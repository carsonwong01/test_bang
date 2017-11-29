package com.dimeng.model.expand;

public class HospitalBasicReq extends FindExportExcelParamsReq {
    //医院ID
    private String hospitalId;
    private String hospitalName;
    private String hospitalNum;
    private String hospitalGrade;
    private String hospitalType;
    private String hospitalAbstract;
    private String hospitalImageUrl;
    private String hospitalImageId;
    private String descirption;
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
    private String descirptionImageUrl;
    private String descriptionImageId;

    public HospitalBasicReq(){};
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

    public String getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(String hospitalId) {
        this.hospitalId = hospitalId;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
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

    public String getDescirption() {
        return descirption;
    }

    public void setDescirption(String descirption) {
        this.descirption = descirption;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
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

    public String getDescirptionImageUrl() {
        return descirptionImageUrl;
    }

    public void setDescirptionImageUrl(String descirptionImageUrl) {
        this.descirptionImageUrl = descirptionImageUrl;
    }

    public String getDescriptionImageId() {
        return descriptionImageId;
    }

    public void setDescriptionImageId(String descriptionImageId) {
        this.descriptionImageId = descriptionImageId;
    }

    @Override
    public String toString() {
        return "HospitalBasicReq{" +
                "hospitalId='" + hospitalId + '\'' +
                ", hospitalName='" + hospitalName + '\'' +
                ", hospitalNum='" + hospitalNum + '\'' +
                ", hospitalGrade='" + hospitalGrade + '\'' +
                ", hospitalType='" + hospitalType + '\'' +
                ", hospitalAbstract='" + hospitalAbstract + '\'' +
                ", hospitalImageUrl='" + hospitalImageUrl + '\'' +
                ", hospitalImageId='" + hospitalImageId + '\'' +
                ", descirption='" + descirption + '\'' +
                ", linkName='" + linkName + '\'' +
                ", mobilPhone='" + mobilePhone + '\'' +
                ", officeTel='" + officeTel + '\'' +
                ", hospitalUrl='" + hospitalUrl + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", county='" + county + '\'' +
                ", logoUrl='" + logoUrl + '\'' +
                ", logoId='" + logoId + '\'' +
                ", descirptionImageUrl='" + descirptionImageUrl + '\'' +
                ", descriptionImageId='" + descriptionImageId + '\'' +
                '}';
    }
}
