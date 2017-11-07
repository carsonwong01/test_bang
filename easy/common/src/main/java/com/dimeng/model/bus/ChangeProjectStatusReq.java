package com.dimeng.model.bus;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 改变项目状态请求实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月8日]
 */
public class ChangeProjectStatusReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -1309315301504114034L;
    
    /**
     * 项目id
     */
    @NotBlank
    private String projectId;
    
    /**
     * 原因
     */
    @Length(max = 200)
    private String reason;
    
    /**
     * 状态，3：取消项目、4：删除项目
     */
    @NotBlank
    private String projectStatus;
    
    /**
     * 操作人用户名
     */
    private String userId;
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    public String getReason()
    {
        return reason;
    }
    
    public void setReason(String reason)
    {
        this.reason = reason;
    }
    
    public String getProjectStatus()
    {
        return projectStatus;
    }
    
    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }
    
    @Override
    public String getUserId()
    {
        return userId;
    }
    
    @Override
    public void setUserId(String userId)
    {
        this.userId = userId;
    }
    
}
