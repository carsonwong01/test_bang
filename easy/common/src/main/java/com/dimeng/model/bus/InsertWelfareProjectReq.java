/*
 * 文 件 名:  InsertProjectInfoReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月9日
 */
package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 发起公益项目请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月9日]
 */
public class InsertWelfareProjectReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8619301097626736455L;
    
    /**
     * 项目类型
     * 1大病救助
     * 2灾难救助
     * 3动物保护
     * 4扶贫助学
     * 5其他救助
     */
    @NotBlank
    private String projectType;
    
    /**
     * 项目ID
     */
    private String projectId;
    
    /**
     * 项目标题
     */
    @NotBlank
    private String projectName;
    
    /**
     * 目标金额
     */
    @NotBlank
    private String targetAmount;
    
    /**
     * 筹资期限
     */
    @NotBlank
    private String financingDays;
    
    /**
     * 项目简介
     */
    @NotBlank
    private String projectIntro;
    
    /**
     * 项目内容
     */
    @NotBlank
    private String projectDetails;
    
    /**
     * 项目图片ID集合
     */
    private String[] imagesIds;
    
    /**
     * 项目封面ID
     */
    @NotBlank
    private String coverImageId;
    
    /**
     * 项目封面URL
     */
    @NotBlank
    private String coverImageUrl;
    
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
     * @return 返回 targetAmount
     */
    public String getTargetAmount()
    {
        return targetAmount;
    }
    
    /**
     * @param 对targetAmount进行赋值
     */
    public void setTargetAmount(String targetAmount)
    {
        this.targetAmount = targetAmount;
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
    
}
