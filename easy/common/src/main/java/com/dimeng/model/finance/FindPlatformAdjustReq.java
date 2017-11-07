/*
 * 文 件 名:  FindPlatformAdjustReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  zhangshuai
 * 修改时间:  2016年2月27日
 */
package com.dimeng.model.finance;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 平台调账列表参数实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月10日]
 */
public class FindPlatformAdjustReq extends FindExportExcelParamsReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -8838591591916698883L;
    
    /**
     * 调账类型  1收入调账、2支出调账
     */
    private String tiaozhangType;
    
    /**
     * 调账流水号
     */
    private String flowNo;
    
    /**
     * 操作人
     */
    private String operator;
    
    /**
     * 开始时间
     */
    private String startTime;
    
    /**
     * 结束时间
     */
    private String endTime;
    
    /**
    * 1查询总计2不查询总计
    */
    private String type;

public String getTiaozhangType()
{
    return tiaozhangType;
}

public void setTiaozhangType(String tiaozhangType)
{
    this.tiaozhangType = tiaozhangType;
}

public String getFlowNo()
{
    return flowNo;
}

public void setFlowNo(String flowNo)
{
    this.flowNo = flowNo;
}

public String getOperator()
{
    return operator;
}

public void setOperator(String operator)
{
    this.operator = operator;
}

public String getStartTime()
{
    return startTime;
}

public void setStartTime(String startTime)
{
    this.startTime = startTime;
}

public String getEndTime()
{
    return endTime;
}

public void setEndTime(String endTime)
{
    this.endTime = endTime;
}

public String getType()
{
    return type;
}

public void setType(String type)
{
    this.type = type;
}
    
   
    
}
