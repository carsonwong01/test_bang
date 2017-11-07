package com.dimeng.model.bus;

import com.dimeng.framework.domain.BaseReq;

/**
 * 
 * 获取项目详情请求参数
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月29日]
 */
public class ProjectDetailsReq extends BaseReq
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -6159208879449723132L;
    
    /**
     * 项目id
     */
    private String projectId;
    
    /**
     * 项目编号
     */
    private String projectNo;
    
    /**
     * 类型
     */
    private String type;
    
    /**
     * 用户id，判断该用户是否关注该项目使用
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
    
    public String getProjectNo()
    {
        return projectNo;
    }
    
    public void setProjectNo(String projectNo)
    {
        this.projectNo = projectNo;
    }
    
    public String getType()
    {
        return type;
    }
    
    public void setType(String type)
    {
        this.type = type;
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
