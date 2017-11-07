package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 查询项目失败、删除原因实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月8日]
 */
public class GetProjectReasonReq extends BaseReq
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
     * 状态，3：取消项目、4：删除项目
     */
    @NotBlank
    private String projectStatus;
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    public String getProjectStatus()
    {
        return projectStatus;
    }
    
    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }
    
}
