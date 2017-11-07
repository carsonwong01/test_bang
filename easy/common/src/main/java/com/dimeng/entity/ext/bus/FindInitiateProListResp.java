package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 用户管理-用户详情-我发起的项目
 * @author  song
 * @version  [版本号, 2016年10月8日]
 */
public class FindInitiateProListResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 4036526058340554729L;
    
    /**
     * 项目id
     */
    private String proId;
    
    /**
     * 用户id
     */
    private String userId;
    
    /**
     * 项目编号
     */
    private String proNum;
    
    /**
     * 项目标题
     */
    private String title;
    
    /**
     * 项目类型
     */
    private String type;
    
    /**
     * 筹集目标金额
     */
    private String targetAmount;
    
    /**
     * 筹资期限
     */
    private String financingDays;
    
    /**
     * 已筹集金额
     */
    private String raisedAmount;
    
    /**
     * 支持人次
     */
    private String supportNumber;
    
    /**
     * 创建时间
     */
    private String createTime;
    
    /**
     * 项目状态
     */
    private String proStatus;

    public String getProId()
    {
        return proId;
    }

    public void setProId(String proId)
    {
        this.proId = proId;
    }

    public String getProNum()
    {
        return proNum;
    }

    public void setProNum(String proNum)
    {
        this.proNum = proNum;
    }
 

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getTargetAmount()
    {
        return targetAmount;
    }

    public void setTargetAmount(String targetAmount)
    {
        this.targetAmount = targetAmount;
    }

    public String getFinancingDays()
    {
        return financingDays;
    }

    public void setFinancingDays(String financingDays)
    {
        this.financingDays = financingDays;
    }

    public String getRaisedAmount()
    {
        return raisedAmount;
    }

    public void setRaisedAmount(String raisedAmount)
    {
        this.raisedAmount = raisedAmount;
    }

    public String getSupportNumber()
    {
        return supportNumber;
    }

    public void setSupportNumber(String supportNumber)
    {
        this.supportNumber = supportNumber;
    }

    public String getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(String createTime)
    {
        this.createTime = createTime;
    }

    public String getProStatus()
    {
        return proStatus;
    }

    public void setProStatus(String proStatus)
    {
        this.proStatus = proStatus;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }
    
    
}
