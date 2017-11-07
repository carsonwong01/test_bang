package com.dimeng.modules.finance.services;

import java.util.Map;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.FindCapitalDetailsListReq;
import com.dimeng.model.finance.FindOrderCheckListReq;
import com.dimeng.model.finance.FindPlatformAdjustReq;
import com.dimeng.model.finance.TiaoZhangReq;


public interface IFinanceManageService
{
    /**
     * 后台-财务管理-财务管理-平台调账管理列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findPfTiaoZhangList(FindPlatformAdjustReq req);
    
    /**
     * 后台-财务管理-财务管理-查看调账备注
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findTiaoZhangRemark(IdReq req);
    
    /**
     * 后台-财务管理-财务管理-平台调账管理-调账
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp commonTiaoZhang(TiaoZhangReq req) throws Exception;
    
    /**
     * 后台-财务管理-财务管理-平台资金明细列表
     * 后台-财务管理-财务管理-用户资金明细列表
     * 前台-个人中心-交易明细
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findCapitalDetailsList(FindCapitalDetailsListReq req);
    
    /**
     * 后台-财务管理-对账管理-支付对账列表
     * 后台-财务管理-对账管理-退款对账列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findOrderCheckList(FindOrderCheckListReq req);
    
    /**
     * 后台-财务管理-对账管理-支付对账
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp commonPayCheck(IdReq req)throws Exception;
    /**
     * 后台-财务管理-对账管理-支付对账回调
     * <功能详细描述>
     * @param orderId
     * @param param
     * @return
     * @throws Exception
     */
    public BaseDataResp commonSupportCheckCallBack(String orderId, Map<String, Object> param)throws Exception;
    
    
    /**
     * 后台-财务管理-对账管理-退款对账
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp commonRefundCheck(IdReq req)throws Exception;
    
    /**
     * 退款对账回调业务
     * <功能详细描述>
     * @param orderId
     * @param param
     * @return
     * @throws Exception
     */
    public BaseDataResp commonRefundCheckCallBack(String orderId, Map<String, Object> param)throws Exception;
}
