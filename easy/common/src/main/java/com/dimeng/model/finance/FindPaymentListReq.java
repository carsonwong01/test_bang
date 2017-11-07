package com.dimeng.model.finance;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 
 * 订单列表查询参数实体
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月27日]
 */
public class FindPaymentListReq extends FindExportExcelParamsReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 2988647727457015084L;
    
    /**
     * 订单号
     */
    private String orderId;
    
    /**
     *用户ID 
     */
    private String userId;
    
    /**
     * 项目ID
     */
    private String projectId;
    
    /**
     * 项目名称
     */
    private String projectName;
    
    /**
     * 支持者
     */
    private String supporter;
    
    /**
     * 来源 1微信    2安卓  3IOS  
     */
    private String paySource;
    
    /**
     * 支付状态：0支付成功、9支付失败
     */
    private String status;
    
    /**
     * 支付流水号
     */
    private String paySerialNo;
    
    /**
     * 开始支付时间
     */
    private String beginTime;
    
    /**
     * 结束支付时间
     */
    private String endTime;
    
    /**
     * 项目编号
     */
    private String projectNo;
    
    /**
     * 项目类型
     */
    private String projectType;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 回报单价
     */
    private String returnAmount;
    
    /**
     * 列表类型： 1、用户支持的订单  2、项目详情支持记录  3、项目订单管理   4、所有订单   5、支付记录
     */
    private String type;
    
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
   
    public String getStatus()
    {
        return status;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }
    public String getPaySerialNo()
    {
        return paySerialNo;
    }
    public void setPaySerialNo(String paySerialNo)
    {
        this.paySerialNo = paySerialNo;
    }
    public String getBeginTime()
    {
        return beginTime;
    }
    public void setBeginTime(String beginTime)
    {
        this.beginTime = beginTime;
    }
    public String getEndTime()
    {
        return endTime;
    }
    public void setEndTime(String endTime)
    {
        this.endTime = endTime;
    }
    public String getProjectNo()
    {
        return projectNo;
    }
    public void setProjectNo(String projectNo)
    {
        this.projectNo = projectNo;
    }
    public String getProjectType()
    {
        return projectType;
    }
    public void setProjectType(String projectType)
    {
        this.projectType = projectType;
    }
    public String getNickName()
    {
        return nickName;
    }
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    @Override
    public String getUserId()
    {
        return userId;
    }
    @Override
    public void setUserId(String userId)
    {
        this.userId = userId;
    }
    public String getProjectId()
    {
        return projectId;
    }
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    public String getProjectName()
    {
        return projectName;
    }
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }
    public String getReturnAmount()
    {
        return returnAmount;
    }
    public void setReturnAmount(String returnAmount)
    {
        this.returnAmount = returnAmount;
    }
    public String getType()
    {
        return type;
    }
    public void setType(String type)
    {
        this.type = type;
    }
    public String getPaySource()
    {
        return paySource;
    }
    public void setPaySource(String paySource)
    {
        this.paySource = paySource;
    }
    
    
}
