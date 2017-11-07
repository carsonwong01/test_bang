/*
 * 文 件 名:  AuditStatusEnum.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月12日
 */
package com.dimeng.enums;

/**
 * 审核状态枚举
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月12日]
 */
public enum AuditStatusEnum
{
    
    DSH("1", "待审核"), SHBTG("2", "审核不通过"), SHTG("3", "审核通过");
    
    public String dataBaseVal;
    
    public String descr;
    
    AuditStatusEnum(String dataBaseVal, String descr)
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
