package com.dimeng.model.finance;

import com.dimeng.framework.domain.BaseReq;

/**
 * 订单详情请求实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月9日]
 */
public class SupportDetailReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -1648095533684147364L;
    
    /**
     * 订单号
     */
    private String orderNo;
    
    /**
     * 订单Id
     */
    private String orderId;
    
    public String getOrderNo()
    {
        return orderNo;
    }
    
    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo;
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
