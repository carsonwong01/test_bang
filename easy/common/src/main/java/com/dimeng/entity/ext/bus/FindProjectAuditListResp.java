package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 审核管理-查询项目验证最新审核信息列表返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月8日]
 */
public class FindProjectAuditListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 5092441373532705902L;
    
    /**
     * 验证id
     */
    private String id;
    
    /**
     * 项目id
     */
    private String projectId;
    
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
       1大病救助
        2灾难救助
        3动物保护
        4扶贫助学
        5其他救助
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
     * 验证类型：
        1:本人验证\r\n        
        2:亲属验证\r\n   
        3:夫妻验证\r\n 
        4:组织验证(企业验证)
     */
    private String validationType;
    
    /**
     * 提交时间
     */
    private String submitTime;
    
    /**
     * 审核状态：
        1待审核
        2审核不通过
        3审核通过

     */
    private String auditStatus;
    
    /**
     * 审核人
     */
    private String auditor;
    
    /**
     * 审核时间
     */
    private String auditTime;
    
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
    
    public String getProjectStatus()
    {
        return projectStatus;
    }
    
    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }
    
    public String getSubmitTime()
    {
        return submitTime;
    }
    
    public void setSubmitTime(String submitTime)
    {
        this.submitTime = submitTime;
    }
    
    public String getAuditStatus()
    {
        return auditStatus;
    }
    
    public void setAuditStatus(String auditStatus)
    {
        this.auditStatus = auditStatus;
    }
    
    public String getAuditor()
    {
        return auditor;
    }
    
    public void setAuditor(String auditor)
    {
        this.auditor = auditor;
    }
    
    public String getAuditTime()
    {
        return auditTime;
    }
    
    public void setAuditTime(String auditTime)
    {
        this.auditTime = auditTime;
    }
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    public String getValidationType()
    {
        return validationType;
    }
    
    public void setValidationType(String validationType)
    {
        this.validationType = validationType;
    }
    
}
