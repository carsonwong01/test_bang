package com.dimeng.model.pay;

import org.hibernate.validator.constraints.NotBlank;

/**
 * 
 * 支付对账回调类
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年3月17日]
 */
public class OrderPayCheckRet
{
	/**
	 * 订单号
	 */
	@NotBlank
	private String orderId;
	/**
	 * 订单生成时间
	 */
    private String orderDatetime;
    /**
     * 订单查询时间
     */

    private String queryDatetime;
    /**
     * 流水号
     */
    private String trdId;
    /**
     *商户订单编号
     */
    private String orderNo;
    public String getOrderId()
    {
        return orderId;
    }

    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }

    public String getOrderDatetime()
    {
        return orderDatetime;
    }

    public void setOrderDatetime(String orderDatetime)
    {
        this.orderDatetime = orderDatetime;
    }

    public String getQueryDatetime()
    {
        return queryDatetime;
    }

    public void setQueryDatetime(String queryDatetime)
    {
        this.queryDatetime = queryDatetime;
    }
 

    public String getTrdId()
    {
        return trdId;
    }

    public void setTrdId(String trdId)
    {
        this.trdId = trdId;
    }

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

    
 
}
