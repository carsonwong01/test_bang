/*
 * 文 件 名:  ProjectTypeEnum.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月8日
 */
package com.dimeng.enums;

/**
 * 项目类型
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月8日]
 */
public enum BProjectTypeEnum implements BaseEnum
{
    
    DBJZ("1", "PROJECT_DISEASE_RELIEF", "个人求助"), //大病救助
    ZNJZ("2", "PROJECT_DISASTER_RELIEF", "个人求助"), //灾难救助
    DWBH("3", "PROJECT_ANIMAL_PROTECT", "个人求助"), //动物保护
    FPZX("4", "PROJECT_POVERTY_RELIEF", "个人求助"), //扶贫助学
    QTJZ("5", "PROJECT_OTHER_RELIEF", "个人求助"), //其他救助
    HBXM("6", "PROJECT_RETURN", "产品急销"), //产品急销
    MXXM("7", "PROJECT_DREAM", "实现梦想"); //实现梦想
    
    private String dbvalue;
    
    private String resourceKey;
    
    public String descr;
    
    BProjectTypeEnum(String dbvalue, String resourceKey, String descr)
    {
        this.dbvalue = dbvalue;
        this.resourceKey = resourceKey;
        this.descr = descr;
    }
    
    public String getDbvalue()
    {
        return dbvalue;
    }
    
    public void setDbvalue(String dbvalue)
    {
        this.dbvalue = dbvalue;
    }
    
    @Override
    public String getResourceKey()
    {
        return resourceKey;
    }
    
    public void setResourceKey(String resourceKey)
    {
        this.resourceKey = resourceKey;
    }
    
    @Override
    public String getValue()
    {
        // TODO Auto-generated method stub
        return null;
    }
    
    public String getDescr()
    {
        return descr;
    }
    
    public void setDescr(String descr)
    {
        this.descr = descr;
    }
    
    /**
     * 返回数据库存储值
     *
     * @return dataBaseVal 数据库存储值
     */
    public String getDataBaseVal()
    {
        return this.dbvalue.toString();
    }
    
}
