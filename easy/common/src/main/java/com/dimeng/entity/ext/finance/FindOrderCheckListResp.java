package com.dimeng.entity.ext.finance;

import java.io.Serializable;

/**
 * 支付/退款对账列表返回结果实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月11日]
 */
public class FindOrderCheckListResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -8668750914172780318L;
    
    /**
     * 订单ID
     */
    private String id;
    
    /**
     * 订单编号
     */
    private String orderNo;
    
    /**
     * 用户
     */
    private String userName;
    
    /**
     * 订单金额
     */
    private String supportAmount;
    
    /**
     * 支付流水号
     */
    private String payFlowNo;
    
    /**
     * 支付时间
     */
    private String payTime;
    
    /**
     * 支付对账时间
     */
    private String payCheckTime;
    
    /**
     * 支付对账状态
     */
    private String payCheckStatus;
    
    /**
     * 退款时间
     */
    private String refundTime;
    
    /**
     * 退款对账时间
     */
    private String refundCheckTime;
    
    /**
     * 退款对账状态
     */
    private String refundCheckStatus;

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getOrderNo()
    {
        return orderNo;
    }

    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getSupportAmount()
    {
        return supportAmount;
    }

    public void setSupportAmount(String supportAmount)
    {
        this.supportAmount = supportAmount;
    }

    public String getPayFlowNo()
    {
        return payFlowNo;
    }

    public void setPayFlowNo(String payFlowNo)
    {
        this.payFlowNo = payFlowNo;
    }

    public String getPayTime()
    {
        return payTime;
    }

    public void setPayTime(String payTime)
    {
        this.payTime = payTime;
    }

    public String getPayCheckTime()
    {
        return payCheckTime;
    }

    public void setPayCheckTime(String payCheckTime)
    {
        this.payCheckTime = payCheckTime;
    }

    public String getPayCheckStatus()
    {
        return payCheckStatus;
    }

    public void setPayCheckStatus(String payCheckStatus)
    {
        this.payCheckStatus = payCheckStatus;
    }

    public String getRefundTime()
    {
        return refundTime;
    }

    public void setRefundTime(String refundTime)
    {
        this.refundTime = refundTime;
    }

    public String getRefundCheckTime()
    {
        return refundCheckTime;
    }

    public void setRefundCheckTime(String refundCheckTime)
    {
        this.refundCheckTime = refundCheckTime;
    }

    public String getRefundCheckStatus()
    {
        return refundCheckStatus;
    }

    public void setRefundCheckStatus(String refundCheckStatus)
    {
        this.refundCheckStatus = refundCheckStatus;
    }
    
    


}
