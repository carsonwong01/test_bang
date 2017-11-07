package com.dimeng.model.pay;

import java.math.BigDecimal;
import com.dimeng.framework.domain.BaseReq;

/**
 * 
 *  支付实体类
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年3月17日]
 */
public class OrderPayReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 232333514654564561L;
    
    /**
     * 支付方式，参考PaysFunctionNumCode
     */
    private String payType;
    
    
    /**
     * 订单id，订单号平台唯一标识
     */
    private String orderId;
    
   
    /**
     * 1:PC端2:安卓3:苹果4:微信',
     */
    private String terminal;
	
    
    /**
     * 订单金额，保留2为小数，单位为元
     */
    private BigDecimal amount;
    
     
    /**
     * 订单提交时间（格式：yyyyMMddHHmmss）
     */
    private String orderDatetime;

    /**
     * 订单id，订单号平台唯一标识
     */
    private String orderNo;
    /**
     * 微信授权用户标识
     */
    private String openId;
    
    /**
     *终端IP
     */
    private String userIp;
    /**
     * 支付内容
     */
    private String body;
    /**
     * 项目ID
     */
    private String projectId;
    
	public String getBody()
    {
        return body;
    }

    public void setBody(String body)
    {
        this.body = body;
    }

    public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getTerminal() {
		return terminal;
	}

	public void setTerminal(String pc) {
		this.terminal = pc;
	}
	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getOrderDatetime() {
		return orderDatetime;
	}

	public void setOrderDatetime(String orderDatetime) {
		this.orderDatetime = orderDatetime;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

    public String getUserIp()
    {
        return userIp;
    }

    public void setUserIp(String userIp)
    {
        this.userIp = userIp;
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
