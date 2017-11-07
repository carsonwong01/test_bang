/*
 * 文 件 名:  FindTradeListResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月19日
 */
package com.dimeng.entity.ext.user;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 前台-交易明细响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月19日]
 */
public class FindTradeListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 2100645562150194665L;
    
    /**
     * 交易类型
     * 1支付
     * 2提现
     * 3提现手续费
     * 5退款
     */
    private String tradeType;
    
    /**
     * 资金方向：
     * 1收入
     * 2支出
     */
    private String capitalDirection;
    
    /**
     * 交易金额
     */
    private String tradeAmount;
    
    /**
     * 创建时间
     */
    private String dateCreate;
    
    /**
     * 订单ID
     */
    private String orderId;
    
    /**
     * 备注
     */
    private String remark;
    
    private String yearMonth;
    
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
     * @return 返回 orderId
     */
    public String getOrderId()
    {
        return orderId;
    }
    
    /**
     * @param 对orderId进行赋值
     */
    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }
    
    /**
     * @return 返回 remark
     */
    public String getRemark()
    {
        return remark;
    }
    
    /**
     * @param 对remark进行赋值
     */
    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public String getYearMonth()
    {
        if(this.dateCreate != null)
        {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try
            {
                date=sdf.parse(this.dateCreate);
            }
            catch (ParseException e)
            {
                e.printStackTrace();
            }
            DateFormat  df = new SimpleDateFormat("yyyy年MM月");
            return df.format(date);
        }
        return null;
    }

    public void setYearMonth(String yearMonth)
    {
        this.yearMonth = yearMonth;
    }
    
    
    
}
