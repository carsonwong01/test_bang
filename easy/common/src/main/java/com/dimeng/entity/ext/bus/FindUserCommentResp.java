/*
 * 文 件 名:  FindUserCommentResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月17日
 */
package com.dimeng.entity.ext.bus;

import java.io.Serializable;
import java.util.List;

/**
 * 评论响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月17日]
 */
public class FindUserCommentResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -2175353046868597396L;
    
    /**
     * 项目ID
     */
    private String projectId;
    
    /**
     * 项目标题
     */
    private String projectName;
    
    /**
     * 项目封面
     */
    private String coverImageUrl;
    
    /**
     * 订单ID
     */
    private String orderId;
    
    /**
     * 支持金额
     */
    private String supportAmount;
    
    /**
     * 订单时间
     */
    private String supportTime;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 头像URL
     */
    private String imageUrl;
    
    /**
     * 回复list
     */
    private List<FindCommentDetailListResp> comments;
    
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
     * @return 返回 orderId
     */
    public String getOrderId()
    {
        return orderId;
    }
    
    /**
     * @param 对orderId进行赋值
     */
    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
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
     * @return 返回 supportTime
     */
    public String getSupportTime()
    {
        return supportTime;
    }
    
    /**
     * @param 对supportTime进行赋值
     */
    public void setSupportTime(String supportTime)
    {
        this.supportTime = supportTime;
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
    
    /**
     * @return 返回 comments
     */
    public List<FindCommentDetailListResp> getComments()
    {
        return comments;
    }
    
    /**
     * @param 对comments进行赋值
     */
    public void setComments(List<FindCommentDetailListResp> comments)
    {
        this.comments = comments;
    }
    
}
