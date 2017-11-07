package com.dimeng.front.controller.easy.user.userSetting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemFrontLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.user.AuthenticationReq;
import com.dimeng.model.user.IsExsitIdCardReq;
import com.dimeng.utils.CommonUtil;

/**
 * 实名认证
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月20日]
 */
@Controller
@RequestMapping("user/security")
public class SecurityInformationController extends BaseController
{
    /**
     * 查询实名认证信息
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findAuthentication.do")
    public Object findAuthentication(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        ModelAndView mv = new ModelAndView("easy/user/userSetting/verifyRealName_temple");
        String data =
            new CommonUtil().callInterfaceMethod(null,
                "user/userManage/v/findAuthentication",
                RequestMethod.POST,
                request);
        Object authInfo = CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        mv.addObject("authInfo", authInfo);
        return mv;
    }
    
    /**
     * 进行实名认证
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @SystemFrontLog(desc = "进行实名认证", modul = "实名认证管理")
    @RequestMapping(value = "/authentication.do")
    public Object authenticationAjax(AuthenticationReq req, HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String result =
            new CommonUtil().callInterfaceMethod(req, "user/userManage/v/authentication", RequestMethod.POST, request);
        return JSONObject.parse(result);
    }
    
    /**
      * 实名认证-查询身份证是否唯一
     * 1已存在
     * 0可以认证
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/idCardUnique.do")
    public Object idCardUnique(IsExsitIdCardReq req, HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "user/userManage/v/idCardUnique", RequestMethod.POST, request);
        return JSON.parse(data);
    }
}