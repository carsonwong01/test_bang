package com.dimeng.model.bus;

import com.dimeng.framework.domain.BasePageReq;

/**
 * 查询项目动态列表实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月10日]
 */
public class FindDynamicsListReq extends BasePageReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 7130183794173388799L;
    
    /**
     * 用户
     */
    private String userName;
    
    /**
     * 项目标题
     */
    private String projectName;
    
    /**
     * 开始更新时间
     */
    private String beginTime;
    
    /**
     * 结束更新时间
     */
    private String endTime;
    
    /**
     * 项目动态类型
     */
    private String dynamicType;
    
    public String getUserName()
    {
        return userName;
    }
    
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    
    public String getProjectName()
    {
        return projectName;
    }
    
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
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

    public String getDynamicType()
    {
        return dynamicType;
    }

    public void setDynamicType(String dynamicType)
    {
        this.dynamicType = dynamicType;
    }
    
}
