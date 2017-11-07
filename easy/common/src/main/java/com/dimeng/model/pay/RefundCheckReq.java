package com.dimeng.model.pay;

import java.math.BigDecimal;

/**
 * 
 * 退款对账请求类
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年3月17日]
 */
public class RefundCheckReq
{
	 	private String orderId;//商户订单号
	 
	 	private String orderNo;//商户订单编号
	 
	    private String refundDatetime;//退款受理时间

	    private BigDecimal refundAmount;//退款金额

	    private String mchtRefundOrderNo;//商户退款订单号
	    
	    private String payType;//商户订单号
	    
        private String refundId;//微信退款单号
	    public String getPayType() {
			return payType;
		}

		public void setPayType(String payType) {
			this.payType = payType;
		}

		public String getOrderId()
	    {
	        return orderId;
	    }

	    public void setOrderId(String orderId)
	    {
	        this.orderId = orderId;
	    }

		public String getRefundDatetime() {
			return refundDatetime;
		}

		public void setRefundDatetime(String refundDatetime) {
			this.refundDatetime = refundDatetime;
		}

		public BigDecimal getRefundAmount() {
			return refundAmount;
		}

		public void setRefundAmount(BigDecimal refundAmount) {
			this.refundAmount = refundAmount;
		}

	 
		public String getMchtRefundOrderNo() {
			return mchtRefundOrderNo;
		}

		public void setMchtRefundOrderNo(String mchtRefundOrderNo) {
			this.mchtRefundOrderNo = mchtRefundOrderNo;
		}

		public String getOrderNo() {
			return orderNo;
		}

		public void setOrderNo(String orderNo) {
			this.orderNo = orderNo;
		}

        public String getRefundId()
        {
            return refundId;
        }

        public void setRefundId(String refundId)
        {
            this.refundId = refundId;
        }

 
}
