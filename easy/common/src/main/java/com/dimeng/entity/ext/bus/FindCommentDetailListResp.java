/*
 * 文 件 名:  FindCommentDetailList.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月10日
 */
package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 查询评论详情列表返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月10日]
 */
public class FindCommentDetailListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8072867829565114863L;
    
    /**
     * 评论id
     */
    private String id;
    
    /**
     * 评论人ID
     */
    private String userId;
    
    /**
     * 评论人
     */
    private String userName;
    
    /**
     * 回复对象
     */
    private String replyUserName;
    
    /**
     * 评论人昵称
     */
    private String nickName;
    
    /**
     * 回复对象昵称
     */
    private String replyNickName;
    
    /**
     * 评论内容
     */
    private String content;
    
    /**
     * 评论时间时间
     */
    private String time;
    
    /**
     * 支持金额
     */
    private String supportAmount;
    
    /**
     * 回复对象ID
     */
    private String replyUserId;
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
    }
    
    /**
     * @return 返回 userId
     */
    public String getUserId()
    {
        return userId;
    }
    
    /**
     * @param 对userId进行赋值
     */
    public void setUserId(String userId)
    {
        this.userId = userId;
    }
    
    public String getUserName()
    {
        return userName;
    }
    
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    
    public String getReplyUserName()
    {
        return replyUserName;
    }
    
    public void setReplyUserName(String replyUserName)
    {
        this.replyUserName = replyUserName;
    }
    
    public String getNickName()
    {
        return nickName;
    }
    
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
    public String getReplyNickName()
    {
        return replyNickName;
    }
    
    public void setReplyNickName(String replyNickName)
    {
        this.replyNickName = replyNickName;
    }
    
    public String getContent()
    {
        return content;
    }
    
    public void setContent(String content)
    {
        this.content = content;
    }
    
    public String getTime()
    {
        return time;
    }
    
    public void setTime(String time)
    {
        this.time = time;
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
     * @return 返回 replyUserId
     */
    public String getReplyUserId()
    {
        return replyUserId;
    }
    
    /**
     * @param 对replyUserId进行赋值
     */
    public void setReplyUserId(String replyUserId)
    {
        this.replyUserId = replyUserId;
    }
    
}
