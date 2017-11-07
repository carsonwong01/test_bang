package com.dimeng.platform.controller.expand;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.utils.EncryptUtil;
import com.dimeng.model.expand.UpdateUserBaseInfoReq;
import com.dimeng.model.message.InsertSystemVerifyCodeReq;
import com.dimeng.model.user.FindTradePwdReq;
import com.dimeng.model.user.NotPageUserIdReq;
import com.dimeng.model.user.UpdateTradePasswordReq;
import com.dimeng.modules.expand.services.ICommonService;
import com.dimeng.modules.expand.services.IPersonalCenterService;
import com.dimeng.modules.message.services.IMessageService;
import com.dimeng.modules.user.services.IPerCenterService;
import com.dimeng.utils.LoginCache;

/**
 * <个人中心控制层>
 * <个人资料基本信息查询更新>
 * 
 * @author  liuzhen
 * @version  [版本号, 2016年1月14日]
 */
@Controller
@RequestMapping("user/perCenter")
public class PersonalCenterController extends BaseController
{
    @Autowired
    private IPersonalCenterService personalCenterService;
    
    @Autowired
    private IPerCenterService perCenterService;
    
    @Autowired
    private ICommonService commonService;
    
    @Autowired
    private IMessageService messageService;
    
    /**
     * <更新用户交易密码>
     * 适用：
     * 1、设置交易密码
     * 2、修改交易密码
     * 3、找回交易密码
     * @author wenguanhai
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/updateTradePwd", method = RequestMethod.PUT, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object updateTradePwd(HttpEntity<UpdateTradePasswordReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            httpEntity.getBody().setNewTradePassword(EncryptUtil.passWord(httpEntity.getBody().getNewTradePassword()));
            UpdateTradePasswordReq req = httpEntity.getBody();
            req.setUserId(LoginCache.getFrontUserInfo().getUserId());
            
            //修改密码
            if (httpEntity.getBody().getOldTradePassword() != null
                && !httpEntity.getBody().getOldTradePassword().equals(""))
            {
                
                httpEntity.getBody().setOldTradePassword(EncryptUtil.passWord(httpEntity.getBody()
                    .getOldTradePassword()));
            }
            else
            {
                //只有设置过交易密码才允许忘记密码
                NotPageUserIdReq userReq = new NotPageUserIdReq();
                req.setUserId(LoginCache.getFrontUserInfo().getUserId());
                resp = personalCenterService.checkSettingTradePwd(userReq);
                if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
                //忘记密码
                {
                    InsertSystemVerifyCodeReq codeReq = new InsertSystemVerifyCodeReq();
                    codeReq.setVerifyMethod(LoginCache.getFrontUserInfo().getMobile());
                    codeReq.setVerifyCode(req.getVerifyCode());
                    codeReq.setType(DigitalAndStringConstant.StringConstant.TWO);
                    resp = messageService.commonVerifyCode(codeReq);
                    if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
                    {
                        return resp;
                    }
                }
                else
                {
                    //首次设置交易密码
                    req.setOldTradePassword(null);
                }
            }
            
            // 传入module对象
            resp = personalCenterService.updateTradePwd(httpEntity.getBody());
            
        }
        commonService.updateFrontUserCacheByUserId(LoginCache.getFrontUserInfo().getUserId());
        return resp;
    }
    
    /**
     * <查询用户交易密码是否已设置>
     * <功能详细描述>
     * @author wenguanhai
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/checkSettingTradePwd", method = RequestMethod.GET, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object checkSettingTradePwd()
        throws Exception
    {
        // 传入module对象
        NotPageUserIdReq req = new NotPageUserIdReq();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        BaseDataResp resp = personalCenterService.checkSettingTradePwd(req);
        return resp;
    }
    
    /**
     * <查询用户交易密码是否正确>
     * <功能详细描述>
     * @author wenguanhai
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/checkTradePassword", method = RequestMethod.GET, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object checkTradePassword(FindTradePwdReq req)
        throws Exception
    {
        BaseDataResp resp = this.validator(req);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            req.setUserId(LoginCache.getFrontUserInfo().getUserId());
            req.setTradePassword(EncryptUtil.passWord(req.getTradePassword()));
            // 传入module对象
            resp = perCenterService.findTradePassword(req);
        }
        return resp;
    }
    
    /**
     * <更新个人基本资料>
     * <功能详细描述>
     * @author wenguanhai
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/updateUserBaseInfo", method = RequestMethod.PUT, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object updateUserBaseInfo(HttpEntity<UpdateUserBaseInfoReq> httpEntity)
        throws Exception
    {
        UpdateUserBaseInfoReq req = httpEntity.getBody();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            // 传入module对象
            resp = personalCenterService.updateUserBaseInfo(httpEntity.getBody());
        }
        commonService.updateFrontUserCacheByUserId(LoginCache.getFrontUserInfo().getUserId());
        return resp;
    }
}
