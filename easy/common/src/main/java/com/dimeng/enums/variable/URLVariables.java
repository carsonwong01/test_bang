//package com.dimeng.enums.variable;
//
//import com.dimeng.entity.base.VariableBean;
//import com.dimeng.utils.VariableTypeAnnotation;
//
///**
// * 
// * @author raoyujun
// *
// */
//@VariableTypeAnnotation(id = "STOCK_URL", name = "资源地址")
//public enum URLVariables implements VariableBean
//{
//    BIND_BANKCARD("/bankCard/userBankCard", "绑卡"), RESET_MOBILE("/yeepay/{v}/userMobile",
//        "修改手机号"), RESET_PASSWORD("/yeepay/userPassword", "修改密码"),;
//        
//    private String key;
//    
//    private String description;
//    
//    private String value;
//    
//    private URLVariables(String value, String description)
//    {
//        this.description = description;
//        this.value = value;
//    }
//    
//    public void setKey(String key)
//    {
//        this.key = key;
//    }
//    
//    public void setDescription(String description)
//    {
//        this.description = description;
//    }
//    
//    public void setValue(String value)
//    {
//        this.value = value;
//    }
//    
//    @Override
//    public String getType()
//    {
//        return URLVariables.class.getAnnotation(VariableTypeAnnotation.class).id();
//    }
//    
//    @Override
//    public String getKey()
//    {
//        StringBuilder builder = new StringBuilder(getType());
//        builder.append('.').append(name());
//        this.key = builder.toString();
//        return this.key;
//    }
//    
//    @Override
//    public String getValue()
//    {
//        return this.value;
//    }
//    
//    @Override
//    public String getDescription()
//    {
//        return this.description;
//    }
//    
//    @Override
//    public boolean isInit()
//    {
//        return true;
//    }
//    
//    @Override
//    public String getTypeName()
//    {
//        return null;
//    }
//    
//    @Override
//    public boolean isDb()
//    {
//        return false;
//    }
//    
//    public static void main(String[] args)
//    {
//        URLVariables[] tvs = URLVariables.class.getEnumConstants();
//        for (URLVariables tv : tvs)
//        {
//            System.out
//                .println(String.format("%s\t%s\t%s\t%s", tv.getKey(), tv.getValue(), tv.getType(), tv.getTypeName()));
//        }
//    }
//}
