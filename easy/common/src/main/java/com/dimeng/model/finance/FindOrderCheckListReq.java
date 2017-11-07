package com.dimeng.model.finance;

import com.dimeng.model.expand.FindExportExcelParamsReq;




/**
 * 支付/退款对账列表参数实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月11日]
 */
public class FindOrderCheckListReq extends FindExportExcelParamsReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8978179074646319782L;
    
    /**
     * 列表类型：1支付对账列表 2退款对账列表
     */
    private String listType;
    
    /**
     * 用户
     */
    private String userName;
    
    /**
     * 订单编号
     */
    private String orderNo;
    
    /**
     * 支付流水号
     */
    private String payFlowNo;
    
    /**
     * 支付时间查询开始
     */
    private String payBeginTime;
    
    /**
     * 支付时间查询结束
     */
    private String payEndTime;
    
    /**
     * 支付对账状态
     */
    private String payCheckStatus;
    
    /**
     * 退款时间查询开始
     */
    private String refundBeginTime;
    
    /**
     * 退款时间查询结束
     */
    private String refundEndTime;
    
    /**
     * 退款对账状态
     */
    private String refundCheckStatus;

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getOrderNo()
    {
        return orderNo;
    }

    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo;
    }

    public String getPayFlowNo()
    {
        return payFlowNo;
    }

    public void setPayFlowNo(String payFlowNo)
    {
        this.payFlowNo = payFlowNo;
    }

    public String getPayBeginTime()
    {
        return payBeginTime;
    }

    public void setPayBeginTime(String payBeginTime)
    {
        this.payBeginTime = payBeginTime;
    }

    public String getPayEndTime()
    {
        return payEndTime;
    }

    public void setPayEndTime(String payEndTime)
    {
        this.payEndTime = payEndTime;
    }

    public String getPayCheckStatus()
    {
        return payCheckStatus;
    }

    public void setPayCheckStatus(String payCheckStatus)
    {
        this.payCheckStatus = payCheckStatus;
    }

    public String getRefundBeginTime()
    {
        return refundBeginTime;
    }

    public void setRefundBeginTime(String refundBeginTime)
    {
        this.refundBeginTime = refundBeginTime;
    }

    public String getRefundEndTime()
    {
        return refundEndTime;
    }

    public void setRefundEndTime(String refundEndTime)
    {
        this.refundEndTime = refundEndTime;
    }

    public String getRefundCheckStatus()
    {
        return refundCheckStatus;
    }

    public void setRefundCheckStatus(String refundCheckStatus)
    {
        this.refundCheckStatus = refundCheckStatus;
    }

    public String getListType()
    {
        return listType;
    }

    public void setListType(String listType)
    {
        this.listType = listType;
    }
    
    
}
