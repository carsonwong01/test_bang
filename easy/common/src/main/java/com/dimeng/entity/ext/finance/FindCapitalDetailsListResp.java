package com.dimeng.entity.ext.finance;

import java.io.Serializable;


/**
 * 用户/平台资金明细列表返回结果实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月11日]
 */
public class FindCapitalDetailsListResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 4208071447978074931L;
    /**
     * 类型：1订单支付  2提现  3提现手续费  4调账

     */
    private String type;
    
    /**
     * 用户名
     */
    private String userName;
    
    /**
     * 收入（元）
     */
    private String income;
    
    /**
     * 支出（元）
     */
    private String expenditure;
    
    /**
     * 账户结余（元）
     */
    private String accountBalance;
    
    /**
     * 时间
     */
    private String time;
    
    /**
     * 备注
     */
    private String remark;

    /**
     * 项目编号
     */
    private String projectNo;
    
    /**
     * 项目名称
     */
    private String projectName;
    
    /**
     * 收入合计（元）
     */
    private String incomeTotal;
    
    /**
     * 支出合计（元）
     */
    private String expenditureTotal;

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

    public String getIncome()
    {
        return income;
    }

    public void setIncome(String income)
    {
        this.income = income;
    }

    public String getExpenditure()
    {
        return expenditure;
    }

    public void setExpenditure(String expenditure)
    {
        this.expenditure = expenditure;
    }

    public String getAccountBalance()
    {
        return accountBalance;
    }

    public void setAccountBalance(String accountBalance)
    {
        this.accountBalance = accountBalance;
    }

    public String getTime()
    {
        return time;
    }

    public void setTime(String time)
    {
        this.time = time;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
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

    public String getIncomeTotal()
    {
        return incomeTotal;
    }

    public void setIncomeTotal(String incomeTotal)
    {
        this.incomeTotal = incomeTotal;
    }

    public String getExpenditureTotal()
    {
        return expenditureTotal;
    }

    public void setExpenditureTotal(String expenditureTotal)
    {
        this.expenditureTotal = expenditureTotal;
    }
    
    
  
}
