package com.dimeng.entity.ext.finance;

import java.io.Serializable;


public class AdjustRemarkResp implements Serializable
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 2987681187764302666L;
    /**
     * 审核原因
     */
    private String  remark;
    
    public String getRemark()
    {
        return remark;
    }
    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    
    
}
