/*
 * 文 件 名:  FindSupportListResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月14日
 */
package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 项目支持订单列表响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月14日]
 */
public class FindSupportListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 6522407988385987535L;
    
    /**
     * 订单ID
     */
    private String orderId;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 头像URL
     */
    private String imageUrl;
    
    /**
     * 支持金额
     */
    private String supportAmount;
    
    /**
     * 订单状态
     * 1待支付
     * 2已取消
     * 3已支付
     * 4待发货
     * 5待收货
     * 6已收货
     * 7待退款
     * 8已退款
     * 9已失败
     * 10退款中
     */
    private String status;
    
    /**
     * 订单时间
     */
    private String supportTime;
    
    /**
     * 订单编号
     */
    private String orderNo;
    
    /**
     * 回报金额
     */
    private String returnAmount;
    
    /**
     * 回报数量
     */
    private String returnCount;
    
    /**
     * 回报内容/梦想内容
     */
    private String returnDescribe;
    
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
     * @return 返回 status
     */
    public String getStatus()
    {
        return status;
    }
    
    /**
     * @param 对status进行赋值
     */
    public void setStatus(String status)
    {
        this.status = status;
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
     * @return 返回 orderNo
     */
    public String getOrderNo()
    {
        return orderNo;
    }
    
    /**
     * @param 对orderNo进行赋值
     */
    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo;
    }
    
    /**
     * @return 返回 returnAmount
     */
    public String getReturnAmount()
    {
        return returnAmount;
    }
    
    /**
     * @param 对returnAmount进行赋值
     */
    public void setReturnAmount(String returnAmount)
    {
        this.returnAmount = returnAmount;
    }
    
    /**
     * @return 返回 returnCount
     */
    public String getReturnCount()
    {
        return returnCount;
    }
    
    /**
     * @param 对returnCount进行赋值
     */
    public void setReturnCount(String returnCount)
    {
        this.returnCount = returnCount;
    }
    
    /**
     * @return 返回 returnDescribe
     */
    public String getReturnDescribe()
    {
        return returnDescribe;
    }
    
    /**
     * @param 对returnDescribe进行赋值
     */
    public void setReturnDescribe(String returnDescribe)
    {
        this.returnDescribe = returnDescribe;
    }
    
}
