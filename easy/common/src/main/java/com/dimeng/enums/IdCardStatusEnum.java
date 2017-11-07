/*
 * 文 件 名:  IdCardStatusEnum.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月14日
 */
package com.dimeng.enums;

/**
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月14日]
 */
public enum IdCardStatusEnum
{
    YRZ("1", "已认证"), WRZ("2", "未认证");
    
    private IdCardStatusEnum(String dataBaseVal, String descr)
    {
        this.dataBaseVal = dataBaseVal;
        this.descr = descr;
    }
    
    public String dataBaseVal;
    
    public String descr;
    
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
