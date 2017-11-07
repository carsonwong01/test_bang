package com.dimeng.model.bus;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 项目验证审核请求实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月9日]
 */
public class CommonVerificateAuditReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 1156250085025977850L;
    
    /**
     * 项目验证id
     */
    @NotBlank
    private String id;
    
    /**
     * 审核意见
     */
    @Length(min = 1, max = 200)
    @NotBlank
    private String auditInfo;
    
    /**
     * 状态：
        1审核通过
        2审核不通过
     */
    @NotBlank
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
