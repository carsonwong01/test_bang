package com.dimeng.enums;


/**
 * 支付结果类型枚举
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月9日]
 */
public enum PayStatusEnum
{
    YZF("3", "支付成功"),
    DFH("4", "支付成功"),
    DSH("5", "支付成功"),
    YSH("6", "支付成功"),
    DTK("7", "支付成功"),
    YTK("8", "支付成功"),
    YSB("9", "支付失败"),
    TKZ("10", "支付成功");
    
    public String dataBaseVal;
    
    public String descr;
    
    PayStatusEnum(String dataBaseVal, String descr)
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
