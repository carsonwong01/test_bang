package com.dimeng.enums;

public enum PayTypeEnum
{
    
    ALLINPAY("100", "通联支付"),
    WECHATPAY("200", "微信支付"),
    JDPAY("300", "京东支付"); 
    
    public String dataBaseVal;
    
    public String descr;
    
    PayTypeEnum(String dataBaseVal, String descr)
    {
        this.dataBaseVal = dataBaseVal;
        this.descr = descr;
    }
    
    /**
     * 返回描述
     *
     * @return descr 描述
     */
    public String getDescr()
    {
        return descr;
    }
    
    /**
     * 返回数据库存储值
     *
     * @return dataBaseVal 数据库存储值
     */
    public String getDataBaseVal()
    {
        return dataBaseVal;
    }
}
