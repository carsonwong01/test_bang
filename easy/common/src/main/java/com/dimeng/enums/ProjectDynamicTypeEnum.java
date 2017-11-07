/*
 * 文 件 名:  ProjectDynamicTypeEnum.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月9日
 */
package com.dimeng.enums;

/**
 * 项目动态类型枚举
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月9日]
 */
public enum ProjectDynamicTypeEnum
{
    
    FBXXM("1", "发布新项目"), ZCXM("2", "支持项目"), GXDT("3", "更新动态"), TQJSXM("4", "提前结束项目"), SCXM("5", "删除项目"), XMXG("6",
        "项目修改(有订单时修改公益项目)"), ZCCG("7", "众筹成功"), ZCSB("8", "众筹失败");
    
    public String dataBaseVal;
    
    public String descr;
    
    ProjectDynamicTypeEnum(String dataBaseVal, String descr)
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
