package com.dimeng.enums;

/**
 * 账户交易类型枚举
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月8日]
 */
public enum AccountTradeTypeEnum
{
    ZCCGWYZ("1", "众筹成功未验证"), ZCCGYYZ("2", "众筹成功已验证"), TXSQ("3", "提现申请"), TXSB("4", "提现失败");
    
    public String dataBaseVal;
    
    public String descr;
    
    AccountTradeTypeEnum(String dataBaseVal, String descr)
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
