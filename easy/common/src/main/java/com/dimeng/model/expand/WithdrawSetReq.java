/*
 * 文 件 名:  WithdrawSetReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月27日
 */
package com.dimeng.model.expand;

import com.dimeng.framework.domain.BaseReq;

/**
 * 提现设置参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月27日]
 */
public class WithdrawSetReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 5601729971243663790L;
    
    /**
     * 最小提现金额
     */
    private String minWithdrawAmt;
    
    /**
     * 最大提现金额
     */
    private String maxWithdrawAmt;
    
    /**
     *提现手续费率
     */
    private String withdrawRate;
    
    /**
     * 提现最高手续费
     */
    private String maxPoundage;
    
    /**
     * @return 返回 minWithdrawAmt
     */
    public String getMinWithdrawAmt()
    {
        return minWithdrawAmt;
    }
    
    /**
     * @param 对minWithdrawAmt进行赋值
     */
    public void setMinWithdrawAmt(String minWithdrawAmt)
    {
        this.minWithdrawAmt = minWithdrawAmt;
    }
    
    /**
     * @return 返回 maxWithdrawAmt
     */
    public String getMaxWithdrawAmt()
    {
        return maxWithdrawAmt;
    }
    
    /**
     * @param 对maxWithdrawAmt进行赋值
     */
    public void setMaxWithdrawAmt(String maxWithdrawAmt)
    {
        this.maxWithdrawAmt = maxWithdrawAmt;
    }
    
    /**
     * @return 返回 withdrawRate
     */
    public String getWithdrawRate()
    {
        return withdrawRate;
    }
    
    /**
     * @param 对withdrawRate进行赋值
     */
    public void setWithdrawRate(String withdrawRate)
    {
        this.withdrawRate = withdrawRate;
    }
    
    /**
     * @return 返回 maxPoundage
     */
    public String getMaxPoundage()
    {
        return maxPoundage;
    }
    
    /**
     * @param 对maxPoundage进行赋值
     */
    public void setMaxPoundage(String maxPoundage)
    {
        this.maxPoundage = maxPoundage;
    }
    
}
