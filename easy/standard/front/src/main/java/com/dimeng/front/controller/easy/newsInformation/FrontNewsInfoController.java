package com.dimeng.front.controller.easy.newsInformation;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.site.media.FindInvestmentInfoReq;
import com.dimeng.utils.CommonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 新闻资讯
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月27日]
 */
@Controller
@RequestMapping("frontHome")
public class FrontNewsInfoController
{
    /**
     * 跳转到新闻资讯列表页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/newsInfos.do")
    public Object newsInfos(HttpServletRequest request, HttpServletResponse response, String investmentInfoType)
    {
        ModelAndView mv = new ModelAndView("easy/newsInformation/newsInfos.page");
        return mv.addObject("infoType", investmentInfoType);
    }
    
    @RequestMapping(value = "/toNewsInfos.do", method = RequestMethod.GET)
    public Object toNewsInfos(HttpServletRequest request, HttpServletResponse response, String investmentInfoType)
    {
        ModelAndView mv = new ModelAndView("easy/newsInformation/newsInfos.page");
        return mv.addObject("infoType", investmentInfoType);
    }
    
    /**
     * 跳转到新闻资讯详情页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/newsInfosDetails.do", method = RequestMethod.GET)
    public Object newsInfosDetails(HttpServletRequest request, HttpServletResponse response, FindInvestmentInfoReq req)
    {
        ModelAndView mv = new ModelAndView("easy/newsInformation/newsInfosDetails.page");
        String id = req.getId();
        if (StringUtil.isEmpty(id))
        {
            BaseDataResp resp = new BaseDataResp();
            resp.setCode(IDiMengResultCode.Commons.ERROR_PARAMETER);
            return resp;
        }
        String obj = new CommonUtil().callInterfaceMethod(req, "site/media/V/reportDetail", RequestMethod.GET, request);
        JSONObject content = (JSONObject)CommonUtil.getJSONObject(obj, null);
        mv.addObject("content", content);
        return mv;
    }

}
