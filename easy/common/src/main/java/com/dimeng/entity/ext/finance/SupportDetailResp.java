package com.dimeng.entity.ext.finance;

import java.io.Serializable;

/**
 * 查询订单详情返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月9日]
 */
public class SupportDetailResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 7201490176031871172L;
    
    /**
     * 订单ID
     */
    private String orderId;
    
    /**
     * 支持项目昵称
     */
    private String projectTile;
    
    /**
     * 支持项目ID
     */
    private String projectId;
    
    /**
     * 项目类型
     * 1大病救助
        2灾难救助
        3动物保护
        4扶贫助学
        5其他救助
        6回报项目
        7梦想项目 
     */
    private String projectType;
    
    /**
     * 支持者
     */
    private String userName;
    
    /**
     * 支持人昵称
     */
    private String nickName;
    
    /**
     * 支持金额
     */
    private String amount;
    
    /**
     * 订单状态（1：待支付2：已取消3：已支付4：待发货5：待收货6：已收货7：待退款8：已退款）
     */
    private String status;
    
    /**
     * 订单编号
     */
    private String orderNo;
    
    /**
     * 交易时间
     */
    private String supportTime;
    
    /**
     * 交易方式
     */
    private String tradeType;
    
    /**
     * 回报金额
     */
    private String returnAmount;
    
    /**
     * 回报数量
     */
    private String returnNumber;
    
    /**
     * 留言
     */
    private String message;
    
    /**
     * 帮助梦想（用途说明）
     */
    private String purposeText;
    
    /**
     * 收货人姓名
     */
    private String receiverName;
    
    /**
     * 收货人联系电话
     */
    private String receiverPhone;
    
    /**
     * 所在地区
     */
    private String receiverAddr;
    
    /**
     * 收货详细地址
     */
    private String receiverDetailAddr;
    
    /**
     * 是否发物流（Y:是N:否）
     */
    private String isLogistics;
    
    /**
     * 收货时间
     */
    private String receiverTime;
    
    /**
     * 发货时间
     */
    private String sendTime;
    
    /**
     * 快递公司
     */
    private String courierCompany;
    
    /**
     * 快递单号
     */
    private String courierNumber;
    
    /**
     * 退款原因
     */
    private String refundReason;
    
    /**
     * 退款原因
     */
    private String refundTime;
    
    /**
     * 支付方式
     */
    private String payType;
    
    /**
     * 订单来源
     */
    private String paySource;
    
    /**
     * 用户ID
     */
    private String userId;
    
    /**
     * 项目封面图片
     */
    private String projectImgUrl;
    
    /**
     * 支持用户头像
     */
    private String headUrl;
    
    public String getOrderId()
    {
        return orderId;
    }
    
    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }
    
    public String getProjectTile()
    {
        return projectTile;
    }
    
    public void setProjectTile(String projectTile)
    {
        this.projectTile = projectTile;
    }
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    public String getNickName()
    {
        return nickName;
    }
    
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
    public String getAmount()
    {
        return amount;
    }
    
    public void setAmount(String amount)
    {
        this.amount = amount;
    }
    
    public String getStatus()
    {
        return status;
    }
    
    public void setStatus(String status)
    {
        this.status = status;
    }
    
    public String getOrderNo()
    {
        return orderNo;
    }
    
    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo;
    }
    
    public String getSupportTime()
    {
        return supportTime;
    }
    
    public void setSupportTime(String supportTime)
    {
        this.supportTime = supportTime;
    }
    
    public String getTradeType()
    {
        return tradeType;
    }
    
    public void setTradeType(String tradeType)
    {
        this.tradeType = tradeType;
    }
    
    public String getReturnAmount()
    {
        return returnAmount;
    }
    
    public void setReturnAmount(String returnAmount)
    {
        this.returnAmount = returnAmount;
    }
    
    public String getReturnNumber()
    {
        return returnNumber;
    }
    
    public void setReturnNumber(String returnNumber)
    {
        this.returnNumber = returnNumber;
    }
    
    public String getMessage()
    {
        return message;
    }
    
    public void setMessage(String message)
    {
        this.message = message;
    }
    
    public String getPurposeText()
    {
        return purposeText;
    }
    
    public void setPurposeText(String purposeText)
    {
        this.purposeText = purposeText;
    }
    
    public String getReceiverName()
    {
        return receiverName;
    }
    
    public void setReceiverName(String receiverName)
    {
        this.receiverName = receiverName;
    }
    
    public String getReceiverPhone()
    {
        return receiverPhone;
    }
    
    public void setReceiverPhone(String receiverPhone)
    {
        this.receiverPhone = receiverPhone;
    }
    
    public String getReceiverAddr()
    {
        return receiverAddr;
    }
    
    public void setReceiverAddr(String receiverAddr)
    {
        this.receiverAddr = receiverAddr;
    }
    
    public String getReceiverDetailAddr()
    {
        return receiverDetailAddr;
    }
    
    public void setReceiverDetailAddr(String receiverDetailAddr)
    {
        this.receiverDetailAddr = receiverDetailAddr;
    }
    
    public String getIsLogistics()
    {
        return isLogistics;
    }
    
    public void setIsLogistics(String isLogistics)
    {
        this.isLogistics = isLogistics;
    }
    
    public String getReceiverTime()
    {
        return receiverTime;
    }
    
    public void setReceiverTime(String receiverTime)
    {
        this.receiverTime = receiverTime;
    }
    
    public String getSendTime()
    {
        return sendTime;
    }
    
    public void setSendTime(String sendTime)
    {
        this.sendTime = sendTime;
    }
    
    public String getCourierCompany()
    {
        return courierCompany;
    }
    
    public void setCourierCompany(String courierCompany)
    {
        this.courierCompany = courierCompany;
    }
    
    public String getCourierNumber()
    {
        return courierNumber;
    }
    
    public void setCourierNumber(String courierNumber)
    {
        this.courierNumber = courierNumber;
    }
    
    public String getRefundReason()
    {
        return refundReason;
    }
    
    public void setRefundReason(String refundReason)
    {
        this.refundReason = refundReason;
    }
    
    public String getRefundTime()
    {
        return refundTime;
    }
    
    public void setRefundTime(String refundTime)
    {
        this.refundTime = refundTime;
    }
    
    public String getProjectType()
    {
        return projectType;
    }
    
    public void setProjectType(String projectType)
    {
        this.projectType = projectType;
    }
    
    public String getUserName()
    {
        return userName;
    }
    
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    
    public String getPayType()
    {
        return payType;
    }
    
    public void setPayType(String payType)
    {
        this.payType = payType;
    }
    
    public String getPaySource()
    {
        return paySource;
    }
    
    public void setPaySource(String paySource)
    {
        this.paySource = paySource;
    }
    
    public String getUserId()
    {
        return userId;
    }
    
    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getProjectImgUrl()
    {
        return projectImgUrl;
    }

    public void setProjectImgUrl(String projectImgUrl)
    {
        this.projectImgUrl = projectImgUrl;
    }

    public String getHeadUrl()
    {
        return headUrl;
    }

    public void setHeadUrl(String headUrl)
    {
        this.headUrl = headUrl;
    }
    
}
