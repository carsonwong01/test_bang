package com.dimeng.model.pay;

/**
 * 
 * 退款对账回调类
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年3月17日]
 */
public class RefundCheckRet
{
    private String orderId;//商户订单号

    private String refundDatetime;//退款受理时间

    private String refundAmount;//退款金额
    private String returnDatetime;//退款申请完成的时间日

    private String refundResult;//退款结果

    private String mchtRefundOrderNo;//商户退款订单号


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

	public String getRefundAmount() {
		return refundAmount;
	}

	public void setRefundAmount(String refundAmount) {
		this.refundAmount = refundAmount;
	}

	 
	public String getRefundResult() {
		return refundResult;
	}

	public void setRefundResult(String refundResult) {
		this.refundResult = refundResult;
	}

	public String getMchtRefundOrderNo() {
		return mchtRefundOrderNo;
	}

	public void setMchtRefundOrderNo(String mchtRefundOrderNo) {
		this.mchtRefundOrderNo = mchtRefundOrderNo;
	}

	public String getReturnDatetime() {
		return returnDatetime;
	}

	public void setReturnDatetime(String returnDatetime) {
		this.returnDatetime = returnDatetime;
	}

     
 
}
