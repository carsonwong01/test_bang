package com.dimeng.enums;

/**
 * 银行卡类型
 * <功能详细描述>
 * 
 * @author wenguanhai
 * @version  [版本号, 2016年10月12日]
 */
public enum UserBankCardTypeEnum
{
    
    GRYH("1", "个人银行卡"), DGYH("2", "对公银行卡");
    
    public String dataBaseVal;
    
    public String descr;
    
    UserBankCardTypeEnum(String dataBaseVal, String descr)
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
