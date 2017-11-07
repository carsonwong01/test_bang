/*
 * 文 件 名:  InsertReturnProjectReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月9日
 */
package com.dimeng.model.bus;

import java.util.List;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 新增回报项目请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月9日]
 */
public class InsertReturnProjectReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8042590883611448027L;
    
    /**
     * 项目类型
     */
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
     * 项目简介
     */
    @NotBlank
    private String projectIntro;
    
    /**
     * 筹资期限
     */
    @NotBlank
    private String financingDays;
    
    /**
     * 支持者是否提供收货地址
     */
    @NotBlank
    private String isNeddAddr;
    
    /**
     * 运费描述
     */
    private String freightDescribe;
    
    /**
     * 发货时间描述
     */
    private String deliverDescribe;
    
    /**
     * 项目标签
     */
    @NotBlank
    private String projectLabel;
    
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
     * 项目回报列表
     */
    private List<ProjectReturnReq> returnList;
    
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
     * @return 返回 freightDescribe
     */
    public String getFreightDescribe()
    {
        return freightDescribe;
    }
    
    /**
     * @param 对freightDescribe进行赋值
     */
    public void setFreightDescribe(String freightDescribe)
    {
        this.freightDescribe = freightDescribe;
    }
    
    /**
     * @return 返回 deliverDescribe
     */
    public String getDeliverDescribe()
    {
        return deliverDescribe;
    }
    
    /**
     * @param 对deliverDescribe进行赋值
     */
    public void setDeliverDescribe(String deliverDescribe)
    {
        this.deliverDescribe = deliverDescribe;
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
     * @return 返回 returnList
     */
    public List<ProjectReturnReq> getReturnList()
    {
        return returnList;
    }
    
    /**
     * @param 对returnList进行赋值
     */
    public void setReturnList(List<ProjectReturnReq> returnList)
    {
        this.returnList = returnList;
    }
    
}
