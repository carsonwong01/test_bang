package com.dimeng.model.finance;

import com.dimeng.model.expand.FindExportExcelParamsReq;


/**
 * 用户/平台资金明细列表参数实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月11日]
 */
public class FindCapitalDetailsListReq extends FindExportExcelParamsReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 3415998196523290910L;
    
    /**
     * 列表类型：0、平台   1、用户
     */
    private String listType;
    
    /**
     * 类型：1订单支付  2提现  3提现手续费  4调账 5退款

     */
    private String type;
    
    /**
     * 用户名
     */
    private String userName;
    
    /**
     * 用户ID
     */
    private String userId;
    
    /**
     * 项目编号
     */
    private String projectNo;
    
    /**
     * 项目名称
     */
    private String projectName;
    
    /**
     * 开始时间
     */
    private String beginTime;
    
    /**
     * 结束时间
     */
    private String endTime;

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    @Override
    public String getUserId()
    {
        return userId;
    }

    @Override
    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getProjectNo()
    {
        return projectNo;
    }

    public void setProjectNo(String projectNo)
    {
        this.projectNo = projectNo;
    }

    public String getProjectName()
    {
        return projectName;
    }

    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }

    public String getBeginTime()
    {
        return beginTime;
    }

    public void setBeginTime(String beginTime)
    {
        this.beginTime = beginTime;
    }

    public String getEndTime()
    {
        return endTime;
    }

    public void setEndTime(String endTime)
    {
        this.endTime = endTime;
    }

    public String getListType()
    {
        return listType;
    }

    public void setListType(String listType)
    {
        this.listType = listType;
    }
    
    
}
