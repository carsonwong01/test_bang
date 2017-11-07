/*
 * 文 件 名:  IRechargeService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  chenwb
 * 修改时间:  2016年1月13日
 */
package com.dimeng.modules.finance.services;

import com.dimeng.model.pay.OrderPayReq;
import com.dimeng.modules.finance.services.base.BaseCommonInterface;

/**
 * 支付接口
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年1月13日]
 */
public interface IPayService extends BaseCommonInterface<OrderPayReq>
{
    
    /**
     * 查询支付订单，并且是待支付的状态
     * <功能详细描述>
     * @param orderId
     * @return
     * @throws Exception
     */
    public OrderPayReq findOrder(String orderId)
        throws Exception;
        
}
