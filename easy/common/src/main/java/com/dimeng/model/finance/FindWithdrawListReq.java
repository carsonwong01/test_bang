package com.dimeng.model.finance;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 提现列表查询参数实体
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月28日]
 */
public class FindWithdrawListReq extends FindExportExcelParamsReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -6447836397608287861L;
    /**
     * 类型:
       0待审核
       1待放款
       2提现成功
       3提现失败
     */
    private  String type;
    /**
     * 提现用户
     */
    private String userName;
    /**
     * 开始申请时间
     */
    private String startApplyTime;
    /**
     * 结束申请时间
     */
    private String endApplyTime;
    /**
     * 开始审核时间
     */
    private String startAuditTime;
    /**
     * 结束审核时间
     */
    private String endAuditTime;
    /**
     * 开始提现时间
     */
    private String startWithdrawTime;
    /**
     * 结束提现时间
     */
    private String endWithdrawTime;
    public String getType()
    {
        return type;
    }
    public void setType(String type)
    {
        this.type = type;
    }
    public String getUserName()
    {
        return userName;
    }
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    public String getStartApplyTime()
    {
        return startApplyTime;
    }
    public void setStartApplyTime(String startApplyTime)
    {
        this.startApplyTime = startApplyTime;
    }
    public String getEndApplyTime()
    {
        return endApplyTime;
    }
    public void setEndApplyTime(String endApplyTime)
    {
        this.endApplyTime = endApplyTime;
    }
    public String getStartAuditTime()
    {
        return startAuditTime;
    }
    public void setStartAuditTime(String startAuditTime)
    {
        this.startAuditTime = startAuditTime;
    }
    public String getEndAuditTime()
    {
        return endAuditTime;
    }
    public void setEndAuditTime(String endAuditTime)
    {
        this.endAuditTime = endAuditTime;
    }
    public String getStartWithdrawTime()
    {
        return startWithdrawTime;
    }
    public void setStartWithdrawTime(String startWithdrawTime)
    {
        this.startWithdrawTime = startWithdrawTime;
    }
    public String getEndWithdrawTime()
    {
        return endWithdrawTime;
    }
    public void setEndWithdrawTime(String endWithdrawTime)
    {
        this.endWithdrawTime = endWithdrawTime;
    }

    
    
}
