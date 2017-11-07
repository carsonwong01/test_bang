/*
 * 文 件 名:  FindAuthenticationResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月14日
 */
package com.dimeng.entity.ext.user;

import java.io.Serializable;

/**
 * 实名认证-查询返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月14日]
 */
public class FindAuthenticationResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 448056669470193180L;
    
    /**
     * 真实姓名
     */
    private String realName;
    
    /**
     * 身份证号
     */
    private String idNumber;
    
    /**
     * 认证时间
     */
    private String auditTime;
    
    /**
     * 审核状态
     */
    private String auditStatus;
    
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
    
    public String getAuditTime()
    {
        return auditTime;
    }
    
    public void setAuditTime(String auditTime)
    {
        this.auditTime = auditTime;
    }
    
    public String getAuditStatus()
    {
        return auditStatus;
    }
    
    public void setAuditStatus(String auditStatus)
    {
        this.auditStatus = auditStatus;
    }
    
}
