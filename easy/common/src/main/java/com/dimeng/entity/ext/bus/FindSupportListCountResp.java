/*
 * 文 件 名:  FindSupportListCountResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月14日
 */
package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 项目支持订单列表总计响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月14日]
 */
public class FindSupportListCountResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -1391280503875378225L;
    
    /**
     * 支持人数
     */
    private String supportCount;
    
    /**
     * 支持总额
     */
    private String supportAmtTotal;
    
    /**
     * 订单待支付数
     */
    private String waiteSendCount;
    
    /**
     * @return 返回 supportCount
     */
    public String getSupportCount()
    {
        return supportCount;
    }
    
    /**
     * @param 对supportCount进行赋值
     */
    public void setSupportCount(String supportCount)
    {
        this.supportCount = supportCount;
    }
    
    /**
     * @return 返回 supportAmtTotal
     */
    public String getSupportAmtTotal()
    {
        return supportAmtTotal;
    }
    
    /**
     * @param 对supportAmtTotal进行赋值
     */
    public void setSupportAmtTotal(String supportAmtTotal)
    {
        this.supportAmtTotal = supportAmtTotal;
    }

    public String getWaiteSendCount()
    {
        return waiteSendCount;
    }

    public void setWaiteSendCount(String waiteSendCount)
    {
        this.waiteSendCount = waiteSendCount;
    }
    
    
}
