package com.dimeng.entity.ext.statistics;

import java.io.Serializable;

/**
 * 提现统计返回实体
 * <一句话功能简述> 
 * @author  song
 * @version  [版本号, 2016年10月9日]
 */
public class WithdrawStatResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 4424564882424513640L;
    
    /**
     * 时间
     */
    private String statDate;
    
    /**
     * 当日提现
     */
    private String withdrawDengesAmount;
    
    /**
     * 提现笔数
     */
    private String withdrawCount;
    
    /**
     * 提现用户数
     */
    private String withdrawUserCount;
    
    /**
     * 新增提现用户
     */
    private String addWithdrawUserCount;
    
    /**
     * 累计提现总额
     */
    private String withdrawAmount;
    
    public String getStatDate()
    {
        return statDate;
    }
    
    public void setStatDate(String statDate)
    {
        this.statDate = statDate;
    }
    
    public String getWithdrawDengesAmount()
    {
        return withdrawDengesAmount;
    }
    
    public void setWithdrawDengesAmount(String withdrawDengesAmount)
    {
        this.withdrawDengesAmount = withdrawDengesAmount;
    }
    
    public String getWithdrawCount()
    {
        return withdrawCount;
    }
    
    public void setWithdrawCount(String withdrawCount)
    {
        this.withdrawCount = withdrawCount;
    }
    
    public String getWithdrawUserCount()
    {
        return withdrawUserCount;
    }
    
    public void setWithdrawUserCount(String withdrawUserCount)
    {
        this.withdrawUserCount = withdrawUserCount;
    }
    
    public String getAddWithdrawUserCount()
    {
        return addWithdrawUserCount;
    }
    
    public void setAddWithdrawUserCount(String addWithdrawUserCount)
    {
        this.addWithdrawUserCount = addWithdrawUserCount;
    }
    
    public String getWithdrawAmount()
    {
        return withdrawAmount;
    }
    
    public void setWithdrawAmount(String withdrawAmount)
    {
        this.withdrawAmount = withdrawAmount;
    }
    
}
