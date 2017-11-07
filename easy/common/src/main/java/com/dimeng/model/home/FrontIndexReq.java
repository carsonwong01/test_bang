package com.dimeng.model.home;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 前台微信、app首页req
 * @author  song
 * @version  [版本号, 2016年10月12日]
 */
public class FrontIndexReq extends FindExportExcelParamsReq
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 6400844822165228292L;


    /**
     * 来源 1PC端2微信端3APP端
     */
    @NotBlank
    private String opSource;

    
    /**
     * 项目类型  6回报项目   7梦想项目 
     */
    private String projectType;
    
    /**
     * 项目标签类型
     */
    private String tagType;
    
    /**
     * 排序字段
     */
    private String sorting;
    
    /**
     * 正/倒序
     */
    private String order;

   
    
    public String getProjectType()
    {
        return projectType;
    }

    public void setProjectType(String projectType)
    {
        this.projectType = projectType;
    }

    public String getTagType()
    {
        return tagType;
    }

    public void setTagType(String tagType)
    {
        this.tagType = tagType;
    }

    public String getSorting()
    {
        return sorting;
    }

    public void setSorting(String sorting)
    {
        this.sorting = sorting;
    }

    public String getOrder()
    {
        return order;
    }

    public void setOrder(String order)
    {
        this.order = order;
    }
 
    @Override
    public String getOpSource()
    {
        return opSource;
    }

    @Override
    public void setOpSource(String opSource)
    {
        this.opSource = opSource;
    }

    
}
