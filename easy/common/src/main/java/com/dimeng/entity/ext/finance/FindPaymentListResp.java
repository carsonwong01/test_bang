package com.dimeng.entity.ext.finance;

import java.io.Serializable;

/**
 * 
 * 订单列表查询返回实体
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月27日]
 */
public class FindPaymentListResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8043716933769108365L;
    
    /**
     * 订单编号
     */
    private String orderId;
    
    /**
     * 用户id
     */
    private String userId;
    
    /**
     * 支持者
     */
    private String supporter;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 支持金额（元）
     */
    private String supportAmt;
    
    /**
     * 支付时间
     */
    private String payTime;
    
    /**
     * 支付方式
     */
    private String payType;
    
    /**
     * 来源 1微信    2安卓  3IOS  
     */
    private String paySource;
    
    /**
     * 支付状态：3、4、5、6、7、8、10支付成功、9支付失败
     */
    private String payStatus;
    
    /**
     * 支付流水号
     */
    private String paySerialNo;
    
    /**
     * 项目id
     */
    private String projectId;
    
    /**
     * 项目编号
     */
    private String projectNo;
    
    /**
     * 项目类型
     */
    private String projectType;
    
    /**
     *项目状态 
     */
    private String projectStatus;
    
    /**
     * 回报梦想描述
     */
    private String returnDescribe;
    
    /**
     * 收货人
     */
    private String receiveName;
    
    /**
     * 联系方式
     */
    private String phone;
    
    /**
     * 地区
     */
    private String region;
    
    /**
     * 详细地址
     */
    private String address;
    
    /**
     * 项目名称
     */
    private String projectName;
    
    /**
     * 回报单价
     */
    private String returnAmt;
    
    /**
     * 支持份数
     */
    private String supportCount;
    
    /**
     * 支持金额合计
     */
    private String supportAmtTotal;
    
    
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

    public String getNickName()
    {
        return nickName;
    }

    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }

    public String getSupportAmt()
    {
        return supportAmt;
    }

    public void setSupportAmt(String supportAmt)
    {
        this.supportAmt = supportAmt;
    }

    public String getPayTime()
    {
        return payTime;
    }

    public void setPayTime(String payTime)
    {
        this.payTime = payTime;
    }

    public String getPaySource()
    {
        return paySource;
    }

    public void setPaySource(String paySource)
    {
        this.paySource = paySource;
    }


    public String getPayStatus()
    {
        return payStatus;
    }

    public void setPayStatus(String payStatus)
    {
        this.payStatus = payStatus;
    }

    public String getPaySerialNo()
    {
        return paySerialNo;
    }

    public void setPaySerialNo(String paySerialNo)
    {
        this.paySerialNo = paySerialNo;
    }

    public String getProjectNo()
    {
        return projectNo;
    }

    public void setProjectNo(String projectNo)
    {
        this.projectNo = projectNo;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getProjectType()
    {
        return projectType;
    }

    public void setProjectType(String projectType)
    {
        this.projectType = projectType;
    }

    public String getProjectStatus()
    {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }

    public String getReturnDescribe()
    {
        return returnDescribe;
    }

    public void setReturnDescribe(String returnDescribe)
    {
        this.returnDescribe = returnDescribe;
    }

    public String getReceiveName()
    {
        return receiveName;
    }

    public void setReceiveName(String receiveName)
    {
        this.receiveName = receiveName;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getRegion()
    {
        return region;
    }

    public void setRegion(String region)
    {
        this.region = region;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getProjectName()
    {
        return projectName;
    }

    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }

    public String getReturnAmt()
    {
        return returnAmt;
    }

    public void setReturnAmt(String returnAmt)
    {
        this.returnAmt = returnAmt;
    }

    public String getSupportCount()
    {
        return supportCount;
    }

    public void setSupportCount(String supportCount)
    {
        this.supportCount = supportCount;
    }

    public String getSupportAmtTotal()
    {
        return supportAmtTotal;
    }

    public void setSupportAmtTotal(String supportAmtTotal)
    {
        this.supportAmtTotal = supportAmtTotal;
    }

    public String getProjectId()
    {
        return projectId;
    }

    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
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
