package com.dimeng.modules.finance.services;

import java.util.Map;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.FindPaymentListReq;
import com.dimeng.model.finance.FindRefundListReq;
import com.dimeng.model.finance.PayOrderReq;
import com.dimeng.model.finance.SupportDetailReq;
import com.dimeng.model.finance.SupportOrderReq;
import com.dimeng.model.pay.OrderPayReq;

/**
 * 订单管理接口类
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月27日]
 */
public interface IOrderManageService
{
    
    /**
     * 后台-财务管理-支付记录列表
     * 后台-用户管理-用户信息-支持的订单
     * 后台-项目详情-支持记录

     * 后台-项目管理-订单管理
     * 后台-订单管理-所有订单
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findPaymentList(FindPaymentListReq req);
    
    /**
     * 后台-财务管理-退款管理列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findRefundList(FindRefundListReq req);
    
    /**
     *后台-业务管理-订单管理-订单列表-订单详情
     * <功能详细描述>
     * @author  wenguanhai
     * @param req
     * @return
     */
    public BaseDataResp supportDetail(SupportDetailReq req);
    
    /**
     * 支持项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public OrderPayReq insertSupportOrder(SupportOrderReq req)throws Exception;
    
    /**
     * 支付
     * <功能详细描述>
     * @param id
     * @return
     */
    public OrderPayReq findSupportOrder(PayOrderReq req)throws Exception;
    
    /**
     * 支持项目回调业务
     * <功能详细描述>
     * @param orderId
     * @param param
     * @return
     * @throws Exception
     */
    public BaseDataResp commonSupportCallBack(String orderId, Map<String, Object> param)throws Exception;

    /**
     * 支付后查询订单状态
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp supportOrderStatus(SupportDetailReq req);
    
    /**
     * 后台-财务管理-退款管理-订单退款失败-退款
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp  commonRefund(IdReq req)throws Exception;
    
    
    
    
}
