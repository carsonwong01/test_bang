package com.dimeng.model.pay;

import java.math.BigDecimal;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 退款请求类
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年3月17日]
 */
public class RefundReq extends BaseReq
{
    /**
     * 
     */
    private static final long serialVersionUID = 14564885314514561L;
    
    /**
     * 订单号
     */
    @NotBlank
    private String orderId;
    
    /**
     * 订单退款提交时间
     */
    private String orderDatetime;
    
    /**
     * 订单退款金额
     */
    private BigDecimal refundAmount;
    
    /**
     * paycode
     */
    private String payType;
    
    /**
     *商户订单编号
     */
    private String orderNo;
    
    /**
     * 退款批次号
     */
    private String refundFlowNo;
    
    /**
     * 支持者
     */
    private String supporter;
    
    /**
     * 支付流水号
     */
    private String orderFlowNo;
    
    /**
     * 退款编号
     */
    private String refundNo;
    
    public String getPayType()
    {
        return payType;
    }
    
    public void setPayType(String payType)
    {
        this.payType = payType;
    }
    
    public BigDecimal getRefundAmount()
    {
        return refundAmount;
    }
    
    public void setRefundAmount(BigDecimal refundAmount)
    {
        this.refundAmount = refundAmount;
    }
    
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
    
    public String getOrderNo()
    {
        return orderNo;
    }
    
    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo;
    }
    
    public String getRefundFlowNo()
    {
        return refundFlowNo;
    }
    
    public void setRefundFlowNo(String refundFlowNo)
    {
        this.refundFlowNo = refundFlowNo;
    }
    
    public String getSupporter()
    {
        return supporter;
    }
    
    public void setSupporter(String supporter)
    {
        this.supporter = supporter;
    }

    public String getOrderFlowNo()
    {
        return orderFlowNo;
    }

    public void setOrderFlowNo(String orderFlowNo)
    {
        this.orderFlowNo = orderFlowNo;
    }

    public String getRefundNo()
    {
        return refundNo;
    }

    public void setRefundNo(String refundNo)
    {
        this.refundNo = refundNo;
    }
     
}
