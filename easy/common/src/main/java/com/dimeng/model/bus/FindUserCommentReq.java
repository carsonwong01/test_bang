/*
 * 文 件 名:  FindUserCommentReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月17日
 */
package com.dimeng.model.bus;

import com.dimeng.framework.domain.BasePageReq;

/**
 * 评论留言分页请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月17日]
 */
public class FindUserCommentReq extends BasePageReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8963905979215304229L;
    
    /**
     * 项目ID
     */
    private String projectId;
    
    /**
     * @return 返回 projectId
     */
    public String getProjectId()
    {
        return projectId;
    }
    
    /**
     * @param 对projectId进行赋值
     */
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
}
