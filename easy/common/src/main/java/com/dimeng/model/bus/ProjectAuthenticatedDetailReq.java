package com.dimeng.model.bus;

import com.dimeng.framework.domain.BaseReq;
/**
 * 查询项目认证参数实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月30日]
 */
public class ProjectAuthenticatedDetailReq extends BaseReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -4485886634789743950L;
    /**
     * 验证id
     */
    private String id;
    /**
     * 项目ID
     */
    private String projectId;
    public String getId()
    {
        return id;
    }
    public void setId(String id)
    {
        this.id = id;
    }
    public String getProjectId()
    {
        return projectId;
    }
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
}
