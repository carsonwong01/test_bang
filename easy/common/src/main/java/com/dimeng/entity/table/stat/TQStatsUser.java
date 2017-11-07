package com.dimeng.entity.table.stat;

import java.util.Date;

import com.dimeng.entity.table.statistics.CommonStatisticsForDay;

public class TQStatsUser  extends CommonStatisticsForDay{
    private Date dateTime;

    private Integer dayRegestNum;

    private Integer loginUesrNum;

    private Integer pcRegistNum;

    private Integer wxRegistNum;

    private Integer appRegistNum;

    private Integer investNewNum;

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public Integer getDayRegestNum() {
        return dayRegestNum;
    }

    public void setDayRegestNum(Integer dayRegestNum) {
        this.dayRegestNum = dayRegestNum;
    }

    public Integer getLoginUesrNum() {
        return loginUesrNum;
    }

    public void setLoginUesrNum(Integer loginUesrNum) {
        this.loginUesrNum = loginUesrNum;
    }

    public Integer getPcRegistNum() {
        return pcRegistNum;
    }

    public void setPcRegistNum(Integer pcRegistNum) {
        this.pcRegistNum = pcRegistNum;
    }

    public Integer getWxRegistNum() {
        return wxRegistNum;
    }

    public void setWxRegistNum(Integer wxRegistNum) {
        this.wxRegistNum = wxRegistNum;
    }

    public Integer getAppRegistNum() {
        return appRegistNum;
    }

    public void setAppRegistNum(Integer appRegistNum) {
        this.appRegistNum = appRegistNum;
    }

    public Integer getInvestNewNum() {
        return investNewNum;
    }

    public void setInvestNewNum(Integer investNewNum) {
        this.investNewNum = investNewNum;
    }
}