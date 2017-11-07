package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 审核管理-查询举报列表返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月12日]
 */
public class FindInformantListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 3461140035228826684L;
    /**
     * 项目id
     */
    private String id;
    /**
     * 项目编号
     */
    private String projectNo;
    /**
     * 项目名称
     */
    private String projectName;
    /**
     * 发起人
     */
    private String originator;
    /**
     * 昵称
     */
    private String nickName;
    /**
     * 项目类型：
        1公益项目
        2回报项目
        3梦想项目
     */
    private String projectType;
    /**
     * 已筹金额（元）
     */
    private String fundraisedAmt;
    /**
     * 项目状态：
        1众筹中
        2众筹成功
        3众筹失败
        4已删除
     */
    private String projectStatus;
    /**
     * 举报总数（次）
     */
    private String totalCount;
    /**
     * 最近7天内举报次数
     */
    private String currentCount;
    /**
     * 最近举报时间
     */
    private String time;
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
    }
    
    public String getProjectNo()
    {
        return projectNo;
    }
    
    public void setProjectNo(String projectNo)
    {
        this.projectNo = projectNo;
    }
    
    public String getProjectName()
    {
        return projectName;
    }
    
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }
    
    public String getOriginator()
    {
        return originator;
    }
    
    public void setOriginator(String originator)
    {
        this.originator = originator;
    }
    
    public String getNickName()
    {
        return nickName;
    }
    
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
    public String getProjectType()
    {
        return projectType;
    }
    
    public void setProjectType(String projectType)
    {
        this.projectType = projectType;
    }
    
    public String getFundraisedAmt()
    {
        return fundraisedAmt;
    }
    
    public void setFundraisedAmt(String fundraisedAmt)
    {
        this.fundraisedAmt = fundraisedAmt;
    }
    
    public String getProjectStatus()
    {
        return projectStatus;
    }
    
    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }
    
    public String getTotalCount()
    {
        return totalCount;
    }
    
    public void setTotalCount(String totalCount)
    {
        this.totalCount = totalCount;
    }
    
    public String getCurrentCount()
    {
        return currentCount;
    }
    
    public void setCurrentCount(String currentCount)
    {
        this.currentCount = currentCount;
    }
    
    public String getTime()
    {
        return time;
    }
    
    public void setTime(String time)
    {
        this.time = time;
    }
    
}
