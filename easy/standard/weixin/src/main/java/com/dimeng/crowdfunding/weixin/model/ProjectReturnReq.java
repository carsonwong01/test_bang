package com.dimeng.crowdfunding.weixin.model;

import java.io.Serializable;

/*
 * 回报
*/
public class ProjectReturnReq implements Serializable {

    
    /**
	 * 
	 */
	private static final long serialVersionUID = -3362644786801413231L;
	
	/**
     * 回报ID
     */
	private String returnId;

	/**
     * 支持金额
     */
    private String supportAmount;
    
    /**
     * 回报数量
     */
    private String upperCount;
    
    
    /**
     * 回报描述
     */
    private String returnDescribe;
    
    /**
     * 回报图片ID
     */
    private String imageId;
    
    /**
     * 回报图片URL
     */
    private String imageUrl;

    public String getReturnId() {
		return returnId;
	}

	public void setReturnId(String returnId) {
		this.returnId = returnId;
	}
	public String getSupportAmount() {
		return supportAmount;
	}

	public void setSupportAmount(String supportAmount) {
		this.supportAmount = supportAmount;
	}

	public String getUpperCount() {
		return upperCount;
	}

	public void setUpperCount(String upperCount) {
		this.upperCount = upperCount;
	}

	public String getReturnDescribe() {
		return returnDescribe;
	}

	public void setReturnDescribe(String returnDescribe) {
		this.returnDescribe = returnDescribe;
	}

	public String getImageId() {
		return imageId;
	}

	public void setImageId(String imageId) {
		this.imageId = imageId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

}
