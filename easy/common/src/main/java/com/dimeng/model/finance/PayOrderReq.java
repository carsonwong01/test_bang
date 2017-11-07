package com.dimeng.model.finance;

import com.dimeng.framework.domain.BaseReq;

/**
 * 支付参数实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年11月3日]
 */
public class PayOrderReq extends BaseReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -6014671029257303801L;
    
    /**
     * 订单ID
     */
    private String orderId;
    
    /**
     * 用户登录IP
     */
    private String userIP;

    public String getOrderId()
    {
        return orderId;
    }

    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }

    public String getUserIP()
    {
        return userIP;
    }

    public void setUserIP(String userIP)
    {
        this.userIP = userIP;
    }
    
}
