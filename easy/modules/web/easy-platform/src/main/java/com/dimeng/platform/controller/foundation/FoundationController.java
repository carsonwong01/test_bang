package com.dimeng.platform.controller.foundation;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.FindFoundationReq;
import com.dimeng.modulesfoundation.services.FindFoundationService;
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
@RequestMapping("foundation")
public class FoundationController extends BaseController{

    @Resource
    FindFoundationService findFoundationService;

    /**
     * 基金会列表接口
     */
    @ResponseBody
    @RequestMapping(value="/{v}/foundationList",method = RequestMethod.POST,
            produces = {"application/json", "application/xml"})
    @ResponseStatus(value = HttpStatus.OK)
    public BaseDataResp findFoundationList(HttpEntity<FindFoundationReq> httpEntity, HttpServletRequest request)
                    throws Exception{
        BaseDataResp resp = this.validator(httpEntity);
        if(!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode())){
            return resp;
        }
        return findFoundationService.findFoundationList(httpEntity.getBody());
    }

    /**
     * 基金会详情接口
     */
    @ResponseBody
    @RequestMapping(value = "/{v}/foundationDetails",method = RequestMethod.POST,
                    produces = {"application/json","applocation/xml"})
    @ResponseStatus(value = HttpStatus.OK)
    public BaseDataResp findFoundationDetails(HttpEntity<FindFoundationReq> httpEntity,HttpServletRequest request)
            throws Exception{
        BaseDataResp resp = this.validator(httpEntity);
        if(!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode())){
            return resp;
        }
        return findFoundationService.findFoundationDetails(httpEntity.getBody());
    }
}
