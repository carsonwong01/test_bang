package com.dimeng.entity.table.project;

import java.util.Date;

public class TProjectValidation
{
    private String validationId;
    
    private String projectId;
    
    private String validationType;
    
    private String receiveRealName;
    
    private String receiveIdCard;
    
    private String receiveIdCard2;
    
    private String receivePhone;
    
    private String disease;
    
    private String hospitalRegionId;
    
    private String hospitalName;
    
    private String recipientRealName;
    
    private String recipient;
    
    private String recipientIdCard;
    
    private String organizationName;
    
    private String organizationPhone;
    
    private Date dateCreate;
    
    private Date dateUpdate;
    
    private String auditStatus;
    
    private Date dateAduit;
    
    private String aduitUserId;
    
    private String receiveCardImageId;
    
    private String receiveCardImageUrl;
    
    private String recipientCardImageId;
    
    private String recipientCardImageUrl;
    
    private String weddingPictureId;
    
    private String weddingPictureUrl;

    private String projectRecord;
    
//    private String organizationAptitudeId;
//
//    private String organizationAptitudeUrl;

    private String foundationName;

    public String getProjectRecord() {
        return projectRecord;
    }

    public void setProjectRecord(String projectRecord) {
        this.projectRecord = projectRecord;
    }

    public String getFoundationName() {
        return foundationName;
    }

    public void setFoundationName(String foundationName) {
        this.foundationName = foundationName;
    }

    public String getValidationId()
    {
        return validationId;
    }
    
