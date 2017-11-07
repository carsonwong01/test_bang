package com.dimeng.entity.ext.finance;

import java.io.Serializable;

/**
 * 退款列表返回结果实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月9日]
 */
public class FindRefundListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -71360194183945093L;
    
    /**
     * 订单号
     */
    private String id;
    
    /**
     * 订单编号
     */
    private String orderId;
    
    /**
     * 支持者
     */
    private String supporter;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 支持金额（元）
     */
    private String supportAmt;
    
    /**
     * 退款类型：1未发货退款 2投诉退款 3项目失败退款 4众筹失败退款 5溢出退款
     */
    private String refundType;
    
    /**
     * 项目id
     */
    private String projectId;
    
    /**
     * 项目编号
     */
    private String projectNo;
    
    /**
     * 支持渠道
     */
    private String supportSource;
    
    /**
     * 支付流水号
     */
    private String paySerialNo;
    
    /**
     * 退款发起时间
     */
    private String launchTime;
    
    /**
     * 退款结果时间
     */
    private String resultTime;
    
    /**
     * 退款结果
     */
    private String status;
    
    /**
     * 失败原因
     */
    private String failResult;
    
    /**
     * 支持金额合计（元）
     */
    private String supportTotal;
    
    /**
     * 项目类型
     */
    private String projectType;
    
    public String getOrderId()
    {
        return orderId;
    }
    
    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }
    
    public String getSupporter()
    {
        return supporter;
    }
    
    public void setSupporter(String supporter)
    {
        this.supporter = supporter;
    }
    
    public String getNickName()
    {
        return nickName;
    }
    
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
    public String getSupportAmt()
    {
        return supportAmt;
    }
    
    public void setSupportAmt(String supportAmt)
    {
        this.supportAmt = supportAmt;
    }
    
    public String getRefundType()
    {
        return refundType;
    }
    
    public void setRefundType(String refundType)
    {
        this.refundType = refundType;
    }
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    public String getProjectNo()
    {
        return projectNo;
    }
    
    public void setProjectNo(String projectNo)
    {
        this.projectNo = projectNo;
    }
    
    public String getSupportSource()
    {
        return supportSource;
    }
    
    public void setSupportSource(String supportSource)
    {
        this.supportSource = supportSource;
    }
    
    public String getPaySerialNo()
    {
        return paySerialNo;
    }
    
    public void setPaySerialNo(String paySerialNo)
    {
        this.paySerialNo = paySerialNo;
    }
    
    public String getLaunchTime()
    {
        return launchTime;
    }
    
    public void setLaunchTime(String launchTime)
    {
        this.launchTime = launchTime;
    }
    
    public String getResultTime()
    {
        return resultTime;
    }
    
    public void setResultTime(String resultTime)
    {
        this.resultTime = resultTime;
    }
    
    public String getStatus()
    {
        return status;
    }
    
    public void setStatus(String status)
    {
        this.status = status;
    }
    
    public String getFailResult()
    {
        return failResult;
    }
    
    public void setFailResult(String failResult)
    {
        this.failResult = failResult;
    }
    
    public String getSupportTotal()
    {
        return supportTotal;
    }
    
    public void setSupportTotal(String supportTotal)
    {
        this.supportTotal = supportTotal;
    }
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
    }

    public String getProjectType()
    {
        return projectType;
    }

    public void setProjectType(String projectType)
    {
        this.projectType = projectType;
    }
    
}
