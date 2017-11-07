package com.dimeng.enums;

public enum QOrderStatusEnum
{
    DZF("1", "待支付"),
    YQX("2", "已取消"),
    YZF("3", "已支付"),
    DFH("4", "待发货"),
    DSH("5", "待收货"),
    YSH("6", "已收货"),
    DTK("7", "待退款"),
    YTK("8", "已退款"),
    YSB("9", "已失败"),
    TKSB("10", "退款失败");
    
    public String dataBaseVal;
    
    public String descr;
    
    QOrderStatusEnum(String dataBaseVal, String descr)
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
