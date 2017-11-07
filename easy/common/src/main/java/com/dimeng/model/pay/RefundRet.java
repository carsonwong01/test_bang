package com.dimeng.model.pay;

import java.math.BigDecimal;

/**
 * 
 * 退款回调类
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年3月17日]
 */
public class RefundRet
{
	/**
	 * 订单号
	 */
    private String orderNo;
    /**
	 * 支持者
	 */
    private String supporter;
   
    /**
     * 退款金额
     */
    private BigDecimal refundAmount;
 

    /**
     * 退款失败原因
     */
    private String reason;
    
    

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getSupporter() {
		return supporter;
	}

	public void setSupporter(String supporter) {
		this.supporter = supporter;
	}

	public BigDecimal getRefundAmount() {
		return refundAmount;
	}

	public void setRefundAmount(BigDecimal bigDecimal) {
		this.refundAmount = bigDecimal;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	  
     
 
}
