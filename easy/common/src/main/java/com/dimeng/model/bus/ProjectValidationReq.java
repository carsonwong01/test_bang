/*
 * 文 件 名:  InsertProjectValidation.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月12日
 */
package com.dimeng.model.bus;

import com.dimeng.framework.domain.BaseReq;

/**
 * 项目验证请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月12日]
 */
public class ProjectValidationReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 2744863872652378769L;
    
    /**
     * 验证ID
     */
    private String validationId;
    
    /**
     * 项目ID
     */
    private String projectId;
    
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
     * 收款人身份证号(带*号)
     */
    private String receiveIdCard2;
    
    /**
     * 收款人联系电话
     */
    private String receivePhone;
    
    /**
     * 受助人真实姓名
     */
    private String recipientRealName;
    
    /**
     * 受助人身份证号
     */
    private String recipient;
    
    /**
     * 受助人身份证号(带*号)
     */
    private String recipientIdCard;
    
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
     * 医疗诊断证明图片ID集合
     */
    private String[] proveImgIds;
    
    /**
     * 户口本图片ID集合
     */
    private String[] accountBookImgIds;
    
    /**
     * 资金用途证明图片ID集合
     */
    private String[] useProveImgIds;
    
    /**
     * 项目相关证明图片ID集合
     */
    private String[] projectProveImgIds;
    
    /**
     * 收款人手持身份证照片ID集合
     */
    private String[] receiveCardImageIds;
    
    /**
     * 受助人手持身份证照片ID集合
     */
    private String[] recipientCardImageIds;

    /**
     * 基金会名称
     */
    private String foundationName;

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
     * @return 返回 receiveIdCard2
     */
    public String getReceiveIdCard2()
    {
        return receiveIdCard2;
    }
    
    /**
     * @param 对receiveIdCard2进行赋值
     */
    public void setReceiveIdCard2(String receiveIdCard2)
    {
        this.receiveIdCard2 = receiveIdCard2;
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
     * @return 返回 recipientIdCard
     */
    public String getRecipientIdCard()
    {
        return recipientIdCard;
    }
    
    /**
     * @param 对recipientIdCard进行赋值
     */
    public void setRecipientIdCard(String recipientIdCard)
    {
        this.recipientIdCard = recipientIdCard;
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
     * @return 返回 proveImgIds
     */
    public String[] getProveImgIds()
    {
        return proveImgIds;
    }
    
    /**
     * @param 对proveImgIds进行赋值
     */
    public void setProveImgIds(String[] proveImgIds)
    {
        this.proveImgIds = proveImgIds;
    }
    
    /**
     * @return 返回 accountBookImgIds
     */
    public String[] getAccountBookImgIds()
    {
        return accountBookImgIds;
    }
    
    /**
     * @param 对accountBookImgIds进行赋值
     */
    public void setAccountBookImgIds(String[] accountBookImgIds)
    {
        this.accountBookImgIds = accountBookImgIds;
    }
    
    /**
     * @return 返回 useProveImgIds
     */
    public String[] getUseProveImgIds()
    {
        return useProveImgIds;
    }
    
    /**
     * @param 对useProveImgIds进行赋值
     */
    public void setUseProveImgIds(String[] useProveImgIds)
    {
        this.useProveImgIds = useProveImgIds;
    }
    
    /**
     * @return 返回 projectProveImgIds
     */
    public String[] getProjectProveImgIds()
    {
        return projectProveImgIds;
    }
    
    /**
     * @param 对projectProveImgIds进行赋值
     */
    public void setProjectProveImgIds(String[] projectProveImgIds)
    {
        this.projectProveImgIds = projectProveImgIds;
    }
    
    /**
     * @return 返回 receiveCardImageIds
     */
    public String[] getReceiveCardImageIds()
    {
        return receiveCardImageIds;
    }
    
    /**
     * @param 对receiveCardImageIds进行赋值
     */
    public void setReceiveCardImageIds(String[] receiveCardImageIds)
    {
        this.receiveCardImageIds = receiveCardImageIds;
    }
    
    /**
     * @return 返回 recipientCardImageIds
     */
    public String[] getRecipientCardImageIds()
    {
        return recipientCardImageIds;
    }
    
    /**
     * @param 对recipientCardImageIds进行赋值
     */
    public void setRecipientCardImageIds(String[] recipientCardImageIds)
    {
        this.recipientCardImageIds = recipientCardImageIds;
    }
    
}
