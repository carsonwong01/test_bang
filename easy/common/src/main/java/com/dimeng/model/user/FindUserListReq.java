package com.dimeng.model.user;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 后台用户管理req
 * @author  song
 * @version  [版本号, 2016年9月28日]
 */
public class FindUserListReq extends FindExportExcelParamsReq 
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 4856418484552699966L;
    
    /**
     * 用户名
     */
    private String userName;
    
    /**
     * 用户昵称    
     */
    private String nickName;
    
    /**
     * 真实姓名
     */
    private String realName;
    
    /**
     * 身份证
     */
    private String idCard;
    
    /**
     * 注册来源  0 PC 1 微信 2 安卓 3 IOS 
     */
    private String source;
    
    /**
     * 状态 0 正常 1锁定 2 拉黑
     */
    private String status;
    
    /**
     * 开始时间 注册
     */
    private String staTime;
    
    /**
     * 结束时间
     */
    private String endTime;

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getNickName()
    {
        return nickName;
    }

    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }

    public String getRealName()
    {
        return realName;
    }

    public void setRealName(String realName)
    {
        this.realName = realName;
    }

    public String getIdCard()
    {
        return idCard;
    }

    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getSource()
    {
        return source;
    }

    public void setSource(String source)
    {
        this.source = source;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStaTime()
    {
        return staTime;
    }

    public void setStaTime(String staTime)
    {
        this.staTime = staTime;
    }

    public String getEndTime()
    {
        return endTime;
    }

    public void setEndTime(String endTime)
    {
        this.endTime = endTime;
    }
    
}
