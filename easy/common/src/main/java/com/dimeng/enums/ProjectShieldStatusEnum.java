package com.dimeng.enums;

/**
 * 项目屏蔽枚举
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年11月16日]
 */
public enum ProjectShieldStatusEnum
{
    YPB("1", "已屏蔽"), WPB("2", "未屏蔽");
    public String dataBaseVal;
    
    public String descr;
    
    ProjectShieldStatusEnum(String dataBaseVal, String descr)
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
