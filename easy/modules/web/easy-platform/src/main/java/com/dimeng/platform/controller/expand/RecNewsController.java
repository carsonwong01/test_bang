package com.dimeng.platform.controller.expand;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.RecomNewsReq;
import com.dimeng.modules.news.services.RecommendNewsService;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("frontHome")
public class RecNewsController extends BaseController {
    @Resource
    RecommendNewsService recommendNewsService;

    @RequestMapping(value = "/{v}/recomNewsList", method = RequestMethod.POST, produces = {"application/json",
            "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object frontTotalInfo(HttpEntity<RecomNewsReq> httpEntity, HttpServletRequest request)
            throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        return recommendNewsService.findRecomNewsList(httpEntity.getBody());
    }
}
