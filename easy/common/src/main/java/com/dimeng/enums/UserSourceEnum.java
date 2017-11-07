package com.dimeng.enums;

/**
 * 注册来源
 * @author  song
 * @version  [版本号, 2016年9月28日]
 */
public enum UserSourceEnum 
{ 
     
    /**
     * PC
     */
    PC("1", "PC"),
    
    /**
    * 微信
    */
    WX("2", "微信"),
    
    /**
     * 安卓
     */
    AZ("3", "安卓"),
    
    /**
     * IOS
     */
    IOS("4", "IOS");
    
    public String dataBaseVal;
    
    public String descr;
    
    UserSourceEnum(String dataBaseVal, String descr)
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
