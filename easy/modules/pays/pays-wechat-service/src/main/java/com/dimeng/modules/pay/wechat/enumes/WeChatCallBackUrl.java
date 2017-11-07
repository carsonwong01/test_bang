package com.dimeng.modules.pay.wechat.enumes;


/**
 * 
 *微信支付成功后回调url
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年8月17日]
 */
public enum WeChatCallBackUrl
{
    
    
    /**
     * 充值
     */
    Charge("/platform/wechat/callback/chargeResp.do", "/platform/callback/chargeResp.do", "/user/rechargeCallBack.do","app-URL", 
        "/weixin/weChatRet/weChatChargeRet.do",
        "托管充值");
   

    //众筹平台回调
    private String notify;
    
    //页面跳转(托管处理)
    private String resp;
    
    //跳转到平台页面(众筹处理)
    private String front;
  //app跳转地址
    private String app;
    
    //微信地址
    private String weixin;
    
    //众筹平台操作说明
    private String text;
    
    private WeChatCallBackUrl(String notify, String resp, String front, String weixin, String text)
    {
        this.notify = notify;
        this.resp = resp;
        this.front = front;
        this.weixin = weixin;
        this.text = text;
    }
    
    private  WeChatCallBackUrl (String notify, String resp, String front, String app, String weixin, String text)
    {
        this.notify = notify;
        this.resp = resp;
        this.front = front;
        this.app = app;
        this.weixin = weixin;
        this.text = text;

    }

    public String getText() {
        return text;
    }
    
    public String getResp() {
        return resp;
    }
    
    public String getNotify() {
        return notify;
    }
    
    public String getFront() {
        return front;
    }
    
    public String getApp()
    {
        return app;
    }
    
    public String getWeixin()
    {
        return weixin;
    }
    
}
