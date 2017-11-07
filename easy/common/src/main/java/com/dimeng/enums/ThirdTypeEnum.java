package com.dimeng.enums;

/**
 * 登录-绑定手机号授权方式
 * @author  song
 * @version  [版本号, 2016年10月27日]
 */
public enum ThirdTypeEnum
{
    SJ("1", "手机"),
    WX("2", "微信"),
    WB("3", "微博"),
    QQ("4", "QQ"),
    GZHYH("5", "公众号用户");
    
    public String dataBaseVal;
    
    public String descr;
    
    ThirdTypeEnum(String dataBaseVal, String descr)
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
