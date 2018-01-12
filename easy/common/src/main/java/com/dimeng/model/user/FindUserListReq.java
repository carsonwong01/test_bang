package com.dimeng.model.user;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 后台用户管理req
 * @author  song
 * @version  [版本号, 2016年9月28日]
 */
public class FindUserListReq extends FindExportExcelParamsReq 
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 4856418484552699966L;
    
    /**
     * 用户名
     */
    private String userName;
    
    /**
     * 用户昵称    
     */
    private String nickName;
    
    /**
     * 真实姓名
     */
    private String realName;
    
    /**
     * 身份证
     */
    private String idCard;
    
    /**
     * 注册来源  0 PC 1 微信 2 安卓 3 IOS 
     */
    private String source;
    
    /**
     * 状态 0 正常 1锁定 2 拉黑
     */
    private String status;
    
    /**
     * 开始时间 注册
     */
    private String staTime;

    /**
     * 用户类型
     */
    private String userType;


    /**
     * 结束时间
     */
    private String endTime;
    /**
     * 邮箱
     */
    private String email;
    private String hospitalName;
    private String mobilePhone;
    private String province;
    private String city;
    private String county;
    private String addr;
    private String hospitalGrade;
    private String hospitalType;
    private String linkName;
    private String hospitalMail;
    private String officeTel;
    private String area;
    private String publishStatus;
    private String recommendStatus;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

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

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
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

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
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

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
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

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getNickName()
    {
        return nickName;
    }

    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }

    public String getRealName()
    {
        return realName;
    }

    public void setRealName(String realName)
    {
        this.realName = realName;
    }

    public String getIdCard()
    {
        return idCard;
    }

    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getSource()
    {
        return source;
    }

    public void setSource(String source)
    {
        this.source = source;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStaTime()
    {
        return staTime;
    }

    public void setStaTime(String staTime)
    {
        this.staTime = staTime;
    }

    public String getEndTime()
    {
        return endTime;
    }

    public void setEndTime(String endTime)
    {
        this.endTime = endTime;
    }
    
}
