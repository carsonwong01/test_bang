/*
 * 文 件 名:  ProjectLabelReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月28日
 */
package com.dimeng.model.expand;

import com.dimeng.framework.domain.BaseReq;

/**
 * 项目标签参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月28日]
 */
public class ProjectLabelReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8966476056558550397L;
    
    private String labelTypeId;
    
    private String labelName;
    
    private String projectType;
    
    private String createId;
    
    private String dateCreate;
    
    /**
     * @return 返回 labelTypeId
     */
    public String getLabelTypeId()
    {
        return labelTypeId;
    }
    
    /**
     * @param 对labelTypeId进行赋值
     */
    public void setLabelTypeId(String labelTypeId)
    {
        this.labelTypeId = labelTypeId;
    }
    
    /**
     * @return 返回 labelName
     */
    public String getLabelName()
    {
        return labelName;
    }
    
    /**
     * @param 对labelName进行赋值
     */
    public void setLabelName(String labelName)
    {
        this.labelName = labelName;
    }
    
    /**
     * @return 返回 projectType
     */
    public String getProjectType()
    {
        return projectType;
    }
    
    /**
     * @param 对projectType进行赋值
     */
    public void setProjectType(String projectType)
    {
        this.projectType = projectType;
    }
    
    /**
     * @return 返回 createId
     */
    public String getCreateId()
    {
        return createId;
    }
    
    /**
     * @param 对createId进行赋值
     */
    public void setCreateId(String createId)
    {
        this.createId = createId;
    }
    
    /**
     * @return 返回 dateCreate
     */
    public String getDateCreate()
    {
        return dateCreate;
    }
    
    /**
     * @param 对dateCreate进行赋值
     */
    public void setDateCreate(String dateCreate)
    {
        this.dateCreate = dateCreate;
    }
    
}
