package com.dimeng.platform.controller.user;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.entity.ext.user.ThirdPartyUserResp;
import com.dimeng.enums.ThirdTypeEnum;
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.domain.BaseReq;
import com.dimeng.framework.utils.FrameworkConfigurer;
import com.dimeng.model.bus.FindProListByUserIdReq;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.model.home.ThirdTypeReq;
import com.dimeng.model.message.InsertSystemVerifyCodeReq;
import com.dimeng.model.thirdParty.loginHelp.QqLoginHelper;
import com.dimeng.model.thirdParty.loginHelp.WbLoginHelper;
import com.dimeng.model.thirdParty.loginHelp.WxLoginHelper;
import com.dimeng.model.thirdParty.thirdUser.ThirdPartyUser;
import com.dimeng.model.user.*;
import com.dimeng.modules.bus.services.IProjectService;
import com.dimeng.modules.expand.services.ICommonService;
import com.dimeng.modules.message.services.IMessageService;
import com.dimeng.modules.user.services.UserInfoManageService;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.SystemCache;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * 用户管理controller
 * @author  song
 * @version  [版本号, 2016年9月28日]
 */
@Controller
@RequestMapping("user/userManage")
public class UserManageController extends BaseController
{
    @Resource
    UserInfoManageService userManageService;
    
    @Autowired
    IProjectService projectService;
    
    @Autowired
    private ICommonService commonService;
    
    @Resource
    private IMessageService msgService;

