package com.dimeng.enums;

/**
 * 支付订单接口列表类型枚举
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月9日]
 */
public enum PaymentListTypeEnum
{
    
    YHZCDD("1", "用户支持的订单"),
    XMZCJL("2", "项目详情支持记录"),
    XMDDGL("3", "项目订单管理"),
    SYDD("4", "所有订单"),
    ZFJL("5", "支付记录");
    
    public String dataBaseVal;
    
    public String descr;
    
    PaymentListTypeEnum(String dataBaseVal, String descr)
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
