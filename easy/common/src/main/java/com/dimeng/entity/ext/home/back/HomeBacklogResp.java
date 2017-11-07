package com.dimeng.entity.ext.home.back;

import java.io.Serializable;

/**
 * 后台首页待办事项
 * @author  song
 * @version  [版本号, 2016年9月27日]
 */
public class HomeBacklogResp implements Serializable
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 1632754809830941733L;
    
    /**
     *项目验证待审核
     */
    private String proVerification ;
    
    /**
     * 提现待审核
     */
    private String withdrawAudit;
    
    /**
     * 提现放款待审核
     */
    private String withdrawLoan;
    
    /**
     * 订单失败待退款
     */
    private String orderFailRefund;

    public String getProVerification()
    {
        return proVerification;
    }

    public void setProVerification(String proVerification)
    {
        this.proVerification = proVerification;
    }

    public String getWithdrawAudit()
    {
        return withdrawAudit;
    }

    public void setWithdrawAudit(String withdrawAudit)
    {
        this.withdrawAudit = withdrawAudit;
    }

    public String getWithdrawLoan()
    {
        return withdrawLoan;
    }

    public void setWithdrawLoan(String withdrawLoan)
    {
        this.withdrawLoan = withdrawLoan;
    }

    public String getOrderFailRefund()
    {
        return orderFailRefund;
    }

    public void setOrderFailRefund(String orderFailRefund)
    {
        this.orderFailRefund = orderFailRefund;
    }

    public static long getSerialversionuid()
    {
        return serialVersionUID;
    }
    
    
}
