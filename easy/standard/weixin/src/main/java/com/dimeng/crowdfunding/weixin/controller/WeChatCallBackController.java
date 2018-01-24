/*
 * 文 件 名:  WeChatCallBackController.java
 * 版    权:  © 2013 dimeng. All rights reserved
 * 描    述:  <描述>
 * 修 改 人:  cuikang
 * 修改时间:  2015-08-12
 */
package com.dimeng.crowdfunding.weixin.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 微信第三方前端回调控制跳转类
 * <功能详细描述>
 * @version  [版本号, 2015年6月30日]
 */
@Controller
@RequestMapping("/weChatRet")
public class WeChatCallBackController
{
    
    private static final Log logs = LogFactory.getLog(WeChatCallBackController.class);
    
    /**
     * 微信投标前端回调
     * <功能详细描述>
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/weChatInvestProjectRet.do")
    public ModelAndView weChatBuyBidRet(HttpServletRequest request) throws UnsupportedEncodingException
    {
    	String repsoneData = request.getParameter("jsonDataString");
        logs.info("WeChatController.weChatBuyBidRet  request = " + repsoneData);
        ModelAndView mv = new ModelAndView();
        mv.addObject("code", repsoneData);
        mv.addObject("type", "投资");
//        String description = request.getParameter("description");
//        if (null!=description&&!"".equals(description))
//        {
//            description=new String(description.getBytes("ISO8859-1"),"UTF-8");
//        }
        mv.setViewName("weixinPayRet");
        return mv;
    }
    
    /**
     * 微信充值前台回调
     * <功能详细描述>
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/weChatChargeRet.do")
    public ModelAndView weChatChargeRet(HttpServletRequest request) throws UnsupportedEncodingException
    {
    	String repsoneData = request.getParameter("jsonDataString");
        logs.info("WeChatController.weChatChargeRet  request = " + repsoneData);
        ModelAndView mv = new ModelAndView();
        mv.addObject("code", repsoneData);
        mv.addObject("type", "充值");
//        String description = request.getParameter("description");
//        if (null!=description&&!"".equals(description))
//        {
//            description=new String(description.getBytes("ISO8859-1"),"UTF-8");
//        }
        mv.setViewName("weixinPayRet");
        return mv;
    }
    
    
    
//    /**
//     * 微信授权前端回调
//     * <功能详细描述>
//     * @param request
//     * @return
//     * @throws UnsupportedEncodingException
//     */
//    @RequestMapping(value = "/weChatAuthorizeRet.do", method = RequestMethod.GET)
//    public ModelAndView weChatAuthorizeRet(HttpServletRequest request) throws UnsupportedEncodingException
//    {
//        logs.info("WeChatController.weChatAuthorizeRet  request = " + request.getParameter("code"));
//        
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("type", "第三方授权");
//        String description = request.getParameter("description");
//        if (StringUtil.notEmpty(description))
//        {
//            description=new String(description.getBytes("ISO8859-1"),"UTF-8");
//        }
//        mv.addObject("description", description);
//        mv.setViewName("weixinPayRet");
//        logs.info("WeChatController.weChatBuyBidRet  modelAndView = " + mv);
//        return mv;
//    }
    
    /**
     * 微信绑卡前台回调
     * <功能详细描述>
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/weChatBindCardRet.do")
    public ModelAndView weChatBindCardRet(HttpServletRequest request) throws UnsupportedEncodingException
    {
    	String repsoneData = request.getParameter("jsonDataString");
        logs.info("WeChatController.weChatBindCardRet  request = " + repsoneData);
       
        ModelAndView mv = new ModelAndView();
        mv.addObject("code", repsoneData);
        mv.addObject("type", "绑定银行卡");
        String description = request.getParameter("description");
        if (null!=description&&!"".equals(description))
        {
            description=new String(description.getBytes("ISO8859-1"),"UTF-8");
        }
        mv.addObject("description", description);
        mv.setViewName("weixinPayRet");
        return mv;
    }
    
    /**
     * 微信提现前端回调
     * <功能详细描述>
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/weChatWithdrawRet.do", method = RequestMethod.GET)
    public ModelAndView weChatWithdrawRet(HttpServletRequest request) throws UnsupportedEncodingException
    {
    	String repsoneData = request.getParameter("jsonDataString");
    	 logs.info("WeChatController.weChatUnBindCardRet  request = " + repsoneData);
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("code", repsoneData);
        mv.addObject("type", "提现");
//        String description = request.getParameter("description");
//        if (null!=description&&!"".equals(description))
//        {
//            description=new String(description.getBytes("ISO8859-1"),"UTF-8");
//        }
        mv.setViewName("weixinPayRet");
        return mv;
    }
    
    /**
     * 微信第三方解绑银行卡回调
     * <功能详细描述>
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/weChatUnBindCardRet.do", method = RequestMethod.GET)
    public ModelAndView weChatUnBindCardRet(HttpServletRequest request) throws UnsupportedEncodingException
    {
    	String repsoneData = request.getParameter("jsonDataString");
        logs.info("WeChatController.weChatUnBindCardRet  request = " + repsoneData);
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("code", repsoneData);
        mv.addObject("type", "银行卡解绑");
//        String description = request.getParameter("description");
//        if (null!=description&&!"".equals(description))
//        {
//            description=new String(description.getBytes("ISO8859-1"),"UTF-8");
//        }
        mv.setViewName("weixinPayRet");
        return mv;
    }
    
    /**
     * 微信注册第三方账户前端回调
     * <功能详细描述>
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/weChatThirdPartyRegisterRet.do")
    public ModelAndView weChatThirdPartyRegisterRet(HttpServletRequest request) throws UnsupportedEncodingException
    {
    	String repsoneData = request.getParameter("jsonDataString");
        logs.info("WeChatController.weChatThirdPartyRegisterRet  request = " + repsoneData);
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("code", repsoneData);
        mv.addObject("type", "第三方账号注册");
//        String description = request.getParameter("description");
//        if (null!=description&&!"".equals(description))
//        {
//            description=new String(description.getBytes("ISO8859-1"),"UTF-8");
//        }
        mv.setViewName("weixinPayRet");
        return mv;
    }
    
}
