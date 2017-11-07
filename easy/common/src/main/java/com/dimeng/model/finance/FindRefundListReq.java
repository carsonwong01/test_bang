package com.dimeng.model.finance;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 退款列表参数实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月9日]
 */
public class FindRefundListReq extends FindExportExcelParamsReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -931985577799540836L;
    
    /**
     * 类型：1待退款   2退款失败   3退款成功及退款失败 4 退款中
     */
    private String type;
    
    /**
     * 订单编号
     */
    private String orderId;
    
    /**
     * 支持者
     */
    private String supporter;
    
    /**
     * 退款类型：1未发货退款 2投诉退款 3项目失败退款 4众筹失败退款 5溢出退款
     */
    private String refundType;
    
    /**
     * 项目编号
     */
    private String projectNo;
    
    /**
     * 开始退款时间
     */
    private String startRefundTime;
    
    /**
     * 结束退款时间
     */
    private String endRefundTime;
    
    /**
     * 开始退款结果时间
     */
    private String startResultTime;
    
    /**
     * 结束退款结果时间
     */
    private String endResultTime;

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getOrderId()
    {
        return orderId;
    }

    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }

    public String getSupporter()
    {
        return supporter;
    }

    public void setSupporter(String supporter)
    {
        this.supporter = supporter;
    }

    public String getRefundType()
    {
        return refundType;
    }

    public void setRefundType(String refundType)
    {
        this.refundType = refundType;
    }

    public String getProjectNo()
    {
        return projectNo;
    }

    public void setProjectNo(String projectNo)
    {
        this.projectNo = projectNo;
    }

    public String getStartRefundTime()
    {
        return startRefundTime;
    }

    public void setStartRefundTime(String startRefundTime)
    {
        this.startRefundTime = startRefundTime;
    }

    public String getEndRefundTime()
    {
        return endRefundTime;
    }

    public void setEndRefundTime(String endRefundTime)
    {
        this.endRefundTime = endRefundTime;
    }

    public String getStartResultTime()
    {
        return startResultTime;
    }

    public void setStartResultTime(String startResultTime)
    {
        this.startResultTime = startResultTime;
    }

    public String getEndResultTime()
    {
        return endResultTime;
    }

    public void setEndResultTime(String endResultTime)
    {
        this.endResultTime = endResultTime;
    }
    
    
    
}
