package com.dimeng.modules.pay.wechat.entity;

/**
 * 
 *微信支付返回状态
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年10月15日]
 */
public class WeChatTradeStatus
{
    /**
     * 代收冻结成功（商户通知）
     */
    public static final String SUCCESS = "SUCCESS";
    /**
     * 代收冻结成功（商户通知）
     */
    public static final String FALL = "FAIL";
    /**
     * 退款状态 退款处理中
     */
    public static final String REFUND_PROCESSING="PROCESSING";
    /**
     * 用户支付中
     */
    public static final String USERPAYING="USERPAYING";
    /**
     * 用户未支付
     */
    public static final String NOTPAY="NOTPAY";
    /**
     * 用户支付失败
     */
    public static final String PAYERROR="PAYERROR";
    /**
     * 用户支付转入退款
     */
    public static final String REFUND="REFUND";
    /**
     * 退款状态 转入代发，退款到银行发现用户的卡作废或者冻结了，导致原路退款银行卡失败，资金回流到商户的现金帐号
     * ，需要商户人工干预，通过线下或者财付通转账的方式进行退款。

     */
    public static final String REFUND_CHANGE="CHANGE";
    
}
