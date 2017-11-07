package com.dimeng.model.bus;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 审核管理-查询举报列表
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月12日]
 */
public class FindInformantListReq extends FindExportExcelParamsReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -6826644478231815129L;
    
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
        0公益项目
        6回报项目
        7梦想项目
     */
    private String projectType;
    
    /**
     * 项目状态：
        1众筹中
        2众筹成功
        3众筹失败
        4已删除
     */
    private String projectStatus;
    
    /**
     * 开始举报时间
     */
    private String beginTime;
    
    /**
     * 结束举报时间
     */
    private String endTime;
    
    /**
     * 排序字段
     */
    private String sortKey;
    
    /**
     * 升序(asc)/降序(desc)
     */
    private String sortValue;
    
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
    
    public String getProjectStatus()
    {
        return projectStatus;
    }
    
    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }
    
    public String getBeginTime()
    {
        return beginTime;
    }
    
    public void setBeginTime(String beginTime)
    {
        this.beginTime = beginTime;
    }
    
    public String getEndTime()
    {
        return endTime;
    }
    
    public void setEndTime(String endTime)
    {
        this.endTime = endTime;
    }
    
    public String getSortKey()
    {
        return sortKey;
    }
    
    public void setSortKey(String sortKey)
    {
        this.sortKey = sortKey;
    }
    
    public String getSortValue()
    {
        return sortValue;
    }
    
    public void setSortValue(String sortValue)
    {
        this.sortValue = sortValue;
    }
    
}