    @RequestMapping(value="/{v}/findHosUserDetails", method = RequestMethod.POST,
            produces = {"application/json","application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findHosUserDetails(HttpEntity<HospitalBasicReq> req) throws Exception{
        return userManageService.findHosUserDetails(req.getBody());
    }

    /**
     * 后台管理-医院用户信息列表查询
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findHospitalUser", method = RequestMethod.POST, produces = {"application/json",
            "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findHospitalUser(HttpEntity<FindUserListReq> req)
            throws Exception
    {
        return userManageService.findHospitalUser(req.getBody());
    }


    /**
     * 后台用户管理-用户信息列表查询
     * @return
     * @author "song"
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findUserList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findUserList(HttpEntity<FindUserListReq> req)
        throws Exception
    {
        return userManageService.findUserList(req.getBody());
    }
    
    /**
     * 后台用户管理-用户信息修改(锁定、解锁、拉黑、取消拉黑)
     * @param req
     * @return
     * @author "song"
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/updateUserStatus", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object commonUser(HttpEntity<FindUserListReq> req)
        throws Exception
    {
        return userManageService.updateUserInfo(req.getBody());
    }
    
    /**
     * 后台用户管理-用户详情信息查看
     * @param req
     * @return
     * @author "song"
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findUserDetail", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findUserDetail(HttpEntity<NotPageUserIdReq> req)
        throws Exception
    {
        BaseDataResp resp = this.validator(req.getBody());
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        resp = userManageService.findUserInfo(req.getBody());
        return resp;
    }
    
    /**
     * 后台用户管理-用户详情-发起的项目列表
     * @param req
     * @return
     * @author "song"
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findInitiateProList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findInitiateProList(HttpEntity<FindProListByUserIdReq> req)
        throws Exception
    {
        BaseDataResp resp = this.validator(req.getBody());
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        resp = projectService.findInitiateProList(req.getBody());
        return resp;
    }
    
    /**
     * PC前台-用户个人中心首页
     * @param req
     * @return
     * @author "song"
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findUserHomeInfo", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findUserHomeInfo()
        throws Exception
    {
        FindByUserIdReq req = new FindByUserIdReq();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        return userManageService.findUserHomeInfo(req);
    }
    
    /**
     *  微信端-app-查询用户绑定的第三方账户列表
     * @param req
     * @return
     * @author "song"
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findThirdPartyList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findThirdPartyList()
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        FindThirdPartyReq req = new FindThirdPartyReq();
        if (LoginCache.getFrontUserInfo() == null)
        {
            resp.setCode(IDiMengResultCode.UserManager.ERROR_DIS_ACCREDIT);
            return resp;
        }
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        return userManageService.findThirdPartyList(req);
    }
    
    /**
     *  微信端-app-解绑第三方账户
     * @param req
     * @return
     * @author "song"
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/unbundling", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object unbundling(HttpEntity<FindThirdPartyReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        if (LoginCache.getFrontUserInfo() == null)
        {
            resp.setCode(IDiMengResultCode.UserManager.ERROR_DIS_ACCREDIT);
            return resp;
        }
        FindThirdPartyReq req = httpEntity.getBody();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        resp = userManageService.commonThirdParty(req);
        return resp;
    }
    
    /**
     * 进入个人设置，查询用户基本信息
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findAccInfo", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findAccInfo(HttpEntity<FindByUserIdReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        NotPageUserIdReq req = new NotPageUserIdReq();
        req.setUserId(httpEntity.getBody().getUserId());
        return userManageService.findAccInfo(req);
    }
    
    /**
     * 实名认证-认证
     * <功能详细描述>
     * @param req
     * @return
     * @throws Throwable 
     */
    @RequestMapping(value = "/{v}/authentication", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object authentication(HttpEntity<AuthenticationReq> httpEntity)
        throws Throwable
    {
        AuthenticationReq req = httpEntity.getBody();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        BaseDataResp resp = this.validator(httpEntity);
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        resp = userManageService.updateAuthentication(req);
        commonService.updateFrontUserCacheByUserId(LoginCache.getFrontUserInfo().getUserId());
        return resp;
    }
    
    /**
     * 实名认证-查询
     * <功能详细描述>
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findAuthentication", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findAuthentication()
        throws Exception
    {
        AuthenticationReq req = new AuthenticationReq();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        BaseDataResp resp = userManageService.findAuthentication(req);
        return resp;
    }
    
    /**
     * 实名认证-查询身份证是否唯一
     * 1已存在
     * 0可以认证
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/idCardUnique", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object idCardUnique(HttpEntity<IsExsitIdCardReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = userManageService.isExsitIdCard(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 前台-我的钱包-账户金额
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findAccCenter", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findAccCenter(HttpEntity<BaseReq> httpEntity)
        throws Exception
    {
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        return userManageService.findAccCenter(httpEntity.getBody());
    }
    
    /**
     * 前台-我的钱包-查询验证冻结金额项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findFreezePro", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findFreezePro(HttpEntity<FindFreezeProReq> httpEntity)
        throws Exception
    {
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        FindFreezeProReq req = httpEntity.getBody();
        req.setUserId(userInfo.getUserId());
        return userManageService.findFreezePro(req);
    }
    
    /**
     * 前台-我的钱包-查询账户交易记录
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findAccMoney", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findAccMoneyList(HttpEntity<FindAccMoneyListReq> httpEntity)
        throws Exception
    {
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        return userManageService.findAccMoneyList(httpEntity.getBody());
    }
    
    /**
     * 前台-交易明细
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findTradeList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findTradeList(HttpEntity<FindTradeListReq> httpEntity)
        throws Exception
    {
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        return userManageService.findTradeList(httpEntity.getBody());
    }
    
    /**
     * 前台-找回交易密码-获取验证码
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/getPasswordCode", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object getPasswordCode(HttpServletRequest request)
        throws Exception
    {
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        if (userInfo != null)
        {
            InsertSystemVerifyCodeReq req = new InsertSystemVerifyCodeReq();
            req.setVerifyMethod(userInfo.getUserName());
            req.setType(CommonConstant.TWO);
            req.setIpAddress(CommonUtil.getIpAddr(request));
            return msgService.insertVerifyCode(req);
        }
        return null;
    }
    
    /**
     * 新增第三方绑定账户 -2wx -3wb- 4QQ -5 公众号  给移动端提供
     */
    @RequestMapping(value = "/{v}/addThirdUser", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object addThirdUser(HttpEntity<ThirdTypeReq> httpEntity, HttpServletRequest request,
        HttpServletResponse response)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        if (userInfo == null)
        {
            resp.setCode(IDiMengResultCode.UserManager.ERROR_DIS_ACCREDIT);
            resp.setDescription("用户需要登录");
            return resp;
        }
        String code = httpEntity.getBody().getCode();
        String sourceType = httpEntity.getBody().getSourceType();
        if (StringUtils.isEmpty(code) || StringUtils.isEmpty(sourceType))
        {
            resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
            resp.setDescription("用户取消了授权");
            return resp;
        }
        String appid = "";
        String secret = "";
        if (sourceType.equals(ThirdTypeEnum.GZHYH.dataBaseVal) || sourceType.equals(ThirdTypeEnum.WX.dataBaseVal))
        {
            if (sourceType.equals(ThirdTypeEnum.GZHYH.dataBaseVal))
            {
                appid = SystemCache.getProperty(EasySystemVariable.WXGZH_APPID);
                secret = SystemCache.getProperty(EasySystemVariable.WXGZH_SECRET);
            }
            else
            {
                appid = SystemCache.getProperty(EasySystemVariable.WX_APPID);
                secret = SystemCache.getProperty(EasySystemVariable.WX_SECRET);
            }
            Map<String, String> map = WxLoginHelper.getWxTokenAndOpenid(appid, secret, code);
            if (map == null)
            {
                resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
                resp.setDescription("用户取消了授权");
                return resp;
            }
            String accessToken = map.get("access_token");
            if (accessToken.equals(""))
            {
                resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
                resp.setDescription("用户取消了授权");
                return resp;
            }
            else
            {
                String openId = map.get("openid");
                String tokenExpireIn = map.get("expires_in");
                FindUserByOpendIdReq req = new FindUserByOpendIdReq();
                req.setOpendId(openId);
                req.setType(ThirdTypeEnum.GZHYH.dataBaseVal);
                if (StringUtils.isNoneBlank(map.get("unionid")))
                {
                    //如果不为空，就是该用户有关联公众号，unionid为用户唯一标识，打通了公众号和网站运用
                    req.setUnionId(map.get("unionid"));
                }
                resp = userManageService.findUserByOpendId(req);
                ThirdPartyUser third = WxLoginHelper.getWxUserinfo(accessToken, openId);
                //如果不存在，就插入第三方信息
                if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
                {
                    //查询用户是否已经绑定过微信公众号用户- 只允许绑定一个微信公众号用户
                    FindUserByOpendIdReq openReq = new FindUserByOpendIdReq();
                    openReq.setUserId(userInfo.getUserId());
                    openReq.setType(ThirdTypeEnum.GZHYH.dataBaseVal);
                    resp = userManageService.findUserOpendId(openReq);
                    if (IDiMengResultCode.UserManager.USER_IS_BOUND.equals(resp.getCode()))
                    {
                        resp.setCode(IDiMengResultCode.UserManager.USER_IS_BOUND);
                        resp.setDescription("账户已经绑定过微信，无需重复绑定");
                        return resp;
                    }
                    ThirdPartyUserResp data = new ThirdPartyUserResp();
                    data.setUserId(userInfo.getUserId());
                    data.setOpenid(openId);
                    data.setNickName(third.nickName);
                    data.setGender(third.gender);
                    data.setHeadImgUrl(third.headImgUrl);
                    data.setToken(accessToken);
                    data.setAuthorizeType(ThirdTypeEnum.GZHYH.dataBaseVal);
                    data.setTokenExpireIn(tokenExpireIn);
                    data.setUnionId(map.get("unionid"));
                    return userManageService.insertUserThirdParty(data);
                }
                resp.setCode(IDiMengResultCode.UserManager.USER_IS_BOUND);
                resp.setDescription("账户已经绑定，无需重复绑定");
                return resp;
            }
        }
        else if (sourceType.equals(ThirdTypeEnum.WB.dataBaseVal))
        {
            appid = SystemCache.getProperty(EasySystemVariable.WB_APPID);
            secret = SystemCache.getProperty(EasySystemVariable.WB_SECRET);
            String redirect_url = "";
            if ("1".equals(httpEntity.getBody().getOpSource()))
            {
                redirect_url = (String)FrameworkConfigurer.getProperties("wb_redirect_URI");
            }
            else if ("2".equals(httpEntity.getBody().getOpSource()))
            {
                redirect_url = (String)FrameworkConfigurer.getProperties("wbwap_redirect_URI");
            }
            Map<String, String> map = WbLoginHelper.getWbToken(appid, secret, redirect_url, code);
            if (map == null)
            {
                resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
                resp.setDescription("用户取消了授权");
                return resp;
            }
            String accessToken = map.get("access_token");
            String openID = map.get("uid");
            ;
            String tokenExpireIn = null;
            if (accessToken.equals(""))
            {
                resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
                resp.setDescription("用户取消了授权");
                return resp;
            }
            else
            {
                tokenExpireIn = String.valueOf(map.get("expires_in"));
                ThirdPartyUser third = WbLoginHelper.getWbUserinfo(openID, accessToken);
                if (third == null)
                {
                    resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
                    resp.setDescription("用户取消了授权");
                    return resp;
                }
                else
                {
                    openID = third.openid;
                    FindUserByOpendIdReq req = new FindUserByOpendIdReq();
                    req.setOpendId(openID);
                    req.setType(ThirdTypeEnum.WB.dataBaseVal);
                    resp = userManageService.findUserByOpendId(req);
                    if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
                    {
                        ThirdPartyUserResp data = new ThirdPartyUserResp();
                        data.setOpenid(openID);
                        data.setNickName(third.nickName);
                        data.setGender(third.gender);
                        data.setHeadImgUrl(third.headImgUrl);
                        data.setToken(accessToken);
                        data.setAuthorizeType(ThirdTypeEnum.WB.dataBaseVal);
                        data.setTokenExpireIn(tokenExpireIn);
                        return userManageService.insertUserThirdParty(data);
                    }
                    resp.setCode(IDiMengResultCode.UserManager.USER_IS_BOUND);
                    resp.setDescription("账户已经绑定，无需重复绑定");
                }
                return resp;
            }
        }
        else if (sourceType.equals(ThirdTypeEnum.QQ.dataBaseVal))
        {
            appid = SystemCache.getProperty(EasySystemVariable.QQ_APPID);
            secret = SystemCache.getProperty(EasySystemVariable.QQ_SECRET);
            String redirect_url = "";
            if ("1".equals(httpEntity.getBody().getOpSource()))
            {
                redirect_url = (String)FrameworkConfigurer.getProperties("qq_redirect_URI");
            }
            else if ("2".equals(httpEntity.getBody().getOpSource()))
            {
                redirect_url = (String)FrameworkConfigurer.getProperties("qqwap_redirect_URI");
            }
            Map<String, String> map =
                QqLoginHelper.getQqToken(httpEntity.getBody().getDeviceType(), appid, secret, redirect_url, code);
            if (map == null)
            {
                resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
                resp.setDescription("用户取消了授权");
                return resp;
            }
            String accessToken = map.get("access_token");
            if (accessToken.equals(""))
            {
                resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
                resp.setDescription("用户取消了授权");
                return resp;
            }
            else
            {
                String tokenExpireIn = String.valueOf(map.get("expires_in"));
                Map<String, String> openMap =
                    QqLoginHelper.getOpenID(httpEntity.getBody().getDeviceType(), accessToken);
                ;
                if (openMap == null)
                {
                    resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
                    resp.setDescription("用户取消了授权");
                    return resp;
                }
                else
                {
                    String openId = openMap.get("openId");
                    FindUserByOpendIdReq userReq = new FindUserByOpendIdReq();
                    userReq.setOpendId(openId);
                    userReq.setType(ThirdTypeEnum.QQ.dataBaseVal);
                    resp = userManageService.findUserByOpendId(userReq);
                    if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
                    {
                        ThirdPartyUser third = QqLoginHelper.getQqUserinfo(openId, appid, accessToken);
                        ThirdPartyUserResp data = new ThirdPartyUserResp();
                        data.setOpenid(openId);
                        data.setNickName(third.nickName);
                        data.setGender(third.gender);
                        data.setHeadImgUrl(third.headImgUrl);
                        data.setToken(accessToken);
                        data.setAuthorizeType(ThirdTypeEnum.QQ.dataBaseVal);
                        data.setTokenExpireIn(tokenExpireIn);
                        return userManageService.insertUserThirdParty(data);
                    }
                    resp.setCode(IDiMengResultCode.UserManager.USER_IS_BOUND);
                    resp.setDescription("账户已经绑定，无需重复绑定");
                }
                return resp;
            }
        }
        resp.setCode(IDiMengResultCode.Trust.ERROR_PARAM);
        resp.setDescription("参数异常");
        return resp;
    }
}
