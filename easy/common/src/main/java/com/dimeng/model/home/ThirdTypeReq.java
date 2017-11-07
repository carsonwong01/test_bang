package com.dimeng.model.home;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

public class ThirdTypeReq extends BaseReq 
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -5177377344457429916L;
    /**
     * 第三方授权类型 2 微信  3微博  4 QQ  5 公众号用户
     */
    @NotBlank
    private String sourceType;
    
    /**
     * 回调需要的第三方code
     */
    @NotBlank
    private String code;
    
    /**
     * 设备类型-QQ登录需要-pc -其他 默认为pc
     */
    private String deviceType;
    
    public String getCode()
    {
        return code;
    }
    public void setCode(String code)
    {
        this.code = code;
    }
    public String getSourceType()
    {
        return sourceType;
    }
    public void setSourceType(String sourceType)
    {
        this.sourceType = sourceType;
    }
    public String getDeviceType()
    {
        return deviceType;
    }
    public void setDeviceType(String deviceType)
    {
        this.deviceType = deviceType;
    }
    
}
