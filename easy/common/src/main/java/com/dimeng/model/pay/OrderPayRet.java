package com.dimeng.model.pay;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 
 * 支付回调类
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年3月17日]
 */
public class OrderPayRet implements Serializable
{
    
    /**
	 * 注释内容
	 */
    private static final long serialVersionUID = 1L;
    
    /**
	 * 订单id，订单号平台唯一标识
	 */
    private String orderId;
    
	
    /**
     * pc:前端，ad:安卓，iso:苹果，other:其他，不为空。
     */
    private String terminal;
	/**
	 * 充值标识
	 * PT：平台充值
	 * YH:用户前台充值
	 */
	private String chargeTag;
	
	/**
	 * 充值人承担的充值手续费
	 */
	private String userFee;
	
	/**
	 * 平台承担的充值手续费
	 */
	private String platformFee;
    
	/**
	 * 订单金额，保留2为小数，单位为元
	 */
    private BigDecimal amount;
    
    /**
	 * 交易流水号
	 */
    private String trdId;
    
   
    
    /**
	 * 交易状态，0001:成功，0002:失败
	 */
    private String resultCode;
    
     
    
    public String getOrderId()
    {
        return orderId;
    }
    
    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }
    
    public BigDecimal getAmount()
    {
        return amount;
    }
    
    public void setAmount(BigDecimal amount)
    {
        this.amount = amount;
    }
    
    public String getResultCode()
    {
        return resultCode;
    }
    
    public void setResultCode(String resultCode)
    {
        this.resultCode = resultCode;
    }
    
    
    public String getTrdId()
    {
        return trdId;
    }
    
    public void setTrdId(String trdId)
    {
        this.trdId = trdId;
    }

	public String getTerminal() {
		return terminal;
	}

	public void setTerminal(String terminal) {
		this.terminal = terminal;
	}

	public String getChargeTag() {
		return chargeTag;
	}
	
	public void setChargeTag(String chargeTag) {
		this.chargeTag = chargeTag;
	}
	
	public String getUserFee() {
		return userFee;
	}
	
	public void setUserFee(String userFee) {
		this.userFee = userFee;
	}
	
	public String getPlatformFee() {
		return platformFee;
	}
	
	public void setPlatformFee(String platformFee) {
		this.platformFee = platformFee;
	}
 
    
}
