/*
 * 文 件 名:  WithdrawStatusEnum.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  chenwb
 * 修改时间:  2016年5月17日
 */
package com.dimeng.enums;


/**
 * 
 * 提现申请状态枚举
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月29日]
 */
public enum WithdrawStatusEnum
{
    /**
     * 待审核
     */
    DSH("0", "待审核"),
    /**
     * 审核通过
     */
    SHTG("1", "审核通过"),
   
    /**
     * 提现成功
     */
    TXCG("2", "提现成功"),
    /**
     * 提现失败
     */
    TXSB("3", "提现失败");
    
    public String dataBaseVal;
    
    public String descr;
    
    WithdrawStatusEnum(String dataBaseVal, String descr)
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
