package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 *  查询项目产品回报、梦想目标列表返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月30日]
 */
public class FindProjectReturnListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 1882759349679048977L;
    
    /**
     * 汇报id
     */
    private String id;
    
    /**
     * 支持金额
     */
    private String amount;
    
    /**
     * 支持数量
     */
    private String returnNum;
    
    /**
     * 回报内容
     */
    private String content;
    
    /**
     * 回报图片URL
     */
    private String imgUrl;
    
    /**
     * 剩余份数/梦想剩余金额
     */
    private String remainingNum;
    
    /**
     * 目标金额
     */
    private String targetAmount;
    
    /**
     * 用途说明
     */
    private String purposeText;
    
    /**
     * 已支持人次
     */
    private String supportCount;
    
    /**
     * 图片id
     */
    private String imgId;
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
    }
    
    public String getAmount()
    {
        return amount;
    }
    
    public void setAmount(String amount)
    {
        this.amount = amount;
    }
    
    public String getReturnNum()
    {
        return returnNum;
    }
    
    public void setReturnNum(String returnNum)
    {
        this.returnNum = returnNum;
    }
    
    public String getContent()
    {
        return content;
    }
    
    public void setContent(String content)
    {
        this.content = content;
    }
    
    public String getImgUrl()
    {
        return imgUrl;
    }
    
    public void setImgUrl(String imgUrl)
    {
        this.imgUrl = imgUrl;
    }
    
    public String getRemainingNum()
    {
        return remainingNum;
    }
    
    public void setRemainingNum(String remainingNum)
    {
        this.remainingNum = remainingNum;
    }
    
    public String getTargetAmount()
    {
        return targetAmount;
    }
    
    public void setTargetAmount(String targetAmount)
    {
        this.targetAmount = targetAmount;
    }
    
    public String getPurposeText()
    {
        return purposeText;
    }
    
    public void setPurposeText(String purposeText)
    {
        this.purposeText = purposeText;
    }
    
    public String getSupportCount()
    {
        return supportCount;
    }
    
    public void setSupportCount(String supportCount)
    {
        this.supportCount = supportCount;
    }
    
    public String getImgId()
    {
        return imgId;
    }
    
    public void setImgId(String imgId)
    {
        this.imgId = imgId;
    }
    
}
