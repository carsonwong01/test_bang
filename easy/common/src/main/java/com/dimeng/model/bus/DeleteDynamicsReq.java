package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 删除项目动态请求实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月11日]
 */
public class DeleteDynamicsReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 794316003304742217L;
    
    /**
     * 动态id
     */
    @NotBlank
    private String id;
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
    }
    
}
