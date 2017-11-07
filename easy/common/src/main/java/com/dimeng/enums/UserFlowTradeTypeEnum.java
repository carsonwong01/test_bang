package com.dimeng.enums;

/**
 * 用户资金明细交易类型枚举类
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月11日]
 */
public enum UserFlowTradeTypeEnum
{  
    ZF("1", "订单支付"),
    TX("2", "提现"),
    TXSXF("3", "提现手续费"),
    TZ("4", "平台调账"),
    TK("5", "订单退款");
    
    public String dataBaseVal;
    
    public String descr;
    
    UserFlowTradeTypeEnum(String dataBaseVal, String descr)
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
