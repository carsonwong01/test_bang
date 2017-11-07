package com.dimeng.enums.variable;

import com.dimeng.entity.base.VariableBean;
import com.dimeng.utils.VariableTypeAnnotation;

@VariableTypeAnnotation(id = "WECHATPAY", name = "微信配置")
public enum WeChatVaribles implements VariableBean
{
    WECHAT_IS_TEST("true", "开启测试模式，支付金额为一分,true,开启;false,关闭"),
    WECHAT_PAY_URL("https://api.mch.weixin.qq.com/pay/unifiedorder", "微信下单URL"),
    WECHAT_REFUND_URL("https://api.mch.weixin.qq.com/secapi/pay/refund", "微信退款URL"),
    WECHAT_REFUND_CHECK_URL("https://api.mch.weixin.qq.com/pay/refundquery", "微信退款查询URL"),
    WECHAT_PAY_CHECK_URL("https://api.mch.weixin.qq.com/pay/orderquery", "微信支付查询URL"),
    WECHAT_CERTLOCALPATH("E://allinpay//apiclient_cert.p12", "HTTPS证书的本地路径"),
    WECHAT_DOMAIN_URL("http://112.95.233.249:5109", "第三方回调url"),
	WECHAT_API_KEY("GQUZH7gURWWlT0wNlXsQRZOulPpZ8FDs", "微信appkey"),
	WECHAT_APP_ID("wx89a42dec00f8c5de", "微信app ID"),
	WECHAT_MCHID("1390132902", "微信商户号"),
	IS_REFUND("true","退款定时器是否开启"),
    IS_TEST("1","是否测试，0不调第三方,1调用第三方");
    
    private String key;
    
    private String description;
    
    private String value;
    
    private WeChatVaribles(String value, String description)
    {
        this.description = description;
        this.value = value;
    }
    
    public void setKey(String key)
    {
        this.key = key;
    }
    
    public void setDescription(String description)
    {
        this.description = description;
    }
    
    public void setValue(String value)
    {
        this.value = value;
    }
    
    @Override
    public String getType()
    {
        return WeChatVaribles.class.getAnnotation(VariableTypeAnnotation.class).id();
    }
    
    @Override
    public String getKey()
    {
        StringBuilder builder = new StringBuilder(getType());
        builder.append('.').append(name());
        this.key = builder.toString();
        return this.key;
    }
    
    @Override
    public String getValue()
    {
        return this.value;
    }
    
    @Override
    public String getDescription()
    {
        return this.description;
    }
    
    @Override
    public boolean isInit()
    {
        return true;
    }
    
    @Override
    public String getTypeName()
    {
        return null;
    }
    
    @Override
    public boolean isDb()
    {
        return false;
    }
    
    public static void main(String[] args)
    {
        WeChatVaribles[] tvs = WeChatVaribles.class.getEnumConstants();
        for (WeChatVaribles tv : tvs)
        {
            System.out.println(String.format("%s\t%s\t%s\t%s",
                tv.getKey(),
                tv.getValue(),
                tv.getType(),
                tv.getTypeName()));
        }
    }
    
    
     
}
