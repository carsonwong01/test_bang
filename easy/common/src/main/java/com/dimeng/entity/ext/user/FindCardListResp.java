package com.dimeng.entity.ext.user;

import java.io.Serializable;

/**
 * 银行卡管理-查询银行卡列表
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月17日]
 */
public class FindCardListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -2374536734105608978L;
    
    /**
     * 主键ID
     */
    private String cardId;
    
    /**
     * 银行logo
     */
    private String bankLogo;
    
    /**
     * 银行名称
     */
    private String bankName;
    
    /**
     * 卡类型（0储蓄卡 1 信用卡）
     */
    private String cardType;
    
    /**
     * 卡号（加密的）
     */
    private String cardNumber;
    
    /**
     * 银行卡编码
     */
    private String bankCode;
    
    public String getCardId()
    {
        return cardId;
    }
    
    public void setCardId(String cardId)
    {
        this.cardId = cardId;
    }
    
    public String getBankLogo()
    {
        return bankLogo;
    }
    
    public void setBankLogo(String bankLogo)
    {
        this.bankLogo = bankLogo;
    }
    
    public String getBankName()
    {
        return bankName;
    }
    
    public void setBankName(String bankName)
    {
        this.bankName = bankName;
    }
    
    public String getCardType()
    {
        return cardType;
    }
    
    public void setCardType(String cardType)
    {
        this.cardType = cardType;
    }
    
    public String getCardNumber()
    {
        return cardNumber;
    }
    
    public void setCardNumber(String cardNumber)
    {
        this.cardNumber = cardNumber;
    }
    
    public String getBankCode()
    {
        return bankCode;
    }
    
    public void setBankCode(String bankCode)
    {
        this.bankCode = bankCode;
    }
    
}
