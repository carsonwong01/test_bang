package com.dimeng.enums;

/**
 * 用户状态
 * @author  song
 * @version  [版本号, 2016年9月28日]
 */
public enum UserStatusEnum
{

    /**
     * 正常
     */
    ZC("1", "正常"),
    
    /**
    * 锁定
    */
    SD("2", "锁定"),
    
    /**
     * 拉黑
     */
    LH("3", "拉黑");
     
    public String dataBaseVal;
    
    public String descr;
    
    UserStatusEnum(String dataBaseVal, String descr)
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
