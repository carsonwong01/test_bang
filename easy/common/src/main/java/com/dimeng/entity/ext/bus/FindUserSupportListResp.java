/*
 * 文 件 名:  FindUserSupportListResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月17日
 */
package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 我支持的项目订单列表响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月17日]
 */
public class FindUserSupportListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 3049186307049407522L;
    
    /**
     * 订单ID
     */
    private String orderId;
    
    /**
     * 订单编号
     */
    private String orderNo;
    
    /**
     * 支持金额
     */
    private String supportAmount;
    
    /**
     * 订单状态
     */
    private String status;
    
    /**
     * 订单时间
     */
    private String supportTime;
    
    /**
     * 项目ID
     */
    private String projectId;
    
    /**
     * 项目类型
     */
    private String projectType;
    
    /**
     * 项目状态
     */
    private String projectStatus;
    
    /**
     * 项目封面图片
     */
    private String coverImage;
    
    /**
     * 项目标题
     */
    private String projectName;
    
    /**
     * 项目简介
     */
    private String projectIntro;
    
    /**
     * 已筹金额
     */
    private String raisedAmount;
    
    /**
     * 目标金额
     */
    private String targetAmount;
    
    /**
     * 剩余时间(天)
     */
    private String remainingDay;
    
    /**
     * @return 返回 orderId
     */
    public String getOrderId()
    {
        return orderId;
    }
    
    /**
     * @param 对orderId进行赋值
     */
    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }
    
    /**
     * @return 返回 orderNo
     */
    public String getOrderNo()
    {
        return orderNo;
    }
    
    /**
     * @param 对orderNo进行赋值
     */
    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo;
    }
    
    /**
     * @return 返回 supportAmount
     */
    public String getSupportAmount()
    {
        return supportAmount;
    }
    
    /**
     * @param 对supportAmount进行赋值
     */
    public void setSupportAmount(String supportAmount)
    {
        this.supportAmount = supportAmount;
    }
    
    /**
     * @return 返回 status
     */
    public String getStatus()
    {
        return status;
    }
    
    /**
     * @param 对status进行赋值
     */
    public void setStatus(String status)
    {
        this.status = status;
    }
    
    /**
     * @return 返回 supportTime
     */
    public String getSupportTime()
    {
        return supportTime;
    }
    
    /**
     * @param 对supportTime进行赋值
     */
    public void setSupportTime(String supportTime)
    {
        this.supportTime = supportTime;
    }
    
    /**
     * @return 返回 projectId
     */
    public String getProjectId()
    {
        return projectId;
    }
    
    /**
     * @param 对projectId进行赋值
     */
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    /**
     * @return 返回 projectType
     */
    public String getProjectType()
    {
        return projectType;
    }
    
    /**
     * @param 对projectType进行赋值
     */
    public void setProjectType(String projectType)
    {
        this.projectType = projectType;
    }
    
    /**
     * @return 返回 projectStatus
     */
    public String getProjectStatus()
    {
        return projectStatus;
    }
    
    /**
     * @param 对projectStatus进行赋值
     */
    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }
    
    /**
     * @return 返回 coverImage
     */
    public String getCoverImage()
    {
        return coverImage;
    }
    
    /**
     * @param 对coverImage进行赋值
     */
    public void setCoverImage(String coverImage)
    {
        this.coverImage = coverImage;
    }
    
    /**
     * @return 返回 projectName
     */
    public String getProjectName()
    {
        return projectName;
    }
    
    /**
     * @param 对projectName进行赋值
     */
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }
    
    /**
     * @return 返回 projectIntro
     */
    public String getProjectIntro()
    {
        return projectIntro;
    }
    
    /**
     * @param 对projectIntro进行赋值
     */
    public void setProjectIntro(String projectIntro)
    {
        this.projectIntro = projectIntro;
    }
    
    /**
     * @return 返回 raisedAmount
     */
    public String getRaisedAmount()
    {
        return raisedAmount;
    }
    
    /**
     * @param 对raisedAmount进行赋值
     */
    public void setRaisedAmount(String raisedAmount)
    {
        this.raisedAmount = raisedAmount;
    }
    
    /**
     * @return 返回 targetAmount
     */
    public String getTargetAmount()
    {
        return targetAmount;
    }
    
    /**
     * @param 对targetAmount进行赋值
     */
    public void setTargetAmount(String targetAmount)
    {
        this.targetAmount = targetAmount;
    }
    
    /**
     * @return 返回 remainingDay
     */
    public String getRemainingDay()
    {
        return remainingDay;
    }
    
    /**
     * @param 对remainingDay进行赋值
     */
    public void setRemainingDay(String remainingDay)
    {
        this.remainingDay = remainingDay;
    }
    
}
