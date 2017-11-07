/*
 * 文 件 名:  FindAddressDetailReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年11月9日
 */
package com.dimeng.model.user;

import com.dimeng.framework.domain.BaseReq;

/**
 * 查询收货地址详情请求实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年11月9日]
 */
public class FindAddressDetailReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8773957871506631166L;
    
    /**
     * 用户地址id
     */
    private String id;
    
    /**
     * 是否取默认，1是，2否
     */
    private String isDefault;
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
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
