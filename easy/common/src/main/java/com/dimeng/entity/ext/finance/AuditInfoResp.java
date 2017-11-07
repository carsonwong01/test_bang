package com.dimeng.entity.ext.finance;

import java.io.Serializable;

/**
 * 
 * 提现审核原因查询返回结果实体
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月29日]
 */
public class AuditInfoResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -4477171927659642482L;
    
    /**
     * 审核原因
     */
    private String  auditInfo;

    public String getAuditInfo()
    {
        return auditInfo;
    }

    public void setAuditInfo(String auditInfo)
    {
        this.auditInfo = auditInfo;
    }
    
    
}
