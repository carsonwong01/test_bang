package com.dimeng.enums;

import org.springframework.util.StringUtils;

/**
 * 产品众筹编号类型枚举
 * <功能详细描述>
 * 
 * @author  ouxin
 * @version  [版本号, 2016年2月1日]
 */
public enum SerialNumberTypeEnum
{
    XM("1","项目编号"),
    DD("2","订单编号"),
    TZ("3","调账编号"),
    TK("4","退款编号");
    
    private String dataBaseVal;
    
    private String descr;

    SerialNumberTypeEnum(String dataBaseVal, String descr)
    {
        this.dataBaseVal = dataBaseVal;
        this.descr = descr;
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
            SerialNumberTypeEnum[] templateTypes = SerialNumberTypeEnum.values();
            
            for (SerialNumberTypeEnum type : templateTypes)
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
    
    /**
     * @return 返回 dataBaseVal
     */
    public String getDataBaseVal()
    {
        return dataBaseVal;
    }
    
    /**
     * @param 对dataBaseVal进行赋值
     */
    public void setDataBaseVal(String dataBaseVal)
    {
        this.dataBaseVal = dataBaseVal;
    }
    
    /**
     * @return 返回 descr
     */
    public String getDescr()
    {
        return descr;
    }
    
    /**
     * @param 对descr进行赋值
     */
    public void setDescr(String descr)
    {
        this.descr = descr;
    }
    
}
