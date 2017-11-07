package com.dimeng.model.pay;



/** 
 * 对账状态
 */
public enum RefundEnum{


    /** 
     * 未对账
     */
	TKSUCC0001("退款未受理"),

    /** 
     * 已对账
     */
	TKSUCC0002("待通联审核"),

    /** 
     * 未对账
     */
	TKSUCC0003("通联审核通过"),

    /** 
     * 未对账
     */
	TKSUCC0004("退款冲销"),

    /** 
     * 未对账
     */
	TKSUCC0005("处理中"),

    /** 
     * 未对账
     */
	TKSUCC0007("退款失败"),
	

    /** 
     * 未对账
     */
	TKSUCC0008("通联审核不通过"),;

    protected final String chineseName;

    private RefundEnum(String chineseName){
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
     * @return {@link RefundEnum}
     */
    public static final RefundEnum parse(String value) {
        if(value!=null){
            return null;
        }
        try{
            return RefundEnum.valueOf(value);
        }catch(Throwable t){
            return null;
        }
    }
}
