/*
 * 文 件 名:  FindPlatformAdjustReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  zhangshuai
 * 修改时间:  2016年2月27日
 */
package com.dimeng.entity.ext.finance;

import java.io.Serializable;

/**
 * 平台调账列表返回结果实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月10日]
 */
public class PlatformAdjustResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -8243322492900871977L;
    
    /**
     * 调账记录id
     */
    private String id;
    /**
     * 调账流水号
     */
    private String flowNo;
    
    /**
     * 收入
     */
    private String income;
    
    /**
     * 支出
     */
    private String expenditure;
    
    
    /**
     * 操作人
     */
    private String operator;
    
    /**
     * 操作时间
     */
    private String operateTime;
   
    /**
     * 账户余额
     */
    private String accountBalance;
    
    /**
     * 收入调账合计（元）
     */
    private String incomeTotal;
    
    /**
     * 支出调账合计（元）
     */
    private String expenditureTotal;
    
    /**
     * 累计平台收入调账（元）
     */
    private String incomeAmt;
    
    /**
     * 累计平台支出调账（元）
     */
    private String expenditureAmt;

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getFlowNo()
    {
        return flowNo;
    }

    public void setFlowNo(String flowNo)
    {
        this.flowNo = flowNo;
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

    public String getOperator()
    {
        return operator;
    }

    public void setOperator(String operator)
    {
        this.operator = operator;
    }

    public String getOperateTime()
    {
        return operateTime;
    }

    public void setOperateTime(String operateTime)
    {
        this.operateTime = operateTime;
    }

    public String getAccountBalance()
    {
        return accountBalance;
    }

    public void setAccountBalance(String accountBalance)
    {
        this.accountBalance = accountBalance;
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

    public String getIncomeAmt()
    {
        return incomeAmt;
    }

    public void setIncomeAmt(String incomeAmt)
    {
        this.incomeAmt = incomeAmt;
    }

    public String getExpenditureAmt()
    {
        return expenditureAmt;
    }

    public void setExpenditureAmt(String expenditureAmt)
    {
        this.expenditureAmt = expenditureAmt;
    }
    
   
    

    
}
