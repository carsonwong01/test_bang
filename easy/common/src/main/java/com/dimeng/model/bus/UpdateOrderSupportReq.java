/*
 * 文 件 名:  UpdateOrderSupportReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月14日
 */
package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 发货请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月14日]
 */
public class UpdateOrderSupportReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 209567783316350782L;
    
    /**
     * 订单ID
     */
    @NotBlank
    private String orderId;
    
    /**
     * 是否发物流（1:是2:否）
     */
    @NotBlank
    private String isLogistics;
    
    /**
     * 快递公司
     */
    private String courierCompany;
    
    /**
     * 快递单号
     */
    private String courierNumber;
    
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
     * @return 返回 isLogistics
     */
    public String getIsLogistics()
    {
        return isLogistics;
    }
    
    /**
     * @param 对isLogistics进行赋值
     */
    public void setIsLogistics(String isLogistics)
    {
        this.isLogistics = isLogistics;
    }
    
    /**
     * @return 返回 courierCompany
     */
    public String getCourierCompany()
    {
        return courierCompany;
    }
    
    /**
     * @param 对courierCompany进行赋值
     */
    public void setCourierCompany(String courierCompany)
    {
        this.courierCompany = courierCompany;
    }
    
    /**
     * @return 返回 courierNumber
     */
    public String getCourierNumber()
    {
        return courierNumber;
    }
    
    /**
     * @param 对courierNumber进行赋值
     */
    public void setCourierNumber(String courierNumber)
    {
        this.courierNumber = courierNumber;
    }
    
}
