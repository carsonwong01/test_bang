package com.dimeng.enums;


/**
 * 退款管理列表类型枚举
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月9日]
 */
public enum RefundListTypeEnum
{
    
    DTK("1", "待退款"),
    TKSB("2", "退款失败"),
    TKJL("3", "退款记录");
    
    public String dataBaseVal;
    
    public String descr;
    
    RefundListTypeEnum(String dataBaseVal, String descr)
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
