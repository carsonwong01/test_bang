/*
 * 文 件 名:  AddBankCardReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月17日
 */
package com.dimeng.model.user;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 添加银行卡
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月17日]
 */
public class AddBankCardReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 5351804439707226558L;
    
    /**
     * 开户姓名/单位名称
     */
    @NotBlank
    @Length(max = 25)
    private String cardUserName;
    
    /**
     * 银行卡号,base64加密
     */
    @NotBlank
    @Length(max = 100)
    private String cardNumberEncrypt;
    
    /**
     * 银行卡类型，0是个人银行 1是对公银行
     */
    @NotBlank
    private String cardType;
    
    /**
     * 开户银行ID
     */
    @NotBlank
    private String bankId;
    
    /**
     * 开户城市（省、市） 
     */
    @NotBlank
    private String bankRegionId;
    
    /**
     * 支行名称
     */
    @NotBlank
    @Length(max = 50)
    private String branchBank;
    
    public String getCardUserName()
    {
        return cardUserName;
    }
    
    public void setCardUserName(String cardUserName)
    {
        this.cardUserName = cardUserName;
    }
    
    public String getCardNumberEncrypt()
    {
        return cardNumberEncrypt;
    }
    
    public void setCardNumberEncrypt(String cardNumberEncrypt)
    {
        this.cardNumberEncrypt = cardNumberEncrypt;
    }
    
    public String getCardType()
    {
        return cardType;
    }
    
    public void setCardType(String cardType)
    {
        this.cardType = cardType;
    }
    
    public String getBankId()
    {
        return bankId;
    }
    
    public void setBankId(String bankId)
    {
        this.bankId = bankId;
    }
    
    public String getBankRegionId()
    {
        return bankRegionId;
    }
    
    public void setBankRegionId(String bankRegionId)
    {
        this.bankRegionId = bankRegionId;
    }
    
    public String getBranchBank()
    {
        return branchBank;
    }
    
    public void setBranchBank(String branchBank)
    {
        this.branchBank = branchBank;
    }
    
}
