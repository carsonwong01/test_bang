package com.dimeng.model.expand;

import com.dimeng.framework.domain.BaseReq;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

public class InsertHospitalReq extends BaseReq {

    private String userId;
    //医院ID
    private String hospitalId;
    private String hospitalName;
    private String hospitalNum;
    private String hospitalGrade;
    private String hospitalType;
    private String hospitalAbstract;
    private String hospitalImageUrl;
    private String hospitalImageId;
    private String description;
    private String linkName;

    @NotBlank
    private String mobilePhone;
    private String hospitalMail;
    private String officeTel;
    private String hospitalUrl;
    private String province;
    private String city;
    private String county;
    private String addr;
    private String area;
    private String logoUrl;
    private String logoId;
    private String descriptionImageUrl;
    private String descriptionImageId;
    private String foundTime;
    private String organizationAptitudeUrl;
    private String organizationAptitudeId;

    private String publishStatus;//是否发布
    private String recommendStatus;//是否推荐

    /**
     * 来源 1 PC \r\n       2 微信\r\n       3 安卓  4IOS
     */
    private String source;

    /**
     * 用户头像-第三方
     */
    private String headPortrait;

    /**
     * 用户昵称-第三方
     */
    private String nickname;

    /**
     * 性别 - 第三方
     */
    private String sex;

    /**
     * 注册IP
     */
    @Length(max = 30)
    private String lastLoginIp;

    /**
     * 注册时，手机发送的验证码
     */
    @NotBlank
    private String telCode;

    /**
     * 用户认证token
     */
    @NotBlank
    public String token;

    /**
     * 用户标识
     */
    @NotBlank
    public String openid;

    /**
     * 授权码授权时间
     */
    public String tokenTime;

    /**
     * 登录授权方式-1 手机  2 微信 3 微博 4 QQ
     */
    @NotBlank
    public String thirdType;

    /**
     * tonken失效时间
     */
    public String tokenExpireIn;

    public String unionId;
    public String getPublishStatus() {
        return publishStatus;
    }

    public void setPublishStatus(String publishStatus) {
        this.publishStatus = publishStatus;
    }

    public String getRecommendStatus() {
        return recommendStatus;
    }

    public void setRecommendStatus(String recommendStatus) {
        this.recommendStatus = recommendStatus;
    }


    public String getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTelCode() {
        return telCode;
    }

    public void setTelCode(String telCode) {
        this.telCode = telCode;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getTokenTime() {
        return tokenTime;
    }

    public void setTokenTime(String tokenTime) {
        this.tokenTime = tokenTime;
    }

    public String getThirdType() {
        return thirdType;
    }

    public void setThirdType(String thirdType) {
        this.thirdType = thirdType;
    }

    public String getTokenExpireIn() {
        return tokenExpireIn;
    }

    public void setTokenExpireIn(String tokenExpireIn) {
        this.tokenExpireIn = tokenExpireIn;
    }

    public String getUnionId() {
        return unionId;
    }

    public void setUnionId(String unionId) {
        this.unionId = unionId;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    @Override
    public String getUserId() {
        return userId;
    }

    @Override
    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getOrganizationAptitudeUrl() {
        return organizationAptitudeUrl;
    }

    public void setOrganizationAptitudeUrl(String organizationAptitudeUrl) {
        this.organizationAptitudeUrl = organizationAptitudeUrl;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
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

    public String getOrganizationAptitudeId() {
        return organizationAptitudeId;
    }

    public void setOrganizationAptitudeId(String organizationAptitudeId) {
        this.organizationAptitudeId = organizationAptitudeId;
    }
}
