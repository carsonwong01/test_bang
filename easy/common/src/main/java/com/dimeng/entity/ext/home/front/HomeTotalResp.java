package com.dimeng.entity.ext.home.front;

import java.io.Serializable;

public class HomeTotalResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -581435987118743096L;
    
    /**
     * 筹资总额
     */
    private String raiseTotal;
    
    /**
     * 项目总数（个）
     */
    private String projectCount;
    
    /**
     * 支持总数（人）
     */
    private String memberCount;
    
    /**
     * 金额无逗号隔开的
     */
    private String totalInteger;

    public String getRaiseTotal()
    {
        return raiseTotal;
    }

    public void setRaiseTotal(String raiseTotal)
    {
        this.raiseTotal = raiseTotal;
    }

    public String getProjectCount()
    {
        return projectCount;
    }

    public void setProjectCount(String projectCount)
    {
        this.projectCount = projectCount;
    }

    public String getMemberCount()
    {
        return memberCount;
    }

    public void setMemberCount(String memberCount)
    {
        this.memberCount = memberCount;
    }

    public String getTotalInteger()
    {
        return totalInteger;
    }

    public void setTotalInteger(String totalInteger)
    {
        this.totalInteger = totalInteger;
    }
    
}
