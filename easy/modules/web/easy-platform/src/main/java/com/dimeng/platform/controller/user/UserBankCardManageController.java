package com.dimeng.platform.controller.user;

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
import com.dimeng.model.common.IdReq;
import com.dimeng.model.user.AddBankCardReq;
import com.dimeng.model.user.NotPageUserIdReq;
import com.dimeng.modules.expand.services.ICommonService;
import com.dimeng.modules.user.services.UserBankCardManageService;
import com.dimeng.utils.LoginCache;

/**
 * 用户管理controller
 * @author  song
 * @version  [版本号, 2016年9月28日]
 */
@Controller
@RequestMapping("user/bankCardManage")
public class UserBankCardManageController extends BaseController
{
    @Autowired
    UserBankCardManageService userBankCardManageService;
    
    @Autowired
    private ICommonService commonService;
    
    /**
     * 查询用户添加的银行卡列表
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findCardList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findCardList()
        throws Exception
    {
        NotPageUserIdReq req = new NotPageUserIdReq();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        return userBankCardManageService.findCardList(req);
    }
    
    /**
     * 添加银行卡
     * <功能详细描述>
     * @return
     * @throws Throwable 
     */
    @RequestMapping(value = "/{v}/addBankCard", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object addBankCard(HttpEntity<AddBankCardReq> httpEntity)
        throws Throwable
    {
        AddBankCardReq req = httpEntity.getBody();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            if (!DigitalAndStringConstant.StringConstant.ONE.equals(LoginCache.getFrontUserInfo().getIdcardStatus()))
            {
                resp.setCode(IDiMengResultCode.UserManager.ERROR_NOT_NCIIC);
                return resp;
            }
            //判断只能添加本人的银行卡
            if (DigitalAndStringConstant.StringConstant.ZERO.equals(req.getCardType())
                && !req.getCardUserName().equals(LoginCache.getFrontUserInfo().getRealName()))
            {
                //加状态码
                resp.setCode(IDiMengResultCode.UserManager.BANK_CARD_ADD_ONLY_USER);
                return resp;
            }
            resp = userBankCardManageService.insertBankCard(req);
        }
        commonService.updateFrontUserCacheByUserId(LoginCache.getFrontUserInfo().getUserId());
        return resp;
    }
    
    /**
     * 删除银行卡
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/deleteBankCard", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object deleteBankCard(HttpEntity<IdReq> httpEntity)
        throws Exception
    {
        IdReq req = httpEntity.getBody();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = userBankCardManageService.deleteBankCard(req);
        }
        commonService.updateFrontUserCacheByUserId(LoginCache.getFrontUserInfo().getUserId());
        return resp;
    }
}
