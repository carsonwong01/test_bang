package com.dimeng.entity.table.project;

import java.math.BigDecimal;
import java.util.Date;

public class TProjectDynamic
{
    private String dynamicId;
    
    private String projectId;
    
    private Date dateCreate;
    
    private String dynamicInfo;
    
    private String dynamicType;
    
    private String creator;
    
    private BigDecimal supportAmount;
    
    private String orderNo;
    
    public String getDynamicId()
    {
        return dynamicId;
    }
    
    public void setDynamicId(String dynamicId)
    {
        this.dynamicId = dynamicId == null ? null : dynamicId.trim();
    }
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId == null ? null : projectId.trim();
    }
    
    public Date getDateCreate()
    {
        return dateCreate;
    }
    
    public void setDateCreate(Date dateCreate)
    {
        this.dateCreate = dateCreate;
    }
    
    public String getDynamicInfo()
    {
        return dynamicInfo;
    }
    
    public void setDynamicInfo(String dynamicInfo)
    {
        this.dynamicInfo = dynamicInfo == null ? null : dynamicInfo.trim();
    }
    
    public String getDynamicType()
    {
        return dynamicType;
    }
    
    public void setDynamicType(String dynamicType)
    {
        this.dynamicType = dynamicType == null ? null : dynamicType.trim();
    }
    
    public String getCreator()
    {
        return creator;
    }
    
    public void setCreator(String creator)
    {
        this.creator = creator == null ? null : creator.trim();
    }
    
    public BigDecimal getSupportAmount()
    {
        return supportAmount;
    }
    
    public void setSupportAmount(BigDecimal supportAmount)
    {
        this.supportAmount = supportAmount;
    }
    
    public String getOrderNo()
    {
        return orderNo;
    }
    
    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }
}