package com.dimeng.model.bus;

import com.dimeng.framework.domain.BaseReq;

/**
 * 删除评论请求实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月11日]
 */
public class DeleteCommentReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -1529973217031326534L;
    
    /**
     * 评论id
     */
    private String id;
    
    /**
     * 订单id
     */
    private String orderId;
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
    }
    
    public String getOrderId()
    {
        return orderId;
    }
    
    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }
    
}
