package com.dimeng.model.common;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * ID参数实体类
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月29日]
 */
public class IdReq extends BaseReq
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 5809322325064600137L;
    
    /**
     * ID
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
