/*
 * 文 件 名:  ProjectStatusEnum.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月30日
 */
package com.dimeng.enums;

/**
 * 项目状态
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月30日]
 */
public enum ProjectStatusEnum implements BaseEnum
{
    
    ZCZ(1, "PROJECT_CROWDFUNDING", "众筹中"), //众筹中  
    ZCCG(2, "PROJECT_CROWDFUNDING_SUCCESS", "众筹结束"), //众筹成功
    ZCSB(3, "PROJECT_CROWDFUNDING_FAIL", "众筹失败"), //众筹失败
    YSC(4, "PROJECT_DELETED", "已删除"); //已删除
    
    private Integer dbvalue;
    
    private String resourceKey;
    
    public String descr;
    
    ProjectStatusEnum(Integer dbvalue, String resourceKey, String descr)
    {
        this.dbvalue = dbvalue;
        this.resourceKey = resourceKey;
        this.descr = descr;
    }
    
    public Integer getDbvalue()
    {
        return dbvalue;
    }
    
    public void setDbvalue(Integer dbvalue)
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
