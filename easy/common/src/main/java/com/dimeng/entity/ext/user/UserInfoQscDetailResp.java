package com.dimeng.entity.ext.user;

import java.io.Serializable;

/**
 * 用户管理查看用户详情信息resp
 * @author  song
 * @version  [版本号, 2016年9月29日]
 */
public class UserInfoQscDetailResp implements Serializable
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -8370047339679653312L;

    private String userId;
    
    private String headUrl;
    
    private String userName;
    
    private String realName;
    
    private String idCard;
    
    private String sex;
    
    private String phoneNumber;
    
    private String availableMoney;
    
    private String freezeMoney;
    
    private String withdrawAmt;
    
    private String supportCount;
    
    private String supportAmt;
    
    private String crowdFundingAmt;
   
    private String crowdFundingCount;
     
    public String getUserId()
    {
        return userId;
    }
 
    public String getSupportAmt()
    {
        return supportAmt;
    }
 
    public void setSupportAmt(String supportAmt)
    {
        this.supportAmt = supportAmt;
    } 
    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getHeadUrl()
    {
        return headUrl;
    }

    public void setHeadUrl(String headUrl)
    {
        this.headUrl = headUrl;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
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

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getPhoneNumber()
    {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber)
    {
        this.phoneNumber = phoneNumber;
    }

    public String getAvailableMoney()
    {
        return availableMoney;
    }

    public void setAvailableMoney(String availableMoney)
    {
        this.availableMoney = availableMoney;
    }

    public String getFreezeMoney()
    {
        return freezeMoney;
    }

    public void setFreezeMoney(String freezeMoney)
    {
        this.freezeMoney = freezeMoney;
    }

    public String getWithdrawAmt()
    {
        return withdrawAmt;
    }

    public void setWithdrawAmt(String withdrawAmt)
    {
        this.withdrawAmt = withdrawAmt;
    }

    public String getSupportCount()
    {
        return supportCount;
    }

    public void setSupportCount(String supportCount)
    {
        this.supportCount = supportCount;
    }

    public String getCrowdFundingAmt()
    {
        return crowdFundingAmt;
    }

    public void setCrowdFundingAmt(String crowdFundingAmt)
    {
        this.crowdFundingAmt = crowdFundingAmt;
    }

    public String getCrowdFundingCount()
    {
        return crowdFundingCount;
    }

    public void setCrowdFundingCount(String crowdFundingCount)
    {
        this.crowdFundingCount = crowdFundingCount;
    }
 
} 
