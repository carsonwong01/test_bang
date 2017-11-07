package com.dimeng.entity.ext.home.back;

import java.io.Serializable;

/**
 * 今日数据统计
 * @author  song
 * @version  [版本号, 2016年9月27日]
 */
public class HomeTodayDataResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -7693061966098127594L;
    
    /**
     * 今日个人注册人数
     */
    private String registerPerCount;
     
    /**
     * 今日登录人数
     */
    private String loginUserCount;
    
    /**
     * 当前在线人数
     */
    private String onlineUserCount;

    public String getRegisterPerCount()
    {
        return registerPerCount;
    }

    public void setRegisterPerCount(String registerPerCount)
    {
        this.registerPerCount = registerPerCount;
    }

    public String getLoginUserCount()
    {
        return loginUserCount;
    }

    public void setLoginUserCount(String loginUserCount)
    {
        this.loginUserCount = loginUserCount;
    }

    public String getOnlineUserCount()
    {
        return onlineUserCount;
    }

    public void setOnlineUserCount(String onlineUserCount)
    {
        this.onlineUserCount = onlineUserCount;
    }
    
}
