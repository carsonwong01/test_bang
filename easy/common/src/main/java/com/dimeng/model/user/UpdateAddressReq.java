package com.dimeng.model.user;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 收货地址管理-添加/修改/删除收货地址
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月17日]
 */
public class UpdateAddressReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -849294527095865959L;
    
    /**
     * 操作类别（0新增，1修改 2删除物理删除）
     */
    @NotBlank
    private String operationType;
    
    /**
     * 主键ID
     */
    private String addrId;
    
    /**
     * 收货人姓名
     */
    @Length(max = 25)
    private String consigneeName;
    
    /**
     * 收货人手机号
     */
    @Length(max = 25)
    private String consigneePhone;
    
    /**
     * 收货人地区（省、市、县/区）
     */
    @Length(max = 25)
    private String consigneeCity;
    
    /**
     * 详细地址（街道）
     */
    @Length(max = 100)
    private String consigneeAddress;
    
    /**
     * 是否是默认地址
     */
    @Length(max = 2)
    private String isDefault;
    
    public String getOperationType()
    {
        return operationType;
    }
    
    public void setOperationType(String operationType)
    {
        this.operationType = operationType;
    }
    
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
    
    public String getConsigneeCity()
    {
        return consigneeCity;
    }
    
    public void setConsigneeCity(String consigneeCity)
    {
        this.consigneeCity = consigneeCity;
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
    
}
