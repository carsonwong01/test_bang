package com.dimeng.enums;


public enum PaysFunctionNumCode {

	ALLINPAY("100", "通联支付","allinpay"),
	WECHATPAY("200", "微信支付","wechat"),
	JDPAY("300", "京东支付","jd"); 
   private String functionNumCode;

    private String chineseName;
    
    private String prefix;

	    private PaysFunctionNumCode(String functionNumCode, String chineseName, String prefix)
	    {
	        this.functionNumCode = functionNumCode;
	        this.chineseName = chineseName;
	        this.prefix = prefix;
	    }

	    public String functionNumCode()
	    {
	        return functionNumCode;
	    }

	    public String chineseName()
	    {
	        return chineseName;
	    }

	    public String getFunctionNumCode() {
			return functionNumCode;
		}

		 

		public String prefix() {
			return prefix;
		}

		/**
	     * 根据funcode得到funcode对象
	     * @param funCode
	     * @return
	     */
	    public static PaysFunctionNumCode parseFunCode(String funCode)
	    {
	        for(PaysFunctionNumCode pfn:PaysFunctionNumCode.values())
	        {
	            if(pfn.functionNumCode.equals(funCode))
	            {
	                return pfn;
	            }
	        }
	        return null;
	    }
}
