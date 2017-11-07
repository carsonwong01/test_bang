package com.dimeng.entity.ext.user;

import java.io.Serializable;

/**
 * 收货地址管理-查询返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月14日]
 */
public class FindAddressResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 4603921289819016252L;
    
    /**
     * 主键ID
     */
    private String addressId;
    
    /**
     * 收货人姓名
     */
    private String userName;
    
    /**
     * 收货人手机号
     */
    private String phoneNumber;
    
    /**
     * 收货人地区（省、市、县/区）
     */
    private String area;
    
    /**
     * 详细地址（街道）
     */
    private String detaileAddress;
    
    /**
     * 是否是默认地址
     */
    private String isDefault;
    
    public String getAddressId()
    {
        return addressId;
    }
    
    public void setAddressId(String addressId)
    {
        this.addressId = addressId;
    }
    
    public String getUserName()
    {
        return userName;
    }
    
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    
    public String getPhoneNumber()
    {
        return phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber)
    {
        this.phoneNumber = phoneNumber;
    }
    
    public String getArea()
    {
        return area;
    }
    
    public void setArea(String area)
    {
        this.area = area;
    }
    
    public String getDetaileAddress()
    {
        return detaileAddress;
    }
    
    public void setDetaileAddress(String detaileAddress)
    {
        this.detaileAddress = detaileAddress;
    }
    
    public String getIsDefault()
    {
        return isDefault;
    }
    
    public void setIsDefault(String isDefault)
    {
        this.isDefault = isDefault;
    }
    
}
