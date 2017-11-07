package com.dimeng.entity.ext.finance;

import java.io.Serializable;

/**
 * 提现列表查询结果实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月28日]
 */
public class FindWithdrawListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 7434498689666204494L;
    
    /**
     * 提现记录id
     */
    private String id;
    
    /**
     * 用户名
     */
    private String userName;
    
    /**
     * 银行
     */
    private String bankName;
    
    /**
     * 银行卡号
     */
    private String bankCardNo;
    
    /**
     * 提现金额（元）
     */
    private String withdrawAmt;
    
    /**
     * 手续费（元）
     */
    private String poundage;
    
    /**
     * 实到金额（元）
     */
    private String actualAmt;
    
    /**
     * 申请时间
     */
    private String applyTime;
    
    /**
     * 审核人
     */
    private String auditor;
    
    /**
     * 审核时间
     */
    private String auditTime;
    
    /**
     * 提现时间
     */
    private String withdrawTime;
    
    /**
     * 开户所在地
     */
    private String bankPlace;
    
    /**
     * 所在支行
     */
    private String bankBranch;
    
    /**
     * 提现金额合计（元）
     */
    private String withdrawTotal;
    
    /**
     * 手续费合计（元）
     */
    private String poundageTotal;
    
    /**
     * 实到金额（元）
     */
    private String actualTotal;
    
    /**
     * 审核人用户名
     */
    private String auditUserName;
    
    /**
     * 真实姓名
     */
    private String realName;
    
    /**
     * 放款人用户名
     */
    private String loanerUserName;
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
    }
    
    public String getUserName()
    {
        return userName;
    }
    
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    
    public String getBankName()
    {
        return bankName;
    }
    
    public void setBankName(String bankName)
    {
        this.bankName = bankName;
    }
    
    public String getBankCardNo()
    {
        return bankCardNo;
    }
    
    public void setBankCardNo(String bankCardNo)
    {
        this.bankCardNo = bankCardNo;
    }
    
    public String getWithdrawAmt()
    {
        return withdrawAmt;
    }
    
    public void setWithdrawAmt(String withdrawAmt)
    {
        this.withdrawAmt = withdrawAmt;
    }
    
    public String getPoundage()
    {
        return poundage;
    }
    
    public void setPoundage(String poundage)
    {
        this.poundage = poundage;
    }
    
    public String getActualAmt()
    {
        return actualAmt;
    }
    
    public void setActualAmt(String actualAmt)
    {
        this.actualAmt = actualAmt;
    }
    
    public String getApplyTime()
    {
        return applyTime;
    }
    
    public void setApplyTime(String applyTime)
    {
        this.applyTime = applyTime;
    }
    
    public String getAuditor()
    {
        return auditor;
    }
    
    public void setAuditor(String auditor)
    {
        this.auditor = auditor;
    }
    
    public String getAuditTime()
    {
        return auditTime;
    }
    
    public void setAuditTime(String auditTime)
    {
        this.auditTime = auditTime;
    }
    
    public String getWithdrawTime()
    {
        return withdrawTime;
    }
    
    public void setWithdrawTime(String withdrawTime)
    {
        this.withdrawTime = withdrawTime;
    }
    
    public String getBankPlace()
    {
        return bankPlace;
    }
    
    public void setBankPlace(String bankPlace)
    {
        this.bankPlace = bankPlace;
    }
    
    public String getBankBranch()
    {
        return bankBranch;
    }
    
    public void setBankBranch(String bankBranch)
    {
        this.bankBranch = bankBranch;
    }
    
    public String getWithdrawTotal()
    {
        return withdrawTotal;
    }
    
    public void setWithdrawTotal(String withdrawTotal)
    {
        this.withdrawTotal = withdrawTotal;
    }
    
    public String getPoundageTotal()
    {
        return poundageTotal;
    }
    
    public void setPoundageTotal(String poundageTotal)
    {
        this.poundageTotal = poundageTotal;
    }
    
    public String getActualTotal()
    {
        return actualTotal;
    }
    
    public void setActualTotal(String actualTotal)
    {
        this.actualTotal = actualTotal;
    }
    
    public String getAuditUserName()
    {
        return auditUserName;
    }
    
    public void setAuditUserName(String auditUserName)
    {
        this.auditUserName = auditUserName;
    }
    
    public String getRealName()
    {
        return realName;
    }
    
    public void setRealName(String realName)
    {
        this.realName = realName;
    }

    public String getLoanerUserName()
    {
        return loanerUserName;
    }

    public void setLoanerUserName(String loanerUserName)
    {
        this.loanerUserName = loanerUserName;
    }
    
}
