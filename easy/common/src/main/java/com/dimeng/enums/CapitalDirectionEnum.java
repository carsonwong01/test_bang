package com.dimeng.enums;

/**
 * 交易方向枚举
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月8日]
 */
public enum CapitalDirectionEnum
{
    /**
     * 收入
     */
    SR("1", "收入"),
    /**
     * 支出
     */
    ZC("2", "支出");
    
    public String dataBaseVal;
    
    public String descr;
    
    CapitalDirectionEnum(String dataBaseVal, String descr)
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
