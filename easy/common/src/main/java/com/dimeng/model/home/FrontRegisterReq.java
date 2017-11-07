package com.dimeng.model.home;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 用户注册请求req
 * @author  song
 * @version  [版本号, 2016年10月13日]
 */
public class FrontRegisterReq extends BaseReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -79036688837995468L;
    
    /**
     * 手机号--用户名
     */
    @NotBlank
    private String phoneNumber;
    
    /**
     * 来源 1 PC \r\n       2 微信\r\n       3 安卓  4IOS
     */
    private String source;
    
    /**
     * 用户头像-第三方
     */
    private String headPortrait;
    
    /**
     * 用户昵称-第三方
     */
    private String nickname;
    
    /**
     * 性别 - 第三方
     */
    private String sex;
    
    /**
     * 注册IP
     */
    @Length(max = 30)
    private String lastLoginIp;
    
    /**
     * 注册时，手机发送的验证码
     */
    @NotBlank
    private String telCode;
    
    /**
     * 用户认证token
     */ 
    @NotBlank
    public String token;
    
    /**
     * 用户标识
     */
    @NotBlank
    public String openid;
    
    /**
     * 授权码授权时间
     */
    public String tokenTime;
    
    /**
     * 登录授权方式-1 手机  2 微信 3 微博 4 QQ
     */
    @NotBlank
    public String thirdType;
    
    /**
     * tonken失效时间
     */
    public String tokenExpireIn;
    
    public String unionId;
    
    public String getPhoneNumber()
    {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber)
    {
        this.phoneNumber = phoneNumber;
    }

    public String getSource()
    {
        return source;
    }

    public void setSource(String source)
    {
        this.source = source;
    }

    public String getHeadPortrait()
    {
        return headPortrait;
    }

    public void setHeadPortrait(String headPortrait)
    {
        this.headPortrait = headPortrait;
    }

    public String getNickname()
    {
        return nickname;
    }

    public void setNickname(String nickname)
    {
        this.nickname = nickname;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getLastLoginIp()
    {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp)
    {
        this.lastLoginIp = lastLoginIp;
    }

    public String getTelCode()
    {
        return telCode;
    }

    public void setTelCode(String telCode)
    {
        this.telCode = telCode;
    }

    public String getToken()
    {
        return token;
    }

    public void setToken(String token)
    {
        this.token = token;
    }

    public String getOpenid()
    {
        return openid;
    }

    public void setOpenid(String openid)
    {
        this.openid = openid;
    }

    public String getTokenTime()
    {
        return tokenTime;
    }

    public void setTokenTime(String tokenTime)
    {
        this.tokenTime = tokenTime;
    }

    public String getThirdType()
    {
        return thirdType;
    }

    public void setThirdType(String thirdType)
    {
        this.thirdType = thirdType;
    }
     
    public String getTokenExpireIn()
    {
        return tokenExpireIn;
    }

    public void setTokenExpireIn(String tokenExpireIn)
    {
        this.tokenExpireIn = tokenExpireIn;
    }

    public String getUnionId()
    {
        return unionId;
    }

    public void setUnionId(String unionId)
    {
        this.unionId = unionId;
    }
 
}
