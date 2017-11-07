package com.dimeng.model.finance;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 支持生成订单请求参数实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月18日]
 */
public class SupportOrderReq extends BaseReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -240791142806002090L;
    
    /**
     * 项目ID
     */
    @NotBlank
    private String projectId;
    
    /**
     * 支持金额
     */
    @NotBlank
    private String amount;
    
    /**
     * 回报/梦想ID
     */
    private String returnId;
    
    /***
     * 支持数量
     */
    private String returnNumber;
    
    /**
     * 收货地址ID
     */
    private String deliveryAddrId;
    
    /**
     * 支持留言
     */
    private String message;
    
    /**
     * 用户IP
     */
    private String userIP;
    
    /**
     * 支付类型
     */
    private String payType;

    public String getProjectId()
    {
        return projectId;
    }

    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }

    public String getAmount()
    {
        return amount;
    }

    public void setAmount(String amount)
    {
        this.amount = amount;
    }

    public String getReturnId()
    {
        return returnId;
    }

    public void setReturnId(String returnId)
    {
        this.returnId = returnId;
    }

    public String getReturnNumber()
    {
        return returnNumber;
    }

    public void setReturnNumber(String returnNumber)
    {
        this.returnNumber = returnNumber;
    }

    public String getDeliveryAddrId()
    {
        return deliveryAddrId;
    }

    public void setDeliveryAddrId(String deliveryAddrId)
    {
        this.deliveryAddrId = deliveryAddrId;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

    public String getUserIP()
    {
        return userIP;
    }

    public void setUserIP(String userIP)
    {
        this.userIP = userIP;
    }

    public String getPayType()
    {
        return payType;
    }

    public void setPayType(String payType)
    {
        this.payType = payType;
    }
    
    
}
