/*
 * 文 件 名:  IRechargeService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  chenwb
 * 修改时间:  2016年1月13日
 */
package com.dimeng.modules.finance.services;



import com.dimeng.model.pay.OrderPayCheckReq;
import com.dimeng.modules.finance.services.base.BaseCommonInterface;

/**
 * 线上支付对账接口
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年1月13日]
 */
public interface IPayCheckService      extends BaseCommonInterface<OrderPayCheckReq> 
{
	/**
	 * 查询支付对账订单
	 * @param orderId
	 * @return
	 * @throws Exception
	 */
		public OrderPayCheckReq findOrder(String orderId) throws Exception ;

}
