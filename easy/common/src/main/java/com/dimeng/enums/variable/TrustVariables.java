/*
 * 文 件 名:  TrustVariables.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年11月1日
 */
package com.dimeng.enums.variable;

import com.dimeng.entity.base.VariableBean;
import com.dimeng.utils.VariableTypeAnnotation;

/**
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年11月1日]
 */
@VariableTypeAnnotation(id = "EASY_TRUST", name = "资金托管")
public enum TrustVariables implements VariableBean
{
    
    WX_SERVICE_ADDR("http://127.0.0.1:8080", "微信服务地址"),
    PAY_TYPE("200", "支付方式：微信 200");
    
    private String key;
    
    private String description;
    
    private String value;
    
    private TrustVariables(String value, String description)
    {
        this.description = description;
        this.value = value;
    }
    
    public void setKey(String key)
    {
        this.key = key;
    }
    
    public void setDescription(String description)
    {
        this.description = description;
    }
    
    public void setValue(String value)
    {
        this.value = value;
    }
    
    @Override
    public String getType()
    {
        return TrustVariables.class.getAnnotation(VariableTypeAnnotation.class).id();
    }
    
    @Override
    public String getKey()
    {
        StringBuilder builder = new StringBuilder(getType());
        builder.append('.').append(name());
        this.key = builder.toString();
        return this.key;
    }
    
    @Override
    public String getValue()
    {
        return this.value;
    }
    
    @Override
    public String getDescription()
    {
        return this.description;
    }
    
    @Override
    public boolean isInit()
    {
        return true;
    }
    
    @Override
    public String getTypeName()
    {
        return null;
    }
    
    @Override
    public boolean isDb()
    {
        return false;
    }
    
    public static void main(String[] args)
    {
        TrustVariables[] tvs = TrustVariables.class.getEnumConstants();
        for (TrustVariables tv : tvs)
        {
            System.out
                .println(String.format("%s\t%s\t%s\t%s", tv.getKey(), tv.getValue(), tv.getType(), tv.getTypeName()));
        }
    }
    
}
