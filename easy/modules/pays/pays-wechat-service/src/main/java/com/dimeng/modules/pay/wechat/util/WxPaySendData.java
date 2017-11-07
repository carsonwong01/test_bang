package com.dimeng.modules.pay.wechat.util;

public class WxPaySendData {

/*	"appId" ： "wx2421b1c4370ec43b", //公众号名称，由商户传入 
	"timeStamp"：" 1395712654", //时间戳，自1970年以来的秒数 
	"nonceStr" ： "e61463f8efa94090b1f366cccfbbb444", //随机串 
	"package" ： "prepay_id=u802345jgfjsdfgsdg888", 
	"signType" ： "MD5", //微信签名方式： 
	"paySign" ： "70EA570631E4BB79628FBCA90534C63FF7FADD89" //微信签名
*/	private String appId;
	private String timeStamp;
	private String nonceStr;
	private String prepayId;
	private String signType;
	private String paySign;
	private String ordeId;
	private String projectId;
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}
	public String getNonceStr() {
		return nonceStr;
	}
	public void setNonceStr(String nonceStr) {
		this.nonceStr = nonceStr;
	}
	public String getSignType() {
		return signType;
	}
	public void setSignType(String signType) {
		this.signType = signType;
	}
	public String getPaySign() {
		return paySign;
	}
	public void setPaySign(String paySign) {
		this.paySign = paySign;
	}
	public String getPrepayId() {
		return prepayId;
	}
	public void setPrepayId(String prepayId) {
		this.prepayId = prepayId;
	}
    public String getOrdeId()
    {
        return ordeId;
    }
    public void setOrdeId(String ordeId)
    {
        this.ordeId = ordeId;
    }
    public String getProjectId()
    {
        return projectId;
    }
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
	  

}