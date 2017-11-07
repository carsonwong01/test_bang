package com.dimeng.entity.ext.finance;

import java.io.Serializable;

public class SupportOrderStatusResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -7579317823846197413L;
    
    /**
     * 订单状态
     */
    private String orderStatus;
    /**
     * 订单编号
     */
    private String orderNo;
    /**
     * 退款原因
     */
    private String refundReason;
    
    /**
     * 项目id
     */
    private String projectId;
    
    /**
     * 项目名称
     */
    private String projectName;
    
    
    public String getOrderStatus()
    {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus)
    {
        this.orderStatus = orderStatus;
    }

    public String getRefundReason()
    {
        return refundReason;
    }

    public void setRefundReason(String refundReason)
    {
        this.refundReason = refundReason;
    }

    public String getProjectId()
    {
        return projectId;
    }

    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }

    public String getProjectName()
    {
        return projectName;
    }

    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }

    public String getOrderNo()
    {
        return orderNo;
    }

    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo;
    }

  

}
