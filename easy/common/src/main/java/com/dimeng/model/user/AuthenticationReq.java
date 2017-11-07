package com.dimeng.model.user;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 实名认证-认证
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月14日]
 */
public class AuthenticationReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -2220793402707795250L;
    
    /**
     * 真实姓名
     */
    @NotBlank
    private String realName;
    
    /**
     * 身份证号,base64加密
     */
    @NotBlank
    private String idNumber;
    
    public String getRealName()
    {
        return realName;
    }
    
    public void setRealName(String realName)
    {
        this.realName = realName;
    }
    
    public String getIdNumber()
    {
        return idNumber;
    }
    
    public void setIdNumber(String idNumber)
    {
        this.idNumber = idNumber;
    }
    
}