    public void setValidationId(String validationId)
    {
        this.validationId = validationId == null ? null : validationId.trim();
    }
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId == null ? null : projectId.trim();
    }
    
    public String getValidationType()
    {
        return validationType;
    }
    
    public void setValidationType(String validationType)
    {
        this.validationType = validationType == null ? null : validationType.trim();
    }
    
    public String getReceiveRealName()
    {
        return receiveRealName;
    }
    
    public void setReceiveRealName(String receiveRealName)
    {
        this.receiveRealName = receiveRealName == null ? null : receiveRealName.trim();
    }
    
    public String getReceiveIdCard()
    {
        return receiveIdCard;
    }
    
    public void setReceiveIdCard(String receiveIdCard)
    {
        this.receiveIdCard = receiveIdCard == null ? null : receiveIdCard.trim();
    }
    
    public String getReceiveIdCard2()
    {
        return receiveIdCard2;
    }
    
    public void setReceiveIdCard2(String receiveIdCard2)
    {
        this.receiveIdCard2 = receiveIdCard2 == null ? null : receiveIdCard2.trim();
    }
    
    public String getReceivePhone()
    {
        return receivePhone;
    }
    
    public void setReceivePhone(String receivePhone)
    {
        this.receivePhone = receivePhone == null ? null : receivePhone.trim();
    }
    
    public String getDisease()
    {
        return disease;
    }
    
    public void setDisease(String disease)
    {
        this.disease = disease == null ? null : disease.trim();
    }
    
    public String getHospitalRegionId()
    {
        return hospitalRegionId;
    }
    
    public void setHospitalRegionId(String hospitalRegionId)
    {
        this.hospitalRegionId = hospitalRegionId == null ? null : hospitalRegionId.trim();
    }
    
    public String getHospitalName()
    {
        return hospitalName;
    }
    
    public void setHospitalName(String hospitalName)
    {
        this.hospitalName = hospitalName == null ? null : hospitalName.trim();
    }
    
    public String getRecipientRealName()
    {
        return recipientRealName;
    }
    
    public void setRecipientRealName(String recipientRealName)
    {
        this.recipientRealName = recipientRealName == null ? null : recipientRealName.trim();
    }
    
    public String getRecipient()
    {
        return recipient;
    }
    
    public void setRecipient(String recipient)
    {
        this.recipient = recipient == null ? null : recipient.trim();
    }
    
    public String getRecipientIdCard()
    {
        return recipientIdCard;
    }
    
    public void setRecipientIdCard(String recipientIdCard)
    {
        this.recipientIdCard = recipientIdCard == null ? null : recipientIdCard.trim();
    }
    
    public String getOrganizationName()
    {
        return organizationName;
    }
    
    public void setOrganizationName(String organizationName)
    {
        this.organizationName = organizationName == null ? null : organizationName.trim();
    }
    
    public String getOrganizationPhone()
    {
        return organizationPhone;
    }
    
    public void setOrganizationPhone(String organizationPhone)
    {
        this.organizationPhone = organizationPhone == null ? null : organizationPhone.trim();
    }
    
    public Date getDateCreate()
    {
        return dateCreate;
    }
    
    public void setDateCreate(Date dateCreate)
    {
        this.dateCreate = dateCreate;
    }
    
    public Date getDateUpdate()
    {
        return dateUpdate;
    }
    
    public void setDateUpdate(Date dateUpdate)
    {
        this.dateUpdate = dateUpdate;
    }
    
    public String getAuditStatus()
    {
        return auditStatus;
    }
    
    public void setAuditStatus(String auditStatus)
    {
        this.auditStatus = auditStatus == null ? null : auditStatus.trim();
    }
    
    public Date getDateAduit()
    {
        return dateAduit;
    }
    
    public void setDateAduit(Date dateAduit)
    {
        this.dateAduit = dateAduit;
    }
    
    public String getAduitUserId()
    {
        return aduitUserId;
    }
    
    public void setAduitUserId(String aduitUserId)
    {
        this.aduitUserId = aduitUserId;
    }
    
    public String getReceiveCardImageId()
    {
        return receiveCardImageId;
    }
    
    public void setReceiveCardImageId(String receiveCardImageId)
    {
        this.receiveCardImageId = receiveCardImageId == null ? null : receiveCardImageId.trim();
    }
    
    public String getReceiveCardImageUrl()
    {
        return receiveCardImageUrl;
    }
    
    public void setReceiveCardImageUrl(String receiveCardImageUrl)
    {
        this.receiveCardImageUrl = receiveCardImageUrl == null ? null : receiveCardImageUrl.trim();
    }
    
    public String getRecipientCardImageId()
    {
        return recipientCardImageId;
    }
    
    public void setRecipientCardImageId(String recipientCardImageId)
    {
        this.recipientCardImageId = recipientCardImageId == null ? null : recipientCardImageId.trim();
    }
    
    public String getRecipientCardImageUrl()
    {
        return recipientCardImageUrl;
    }
    
    public void setRecipientCardImageUrl(String recipientCardImageUrl)
    {
        this.recipientCardImageUrl = recipientCardImageUrl == null ? null : recipientCardImageUrl.trim();
    }
    
    public String getWeddingPictureId()
    {
        return weddingPictureId;
    }
    
    public void setWeddingPictureId(String weddingPictureId)
    {
        this.weddingPictureId = weddingPictureId == null ? null : weddingPictureId.trim();
    }
    
    public String getWeddingPictureUrl()
    {
        return weddingPictureUrl;
    }
    
    public void setWeddingPictureUrl(String weddingPictureUrl)
    {
        this.weddingPictureUrl = weddingPictureUrl == null ? null : weddingPictureUrl.trim();
    }
    
//    public String getOrganizationAptitudeId()
//    {
//        return organizationAptitudeId;
//    }
    
//    public void setOrganizationAptitudeId(String organizationAptitudeId)
//    {
//        this.organizationAptitudeId = organizationAptitudeId == null ? null : organizationAptitudeId.trim();
//    }
    
//    public String getOrganizationAptitudeUrl()
//    {
//        return organizationAptitudeUrl;
//    }
//
//    public void setOrganizationAptitudeUrl(String organizationAptitudeUrl)
//    {
//        this.organizationAptitudeUrl = organizationAptitudeUrl == null ? null : organizationAptitudeUrl.trim();
//    }
}