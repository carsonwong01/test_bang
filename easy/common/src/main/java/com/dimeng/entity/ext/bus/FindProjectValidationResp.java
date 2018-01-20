/*
 * 文 件 名:  FindProjectValidationResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月13日
 */
package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 项目验证详情响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月13日]
 */
public class FindProjectValidationResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 5563198816024134569L;
    
    /**
     * 验证ID
     */
    private String validationId;
    
    /**
     * 项目ID
     */
    private String projectId;
    
    /**
     * 项目标题
     */
    private String projectName;
    
    /**
     * 项目类型
     */
    private String projectType;
    
    /**
     * 验证类型
     * 1本人验证(个人验证)
     * 2亲属验证
     * 3夫妻验证
     * 4组织验证(企业验证)
     */
    private String validationType;
    
    /**
     * 收款人真实姓名
     */
    private String receiveRealName;
    
    /**
     * 收款人身份证号
     */
    private String receiveIdCard;
    
    /**
     * 收款人联系电话
     */
    private String receivePhone;
    
    /**
     * 收款人手持身份证照片ID
     */
    private String receiveCardImageId;
    
    /**
     * 收款人手持身份证照片URL
     */
    private String receiveCardImageUrl;
    
    /**
     * 受助人真实姓名
     */
    private String recipientRealName;
    
    /**
     * 受助人身份证号
     */
    private String recipient;
    
    /**
     * 受助人手持身份证照片ID
     */
    private String recipientCardImageId;
    
    /**
     * 受助人手持身份证照片URL
     */
    private String recipientCardImageUrl;
    
    /**
     * 组织名称
     */
    private String organizationName;
    
    /**
     * 组织联系电话
     */
    private String organizationPhone;
    
    /**
     * 组织机构资质/营业执照图片ID
     */
    private String organizationAptitudeId;
    
    /**
     * 组织机构资质/营业执照图片URL
     */
    private String organizationAptitudeUrl;
    
    /**
     * 所患疾病
     */
    private String disease;
    
    /**
     * 医院省市ID
     */
    private String hospitalRegionId;
    
    /**
     * 医院省市名称
     */
    private String hospitalRegionName;
    
    /**
     * 医院名称
     */
    private String hospitalName;
    
    /**
     * 结婚证照片ID
     */
    private String weddingPictureId;
    
    /**
     * 结婚证照片URL
     */
    private String weddingPictureUrl;
    
    /**
     * 创建时间
     */
    private String dateCreate;
    
    /**
     * 审核状态
     */
    private String auditStatus;

    /**
     * 基金会名称
     */
    private String foundationName;

    /**
     * 医院用户手机
     */
    private String mobilePhone;
    /**
     * 省
     */
    private String province;
    /**
     * 市
     */
    private String city;
    /**
     * 固定电话
     */
    private String officeTel;
    /**
     *  详细地址
     */
    private String addr;
    /**
     * 公开募捐活动在民政部备案号
     */
    private String projectRecord;

    private String userType;

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getProjectRecord() {
        return projectRecord;
    }

    public void setProjectRecord(String projectRecord) {
        this.projectRecord = projectRecord;
    }

    public String getOfficeTel() {
        return officeTel;
    }

    public void setOfficeTel(String officeTel) {
        this.officeTel = officeTel;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getFoundationName() {
        return foundationName;
    }

    public void setFoundationName(String foundationName) {
        this.foundationName = foundationName;
    }
    
    /**
     * @return 返回 validationId
     */
    public String getValidationId()
    {
        return validationId;
    }
    
    /**
     * @param 对validationId进行赋值
     */
    public void setValidationId(String validationId)
    {
        this.validationId = validationId;
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
     * @return 返回 validationType
     */
    public String getValidationType()
    {
        return validationType;
    }
    
    /**
     * @param 对validationType进行赋值
     */
    public void setValidationType(String validationType)
    {
        this.validationType = validationType;
    }
    
    /**
     * @return 返回 receiveRealName
     */
    public String getReceiveRealName()
    {
        return receiveRealName;
    }
    
    /**
     * @param 对receiveRealName进行赋值
     */
    public void setReceiveRealName(String receiveRealName)
    {
        this.receiveRealName = receiveRealName;
    }
    
    /**
     * @return 返回 receiveIdCard
     */
    public String getReceiveIdCard()
    {
        return receiveIdCard;
    }
    
    /**
     * @param 对receiveIdCard进行赋值
     */
    public void setReceiveIdCard(String receiveIdCard)
    {
        this.receiveIdCard = receiveIdCard;
    }
    
    /**
     * @return 返回 receivePhone
     */
    public String getReceivePhone()
    {
        return receivePhone;
    }
    
    /**
     * @param 对receivePhone进行赋值
     */
    public void setReceivePhone(String receivePhone)
    {
        this.receivePhone = receivePhone;
    }
    
    /**
     * @return 返回 receiveCardImageId
     */
    public String getReceiveCardImageId()
    {
        return receiveCardImageId;
    }
    
    /**
     * @param 对receiveCardImageId进行赋值
     */
    public void setReceiveCardImageId(String receiveCardImageId)
    {
        this.receiveCardImageId = receiveCardImageId;
    }
    
    /**
     * @return 返回 receiveCardImageUrl
     */
    public String getReceiveCardImageUrl()
    {
        return receiveCardImageUrl;
    }
    
    /**
     * @param 对receiveCardImageUrl进行赋值
     */
    public void setReceiveCardImageUrl(String receiveCardImageUrl)
    {
        this.receiveCardImageUrl = receiveCardImageUrl;
    }
    
    /**
     * @return 返回 recipientRealName
     */
    public String getRecipientRealName()
    {
        return recipientRealName;
    }
    
    /**
     * @param 对recipientRealName进行赋值
     */
    public void setRecipientRealName(String recipientRealName)
    {
        this.recipientRealName = recipientRealName;
    }
    
    /**
     * @return 返回 recipient
     */
    public String getRecipient()
    {
        return recipient;
    }
    
    /**
     * @param 对recipient进行赋值
     */
    public void setRecipient(String recipient)
    {
        this.recipient = recipient;
    }
    
    /**
     * @return 返回 recipientCardImageId
     */
    public String getRecipientCardImageId()
    {
        return recipientCardImageId;
    }
    
    /**
     * @param 对recipientCardImageId进行赋值
     */
    public void setRecipientCardImageId(String recipientCardImageId)
    {
        this.recipientCardImageId = recipientCardImageId;
    }
    
    /**
     * @return 返回 recipientCardImageUrl
     */
    public String getRecipientCardImageUrl()
    {
        return recipientCardImageUrl;
    }
    
    /**
     * @param 对recipientCardImageUrl进行赋值
     */
    public void setRecipientCardImageUrl(String recipientCardImageUrl)
    {
        this.recipientCardImageUrl = recipientCardImageUrl;
    }
    
    /**
     * @return 返回 organizationName
     */
    public String getOrganizationName()
    {
        return organizationName;
    }
    
    /**
     * @param 对organizationName进行赋值
     */
    public void setOrganizationName(String organizationName)
    {
        this.organizationName = organizationName;
    }
    
    /**
     * @return 返回 organizationPhone
     */
    public String getOrganizationPhone()
    {
        return organizationPhone;
    }
    
    /**
     * @param 对organizationPhone进行赋值
     */
    public void setOrganizationPhone(String organizationPhone)
    {
        this.organizationPhone = organizationPhone;
    }
    
    /**
     * @return 返回 organizationAptitudeId
     */
    public String getOrganizationAptitudeId()
    {
        return organizationAptitudeId;
    }
    
    /**
     * @param 对organizationAptitudeId进行赋值
     */
    public void setOrganizationAptitudeId(String organizationAptitudeId)
    {
        this.organizationAptitudeId = organizationAptitudeId;
    }
    
    /**
     * @return 返回 organizationAptitudeUrl
     */
    public String getOrganizationAptitudeUrl()
    {
        return organizationAptitudeUrl;
    }
    
    /**
     * @param 对organizationAptitudeUrl进行赋值
     */
    public void setOrganizationAptitudeUrl(String organizationAptitudeUrl)
    {
        this.organizationAptitudeUrl = organizationAptitudeUrl;
    }
    
    /**
     * @return 返回 disease
     */
    public String getDisease()
    {
        return disease;
    }
    
    /**
     * @param 对disease进行赋值
     */
    public void setDisease(String disease)
    {
        this.disease = disease;
    }
    
    /**
     * @return 返回 hospitalRegionId
     */
    public String getHospitalRegionId()
    {
        return hospitalRegionId;
    }
    
    /**
     * @param 对hospitalRegionId进行赋值
     */
    public void setHospitalRegionId(String hospitalRegionId)
    {
        this.hospitalRegionId = hospitalRegionId;
    }
    
    /**
     * @return 返回 hospitalRegionName
     */
    public String getHospitalRegionName()
    {
        return hospitalRegionName;
    }
    
    /**
     * @param 对hospitalRegionName进行赋值
     */
    public void setHospitalRegionName(String hospitalRegionName)
    {
        this.hospitalRegionName = hospitalRegionName;
    }
    
    /**
     * @return 返回 hospitalName
     */
    public String getHospitalName()
    {
        return hospitalName;
    }
    
    /**
     * @param 对hospitalName进行赋值
     */
    public void setHospitalName(String hospitalName)
    {
        this.hospitalName = hospitalName;
    }
    
    /**
     * @return 返回 weddingPictureId
     */
    public String getWeddingPictureId()
    {
        return weddingPictureId;
    }
    
    /**
     * @param 对weddingPictureId进行赋值
     */
    public void setWeddingPictureId(String weddingPictureId)
    {
        this.weddingPictureId = weddingPictureId;
    }
    
    /**
     * @return 返回 weddingPictureUrl
     */
    public String getWeddingPictureUrl()
    {
        return weddingPictureUrl;
    }
    
    /**
     * @param 对weddingPictureUrl进行赋值
     */
    public void setWeddingPictureUrl(String weddingPictureUrl)
    {
        this.weddingPictureUrl = weddingPictureUrl;
    }
    
    /**
     * @return 返回 dateCreate
     */
    public String getDateCreate()
    {
        return dateCreate;
    }
    
    /**
     * @param 对dateCreate进行赋值
     */
    public void setDateCreate(String dateCreate)
    {
        this.dateCreate = dateCreate;
    }
    
    /**
     * @return 返回 auditStatus
     */
    public String getAuditStatus()
    {
        return auditStatus;
    }
    
    /**
     * @param 对auditStatus进行赋值
     */
    public void setAuditStatus(String auditStatus)
    {
        this.auditStatus = auditStatus;
    }
    
}
