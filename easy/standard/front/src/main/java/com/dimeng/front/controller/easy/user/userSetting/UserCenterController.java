/*
 * 文 件 名:  UserPersonalInfoController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月20日
 */
package com.dimeng.front.controller.easy.user.userSetting;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemFrontLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.expand.UpdateUserBaseInfoReq;
import com.dimeng.utils.AmountUtil;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.SystemCache;

/**
 * 用户个人资料
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月20日]
 */
@Controller
@RequestMapping("user")
public class UserCenterController extends BaseController
{
    /**
     * 个人设置-个人资料
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/userInfo.do")
    public Object userInfo(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        ModelAndView mv = new ModelAndView("easy/user/userSetting/baseInfomation_temple");
        String dataJson =
            new CommonUtil().callInterfaceMethod(null, "user/userManage/v/findAccInfo", RequestMethod.POST, request);
        JSONObject userInfo = (JSONObject)CommonUtil.getJSONObject(dataJson, CommonConstant.JSON_KEY_SINGLE_RESULT);
        
        JSONObject object = new JSONObject();
        String mobile = userInfo.getString("phoneNumber");
        object.put("phoneNumber", mobile.substring(0, 3) + "****" + mobile.substring(7));
        object.put("headUrl", userInfo.get("headUrl"));
        object.put("nickName", userInfo.get("nickName"));
        mv.addObject("userInfo", object);
        return mv;
    }
    
    /**
     * 更新用户信息
     * 更新头像、昵称
     * @param req
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @SystemFrontLog(desc = "更新用户信息", modul = "个人中心")
    @RequestMapping(value = "/updateUserBaseInfo.do")
    public Object updateUserBaseInfo(UpdateUserBaseInfoReq req, HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        if (StringUtil.notEmpty(req.getNickName()))
        {
            req.setNickName(URLDecoder.decode(req.getNickName()));
        }
        String dataJson =
            new CommonUtil().callInterfaceMethod(req, "user/perCenter/v/updateUserBaseInfo", RequestMethod.PUT, request);
        return JSON.parse(dataJson);
    }
    
    /**
     * 个人中心模板页
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/userCenter.do")
    public Object userCenter(@ModelAttribute("to")
    String to, HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        ModelAndView mv = new ModelAndView("easy/user/userCenter.page");
        return mv.addObject("dateLastLogin", LoginCache.getFrontUserInfo().getDateLastLogin());
    }
    
    /**
     * 个人中心首页
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/userAccountInfo.do")
    public Object userAccountInfo(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        ModelAndView mv = new ModelAndView("easy/user/userAccountInfo_temple");
        
        String dataJson =
            new CommonUtil().callInterfaceMethod(null,
                "user/userManage/v/findUserHomeInfo",
                RequestMethod.POST,
                request);
        JSONObject accountInfo = (JSONObject)CommonUtil.getJSONObject(dataJson, CommonConstant.JSON_KEY_SINGLE_RESULT);
        accountInfo.put("isOpenTradePwd", SystemCache.getProperty(EasySystemVariable.SETTING_WITHDRAWAL_PASSWORD));
        accountInfo.put("availableAmount", AmountUtil.format(accountInfo.getDoubleValue("availableAmount")));
        accountInfo.put("frozenAmount", AmountUtil.format(accountInfo.getDoubleValue("frozenAmount")));
        accountInfo.put("supportAmt", AmountUtil.format(accountInfo.getDoubleValue("supportAmt")));
        accountInfo.put("crowdfundingAmt", AmountUtil.format(accountInfo.getDoubleValue("crowdfundingAmt")));
        mv.addObject("accountInfo", accountInfo);
        return mv;
    }
    
    /**
     * 个人中心首页热门推荐的3个项目列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findRecommendAjax.do")
    public Object findRecommendAjax(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String dataJson =
            new CommonUtil().callInterfaceMethod(null, "home/frontInfo/v/findRecommend", RequestMethod.POST, request);
        return JSON.parse(dataJson);
    }
}
