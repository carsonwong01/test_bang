package com.dimeng.entity.ext.user;

import java.io.Serializable;

/**
 * 进入个人设置，查询用户基本信息
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月14日]
 */
public class FindAccInfoResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 4630856589230738466L;
    
    /**
     * 用户头像
     */
    private String headUrl;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 用户名 
     */
    private String userName;
    
    /**
     * 绑定手机号
     */
    private String phoneNumber;
    
    /**
     * 发起项目数
     */
    private String launchProNumber;
    
    /**
     * 支持项目数
     */
    private String supportProNumber;
    
    /**
     * 关注项目数 
     */
    private String focusProNumber;
    
    /**
     * 我的账户金额
     */
    private String accountAmt;
    
    /**
     * 冻结金额
     */
    private String frozenAmount;
    
    /**
     * 账户状态
     */
    private String userStatus;
    
    /**
     * 身份认证状态 
     */
    private String idcardStatus;
    
    /**
     * 交易密码状态
     */
    private String tradePwdStatus;
    
    public String getHeadUrl()
    {
        return headUrl;
    }
    
    public void setHeadUrl(String headUrl)
    {
        this.headUrl = headUrl;
    }
    
    public String getNickName()
    {
        return nickName;
    }
    
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
    public String getUserName()
    {
        return userName;
    }
    
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    
    public String getPhoneNumber()
    {
        return phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber)
    {
        this.phoneNumber = phoneNumber;
    }
    
    public String getLaunchProNumber()
    {
        return launchProNumber;
    }
    
    public void setLaunchProNumber(String launchProNumber)
    {
        this.launchProNumber = launchProNumber;
    }
    
    public String getSupportProNumber()
    {
        return supportProNumber;
    }
    
    public void setSupportProNumber(String supportProNumber)
    {
        this.supportProNumber = supportProNumber;
    }
    
    public String getFocusProNumber()
    {
        return focusProNumber;
    }
    
    public void setFocusProNumber(String focusProNumber)
    {
        this.focusProNumber = focusProNumber;
    }
    
    public String getAccountAmt()
    {
        return accountAmt;
    }
    
    public void setAccountAmt(String accountAmt)
    {
        this.accountAmt = accountAmt;
    }
    
    public String getFrozenAmount()
    {
        return frozenAmount;
    }
    
    public void setFrozenAmount(String frozenAmount)
    {
        this.frozenAmount = frozenAmount;
    }
    
    public String getUserStatus()
    {
        return userStatus;
    }
    
    public void setUserStatus(String userStatus)
    {
        this.userStatus = userStatus;
    }
    
    public String getIdcardStatus()
    {
        return idcardStatus;
    }
    
    public void setIdcardStatus(String idcardStatus)
    {
        this.idcardStatus = idcardStatus;
    }

	public String getTradePwdStatus() {
		return tradePwdStatus;
	}

	public void setTradePwdStatus(String tradePwdStatus) {
		this.tradePwdStatus = tradePwdStatus;
	}

}
