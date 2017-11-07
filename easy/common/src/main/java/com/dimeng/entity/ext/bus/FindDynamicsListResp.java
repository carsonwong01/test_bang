package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 查询项目动态列表返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月10日]
 */
public class FindDynamicsListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -5527185448285249479L;
    
    /**
     * 项目动态id
     */
    private String id;
    
    /**
     * 用户
     */
    private String userName;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 项目id 
     */
    private String projectId;
    
    /**
     * 项目编号
     */
    private String projectNo;
    
    /**
     * 项目标题
     */
    private String projectName;
    
    /**
     * 动态内容
     */
    private String content;
    
    /**
     * 更新时间
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
    
    public String getUserName()
    {
        return userName;
    }
    
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    
    public String getNickName()
    {
        return nickName;
    }
    
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
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
    
    public String getProjectName()
    {
        return projectName;
    }
    
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }
    
    public String getContent()
    {
        return content;
    }
    
    public void setContent(String content)
    {
        this.content = content;
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
