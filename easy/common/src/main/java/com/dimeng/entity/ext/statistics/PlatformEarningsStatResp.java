package com.dimeng.entity.ext.statistics;

import java.io.Serializable;

/**
 * <平台资金统计返回实体>
 * <一句话功能简述> 
 * @author  song
 * @version  [版本号, 2016年10月10日]
 */
public class PlatformEarningsStatResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 2569313839235765732L;
    
    /**
     * 用户名
     */
    private String userName;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 提现手续费
     */
    private String withdrawFee;
    
    /**
     * 提现时间
     */
    private String withdrawTime;


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

    public String getWithdrawFee()
    {
        return withdrawFee;
    }

    public void setWithdrawFee(String withdrawFee)
    {
        this.withdrawFee = withdrawFee;
    }

    public String getWithdrawTime()
    {
        return withdrawTime;
    }

    public void setWithdrawTime(String withdrawTime)
    {
        this.withdrawTime = withdrawTime;
    }
     
}
