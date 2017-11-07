/*
 * 文 件 名:  FindProAuthenStatuResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年11月5日
 */
package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 查询项目验证状态响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年11月5日]
 */
public class FindProAuthenStatuResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 3189817907032314402L;
    
    /**
     * 项目验证状态
     */
    private String status;
    
    /**
     * 项目验证id
     */
    private String validationId;
    
    /**
     * @return 返回 status
     */
    public String getStatus()
    {
        return status;
    }
    
    /**
     * @param 对status进行赋值
     */
    public void setStatus(String status)
    {
        this.status = status;
    }
    
    /**
     * @return 返回 validationId
     */
    public String getValidationId()
    {
        return validationId;
    }
    
    /**
     * @param 对validationId进行赋值
     */
    public void setValidationId(String validationId)
    {
        this.validationId = validationId;
    }
    
}
