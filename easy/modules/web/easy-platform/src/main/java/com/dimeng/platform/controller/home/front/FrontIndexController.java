package com.dimeng.platform.controller.home.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.ehcache.Element;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.enums.ThirdTypeEnum;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.home.FrontIndexReq;
import com.dimeng.model.home.FrontLoginCheckReq;
import com.dimeng.model.home.FrontRegisterReq;
import com.dimeng.model.message.InsertSystemVerifyCodeReq;
import com.dimeng.model.user.FindUserByOpendIdReq;
import com.dimeng.modules.home.services.FrontIndexService;
import com.dimeng.modules.message.services.IMessageService;
import com.dimeng.modules.user.services.UserInfoManageService;
import com.dimeng.utils.Base64Decoder;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.LoginCache;

/**
 * 前台首页
 * <一句话功能简述> 
 * @author  song
 * @version  [版本号, 2016年10月12日]
 */
@Controller
@RequestMapping("home/frontInfo")
public class FrontIndexController extends BaseController
{
    
    @Resource
    FrontIndexService frontIndexService;
    
    @Resource
    UserInfoManageService userManageService;
    
    @Resource
    private IMessageService msgService;
    
    /**
     * 前台首页-广告-累计
     * <功能详细描述>
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/frontTotalInfo", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object frontTotalInfo(HttpEntity<FrontIndexReq> httpEntity, HttpServletRequest request)
        throws Exception
    {
        return frontIndexService.frontTotalInfo(httpEntity.getBody());
    }
    
    /**
     * 首页项目列表
     * <功能详细描述>
     * @return
     */
    @RequestMapping(value = "/{v}/findRecommendList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findRecommendList(HttpEntity<FrontIndexReq> httpEntity, HttpServletRequest reques)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        return frontIndexService.findRecommendList(httpEntity.getBody());
    }
    
    /**
     * 首页3个推荐项目
     * <功能详细描述>
     * @return
     */
    @RequestMapping(value = "/{v}/findRecommend", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findRecommend(HttpServletRequest reques)
        throws Exception
    {
        return frontIndexService.findRecommend();
    }
    
    /**
     * 用户登录
     * <功能详细描述>
     * @return
     */
    @RequestMapping(value = "/{v}/loginCheck", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object loginCheck(HttpEntity<FrontLoginCheckReq> httpEntity, HttpServletRequest request)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        FrontLoginCheckReq req = httpEntity.getBody();
        //验证验证码
        InsertSystemVerifyCodeReq codeReq = new InsertSystemVerifyCodeReq();
        codeReq.setVerifyMethod(req.getUserName());
        codeReq.setType(CommonConstant.ONE);//手机注册/登录验证码
        codeReq.setVerifyCode(req.getLoginYzm());
        codeReq.setIpAddress(CommonUtil.getIpAddr(request));
        resp = msgService.commonVerifyCode(codeReq);
        if (!resp.getCode().equals(IDiMengResultCode.Commons.SUCCESS))
        {
            return resp;
        }
        req.setLoginIp(CommonUtil.getIpAddr(request));
        resp = frontIndexService.commonLoginCheck(req);
        if (IDiMengResultCode.UserManager.USER_INSERTINFO_OK.equals(resp.getCode()))
        {
            //注册成功走登录，避免事物嵌套
            resp = frontIndexService.commonLoginCheck(req);
        }
        return resp;
    }
    
    /**
     * 用户注册
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/frontRegisterUser", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object insertFrontUserInfo(HttpEntity<FrontRegisterReq> httpEntity, HttpServletRequest request)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        FrontRegisterReq req = httpEntity.getBody();
        req.setLastLoginIp(CommonUtil.getIpAddr(request));
        //验证验证码
        InsertSystemVerifyCodeReq codeReq = new InsertSystemVerifyCodeReq();
        codeReq.setVerifyMethod(req.getPhoneNumber());
        codeReq.setType(CommonConstant.ONE);//第三方注册绑定手机验证码
        codeReq.setVerifyCode(req.getTelCode());
        codeReq.setIpAddress(CommonUtil.getIpAddr(request));
        resp = msgService.commonVerifyCode(codeReq);
        if (!resp.getCode().equals(IDiMengResultCode.Commons.SUCCESS))
        {
            return resp;
        }
        FindUserByOpendIdReq opendReq = new FindUserByOpendIdReq();
        opendReq.setOpendId(Base64Decoder.decode(req.getOpenid()));
        opendReq.setType(req.getThirdType());
        if ((ThirdTypeEnum.WX.dataBaseVal.equals(req.getThirdType()) || ThirdTypeEnum.GZHYH.dataBaseVal.equals(req.getThirdType()))
            && StringUtils.isNotBlank(req.getUnionId()))
        {
            opendReq.setUnionId(Base64Decoder.decode(req.getUnionId()));
        }
        resp = userManageService.findUserByOpendId(opendReq);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            //如果该第三方账户已经被其它手机号绑定了，则重新回到登录页面，让用户重新用第三方账户直接登录，不再进行后面的手机号绑定
            resp.setCode(IDiMengResultCode.UserManager.USER_IS_BOUND);
            return resp;
        }
        resp = frontIndexService.insertFrontUserInfo(req);
        if (IDiMengResultCode.UserManager.USER_ERROR_LOGINNAME_EXIST.equals(resp.getCode())
            || IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            //走登录流程
            FrontLoginCheckReq loginReq = new FrontLoginCheckReq();
            //赋值用户名、密码
            loginReq.setUserName(req.getPhoneNumber());
            loginReq.setLoginIp(req.getLastLoginIp());
            loginReq.setSource(req.getSource());
            resp = frontIndexService.commonLoginCheck(loginReq);
        }
        return resp;
    }
    
    /**
     * 登 出
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/{v}/logout", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object logout(HttpServletRequest request)
    {
        //移除缓存中用户信息
        loginCache.remove(LoginCache.getToken());
        //缓存中在线用户-1
        int loginCount = (int)systemCache.get("loginCount").getObjectValue();
        systemCache.put(new Element("loginCount", loginCount - 1));
        SecurityUtils.getSubject().logout();
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
}
