/*
 * 文 件 名:  AccountTypeEnum.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  chenwb
 * 修改时间:  2016年5月17日
 */
package com.dimeng.enums;

import org.springframework.util.StringUtils;

/**
 * 账户类型枚举
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月8日]
 */
public enum AccountTypeEnum
{
    KYZH("1", "可用账户"), SDZH("2", "冻结账户");
    
    public String dataBaseVal;
    
    public String descr;
    
    AccountTypeEnum(String dataBaseVal, String descr)
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
    
    /**
     * 解析字符串.
     * 通过传入的 type 获取对应的中文
     * @return {@link UserSourceType}
     */
    public static final String parse(String value)
    {
        if (StringUtils.isEmpty(value))
        {
            return null;
        }
        try
        {
            AccountTypeEnum[] templateTypes = AccountTypeEnum.values();
            
            for (AccountTypeEnum type : templateTypes)
            {
                if (type.dataBaseVal.equals(value))
                {
                    return type.descr;
                }
            }
            
            return value;
        }
        catch (Throwable t)
        {
            return value;
        }
    }
}
