package com.dimeng.platform.controller.finance;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.user.ConsoleUserInfo;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.AuditWithdrawReq;
import com.dimeng.model.finance.FindWithdrawListReq;
import com.dimeng.model.finance.WithdrawApplyReq;
import com.dimeng.modules.finance.services.IWithdrawManageService;
import com.dimeng.utils.LoginCache;

/**
 * 提现
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月28日]
 */
@Controller
@RequestMapping(value = "finance/withdrawManage")
public class WithdrawManageController extends BaseController
{
    @Resource
    private IWithdrawManageService withdrawManageService;
    
    /**
     * 前台-用户提现申请
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/insertWithdraw", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object insertWithdraw(HttpEntity<WithdrawApplyReq> httpEntity,
        HttpServletRequest request)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = withdrawManageService.insertWithdraw(httpEntity.getBody());
        }
        return resp;
    }  
    
    /**
     * 前台-提现手续费计算
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/commonWithdrawFee", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object commonWithdrawFee(HttpEntity<WithdrawApplyReq> httpEntity,
        HttpServletRequest request)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = withdrawManageService.commonWithdrawFee(httpEntity.getBody());
        }
        return resp;
    }  
    
    /**
     * 后台-财务管理-提现管理-提现记录列表
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findWithdrawApplyList", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findWithdrawList(HttpEntity<FindWithdrawListReq> httpEntity,
        HttpServletRequest request)
        throws Exception
    {
        return withdrawManageService.findWithdrawList(httpEntity.getBody());
    }
    
    /**
     * 后台-财务管理-提现管理-提现审核
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/commonWithdrawAudit", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object commonWithdrawAudit(HttpEntity<AuditWithdrawReq> httpEntity, HttpServletRequest request)
        throws Exception
    {
        //获取后台用户
        ConsoleUserInfo user = LoginCache.getConsoleUserInfo();
        httpEntity.getBody().setUserId(user.getUserId());
        return withdrawManageService.commonWithdrawAudit(httpEntity.getBody());
    }
    
    /**
     * 后台-财务管理-提现管理-提现放款审核
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/commonWithdrawLoan", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object commonWithdrawLoan(HttpEntity<AuditWithdrawReq> httpEntity, HttpServletRequest request)
        throws Exception
    {
        //获取后台用户
        ConsoleUserInfo user = LoginCache.getConsoleUserInfo();
        httpEntity.getBody().setUserId(user.getUserId());
        return withdrawManageService.commonWithdrawLoan(httpEntity.getBody());
    }
    
    /**
     * 后台-财务管理-提现管理-提现审核失败原因
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findAuditInfo", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findWithdrawFailReason(HttpEntity<IdReq> httpEntity,
        HttpServletRequest request)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = withdrawManageService.findWithdrawFailReason(httpEntity.getBody());
        }
        return resp;
    }        
}
