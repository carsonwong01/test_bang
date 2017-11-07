/*
 * 文 件 名:  InsertUserCommentReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月18日
 */
package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 评论回复请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月18日]
 */
public class InsertUserCommentReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -7035567120230409605L;
    
    /**
     * 订单ID
     */
    @NotBlank
    private String orderId;
    
    /**
     * 回复内容
     */
    @NotBlank
    private String commentContent;
    
    /**
     * 回复对象ID
     */
    private String replyId;
    
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
     * @return 返回 commentContent
     */
    public String getCommentContent()
    {
        return commentContent;
    }
    
    /**
     * @param 对commentContent进行赋值
     */
    public void setCommentContent(String commentContent)
    {
        this.commentContent = commentContent;
    }
    
    /**
     * @return 返回 replyId
     */
    public String getReplyId()
    {
        return replyId;
    }
    
    /**
     * @param 对replyId进行赋值
     */
    public void setReplyId(String replyId)
    {
        this.replyId = replyId;
    }
    
}
