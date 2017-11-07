/*
 * 文 件 名:  FindTradeListReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月19日
 */
package com.dimeng.model.user;

import com.dimeng.framework.domain.BasePageReq;

/**
 * 前台-交易明细请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月19日]
 */
public class FindTradeListReq extends BasePageReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 6856076591596400348L;
    
    /**
     * 交易类型
     * 1支付
     * 2提现
     * 3提现手续费
     * 5退款
     */
    private String tradeType;
    
    /**
     * 开始时间
     */
    private String startTime;
    
    /**
     * 结束时间
     */
    private String endTime;
    
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
     * @return 返回 startTime
     */
    public String getStartTime()
    {
        return startTime;
    }
    
    /**
     * @param 对startTime进行赋值
     */
    public void setStartTime(String startTime)
    {
        this.startTime = startTime;
    }
    
    /**
     * @return 返回 endTime
     */
    public String getEndTime()
    {
        return endTime;
    }
    
    /**
     * @param 对endTime进行赋值
     */
    public void setEndTime(String endTime)
    {
        this.endTime = endTime;
    }
    
}
