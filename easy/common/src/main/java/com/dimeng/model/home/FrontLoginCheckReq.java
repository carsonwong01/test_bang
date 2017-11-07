package com.dimeng.model.home;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 前台登录请求req
 * <一句话功能简述> 
 * @author  song
 * @version  [版本号, 2016年10月13日]
 */
public class FrontLoginCheckReq extends BaseReq
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -5365393358870459770L;
    
    /**
     * 用户名-手机号
     */
    @NotBlank
    private String userName;
    
    /**
     * 登录来源 0 PC 1微信 2安卓 3 IOS
     */
    @NotBlank
    private String source;
    
    /**
     * 登录ip
     */
    private String loginIp;
    
    /**
     * 登录验证码-短信验证码
     */
    @NotBlank
    private String loginYzm;
    
    public String getUserName()
    {
        return userName;
    }
    
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    
    public String getSource()
    {
        return source;
    }
    
    public void setSource(String source)
    {
        this.source = source;
    }
    
    public String getLoginIp()
    {
        return loginIp;
    }
    
    public void setLoginIp(String loginIp)
    {
        this.loginIp = loginIp;
    }
    
    public String getLoginYzm()
    {
        return loginYzm;
    }
    
    public void setLoginYzm(String loginYzm)
    {
        this.loginYzm = loginYzm;
    }
    
}
