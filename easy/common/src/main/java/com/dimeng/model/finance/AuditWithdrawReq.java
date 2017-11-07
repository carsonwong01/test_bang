package com.dimeng.model.finance;

import com.dimeng.framework.domain.BaseReq;

/**
 * 
 * 提现审核参数实体类
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月8日]
 */
public class AuditWithdrawReq extends BaseReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -4332043573353379531L;
    /**
     * 提现ID
     */
    private String id;
    /**
     * 审核意见
     */
    private String auditInfo;
    /**
     * 审核状态 1：审核通过  2：审核不通过
     */
    private String status;

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getAuditInfo()
    {
        return auditInfo;
    }

    public void setAuditInfo(String auditInfo)
    {
        this.auditInfo = auditInfo;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }
    
    
    
}
