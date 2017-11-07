/*
 * 文 件 名:  IsExsitIdCardReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月31日
 */
package com.dimeng.model.user;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;

/**
 * 检查身份证是否存在
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月31日]
 */
public class IsExsitIdCardReq implements Serializable
{
    /**
     * 注释内容
     */
    @NotBlank
    private static final long serialVersionUID = 1475469393650422024L;
    
    /**
     * 身份证号码，base64编码
     */
    private String idCardNmber;
    
    public String getIdCardNmber()
    {
        return idCardNmber;
    }
    
    public void setIdCardNmber(String idCardNmber)
    {
        this.idCardNmber = idCardNmber;
    }
}
