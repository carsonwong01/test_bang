/*
 * 文 件 名:  FindAccMoneyListResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月18日
 */
package com.dimeng.entity.ext.user;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 查询账户交易记录响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月18日]
 */
public class FindAccMoneyListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 2100645562150194665L;
    
    /**
     * 交易金额
     */
    private String tradeAmount;
    
    /**
     * 交易类型
     * 1众筹成功未验证
     * 2众筹成功已验证
     * 3提现申请
     * 4提现失败
     */
    private String tradeType;
    
    /**
     * 资金方向
     * 1收入
     * 2支出
     */
    private String capitalDirection;
    
    /**
     * 账户类型：
     * 1可用金额账户
     * 2冻结金额账户
     */
    private String accountType;
    
    /**
     * 创建时间
     */
    private String dateCreate;
    
    /**
     * 项目标题
     */
    private String projectName;
    
    /**
     * 项目封面图片
     */
    private String coverImage;
    
    /**
     * 年月，如2016年12月
     */
    private String yearMonth;
    
    /**
     * 项目id
     */
    private String projectId;
    
    /**
     * @return 返回 tradeAmount
     */
    public String getTradeAmount()
    {
        return tradeAmount;
    }
    
    /**
     * @param 对tradeAmount进行赋值
     */
    public void setTradeAmount(String tradeAmount)
    {
        this.tradeAmount = tradeAmount;
    }
    
    /**
     * @return 返回 tradeType
     */
    public String getTradeType()
    {
        return tradeType;
    }
    
    /**
     * @param 对tradeType进行赋值
     */
    public void setTradeType(String tradeType)
    {
        this.tradeType = tradeType;
    }
    
    /**
     * @return 返回 capitalDirection
     */
    public String getCapitalDirection()
    {
        return capitalDirection;
    }
    
    /**
     * @param 对capitalDirection进行赋值
     */
    public void setCapitalDirection(String capitalDirection)
    {
        this.capitalDirection = capitalDirection;
    }
    
    /**
     * @return 返回 accountType
     */
    public String getAccountType()
    {
        return accountType;
    }
    
    /**
     * @param 对accountType进行赋值
     */
    public void setAccountType(String accountType)
    {
        this.accountType = accountType;
    }
    
    /**
     * @return 返回 dateCreate
     */
    public String getDateCreate()
    {
        return dateCreate;
    }
    
    /**
     * @param 对dateCreate进行赋值
     */
    public void setDateCreate(String dateCreate)
    {
        this.dateCreate = dateCreate;
    }
    
    /**
     * @return 返回 projectName
     */
    public String getProjectName()
    {
        return projectName;
    }
    
    /**
     * @param 对projectName进行赋值
     */
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }
    
    /**
     * @return 返回 coverImage
     */
    public String getCoverImage()
    {
        return coverImage;
    }
    
    /**
     * @param 对coverImage进行赋值
     */
    public void setCoverImage(String coverImage)
    {
        this.coverImage = coverImage;
    }
    
    public String getYearMonth()
    {
        if (this.dateCreate != null)
        {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try
            {
                date = sdf.parse(this.dateCreate);
            }
            catch (ParseException e)
            {
                e.printStackTrace();
            }
            DateFormat df = new SimpleDateFormat("yyyy年MM月");
            return df.format(date);
        }
        return null;
    }
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
}
