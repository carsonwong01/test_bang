package com.dimeng.entity.ext.statistics;

import java.io.Serializable;

/**
 * 用户支持统计resp
 * @author  song
 * @version  [版本号, 2016年10月10日]
 */
public class UserSupportStatResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -1041656020046181622L;
    
    /**
     * 用户名
     */
    private String userName;
    
    /**
     * 用户昵称
     */
    private String nickName;
    
    /**
     * 支持总额
     */
    private String supportAmt;
    
    /**
     * 支持项目数
     */
    private String supportProCount;
    
    /**
     * 支持成功项目数
     */
    private String successProCount;
    
    /**
     * 失败项目数
     */
    private String failProCount;
    
    /**
     * 退款金额
     */
    private String refundAmt;

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

    public String getSupportAmt()
    {
        return supportAmt;
    }

    public void setSupportAmt(String supportAmt)
    {
        this.supportAmt = supportAmt;
    }

    public String getSupportProCount()
    {
        return supportProCount;
    }

    public void setSupportProCount(String supportProCount)
    {
        this.supportProCount = supportProCount;
    }

    public String getSuccessProCount()
    {
        return successProCount;
    }

    public void setSuccessProCount(String successProCount)
    {
        this.successProCount = successProCount;
    }

    public String getFailProCount()
    {
        return failProCount;
    }

    public void setFailProCount(String failProCount)
    {
        this.failProCount = failProCount;
    }

    public String getRefundAmt()
    {
        return refundAmt;
    }

    public void setRefundAmt(String refundAmt)
    {
        this.refundAmt = refundAmt;
    }
    
    
}
