/*
 * 文 件 名:  ProjectReturnReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月9日
 */
package com.dimeng.model.bus;

import com.dimeng.framework.domain.BaseReq;

/**
 * 项目回报请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月9日]
 */
public class ProjectReturnReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -6285192938709152378L;
    
    /**
     * 回报ID
     */
    private String returnId;
    
    /**
     * 支持金额
     */
    private String supportAmount;
    
    /**
     * 回报数量
     */
    private String upperCount;
    
    /**
     * 创建时间
     */
    private String dateCreate;
    
    /**
     * 项目ID
     */
    private String projectId;
    
    /**
     * 修改时间
     */
    private String dateUpdate;
    
    /**
     * 创建人ID
     */
    private String createId;
    
    /**
     * 修改人ID
     */
    private String updateId;
    
    /**
     * 回报描述
     */
    private String returnDescribe;
    
    /**
     * 剩余支持人数
     */
    private String surplusCount;
    
    /**
     * 回报图片ID
     */
    private String imageId;
    
    /**
     * 回报图片URL
     */
    private String imageUrl;
    
    /**
     * @return 返回 returnId
     */
    public String getReturnId()
    {
        return returnId;
    }
    
    /**
     * @param 对returnId进行赋值
     */
    public void setReturnId(String returnId)
    {
        this.returnId = returnId;
    }
    
    /**
     * @return 返回 supportAmount
     */
    public String getSupportAmount()
    {
        return supportAmount;
    }
    
    /**
     * @param 对supportAmount进行赋值
     */
    public void setSupportAmount(String supportAmount)
    {
        this.supportAmount = supportAmount;
    }
    
    /**
     * @return 返回 upperCount
     */
    public String getUpperCount()
    {
        return upperCount;
    }
    
    /**
     * @param 对upperCount进行赋值
     */
    public void setUpperCount(String upperCount)
    {
        this.upperCount = upperCount;
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
     * @return 返回 dateUpdate
     */
    public String getDateUpdate()
    {
        return dateUpdate;
    }
    
    /**
     * @param 对dateUpdate进行赋值
     */
    public void setDateUpdate(String dateUpdate)
    {
        this.dateUpdate = dateUpdate;
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
     * @return 返回 updateId
     */
    public String getUpdateId()
    {
        return updateId;
    }
    
    /**
     * @param 对updateId进行赋值
     */
    public void setUpdateId(String updateId)
    {
        this.updateId = updateId;
    }
    
    /**
     * @return 返回 returnDescribe
     */
    public String getReturnDescribe()
    {
        return returnDescribe;
    }
    
    /**
     * @param 对returnDescribe进行赋值
     */
    public void setReturnDescribe(String returnDescribe)
    {
        this.returnDescribe = returnDescribe;
    }
    
    /**
     * @return 返回 surplusCount
     */
    public String getSurplusCount()
    {
        return surplusCount;
    }
    
    /**
     * @param 对surplusCount进行赋值
     */
    public void setSurplusCount(String surplusCount)
    {
        this.surplusCount = surplusCount;
    }
    
    /**
     * @return 返回 imageId
     */
    public String getImageId()
    {
        return imageId;
    }
    
    /**
     * @param 对imageId进行赋值
     */
    public void setImageId(String imageId)
    {
        this.imageId = imageId;
    }
    
    /**
     * @return 返回 imageUrl
     */
    public String getImageUrl()
    {
        return imageUrl;
    }
    
    /**
     * @param 对imageUrl进行赋值
     */
    public void setImageUrl(String imageUrl)
    {
        this.imageUrl = imageUrl;
    }
    
}
