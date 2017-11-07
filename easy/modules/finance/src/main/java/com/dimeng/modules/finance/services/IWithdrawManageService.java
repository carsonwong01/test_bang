package com.dimeng.modules.finance.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.AuditWithdrawReq;
import com.dimeng.model.finance.FindWithdrawListReq;
import com.dimeng.model.finance.WithdrawApplyReq;

/**
 * 提现管理接口类
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月28日]
 */
public interface IWithdrawManageService
{
    /**
     * 前台-用户提现申请
     * <功能详细描述>
     * @return
     */
    public BaseDataResp insertWithdraw(WithdrawApplyReq req)throws Exception;
    /**
     * 前台-计算提现手续费
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp commonWithdrawFee(WithdrawApplyReq req);
    /**
     * 后台-财务管理-提现管理-提现记录列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findWithdrawList(FindWithdrawListReq req);
    
    /**
     * 后台-财务管理-提现管理-提现审核失败原因
     * <功能详细描述>
     * @param req
     * @return
     */
    public  BaseDataResp findWithdrawFailReason(IdReq req);
    
    /**
     * 后台-财务管理-提现管理-提现审核
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp commonWithdrawAudit(AuditWithdrawReq req) throws Exception;
    
    /**
     * 后台-财务管理-提现管理-提现放款审核
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp commonWithdrawLoan(AuditWithdrawReq req) throws Exception;
}
