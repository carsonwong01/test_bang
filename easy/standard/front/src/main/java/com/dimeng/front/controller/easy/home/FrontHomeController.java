package com.dimeng.front.controller.easy.home;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.Element;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemFrontLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.site.NoticeAndNewsInfoResp;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.entity.ext.user.ThirdPartyUserResp;
import com.dimeng.enums.ThirdTypeEnum;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.home.FrontIndexReq;
import com.dimeng.model.home.FrontLoginCheckReq;
import com.dimeng.model.home.FrontRegisterReq;
import com.dimeng.model.home.ThirdTypeReq;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.SessionManage;
import com.dimeng.utils.SystemCache;

/**
 * 前台主页注册-登录-首页信息控制层
 * @author  song
 * @version  [版本号, 2016年10月13日]
 */
@Controller
@RequestMapping("frontHome")
public class FrontHomeController extends BaseController
{
    
    /**
     * 去往第三方頁面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/toThirdInfo.do")
    public void toThirdInfo(HttpServletRequest request, HttpServletResponse response)
    {
        ThirdTypeReq thirdTypeReq = new ThirdTypeReq();
        thirdTypeReq.setSourceType(request.getParameter("sourceType"));
        String listJson =
            new CommonUtil().callInterfaceMethod(thirdTypeReq,
                "thirdAuthorize/v/goThirdAuthorize",
                RequestMethod.POST,
                request);
        String code = CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_CODE).toString();
        if (IDiMengResultCode.Commons.SUCCESS.equals(code))
        {
            try
            {
                String url = CommonUtil.getJSONObject(listJson, null).toString();
                response.sendRedirect(url);
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }
    
    /**
     * 第三方回調地址 PC
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/wxCallback.do")
    public Object wxCallback(HttpServletRequest request, HttpServletResponse response)
    {
        ThirdTypeReq thirdTypeReq = new ThirdTypeReq();
        thirdTypeReq.setCode(request.getParameter("code"));
        thirdTypeReq.setSourceType(ThirdTypeEnum.WX.dataBaseVal);
        String listJson =
            new CommonUtil().callInterfaceMethod(thirdTypeReq,
                "thirdAuthorize/v/wxCallback",
                RequestMethod.POST,
                request);
        String code = CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_CODE).toString();
        logs.info("控制层listJson:" + listJson);
        if (IDiMengResultCode.Commons.SUCCESS.equals(code))
        {
            JSONObject userObject = (JSONObject)CommonUtil.getJSONObject(listJson, null);
            FrontUserInfo currUser = JSONObject.toJavaObject(userObject, FrontUserInfo.class);
            if (currUser != null)
            {
                SecurityUtils.getSubject().login(new UsernamePasswordToken(currUser.getToken(), currUser.getToken()));
                //判断是否已登录
                String token = SessionManage.getFrontUser(currUser.getUserId());
                //已登录
                if (StringUtils.isNotBlank(token))
                {
                    loginCache.remove(LoginCache.getToken());
                    SessionManage.removeFrontUser(currUser.getUserId(), SecurityUtils.getSubject().getSession().getId());
                }
                SecurityUtils.getSubject()
                    .getSession()
                    .setAttribute(CommonConstant.FRONT + currUser.getUserId(), currUser.getToken());
                loginCache.put(new Element(currUser.getToken(), currUser));
            }
            return "redirect:/user/userCenter.do";
        }
        else if (IDiMengResultCode.UserManager.ERROR_NOT_BIND_PHONE.equals(code))
        {
            JSONObject userObject =
                (JSONObject)CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_SINGLE_RESULT);
            ThirdPartyUserResp thirdUser = JSONObject.toJavaObject(userObject, ThirdPartyUserResp.class);
            //到登录页面
            ModelAndView mode = new ModelAndView("pages/easy/home/login.base");
            mode.addObject("callbackStatus", "true");
            mode.addObject("thirdUser", thirdUser);
            return mode;
        }
        else
        {
            loginCache.remove("callbackStatus");
            ModelAndView mode = new ModelAndView("pages/easy/home/login.base");
            if (IDiMengResultCode.UserManager.USER_LOGIN_LOCK.equals(code))
            {
                mode.addObject("errMsg", CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_DESCRIPTION)
                    .toString());
            }
            return mode;
        }
    }
    
    /**
     * 第三方回調地址 PC
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/wbCallback.do")
    public Object wbCallback(HttpServletRequest request, HttpServletResponse response)
    {
        ThirdTypeReq thirdTypeReq = new ThirdTypeReq();
        thirdTypeReq.setCode(request.getParameter("code"));
        thirdTypeReq.setSourceType(ThirdTypeEnum.WB.dataBaseVal);
        //调用接口方法
        String listJson =
            new CommonUtil().callInterfaceMethod(thirdTypeReq,
                "thirdAuthorize/v/wbCallback",
                RequestMethod.POST,
                request);
        String code = CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_CODE).toString();
        if (IDiMengResultCode.Commons.SUCCESS.equals(code))
        {
            JSONObject userObject = (JSONObject)CommonUtil.getJSONObject(listJson, null);
            FrontUserInfo currUser = JSONObject.toJavaObject(userObject, FrontUserInfo.class);
            if (currUser != null)
            {
                SecurityUtils.getSubject().login(new UsernamePasswordToken(currUser.getToken(), currUser.getToken()));
                String token = SessionManage.getFrontUser(currUser.getUserId());
                if (StringUtils.isNotBlank(token))
                {
                    loginCache.remove(LoginCache.getToken());
                    SessionManage.removeFrontUser(currUser.getUserId(), SecurityUtils.getSubject().getSession().getId());
                }
                SecurityUtils.getSubject()
                    .getSession()
                    .setAttribute(CommonConstant.FRONT + currUser.getUserId(), currUser.getToken());
                loginCache.put(new Element(currUser.getToken(), currUser));
            }
            return "redirect:/user/userCenter.do";
        }
        else if (IDiMengResultCode.UserManager.ERROR_NOT_BIND_PHONE.equals(code))
        {
            JSONObject userObject =
                (JSONObject)CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_SINGLE_RESULT);
            ThirdPartyUserResp thirdUser = JSONObject.toJavaObject(userObject, ThirdPartyUserResp.class);
            //到登录页面
            ModelAndView mode = new ModelAndView("pages/easy/home/login.base");
            mode.addObject("callbackStatus", "true");
            mode.addObject("thirdUser", thirdUser);
            return mode;
        }
        else
        {
            loginCache.remove("callbackStatus");
            ModelAndView mode = new ModelAndView("pages/easy/home/login.base");
            if (IDiMengResultCode.UserManager.USER_LOGIN_LOCK.equals(code))
            {
                mode.addObject("errMsg", CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_DESCRIPTION)
                    .toString());
            }
            return mode;
        }
    }
    
    /**
     * 第三方回調地址 PC
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/qqCallback.do")
    public Object qqCallback(HttpServletRequest request, HttpServletResponse response)
    {
        ThirdTypeReq thirdTypeReq = new ThirdTypeReq();
        thirdTypeReq.setCode(request.getParameter("code"));
        thirdTypeReq.setDeviceType("pc");
        thirdTypeReq.setSourceType(ThirdTypeEnum.QQ.dataBaseVal);
        //调用接口方法
        String listJson =
            new CommonUtil().callInterfaceMethod(thirdTypeReq,
                "thirdAuthorize/v/qqCallback",
                RequestMethod.POST,
                request);
        String code = CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_CODE).toString();
        if (IDiMengResultCode.Commons.SUCCESS.equals(code))
        {
            JSONObject userObject = (JSONObject)CommonUtil.getJSONObject(listJson, null);
            FrontUserInfo currUser = JSONObject.toJavaObject(userObject, FrontUserInfo.class);
            if (currUser != null)
            {
                SecurityUtils.getSubject().login(new UsernamePasswordToken(currUser.getToken(), currUser.getToken()));
                //判断是否已登录
                String token = SessionManage.getFrontUser(currUser.getUserId());
                //已登录
                if (StringUtils.isNotBlank(token))
                {
                    loginCache.remove(LoginCache.getToken());
                    SessionManage.removeFrontUser(currUser.getUserId(), SecurityUtils.getSubject().getSession().getId());
                }
                SecurityUtils.getSubject()
                    .getSession()
                    .setAttribute(CommonConstant.FRONT + currUser.getUserId(), currUser.getToken());
                //将用户信息放入缓存
                loginCache.put(new Element(currUser.getToken(), currUser));
            }
            return "redirect:/user/userCenter.do";
        }
        else if (IDiMengResultCode.UserManager.ERROR_NOT_BIND_PHONE.equals(code))
        {
            JSONObject userObject =
                (JSONObject)CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_SINGLE_RESULT);
            ThirdPartyUserResp thirdUser = JSONObject.toJavaObject(userObject, ThirdPartyUserResp.class);
            //到登录页面
            ModelAndView mode = new ModelAndView("pages/easy/home/login.base");
            mode.addObject("callbackStatus", "true");
            mode.addObject("thirdUser", thirdUser);
            return mode;
            
        }
        else
        {
            //到登录页面
            loginCache.remove("callbackStatus");
            ModelAndView mode = new ModelAndView("pages/easy/home/login.base");
            if (IDiMengResultCode.UserManager.USER_LOGIN_LOCK.equals(code))
            {
                mode.addObject("errMsg", CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_DESCRIPTION)
                    .toString());
            }
            return mode;
        }
    }
    
    /**
     * 确认注册
     * <功能详细描述>
     * @param insertFrontUserReq
     * @param registerYzm
     * @param request
     * @param response
     * @return
     * @throws Exception 
     */
    @SystemFrontLog(desc = "前台用户第三方快捷登录绑定手机号", modul = "登录模块")
    @RequestMapping(value = "/confirmRegister.do")
    @ResponseBody
    public Map<String, Object> confirmRegister(FrontRegisterReq insertFrontUserReq, String registerYzm,
        HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        //获取当前登录人IP 
        insertFrontUserReq.setSource(CommonConstant.ONE);
        String nickName = URLDecoder.decode(insertFrontUserReq.getNickname(), "utf-8");
        insertFrontUserReq.setNickname(nickName);
        //调用接口方法
        String listJson =
            new CommonUtil().callInterfaceMethod(insertFrontUserReq,
                "home/frontInfo/v/frontRegisterUser",
                RequestMethod.POST,
                request);
        
        JSONObject userObject = (JSONObject)CommonUtil.getJSONObject(listJson, null);
        FrontUserInfo currUser = JSONObject.toJavaObject(userObject, FrontUserInfo.class);
        String code = CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_CODE).toString();
        //将用户信息放入缓存
        if (listJson != null && IDiMengResultCode.Commons.SUCCESS.equals(code) && currUser != null)
        {
            SecurityUtils.getSubject().login(new UsernamePasswordToken(currUser.getToken(), currUser.getToken()));
            SecurityUtils.getSubject()
                .getSession()
                .setAttribute(CommonConstant.FRONT + currUser.getUserId(), currUser.getToken());
            loginCache.put(new Element(currUser.getToken(), currUser));
        }
        //返回操作码
        modelMap.put(CommonConstant.JSON_KEY_CODE, code);
        //返回操作码描述
        modelMap.put(CommonConstant.JSON_KEY_DESCRIPTION,
            CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_DESCRIPTION).toString());
        return modelMap;
    }
    
    /**
     * 确认登录
     * <功能详细描述>
     * @author  song
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "前台用户登录", modul = "登录模块")
    @RequestMapping(value = "/confirmLogin.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> confirmLogin(FrontLoginCheckReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        //调用接口方法
        String listJson =
            new CommonUtil().callInterfaceMethod(req, "home/frontInfo/v/loginCheck", RequestMethod.POST, request);
        String code = CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_CODE).toString();
        JSONObject userObject = (JSONObject)CommonUtil.getJSONObject(listJson, null);
        FrontUserInfo currUser = JSONObject.toJavaObject(userObject, FrontUserInfo.class);
        if (listJson != null && IDiMengResultCode.Commons.SUCCESS.equals(code) && currUser != null)
        {
            SecurityUtils.getSubject().login(new UsernamePasswordToken(currUser.getToken(), currUser.getToken()));
            String token = SessionManage.getFrontUser(currUser.getUserId());
            if (StringUtils.isNotBlank(token))
            {
                loginCache.remove(LoginCache.getToken());
                SessionManage.removeFrontUser(currUser.getUserId(), SecurityUtils.getSubject().getSession().getId());
            }
            SecurityUtils.getSubject()
                .getSession()
                .setAttribute(CommonConstant.FRONT + currUser.getUserId(), currUser.getToken());
            //将用户信息放入缓存
            loginCache.put(new Element(currUser.getToken(), currUser));
        }
        modelMap.put(CommonConstant.JSON_KEY_CODE, code);
        modelMap.put(CommonConstant.CURR_USER, currUser);
        modelMap.put(CommonConstant.JSON_KEY_DATA, userObject);
        modelMap.put(CommonConstant.JSON_KEY_DESCRIPTION,
            CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_DESCRIPTION).toString());
        return modelMap;
    }
    
    /**
     * 首页数据
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/homePageBody.do")
    @ResponseBody
    public Object homePageBody(HttpServletRequest request, HttpServletResponse response)
    {
        Map<String, Object> data = new HashMap<>();
        FrontIndexReq req = new FrontIndexReq();
        req.setOpSource("1");
        //调用首页接口
        String json =
            new CommonUtil().callInterfaceMethod(req, "home/frontInfo/v/frontTotalInfo", RequestMethod.POST, request);
        //广告图片列表
        data.put("advertise", CommonUtil.getJSONObject(json, "advertiseList"));
        //首页统计
        data.put("indexTotalMessage", CommonUtil.getJSONObject(json, "statResult"));
        //新闻资讯SystemCache.getCache(SystemConstant.CacheKey.SITE_INFO)
        
        List<NoticeAndNewsInfoResp> newsInfoResps =
            (List<NoticeAndNewsInfoResp>)SystemCache.getCache(SystemConstant.CacheKey.NEWS_INFO);
        if (newsInfoResps != null)
        {
            for (NoticeAndNewsInfoResp noticeAndNewsInfoResp : newsInfoResps)
            {
                noticeAndNewsInfoResp.setInfoContent(Html2Text(noticeAndNewsInfoResp.getInfoContent()));
            }
        }
        data.put("InvestmentDynamicInfo", newsInfoResps);
        //公告
        data.put("InvestmentInfo", SystemCache.getCache(SystemConstant.CacheKey.AFFICHE_INFO));
        //合作伙伴
        data.put("friendshipUrl", SystemCache.getCache(SystemConstant.CacheKey.FRIENDSHIP_INFO));
        String proJson =
            new CommonUtil().callInterfaceMethod("", "home/frontInfo/v/findRecommend", RequestMethod.POST, request);
        //热门项目
        data.put("hotProject", CommonUtil.getJSONObject(proJson, "recommendList"));
        
        return data;
    }
    
    public static String Html2Text(String inputString)
    {
        if (StringUtils.isEmpty(inputString))
            return "";
        String htmlStr = inputString; // 含html标签的字符串
        String textStr = "";
        java.util.regex.Pattern p_script;
        java.util.regex.Matcher m_script;
        java.util.regex.Pattern p_style;
        java.util.regex.Matcher m_style;
        java.util.regex.Pattern p_html;
        java.util.regex.Matcher m_html;
        
        try
        {
            String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; // 定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script>
                                                                                                     // }
            String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; // 定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style>
                                                                                                  // }
            String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
            
            p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
            m_script = p_script.matcher(htmlStr);
            htmlStr = m_script.replaceAll(""); // 过滤script标签
            
            p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
            m_style = p_style.matcher(htmlStr);
            htmlStr = m_style.replaceAll(""); // 过滤style标签
            
            p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
            m_html = p_html.matcher(htmlStr);
            htmlStr = m_html.replaceAll(""); // 过滤html标签
            
            textStr = htmlStr;
            
        }
        catch (Exception e)
        {
            textStr = inputString;
        }
        
        return textStr;// 返回文本字符串
    }
    
    /**
     * 去往app下载页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/toAppDownload.do")
    public Object toAppDownload(HttpServletRequest request, HttpServletResponse response)
    {
        return new ModelAndView("easy/home/appDownload.page");
    }
}
