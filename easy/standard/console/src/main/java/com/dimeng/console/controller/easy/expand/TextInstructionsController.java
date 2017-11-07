/*
 * 文 件 名:  TextInstructionsController.java
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
import com.dimeng.abilitys.annotation.SystemConsoleLog;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.expand.TextInstructReq;
import com.dimeng.utils.CommonUtil;

/**
 * 文本说明Controller
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
@RequestMapping("site")
@Controller
public class TextInstructionsController extends BaseController
{
    
    /**
     * 文本说明列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/textInstructionsList.do")
    public ModelAndView textInstructionsList(HttpServletRequest request, HttpServletResponse response)
    {
        return new ModelAndView("pages/easy/operations/textInstructionsList");
    }
    
    /**
     * 文本说明列表Ajax
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping("/textInstructionsListAjax.do")
    public Object textInstructionsListAjax(TextInstructReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String json =
            new CommonUtil().callInterfaceMethod(req,
                "site/textInstruct/v/findTextInstructList",
                RequestMethod.POST,
                request);
        return JSON.parseObject(json);
    }
    
    /**
     * 文本说明详情
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping("/textInstructDetail.do")
    public ModelAndView textInstructDetail(TextInstructReq req, HttpServletRequest request,
        HttpServletResponse response, String isEdit)
    {
        ModelAndView mv;
        if (StringUtil.notEmpty(isEdit))
        {
            mv = new ModelAndView("pages/easy/operations/textInstructionsEdit");
        }
        else
        {
            mv = new ModelAndView("pages/easy/operations/textInstructionsDetail");
        }
        String json =
            new CommonUtil().callInterfaceMethod(req,
                "site/textInstruct/v/findTextInstructList",
                RequestMethod.POST,
                request);
        mv.addObject("object", JSON.parseObject(json));
        return mv;
    }
    
    /**
     * 
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemConsoleLog(desc = "修改文本说明", modul = "运营管理")
    @ResponseBody
    @RequestMapping("/updateTextInstruct.do")
    public Object updateTextInstruct(TextInstructReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String json =
            new CommonUtil().callInterfaceMethod(req,
                "site/textInstruct/v/commonTextInstruct",
                RequestMethod.POST,
                request);
        return JSON.parseObject(json);
    }
    
}
