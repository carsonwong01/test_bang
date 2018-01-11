package com.dimeng.entity.ext.expand;

import java.io.Serializable;
import java.util.Date;

public class FindFoundationResp  implements Serializable {
    //基金会ID
    private String foundationId;
    //基金会名称
    private String foundationName;
    //网址
    private String foundationUrl;
    //登记管理机关
    private String registrationInstitution;
    //统一社会信用代码
    private String socialCreditCode;
    //登记证书
    private String certificateUrl;
    //公开募捐资质
    private String donationsQualificationUrl;
    //办公地址
    private String address;
    //办公电话
    private String officeTel;
    //联系邮箱
    private String mail;
    //logo
    private String logoUrl;
    //录入时间
    private Date CreateTime;
    //基金会描述
    private String description;
    //剩余资产处理方案
    private String remainProperty;
    //开户行信息
    private String bankInfo;
    //发票类型
    private String invoiceType;
    //支付账户信息
    private String accountInfo;
    //联系手机
    private String linkMobile;
    //联系人
    private String linkName;

    public String getFoundationId() {
        return foundationId;
    }

    public void setFoundationId(String foundationId) {
        this.foundationId = foundationId;
    }

    public String getFoundationName() {
        return foundationName;
    }

    public void setFoundationName(String foundationName) {
        this.foundationName = foundationName;
    }

    public String getFoundationUrl() {
        return foundationUrl;
    }

    public void setFoundationUrl(String foundationUrl) {
        this.foundationUrl = foundationUrl;
    }

    public String getRegistrationInstitution() {
        return registrationInstitution;
    }

    public void setRegistrationInstitution(String registrationInstitution) {
        this.registrationInstitution = registrationInstitution;
    }

    public String getSocialCreditCode() {
        return socialCreditCode;
    }

    public void setSocialCreditCode(String socialCreditCode) {
        this.socialCreditCode = socialCreditCode;
    }

    public String getCertificateUrl() {
        return certificateUrl;
    }

    public void setCertificateUrl(String certificateUrl) {
        this.certificateUrl = certificateUrl;
    }

    public String getDonationsQualificationUrl() {
        return donationsQualificationUrl;
    }

    public void setDonationsQualificationUrl(String donationsQualificationUrl) {
        this.donationsQualificationUrl = donationsQualificationUrl;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOfficeTel() {
        return officeTel;
    }

    public void setOfficeTel(String officeTel) {
        this.officeTel = officeTel;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public Date getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(Date createTime) {
        CreateTime = createTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRemainProperty() {
        return remainProperty;
    }

    public void setRemainProperty(String remainProperty) {
        this.remainProperty = remainProperty;
    }

    public String getBankInfo() {
        return bankInfo;
    }

    public void setBankInfo(String bankInfo) {
        this.bankInfo = bankInfo;
    }

    public String getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(String invoiceType) {
        this.invoiceType = invoiceType;
    }

    public String getAccountInfo() {
        return accountInfo;
    }

    public void setAccountInfo(String accountInfo) {
        this.accountInfo = accountInfo;
    }

    public String getLinkMobile() {
        return linkMobile;
    }

    public void setLinkMobile(String linkMobile) {
        this.linkMobile = linkMobile;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }
    public FindFoundationResp(){}
}
