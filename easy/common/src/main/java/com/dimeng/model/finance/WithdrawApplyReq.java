package com.dimeng.model.finance;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

public class WithdrawApplyReq extends BaseReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -2069580977040097539L;
    
    /**
     * 提现银行卡
     */
    private String bankCardId;
    
    /**
     * 提现金额
     */
    @NotBlank
    private String withdrawAmt;

    public String getBankCardId()
    {
        return bankCardId;
    }

    public void setBankCardId(String bankCardId)
    {
        this.bankCardId = bankCardId;
    }

    public String getWithdrawAmt()
    {
        return withdrawAmt;
    }

    public void setWithdrawAmt(String withdrawAmt)
    {
        this.withdrawAmt = withdrawAmt;
    }
    
}
