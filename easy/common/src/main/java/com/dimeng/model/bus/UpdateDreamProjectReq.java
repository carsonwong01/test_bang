/*
 * 文 件 名:  UpdateDreamProjectReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月10日
 */
package com.dimeng.model.bus;

import java.util.List;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 修改梦想项目请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月10日]
 */
public class UpdateDreamProjectReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -4146877434803568914L;
    
    /**
     * 项目是否有订单
     * 1有
     * 2无
     */
    @NotBlank
    private String isOrdered;
    
    /**
     * 项目ID
     */
    @NotBlank
    private String projectId;
    
    /**
     * 项目标题
     */
    private String projectName;
    
    /**
     * 项目简介
     */
    private String projectIntro;
    
    /**
     * 筹资期限
     */
    @NotBlank
    private String financingDays;
    
    /**
     * 支持者是否提供收货地址
     */
    private String isNeddAddr;
    
    /**
     * 项目标签
     */
    @NotBlank
    private String projectLabel;
    
    /**
     * 项目内容
     */
    private String projectDetails;
    
    /**
     * 项目图片ID集合
     */
    private String[] imagesIds;
    
    /**
     * 项目封面ID
     */
    private String coverImageId;
    
    /**
     * 项目封面URL
     */
    private String coverImageUrl;
    
    /**
     * 项目梦想目标
     */
    private List<ProjectReturnReq> targetList;
    
    /**
     * @return 返回 isOrdered
     */
    public String getIsOrdered()
    {
        return isOrdered;
    }
    
    /**
     * @param 对isOrdered进行赋值
     */
    public void setIsOrdered(String isOrdered)
    {
        this.isOrdered = isOrdered;
    }
    
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
    
    /**
     * @return 返回 projectName
     */
    public String getProjectName()
    {
        return projectName;
    }
    
    /**
     * @param 对projectName进行赋值
     */
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }
    
    /**
     * @return 返回 projectIntro
     */
    public String getProjectIntro()
    {
        return projectIntro;
    }
    
    /**
     * @param 对projectIntro进行赋值
     */
    public void setProjectIntro(String projectIntro)
    {
        this.projectIntro = projectIntro;
    }
    
    /**
     * @return 返回 financingDays
     */
    public String getFinancingDays()
    {
        return financingDays;
    }
    
    /**
     * @param 对financingDays进行赋值
     */
    public void setFinancingDays(String financingDays)
    {
        this.financingDays = financingDays;
    }
    
    /**
     * @return 返回 isNeddAddr
     */
    public String getIsNeddAddr()
    {
        return isNeddAddr;
    }
    
    /**
     * @param 对isNeddAddr进行赋值
     */
    public void setIsNeddAddr(String isNeddAddr)
    {
        this.isNeddAddr = isNeddAddr;
    }
    
    /**
     * @return 返回 projectLabel
     */
    public String getProjectLabel()
    {
        return projectLabel;
    }
    
    /**
     * @param 对projectLabel进行赋值
     */
    public void setProjectLabel(String projectLabel)
    {
        this.projectLabel = projectLabel;
    }
    
    /**
     * @return 返回 projectDetails
     */
    public String getProjectDetails()
    {
        return projectDetails;
    }
    
    /**
     * @param 对projectDetails进行赋值
     */
    public void setProjectDetails(String projectDetails)
    {
        this.projectDetails = projectDetails;
    }
    
    /**
     * @return 返回 imagesIds
     */
    public String[] getImagesIds()
    {
        return imagesIds;
    }
    
    /**
     * @param 对imagesIds进行赋值
     */
    public void setImagesIds(String[] imagesIds)
    {
        this.imagesIds = imagesIds;
    }
    
    /**
     * @return 返回 coverImageId
     */
    public String getCoverImageId()
    {
        return coverImageId;
    }
    
    /**
     * @param 对coverImageId进行赋值
     */
    public void setCoverImageId(String coverImageId)
    {
        this.coverImageId = coverImageId;
    }
    
    /**
     * @return 返回 coverImageUrl
     */
    public String getCoverImageUrl()
    {
        return coverImageUrl;
    }
    
    /**
     * @param 对coverImageUrl进行赋值
     */
    public void setCoverImageUrl(String coverImageUrl)
    {
        this.coverImageUrl = coverImageUrl;
    }
    
    /**
     * @return 返回 targetList
     */
    public List<ProjectReturnReq> getTargetList()
    {
        return targetList;
    }
    
    /**
     * @param 对targetList进行赋值
     */
    public void setTargetList(List<ProjectReturnReq> targetList)
    {
        this.targetList = targetList;
    }
    
}
