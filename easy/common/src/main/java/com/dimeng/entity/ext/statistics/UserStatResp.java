package com.dimeng.entity.ext.statistics;

import java.io.Serializable;

/**
 * 用户统计返回实体
 * @author  song
 * @version  [版本号, 2016年10月9日]
 */
public class UserStatResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -6541372042545419647L;
    
    /**
     * 日期
     */
    private String dateTime;
    
    /**
     * 当日注册
     */
    private String registerCount;
    
    /**
     * 登录用户
     */
    private String loginUserCount;
    
    /**
     * 新增支付用户
     */
    private String newPayUserCount;
    
    /**
     * 微信注册量
     */
    private String regWxCount;
    
    /**
     * App注册量
     */
    private String regAppCount;
    
    /**
     * PC端注册量
     */
    private String regPcCount;
    
    public String getDateTime()
    {
        return dateTime;
    }
    
    public void setDateTime(String dateTime)
    {
        this.dateTime = dateTime;
    }
    
    public String getRegisterCount()
    {
        return registerCount;
    }
    
    public void setRegisterCount(String registerCount)
    {
        this.registerCount = registerCount;
    }
    
    public String getLoginUserCount()
    {
        return loginUserCount;
    }
    
    public void setLoginUserCount(String loginUserCount)
    {
        this.loginUserCount = loginUserCount;
    }

    public String getNewPayUserCount()
    {
        return newPayUserCount;
    }

    public void setNewPayUserCount(String newPayUserCount)
    {
        this.newPayUserCount = newPayUserCount;
    }

    public String getRegWxCount()
    {
        return regWxCount;
    }

    public void setRegWxCount(String regWxCount)
    {
        this.regWxCount = regWxCount;
    }

    public String getRegAppCount()
    {
        return regAppCount;
    }

    public void setRegAppCount(String regAppCount)
    {
        this.regAppCount = regAppCount;
    }

    public String getRegPcCount()
    {
        return regPcCount;
    }

    public void setRegPcCount(String regPcCount)
    {
        this.regPcCount = regPcCount;
    }
}
