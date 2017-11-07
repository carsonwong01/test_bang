package com.dimeng.entity.ext.user;

import java.io.Serializable;

/**
 *PC 用户个人中心首页
 * @author  song
 * @version  [版本号, 2016年10月13日]
 */
public class FrontUserAccHomeResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 1006186408908233797L;
    
    /**
     * 用户id
     */
    private String userId;
    
    /**
     * 上次登录时间
     */
    private String dateLastLogin;
    
    /**
     * 用户昵称
     */
    private String nickName;
    
    /**
     * 用户头像
     */
    private String imageUrl;
    
    /**
     * 用户状态
     */
    private String userStatus;
    
    /**
     * 身份证是否认证
     */
    private String idcardStatus;
    
    /**
     * 可用金额
     */
    private String availableAmount;
    
    /**
     * 冻结金额
     */
    private String frozenAmount;
    
    /**
     * 支持次数
     */
    private String supportTimes;
    
    /**
     * 支持金额
     */
    private String supportAmt;
    
    /**
     * 众筹成功的项目数
     */
    private String crowdfundingSuccess;
    
    /**
     * 众筹成功金额
     */
    private String crowdfundingAmt;

    
    
    public String getUserStatus()
    {
        return userStatus;
    }

    public void setUserStatus(String userStatus)
    {
        this.userStatus = userStatus;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getDateLastLogin()
    {
        return dateLastLogin;
    }

    public void setDateLastLogin(String dateLastLogin)
    {
        this.dateLastLogin = dateLastLogin;
    }

    public String getNickName()
    {
        return nickName;
    }

    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }

    public String getImageUrl()
    {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl)
    {
        this.imageUrl = imageUrl;
    }

    public String getIdcardStatus()
    {
        return idcardStatus;
    }

    public void setIdcardStatus(String idcardStatus)
    {
        this.idcardStatus = idcardStatus;
    }

    public String getAvailableAmount()
    {
        return availableAmount;
    }

    public void setAvailableAmount(String availableAmount)
    {
        this.availableAmount = availableAmount;
    }

    public String getFrozenAmount()
    {
        return frozenAmount;
    }

    public void setFrozenAmount(String frozenAmount)
    {
        this.frozenAmount = frozenAmount;
    }

    public String getSupportTimes()
    {
        return supportTimes;
    }

    public void setSupportTimes(String supportTimes)
    {
        this.supportTimes = supportTimes;
    }

    public String getSupportAmt()
    {
        return supportAmt;
    }

    public void setSupportAmt(String supportAmt)
    {
        this.supportAmt = supportAmt;
    }

    public String getCrowdfundingSuccess()
    {
        return crowdfundingSuccess;
    }

    public void setCrowdfundingSuccess(String crowdfundingSuccess)
    {
        this.crowdfundingSuccess = crowdfundingSuccess;
    }

    public String getCrowdfundingAmt()
    {
        return crowdfundingAmt;
    }

    public void setCrowdfundingAmt(String crowdfundingAmt)
    {
        this.crowdfundingAmt = crowdfundingAmt;
    }
    
}
