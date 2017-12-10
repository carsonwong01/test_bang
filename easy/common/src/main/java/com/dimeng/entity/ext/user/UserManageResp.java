package com.dimeng.entity.ext.user;

import java.io.Serializable;

/**
 * 用户管理返回RESP
 * @author  song
 * @version  [版本号, 2016年9月28日]
 */
public class UserManageResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 5180484325583056794L;
    
    /**
     * 用户ID
     */
    private String userId;
    
    /**
     * 用户名
     */
    private String userName;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 真实姓名
     */
    private String realName;
    
    /**
     * 身份证号
     */
    private String idCard;
    
    /**
     * 注册来源0:PC 1:微信 2安卓 3：ios
     */
    private String source;
    
    /**
     * 状态 0正常 1锁定 2 拉黑
     */
    private String status;
    
    /**
     * 手机号
     */
    private String mobile;
    
    /**
     * 性别
     */
    private String sex;


    /**
     * 用户类型
     */
    private String userType;


    /**
     * 注册时间
     */
    private String registerTime;

    /**
     * 医院名
     */
    private String hospitalName;
    private String hospitalGrade;
    private String hospitalType;
    private String linkName;
    private String mobilePhone;
    private String hospitalMail;
    private String officeTel;
    private String province;
    private String city;

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

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }
    
    public String getMobile()
    {
        return mobile;
    }

    public void setMobile(String mobile)
    {
        this.mobile = mobile;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
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

    public String getRegisterTime()
    {
        return registerTime;
    }

    public void setRegisterTime(String registerTime)
    {
        this.registerTime = registerTime;
    }
    
}
