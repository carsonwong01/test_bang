/*
 * 文 件 名:  FindSupportListReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月14日
 */
package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 项目支持订单列表请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月14日]
 */
public class FindSupportListReq extends FindExportExcelParamsReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 4314486884491949112L;
    
    /**
     * 项目ID
     */
    @NotBlank
    private String projectId;
    
    /**
     * 订单号
     */
    private String orderNo;
    
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
     * 昵称
     */
    private String nickName;
    
    /**
     * 回报金额
     */
    private String supportAmount;
    
    /**
     * 开始时间
     */
    private String beginTime;
    
    /**
     * 结束时间
     */
    private String endTime;
    
    /**
     * 是否查询总计
     * 1查询
     * 2不查询
     */
    private String type;
    
    /**
     * @return 返回 projectId
     */
    public String getProjectId()
    {
        return projectId;
    }
    
    /**
     * @param 对projectId进行赋值
     */
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
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
     * @return 返回 beginTime
     */
    public String getBeginTime()
    {
        return beginTime;
    }
    
    /**
     * @param 对beginTime进行赋值
     */
    public void setBeginTime(String beginTime)
    {
        this.beginTime = beginTime;
    }
    
    /**
     * @return 返回 endTime
     */
    public String getEndTime()
    {
        return endTime;
    }
    
    /**
     * @param 对endTime进行赋值
     */
    public void setEndTime(String endTime)
    {
        this.endTime = endTime;
    }
    
    /**
     * @return 返回 type
     */
    public String getType()
    {
        return type;
    }
    
    /**
     * @param 对type进行赋值
     */
    public void setType(String type)
    {
        this.type = type;
    }
    
}
