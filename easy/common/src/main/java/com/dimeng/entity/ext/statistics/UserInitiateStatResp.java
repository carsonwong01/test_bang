package com.dimeng.entity.ext.statistics;

import java.io.Serializable;

/**
 * 用户发起统计resp
 * @author  song
 * @version  [版本号, 2016年10月10日]
 */
public class UserInitiateStatResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -1591463726400615254L;
    
    /**
     * 用户名
     */
    private String userName;
    
    /**
     * 用户昵称
     */
    private String nickName;
    
    /**
     * 发起项目数
     */
    private String initiateProCount;
    
    /**
     * 成功项目数
     */
    private String successProCount;
    
    /**
     * 失败项目数
     */
    private String failProCount;
    
    /**
     * 删除项目数
     */
    private String deleteProCount;
    
    /**
     * 成功项目总额
     */
    private String initiateAmt;
    
    /**
     * 退款总额
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

    public String getInitiateProCount()
    {
        return initiateProCount;
    }

    public void setInitiateProCount(String initiateProCount)
    {
        this.initiateProCount = initiateProCount;
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

    public String getInitiateAmt()
    {
        return initiateAmt;
    }

    public void setInitiateAmt(String initiateAmt)
    {
        this.initiateAmt = initiateAmt;
    }

    public String getRefundAmt()
    {
        return refundAmt;
    }

    public void setRefundAmt(String refundAmt)
    {
        this.refundAmt = refundAmt;
    }

    public String getDeleteProCount()
    {
        return deleteProCount;
    }

    public void setDeleteProCount(String deleteProCount)
    {
        this.deleteProCount = deleteProCount;
    }
    
}
