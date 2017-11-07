package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 返回查询项目列表实体
 * @author  wenguanhai
 * @version  [版本号, 2016年9月28日]
 */
public class FindQscProjectListResp implements Serializable
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 182079859799067031L;
    
    /**
     * 项目ID
     */
    private String projectId;
    
    /**
     * 项目编号
     */
    private String projectNo;
    
    /**
     * 项目标题
     */
    private String title;
    
    /**
     * 发起人用户名
     */
    private String initiator;
    
    /**
     * 发起人昵称
     */
    private String initiatorNickName;
    
    /**
     * 项目类型
     */
    private String type;
    
    /**
     * 项目状态
     */
    private String projectStatus;
    
    /**
     * 筹资目标（元）
     */
    private String facTarget;
    
    /**
     * 已筹金额（元）
     */
    private String supportAmt;
    
    /**
     * 投资期限（天）
     */
    private String timeLimit;
    
    /**
     * 支持人次
     */
    private String supportNumber;
    
    /**
     * 剩余时间（天）
     */
    private String remainingDay;
    
    /**
     * 实际筹资时间（天）
     */
    private String factInvestDays;
    
    /**
     * 操作人
     */
    private String author;
    
    /**
     * 众筹开始时间
     */
    private String beginTime;
    
    /**
     * 众筹成功时间
     */
    private String successTime;
    
    /**
     * 众筹失败时间
     */
    private String failTime;
    
    /**
     * 众筹失败时间
     */
    private String delTime;
    
    /**
     * 推荐状态
     */
    private String recommendStatus;
    
    /**
     * 筹资期限  天数
     */
    private String financingDays;
    
    /**
     * 项目推荐id-站点管理-项目推荐列表需要
     */
    private String recommendId;
    
    /**
     * 用户id-项目发起人-定时任务用
     */
    private String userId;
    
    /**
     * 验证状态-定时任务用 大于0为已验证
     */
    private String proValidate;
    
    /**
     * 屏蔽状态，1-已屏蔽，2-未屏蔽
     */
    private String shieldStatus;
    
    /**
     * 发起人的真实姓名
     */
    private String initiatorRealName;
    
    public String getProValidate()
    {
        return proValidate;
    }
    
    public void setProValidate(String proValidate)
    {
        this.proValidate = proValidate;
    }
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    public String getProjectNo()
    {
        return projectNo;
    }
    
    public void setProjectNo(String projectNo)
    {
        this.projectNo = projectNo;
    }
    
    public String getTitle()
    {
        return title;
    }
    
    public void setTitle(String title)
    {
        this.title = title;
    }
    
    public String getInitiator()
    {
        return initiator;
    }
    
    public void setInitiator(String initiator)
    {
        this.initiator = initiator;
    }
    
    public String getInitiatorNickName()
    {
        return initiatorNickName;
    }
    
    public void setInitiatorNickName(String initiatorNickName)
    {
        this.initiatorNickName = initiatorNickName;
    }
    
    public String getType()
    {
        return type;
    }
    
    public void setType(String type)
    {
        this.type = type;
    }
    
    public String getProjectStatus()
    {
        return projectStatus;
    }
    
    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }
    
    public String getFacTarget()
    {
        return facTarget;
    }
    
    public void setFacTarget(String facTarget)
    {
        this.facTarget = facTarget;
    }
    
    public String getSupportAmt()
    {
        return supportAmt;
    }
    
    public void setSupportAmt(String supportAmt)
    {
        this.supportAmt = supportAmt;
    }
    
    public String getTimeLimit()
    {
        return timeLimit;
    }
    
    public void setTimeLimit(String timeLimit)
    {
        this.timeLimit = timeLimit;
    }
    
    public String getSupportNumber()
    {
        return supportNumber;
    }
    
    public void setSupportNumber(String supportNumber)
    {
        this.supportNumber = supportNumber;
    }
    
    public String getRemainingDay()
    {
        return remainingDay;
    }
    
    public void setRemainingDay(String remainingDay)
    {
        this.remainingDay = remainingDay;
    }
    
    public String getFactInvestDays()
    {
        return factInvestDays;
    }
    
    public void setFactInvestDays(String factInvestDays)
    {
        this.factInvestDays = factInvestDays;
    }
    
    public String getAuthor()
    {
        return author;
    }
    
    public void setAuthor(String author)
    {
        this.author = author;
    }
    
    public String getBeginTime()
    {
        return beginTime;
    }
    
    public void setBeginTime(String beginTime)
    {
        this.beginTime = beginTime;
    }
    
    public String getSuccessTime()
    {
        return successTime;
    }
    
    public void setSuccessTime(String successTime)
    {
        this.successTime = successTime;
    }
    
    public String getFailTime()
    {
        return failTime;
    }
    
    public void setFailTime(String failTime)
    {
        this.failTime = failTime;
    }
    
    public String getDelTime()
    {
        return delTime;
    }
    
    public void setDelTime(String delTime)
    {
        this.delTime = delTime;
    }
    
    public String getRecommendStatus()
    {
        return recommendStatus;
    }
    
    public void setRecommendStatus(String recommendStatus)
    {
        this.recommendStatus = recommendStatus;
    }
    
    public String getFinancingDays()
    {
        return financingDays;
    }
    
    public void setFinancingDays(String financingDays)
    {
        this.financingDays = financingDays;
    }
    
    public String getRecommendId()
    {
        return recommendId;
    }
    
    public void setRecommendId(String recommendId)
    {
        this.recommendId = recommendId;
    }
    
    public String getUserId()
    {
        return userId;
    }
    
    public void setUserId(String userId)
    {
        this.userId = userId;
    }
    
    public String getShieldStatus()
    {
        return shieldStatus;
    }
    
    public void setShieldStatus(String shieldStatus)
    {
        this.shieldStatus = shieldStatus;
    }
    
    public String getInitiatorRealName()
    {
        return initiatorRealName;
    }
    
    public void setInitiatorRealName(String initiatorRealName)
    {
        this.initiatorRealName = initiatorRealName;
    }
    
}
