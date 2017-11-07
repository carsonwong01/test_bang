package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 查询评论列表返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月10日]
 */
public class FindCommentListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -5527185448285249479L;
    
    /**
     * 订单id
     */
    private String orderId;
    
    /**
     * 用户名
     */
    private String userName;
    
    /**
     * 项目名称
     */
    private String projectName;
    
    /**
     * 评论数
     */
    private String count;
    
    /**
     * 最新评论时间
     */
    private String dateNewst;
    
    /**
     * 用户头像
     */
    private String headPicUrl;
    
    /**
     * 下单时间
     */
    private String datePay;
    
    /**
     * 评论内容
     */
    private String commentContent;
    
    public String getOrderId()
    {
        return orderId;
    }
    
    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }
    
    public String getUserName()
    {
        return userName;
    }
    
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    
    public String getProjectName()
    {
        return projectName;
    }
    
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }
    
    public String getCount()
    {
        return count;
    }
    
    public void setCount(String count)
    {
        this.count = count;
    }
    
    public String getDateNewst()
    {
        return dateNewst;
    }
    
    public void setDateNewst(String dateNewst)
    {
        this.dateNewst = dateNewst;
    }
    
    public String getDatePay()
    {
        return datePay;
    }
    
    public void setDatePay(String datePay)
    {
        this.datePay = datePay;
    }
    
    public String getHeadPicUrl()
    {
        return headPicUrl;
    }
    
    public void setHeadPicUrl(String headPicUrl)
    {
        this.headPicUrl = headPicUrl;
    }

    public String getCommentContent()
    {
        return commentContent;
    }

    public void setCommentContent(String commentContent)
    {
        this.commentContent = commentContent;
    }
    
}
