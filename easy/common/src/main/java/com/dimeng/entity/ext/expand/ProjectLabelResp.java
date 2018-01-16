package com.dimeng.entity.ext.expand;

import java.io.Serializable;

public class ProjectLabelResp implements Serializable {

    private String labelTypeId;

    private String labelName;

    private String projectType;

    private String createId;

    private String dateCreate;

    private String labelId;

    public ProjectLabelResp(){}

    public String getLabelId() {
        return labelId;
    }

    public void setLabelId(String labelId) {
        this.labelId = labelId;
    }
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
