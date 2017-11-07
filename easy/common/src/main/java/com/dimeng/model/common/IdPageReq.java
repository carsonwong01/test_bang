package com.dimeng.model.common;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * ID分页参数实体类
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月29日]
 */
public class IdPageReq extends FindExportExcelParamsReq
{

   
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -4853275660802562677L;
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
