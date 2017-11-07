package com.dimeng.modules.pay.wechat.enumes;

import com.dimeng.framework.utils.StringUtil;


/**
 * 
 *微信支付成功后回调url
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年8月17日]
 */
public enum PayStatus
{
    
    
    /** 
     *退款中
     */
    PROCESSING("PROCESSING"),

    /** 
     * 转入代发
     */
    CHANGE("CHANGE"),
    

    /** 
     *  接口返回错误
     */
    SYSTEMERROR("SYSTEMERROR"),
 
    /** 
     *  退款订单查询失败    订单号错误或订单状态不正确
     */
    REFUNDNOTEXIST("REFUNDNOTEXIST");
    
    
    protected final String chineseName;

    private PayStatus(String chineseName){
        this.chineseName = chineseName;
    }
    /**
     * 获取中文名称.
     * 
     * @return {@link String}
     */
    public String getChineseName() {
        return chineseName;
    }
    /**
     * 解析字符串.
     * 
     * @return {@link T6247_F05}
     */
    public static final PayStatus parse(String value) {
        if(StringUtil.isEmpty(value)){
            return null;
        }
        try{
            return PayStatus.valueOf(value);
        }catch(Throwable t){
            return null;
        }
    }
}
