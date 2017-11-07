package com.dimeng.entity.ext.home.back;

import java.io.Serializable;

/**
 * 后台首页统计数据
 * @author  song
 * @version  [版本号, 2016年9月27日]
 */
public class HomeStatDataResp implements Serializable
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -4763783796341524748L;
    
    /**
     * 众筹总金额
     */
    private String  crowdfundingAmount;
    
    /**
     * 众筹成功总额
     */
    private String cfdSuccessAmount;
    
    /**
     * 成功项目总数
     */
    private String sucProjectCount;
    
    /**
     * 支持总人次
     */
    private String supportPersonTime;
     
    
    /**
     * 支持总人数
     */
    private String supportUserCount;
     
    /**
     * 提现总金额
     */
    private String withdrawAmount;

    public String getCrowdfundingAmount()
    {
        return crowdfundingAmount;
    }

    public void setCrowdfundingAmount(String crowdfundingAmount)
    {
        this.crowdfundingAmount = crowdfundingAmount;
    }

    public String getSucProjectCount()
    {
        return sucProjectCount;
    }

    public void setSucProjectCount(String sucProjectCount)
    {
        this.sucProjectCount = sucProjectCount;
    }

    public String getSupportPersonTime()
    {
        return supportPersonTime;
    }

    public void setSupportPersonTime(String supportPersonTime)
    {
        this.supportPersonTime = supportPersonTime;
    }

    public String getSupportUserCount()
    {
        return supportUserCount;
    }

    public void setSupportUserCount(String supportUserCount)
    {
        this.supportUserCount = supportUserCount;
    }

    public String getWithdrawAmount()
    {
        return withdrawAmount;
    }

    public void setWithdrawAmount(String withdrawAmount)
    {
        this.withdrawAmount = withdrawAmount;
    }

    public String getCfdSuccessAmount()
    {
        return cfdSuccessAmount;
    }

    public void setCfdSuccessAmount(String cfdSuccessAmount)
    {
        this.cfdSuccessAmount = cfdSuccessAmount;
    }
    
}
