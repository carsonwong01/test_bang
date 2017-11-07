/*
 * 文 件 名:  ProjectValidationTypeEnum.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月12日
 */
package com.dimeng.enums;

/**
 * 项目验证类型
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月12日]
 */
public enum ProjectValidationTypeEnum
{
    
    BRYZ("1", "本人验证(个人验证)"), QSYZ("2", "亲属验证"), FQYZ("3", "夫妻验证"), ZZYZ("4", "组织验证(企业验证)");
    
    public String dataBaseVal;
    
    public String descr;
    
    ProjectValidationTypeEnum(String dataBaseVal, String descr)
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
