package com.dimeng.model.home;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.model.expand.FindExportExcelParamsReq;

import java.util.List;

/**
 * 前台微信、app首页req
 * @author  song
 * @version  [版本号, 2016年10月12日]
 */
public class FrontIndexReq extends FindExportExcelParamsReq
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 6400844822165228292L;


    /**
     * 来源 1PC端2微信端3APP端
     */
    @NotBlank
    private String opSource;

    
    /**
     * 项目类型  6回报项目   7梦想项目 
     */
    private String projectType;
    
    /**
     * 项目标签类型
     */
    private String tagType;
    
    /**
     * 排序字段
     */
    private String sorting;
    
    /**
     * 正/倒序
     */
    private String order;

    /**
     * 基金会
     */
    private String foundationName;
    /**
     * 发起医院
     */
    private String hospitalName;

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public String getFoundationName() {
        return foundationName;
    }

    public void setFoundationName(String foundationName) {
        this.foundationName = foundationName;
    }
    
    public String getProjectType()
    {
        return projectType;
    }

    public void setProjectType(String projectType)
    {
        this.projectType = projectType;
    }

    public String getTagType()
    {
        return tagType;
    }

    public void setTagType(String tagType)
    {
        this.tagType = tagType;
    }

    public String getSorting()
    {
        return sorting;
    }

    public void setSorting(String sorting)
    {
        this.sorting = sorting;
    }

    public String getOrder()
    {
        return order;
    }

    public void setOrder(String order)
    {
        this.order = order;
    }
 
    @Override
    public String getOpSource()
    {
        return opSource;
    }

    @Override
    public void setOpSource(String opSource)
    {
        this.opSource = opSource;
    }

    private String hospitalId;
    private List<String> hospitalTypes;
    private String hospitalNum;
    private String hospitalGrade;
    private String hospitalAbstract;
    private String hospitalImageUrl;
    private String hospitalImageId;
    private String description;
    private String hospitalType;
    private String linkName;
    private String mobilePhone;
    private String hospitalMail;
    private String officeTel;
    private String hospitalUrl;
    private String province;
    private String city;
    private String county;
    private String logoUrl;
    private String logoId;
    private String descriptionImageUrl;
    private String descriptionImageId;
    private String foundTime;

    private String projectId;
    private String projectName;
    private String targetAmount;
    private String raisedAmount;
    private String dateRaisedEnd;
    private String dateCreate;
    private String projectStatus;
    private String coverImageUrl;
    private String recipientRealName;
    private String supportTimes;


    private String allTargetAmount;
    private String allRaisedAmount;
    private String allSupprotTimes;
    private String rate;

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getAllTargetAmount() {
        return allTargetAmount;
    }

    public void setAllTargetAmount(String allTargetAmount) {
        this.allTargetAmount = allTargetAmount;
    }

    public String getAllRaisedAmount() {
        return allRaisedAmount;
    }

    public void setAllRaisedAmount(String allRaisedAmount) {
        this.allRaisedAmount = allRaisedAmount;
    }

    public String getAllSupprotTimes() {
        return allSupprotTimes;
    }

    public void setAllSupprotTimes(String allSupprotTimes) {
        this.allSupprotTimes = allSupprotTimes;
    }

    public List<String> getHospitalTypes() {
        return hospitalTypes;
    }

    public void setHospitalTypes(List<String> hospitalTypes) {
        this.hospitalTypes = hospitalTypes;
    }

    public String getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(String hospitalId) {
        this.hospitalId = hospitalId;
    }

    public String getHospitalNum() {
        return hospitalNum;
    }

    public void setHospitalNum(String hospitalNum) {
        this.hospitalNum = hospitalNum;
    }

    public String getHospitalGrade() {
        return hospitalGrade;
    }

    public void setHospitalGrade(String hospitalGrade) {
        this.hospitalGrade = hospitalGrade;
    }

    public String getHospitalType() {
        return hospitalType;
    }

    public void setHospitalType(String hospitalType) {
        this.hospitalType = hospitalType;
    }

    public String getHospitalAbstract() {
        return hospitalAbstract;
    }

    public void setHospitalAbstract(String hospitalAbstract) {
        this.hospitalAbstract = hospitalAbstract;
    }

    public String getHospitalImageUrl() {
        return hospitalImageUrl;
    }

    public void setHospitalImageUrl(String hospitalImageUrl) {
        this.hospitalImageUrl = hospitalImageUrl;
    }

    public String getHospitalImageId() {
        return hospitalImageId;
    }

    public void setHospitalImageId(String hospitalImageId) {
        this.hospitalImageId = hospitalImageId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getHospitalMail() {
        return hospitalMail;
    }

    public void setHospitalMail(String hospitalMail) {
        this.hospitalMail = hospitalMail;
    }

    public String getOfficeTel() {
        return officeTel;
    }

    public void setOfficeTel(String officeTel) {
        this.officeTel = officeTel;
    }

    public String getHospitalUrl() {
        return hospitalUrl;
    }

    public void setHospitalUrl(String hospitalUrl) {
        this.hospitalUrl = hospitalUrl;
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

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getLogoId() {
        return logoId;
    }

    public void setLogoId(String logoId) {
        this.logoId = logoId;
    }

    public String getDescriptionImageUrl() {
        return descriptionImageUrl;
    }

    public void setDescriptionImageUrl(String descriptionImageUrl) {
        this.descriptionImageUrl = descriptionImageUrl;
    }

    public String getDescriptionImageId() {
        return descriptionImageId;
    }

    public void setDescriptionImageId(String descriptionImageId) {
        this.descriptionImageId = descriptionImageId;
    }

    public String getFoundTime() {
        return foundTime;
    }

    public void setFoundTime(String foundTime) {
        this.foundTime = foundTime;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getTargetAmount() {
        return targetAmount;
    }

    public void setTargetAmount(String targetAmount) {
        this.targetAmount = targetAmount;
    }

    public String getRaisedAmount() {
        return raisedAmount;
    }

    public void setRaisedAmount(String raisedAmount) {
        this.raisedAmount = raisedAmount;
    }

    public String getDateRaisedEnd() {
        return dateRaisedEnd;
    }

    public void setDateRaisedEnd(String dateRaisedEnd) {
        this.dateRaisedEnd = dateRaisedEnd;
    }

    public String getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
    }

    public String getCoverImageUrl() {
        return coverImageUrl;
    }

    public void setCoverImageUrl(String coverImageUrl) {
        this.coverImageUrl = coverImageUrl;
    }

    public String getRecipientRealName() {
        return recipientRealName;
    }

    public void setRecipientRealName(String recipientRealName) {
        this.recipientRealName = recipientRealName;
    }

    public String getSupportTimes() {
        return supportTimes;
    }

    public void setSupportTimes(String supportTimes) {
        this.supportTimes = supportTimes;
    }
}
