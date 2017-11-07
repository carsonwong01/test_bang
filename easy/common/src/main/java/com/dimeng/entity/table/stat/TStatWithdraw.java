package com.dimeng.entity.table.stat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.dimeng.entity.table.statistics.CommonStatisticsForDay;

public class TStatWithdraw extends CommonStatisticsForDay implements Serializable{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 2277117023424528229L;

    private Date dateTime;

    private BigDecimal dayWithdraw;

    private Integer withdrawNum;

    private Integer withdrawUserNum;

    private Integer withdrawAddUserNum;

    public Date getDateTime()
    {
        return dateTime;
    }

    public void setDateTime(Date dateTime)
    {
        this.dateTime = dateTime;
    }

    public BigDecimal getDayWithdraw()
    {
        return dayWithdraw;
    }

    public void setDayWithdraw(BigDecimal dayWithdraw)
    {
        this.dayWithdraw = dayWithdraw;
    }

    public Integer getWithdrawNum()
    {
        return withdrawNum;
    }

    public void setWithdrawNum(Integer withdrawNum)
    {
        this.withdrawNum = withdrawNum;
    }

    public Integer getWithdrawUserNum()
    {
        return withdrawUserNum;
    }

    public void setWithdrawUserNum(Integer withdrawUserNum)
    {
        this.withdrawUserNum = withdrawUserNum;
    }

    public Integer getWithdrawAddUserNum()
    {
        return withdrawAddUserNum;
    }

    public void setWithdrawAddUserNum(Integer withdrawAddUserNum)
    {
        this.withdrawAddUserNum = withdrawAddUserNum;
    }
  
    
}