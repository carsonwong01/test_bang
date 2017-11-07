package com.dimeng.enums;

/**
 * 支付渠道类型枚举
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月9日]
 */
public enum PaySourceEnum
{
    WX("2", "微信"),
    AZ("3", "安卓"),
    IOS("4", "苹果");
    
    public String dataBaseVal;
    
    public String descr;
    
    PaySourceEnum(String dataBaseVal, String descr)
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
