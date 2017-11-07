package com.dimeng.entity.table.project;

import java.math.BigDecimal;
import java.util.Date;

public class TProjectInfo
{
    private String projectId;
    
    private String projectNo;
    
    private String projectName;
    
    private String projectType;
    
    private String projectCreatorId;
    
    private BigDecimal targetAmount;
    
    private BigDecimal raisedAmount;
    
    private String projectIntro;
    
    private String projectStatus;
    
    private String financingDays;
    
    private Date dateRaisedEnd;
    
    private String freightDescribe;
    
    private String deliverDescribe;
    
    private Date dateCreate;
    
    private String modifyId;
    
    private Date dateUpdate;
    
    private String qrCodeAddr;
    
    private Date dateSuccess;
    
    private String projectLabel;
    
    private String isNeddAddr;
    
    private Date dateProjectFailure;
    
    private String failureReason;
    
    private String operatorFailureId;
    
    private Date dateProjectDelete;
    
    private String deleteReason;
    
    private String operatorDeleteId;
    
    private String projectDetails;
    
    private String coverImageId;
    
    private String coverImageUrl;
    
    private String shieldStatus;
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId == null ? null : projectId.trim();
    }
    
    public String getProjectNo()
    {
        return projectNo;
    }
    
    public void setProjectNo(String projectNo)
    {
        this.projectNo = projectNo == null ? null : projectNo.trim();
    }
    
    public String getProjectName()
    {
        return projectName;
    }
    
    public void setProjectName(String projectName)
    {
        this.projectName = projectName == null ? null : projectName.trim();
    }
    
    public String getProjectType()
    {
        return projectType;
    }
    
    public void setProjectType(String projectType)
    {
        this.projectType = projectType == null ? null : projectType.trim();
    }
    
    public String getProjectCreatorId()
    {
        return projectCreatorId;
    }
    
    public void setProjectCreatorId(String projectCreatorId)
    {
        this.projectCreatorId = projectCreatorId == null ? null : projectCreatorId.trim();
    }
    
    public BigDecimal getTargetAmount()
    {
        return targetAmount;
    }
    
    public void setTargetAmount(BigDecimal targetAmount)
    {
        this.targetAmount = targetAmount;
    }
    
    public BigDecimal getRaisedAmount()
    {
        return raisedAmount;
    }
    
    public void setRaisedAmount(BigDecimal raisedAmount)
    {
        this.raisedAmount = raisedAmount;
    }
    
    public String getProjectIntro()
    {
        return projectIntro;
    }
    
    public void setProjectIntro(String projectIntro)
    {
        this.projectIntro = projectIntro == null ? null : projectIntro.trim();
    }
    
    public String getProjectStatus()
    {
        return projectStatus;
    }
    
    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus == null ? null : projectStatus.trim();
    }
    
    public Date getDateRaisedEnd()
    {
        return dateRaisedEnd;
    }
    
    public void setDateRaisedEnd(Date dateRaisedEnd)
    {
        this.dateRaisedEnd = dateRaisedEnd;
    }
    
    public String getFreightDescribe()
    {
        return freightDescribe;
    }
    
    public void setFreightDescribe(String freightDescribe)
    {
        this.freightDescribe = freightDescribe == null ? null : freightDescribe.trim();
    }
    
    public String getDeliverDescribe()
    {
        return deliverDescribe;
    }
    
    public void setDeliverDescribe(String deliverDescribe)
    {
        this.deliverDescribe = deliverDescribe == null ? null : deliverDescribe.trim();
    }
    
    public Date getDateCreate()
    {
        return dateCreate;
    }
    
    public void setDateCreate(Date dateCreate)
    {
        this.dateCreate = dateCreate;
    }
    
    public String getModifyId()
    {
        return modifyId;
    }
    
    public void setModifyId(String modifyId)
    {
        this.modifyId = modifyId == null ? null : modifyId.trim();
    }
    
    public Date getDateUpdate()
    {
        return dateUpdate;
    }
    
    public void setDateUpdate(Date dateUpdate)
    {
        this.dateUpdate = dateUpdate;
    }
    
    public String getQrCodeAddr()
    {
        return qrCodeAddr;
    }
    
    public void setQrCodeAddr(String qrCodeAddr)
    {
        this.qrCodeAddr = qrCodeAddr == null ? null : qrCodeAddr.trim();
    }
    
    public Date getDateSuccess()
    {
        return dateSuccess;
    }
    
    public void setDateSuccess(Date dateSuccess)
    {
        this.dateSuccess = dateSuccess;
    }
    
    public String getProjectLabel()
    {
        return projectLabel;
    }
    
    public void setProjectLabel(String projectLabel)
    {
        this.projectLabel = projectLabel == null ? null : projectLabel.trim();
    }
    
    public String getIsNeddAddr()
    {
        return isNeddAddr;
    }
    
    public void setIsNeddAddr(String isNeddAddr)
    {
        this.isNeddAddr = isNeddAddr == null ? null : isNeddAddr.trim();
    }
    
    public Date getDateProjectFailure()
    {
        return dateProjectFailure;
    }
    
    public void setDateProjectFailure(Date dateProjectFailure)
    {
        this.dateProjectFailure = dateProjectFailure;
    }
    
    public String getFailureReason()
    {
        return failureReason;
    }
    
    public void setFailureReason(String failureReason)
    {
        this.failureReason = failureReason == null ? null : failureReason.trim();
    }
    
    public String getOperatorFailureId()
    {
        return operatorFailureId;
    }
    
    public void setOperatorFailureId(String operatorFailureId)
    {
        this.operatorFailureId = operatorFailureId == null ? null : operatorFailureId.trim();
    }
    
    public Date getDateProjectDelete()
    {
        return dateProjectDelete;
    }
    
    public void setDateProjectDelete(Date dateProjectDelete)
    {
        this.dateProjectDelete = dateProjectDelete;
    }
    
    public String getDeleteReason()
    {
        return deleteReason;
    }
    
    public void setDeleteReason(String deleteReason)
    {
        this.deleteReason = deleteReason;
    }
    
    public String getOperatorDeleteId()
    {
        return operatorDeleteId;
    }
    
    public void setOperatorDeleteId(String operatorDeleteId)
    {
        this.operatorDeleteId = operatorDeleteId;
    }
    
    public String getProjectDetails()
    {
        return projectDetails;
    }
    
    public void setProjectDetails(String projectDetails)
    {
        this.projectDetails = projectDetails == null ? null : projectDetails.trim();
    }
    
    public String getCoverImageId()
    {
        return coverImageId;
    }
    
    public void setCoverImageId(String coverImageId)
    {
        this.coverImageId = coverImageId;
    }
    
    public String getCoverImageUrl()
    {
        return coverImageUrl;
    }
    
    public void setCoverImageUrl(String coverImageUrl)
    {
        this.coverImageUrl = coverImageUrl;
    }
    
    public String getFinancingDays()
    {
        return financingDays;
    }
    
    public void setFinancingDays(String financingDays)
    {
        this.financingDays = financingDays;
    }

    public String getShieldStatus()
    {
        return shieldStatus;
    }

    public void setShieldStatus(String shieldStatus)
    {
        this.shieldStatus = shieldStatus;
    }
    
}