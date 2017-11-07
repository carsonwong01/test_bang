package com.dimeng.entity.ext.user;

import java.io.Serializable;

public class FindAddressDetailResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8039425125018377569L;
    
    /**
     * 主键ID
     */
    private String addrId;
    
    /**
     * 收货人姓名
     */
    private String consigneeName;
    
    /**
     * 收货人手机号
     */
    private String consigneePhone;
    
    /**
     * 收货人地区省
     */
    private String province;
    
    /**
     *  收货人地区省Id
     */
    private String provinceId;
    
    /**
     * 收货人地区市
     */
    private String city;
    
    /**
     *收货人地区市Id
     */
    private String cityId;
    
    /**
     * 收货人地区区
     */
    private String county;
    
    /**
     * 收货人地区区Id
     */
    private String countyId;
    
    /**
     * 详细地址（街道）
     */
    private String consigneeAddress;
    
    /**
     * 是否是默认地址
     */
    private String isDefault;
    
    /**
     * 收货地址的区域id
     */
    private String consigneeCity;
    
    public String getAddrId()
    {
        return addrId;
    }
    
    public void setAddrId(String addrId)
    {
        this.addrId = addrId;
    }
    
    public String getConsigneeName()
    {
        return consigneeName;
    }
    
    public void setConsigneeName(String consigneeName)
    {
        this.consigneeName = consigneeName;
    }
    
    public String getConsigneePhone()
    {
        return consigneePhone;
    }
    
    public void setConsigneePhone(String consigneePhone)
    {
        this.consigneePhone = consigneePhone;
    }
    
    public String getProvince()
    {
        return province;
    }
    
    public void setProvince(String province)
    {
        this.province = province;
    }
    
    public String getProvinceId()
    {
        return this.consigneeCity.substring(0, 2);
    }
    
    public String getCity()
    {
        return city;
    }
    
    public void setCity(String city)
    {
        this.city = city;
    }
    
    public String getCityId()
    {
        return this.consigneeCity.substring(2, 4);
    }
    
    public String getCounty()
    {
        return county;
    }
    
    public void setCounty(String county)
    {
        this.county = county;
    }
    
    public String getCountyId()
    {
        return this.consigneeCity.substring(4);
    }
    
    public String getConsigneeAddress()
    {
        return consigneeAddress;
    }
    
    public void setConsigneeAddress(String consigneeAddress)
    {
        this.consigneeAddress = consigneeAddress;
    }
    
    public String getIsDefault()
    {
        return isDefault;
    }
    
    public void setIsDefault(String isDefault)
    {
        this.isDefault = isDefault;
    }
    
    public String getConsigneeCity()
    {
        return consigneeCity;
    }
    
    public void setConsigneeCity(String consigneeCity)
    {
        this.consigneeCity = consigneeCity;
    }
    
}
