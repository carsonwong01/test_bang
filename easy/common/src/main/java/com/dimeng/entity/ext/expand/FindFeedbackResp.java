/*
 * 文 件 名:  FindFeedbackResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.entity.ext.expand;

import java.io.Serializable;

/**
 * 意见反馈响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
public class FindFeedbackResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 6839190103504267066L;
    
    private String feedbackId;
    
    /**
     * 反馈人
     */
    private String userName;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 邮箱地址
     */
    private String contactEmail;
    
    /**
     * 反馈意见
     */
    private String feedbackDetails;
    
    /**
     * 提交时间
     */
    private String dateCommit;
    
    /**
     * @return 返回 feedbackId
     */
    public String getFeedbackId()
    {
        return feedbackId;
    }
    
    /**
     * @param 对feedbackId进行赋值
     */
    public void setFeedbackId(String feedbackId)
    {
        this.feedbackId = feedbackId;
    }
    
    /**
     * @return 返回 userName
     */
    public String getUserName()
    {
        return userName;
    }
    
    /**
     * @param 对userName进行赋值
     */
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    
    /**
     * @return 返回 nickName
     */
    public String getNickName()
    {
        return nickName;
    }
    
    /**
     * @param 对nickName进行赋值
     */
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
    /**
     * @return 返回 contactEmail
     */
    public String getContactEmail()
    {
        return contactEmail;
    }
    
    /**
     * @param 对contactEmail进行赋值
     */
    public void setContactEmail(String contactEmail)
    {
        this.contactEmail = contactEmail;
    }
    
    /**
     * @return 返回 feedbackDetails
     */
    public String getFeedbackDetails()
    {
        return feedbackDetails;
    }
    
    /**
     * @param 对feedbackDetails进行赋值
     */
    public void setFeedbackDetails(String feedbackDetails)
    {
        this.feedbackDetails = feedbackDetails;
    }
    
    /**
     * @return 返回 dateCommit
     */
    public String getDateCommit()
    {
        return dateCommit;
    }
    
    /**
     * @param 对dateCommit进行赋值
     */
    public void setDateCommit(String dateCommit)
    {
        this.dateCommit = dateCommit;
    }
    
}
