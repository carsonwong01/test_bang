package com.dimeng.entity.ext.home.front;

import java.io.Serializable;
import java.util.List;

/**
 * 前台项目列表resp
 * @author  song
 * @version  [版本号, 2016年10月12日]
 */
public class FindRecommendListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 6459876859814781886L;
    
    /**
     * 项目id
     */
    private String projectId;
    
    /**
     * 发起人昵称
     */
    private String nickName;
    
    /**
     * 剩余时间
     */
    private String timeLeft;
    
    /**
     * 项目封面
     */
    private String projectImg;
    
    /**
     * 项目标题
     */
    private String projectName;
    
    /**
     * 项目简介
     */
    private String projectIntro;
    
    /**
     * 项目标签
     */
    private String projectTag;
    
    /**
     * 项目标签列表
     */
    private List<String> projectTags;
    
    /**
     * 支持人数
     */
    private String supportCount;
    
    /**
     * 目标金额
     */
    private String targetAmount;
    
    /**
     * 已筹集金额
     */
    private String raiseTotal;
    
    /**
     * 进度
     */
    private String rate;
    
    /**
     * 项目类型
     */
    private String projectType;
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    public String getNickName()
    {
        return nickName;
    }
    
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
    public String getTimeLeft()
    {
        return timeLeft;
    }
    
    public void setTimeLeft(String timeLeft)
    {
        this.timeLeft = timeLeft;
    }
    
    public String getProjectImg()
    {
        return projectImg;
    }
    
    public void setProjectImg(String projectImg)
    {
        this.projectImg = projectImg;
    }
    
    public String getProjectName()
    {
        return projectName;
    }
    
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }
    
    public String getProjectIntro()
    {
        return projectIntro;
    }
    
    public void setProjectIntro(String projectIntro)
    {
        this.projectIntro = projectIntro;
    }
    
    public String getProjectTag()
    {
        return projectTag;
    }
    
    public void setProjectTag(String projectTag)
    {
        this.projectTag = projectTag;
    }
    
    public String getSupportCount()
    {
        return supportCount;
    }
    
    public void setSupportCount(String supportCount)
    {
        this.supportCount = supportCount;
    }
    
    public String getTargetAmount()
    {
        return targetAmount;
    }
    
    public void setTargetAmount(String targetAmount)
    {
        this.targetAmount = targetAmount;
    }
    
    public String getRaiseTotal()
    {
        return raiseTotal;
    }
    
    public void setRaiseTotal(String raiseTotal)
    {
        this.raiseTotal = raiseTotal;
    }
    
    public String getRate()
    {
        return rate;
    }
    
    public void setRate(String rate)
    {
        this.rate = rate;
    }

    public List<String> getProjectTags()
    {
        return projectTags;
    }

    public void setProjectTags(List<String> projectTags)
    {
        this.projectTags = projectTags;
    }

    public String getProjectType()
    {
        return projectType;
    }

    public void setProjectType(String projectType)
    {
        this.projectType = projectType;
    }
    
}
