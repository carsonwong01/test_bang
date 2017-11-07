/*
 * 文 件 名:  OperateFeedbackController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.console.controller.easy.expand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.expand.FindFeedbackReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;

/**
 * 意见反馈Controller
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
@RequestMapping("operations")
@Controller
public class OperateFeedbackController extends BaseController
{
    
    /**
     * 意见反馈列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/feedbackList.do")
    public ModelAndView feedbackList(HttpServletRequest request, HttpServletResponse response)
    {
        return new ModelAndView("pages/easy/operations/feedbackList");
    }
    
    /**
     * 意见反馈列表Ajax
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping("/feedbackListAjax.do")
    public Object feedbackListAjax(FindFeedbackReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String json =
            new CommonUtil().callInterfaceMethod(req,
                "operation/feedback/v/findFeedbackList",
                RequestMethod.POST,
                request);
        return JSON.parseObject(json);
    }
    
    /**
     * 意见反馈列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequestMapping(value = "/feedbackListExport.do")
    public void feedbackListExport(FindFeedbackReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "operation/feedback/v/findFeedbackList", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
}
