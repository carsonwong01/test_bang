package com.dimeng.model.statistics;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 统计管理公用req
 * @author  song
 * @version  [版本号, 2016年10月8日]
 */
public class FindCommonStatReq extends FindExportExcelParamsReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8589079979959059872L;
    
    /**
     * 开始时间
     */
    private String startDate;
    
    /**
     * 结束时间
     */
    private String endDate;
    
    /**
     * 用户名
     */
    private String userName;
     
    /**
     * 开始金额
     */
    private String staMoney;
    
    /**
     * 结束金额
     */
    private String endMoney;
    
    /**
     * 统计日期
     */
    private String statTime;
    
    /**
     * 区分是进入页面还是搜索/分页操作 默认为null进入页面操作
     */
    private String type;
    
    /**
     * mysql Limit数据统计起始值
     */
    private Integer statIndex;
    
    /**
     * limit 返回数据条数
     */
    private Integer results;

    public String getStartDate()
    {
        return startDate;
    }

    public void setStartDate(String startDate)
    {
        this.startDate = startDate;
    }

    public String getEndDate()
    {
        return endDate;
    }

    public void setEndDate(String endDate)
    {
        this.endDate = endDate;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getStaMoney()
    {
        return staMoney;
    }

    public void setStaMoney(String staMoney)
    {
        this.staMoney = staMoney;
    }

    public String getEndMoney()
    {
        return endMoney;
    }

    public void setEndMoney(String endMoney)
    {
        this.endMoney = endMoney;
    }

    public String getStatTime()
    {
        return statTime;
    }

    public void setStatTime(String statTime)
    {
        this.statTime = statTime;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

	public Integer getStatIndex() {
		return statIndex;
	}

	public void setStatIndex(Integer statIndex) {
		this.statIndex = statIndex;
	}

    public Integer getResults()
    {
        return results;
    }

    public void setResults(Integer results)
    {
        this.results = results;
    }

    

	
}
