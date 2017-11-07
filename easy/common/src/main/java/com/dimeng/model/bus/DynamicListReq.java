package com.dimeng.model.bus;

import com.dimeng.framework.domain.BasePageReq;
import com.dimeng.framework.domain.BaseReq;
import com.dimeng.framework.domain.BaseResp;

/**
 * 前台查询项目动态请求实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月30日]
 */
public class DynamicListReq extends BasePageReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 3084796352771643188L;
    /**
     * 项目id
     */
    private String projectId;
    /**
     * 用户id
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
    public String getUserId()
    {
        return userId;
    }
    public void setUserId(String userId)
    {
        this.userId = userId;
    }
    
    
}
