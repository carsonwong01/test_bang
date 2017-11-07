package com.dimeng.enums;


/**
 * 
 * 退款类型枚举类
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月9日]
 */
public enum RefundTypeEnum
{
    XMSCTK("1", "项目删除退款"),
    ZCSBTK("2", "众筹失败退款"),
    XMCEYCTK("3", "项目超额溢出退款"),
    HBBZYCTK("4", "回报不足溢出退款"),
    XMSCYCTK("5", "项目删除溢出退款"),
    ZCSBTCTK("6", "众筹失败溢出退款");
    
    public String dataBaseVal;
    
    public String descr;
    
    RefundTypeEnum(String dataBaseVal, String descr)
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
    
    public static String getDescrByDataBaseVal(String dataBaseVal){
        for(RefundTypeEnum c : RefundTypeEnum.values())
        {
            if(dataBaseVal.equals(c.getDataBaseVal()))
            {
                return c.getDescr();
            }
        }
        return null;
    }
}
