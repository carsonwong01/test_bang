package com.dimeng.crowdfunding.weixin.model;

import java.io.Serializable;
import java.util.List;

public class ProjectReturnDataReq implements Serializable {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 6535885759453225197L;

	/**
     * 项目标题
     */
    private String projectName;
    
    /**
     * 目标金额
     */
    private String targetAmount;
    
    /**
     * 项目简介
     */
    private String projectIntro;
    
    /**
     * 筹资期限
     */
    private String financingDays;
    
    /**
     * 支持者是否提供收货地址
     */
    private String isNeddAddr;
    
    /**
     * 运费描述
     */
    private String freightDescribe;
    
    /**
     * 发货时间描述
     */
    private String deliverDescribe;
    
    /**
     * 项目标签
     */
    private String projectLabel;
    
    /**
     * 项目内容
     */
    private String projectDetails;
    
    /**
     * 项目图片ID集合
     */
    private String[] imagesIds;
    
    /**
     * 项目封面ID
     */
    private String coverImageId;
    
    /**
     * 项目封面URL
     */
    private String coverImageUrl;
    
    /**
     * 项目回报列表
     */
    private List<ProjectReturnReq> returnList;

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getTargetAmount() {
		return targetAmount;
	}

	public void setTargetAmount(String targetAmount) {
		this.targetAmount = targetAmount;
	}

	public String getProjectIntro() {
		return projectIntro;
	}

	public void setProjectIntro(String projectIntro) {
		this.projectIntro = projectIntro;
	}

	public String getFinancingDays() {
		return financingDays;
	}

	public void setFinancingDays(String financingDays) {
		this.financingDays = financingDays;
	}

	public String getIsNeddAddr() {
		return isNeddAddr;
	}

	public void setIsNeddAddr(String isNeddAddr) {
		this.isNeddAddr = isNeddAddr;
	}

	public String getFreightDescribe() {
		return freightDescribe;
	}

	public void setFreightDescribe(String freightDescribe) {
		this.freightDescribe = freightDescribe;
	}

	public String getDeliverDescribe() {
		return deliverDescribe;
	}

	public void setDeliverDescribe(String deliverDescribe) {
		this.deliverDescribe = deliverDescribe;
	}

	public String getProjectLabel() {
		return projectLabel;
	}

	public void setProjectLabel(String projectLabel) {
		this.projectLabel = projectLabel;
	}

	public String getProjectDetails() {
		return projectDetails;
	}

	public void setProjectDetails(String projectDetails) {
		this.projectDetails = projectDetails;
	}

	public String[] getImagesIds() {
		return imagesIds;
	}

	public void setImagesIds(String[] imagesIds) {
		this.imagesIds = imagesIds;
	}

	public String getCoverImageId() {
		return coverImageId;
	}

	public void setCoverImageId(String coverImageId) {
		this.coverImageId = coverImageId;
	}

	public String getCoverImageUrl() {
		return coverImageUrl;
	}

	public void setCoverImageUrl(String coverImageUrl) {
		this.coverImageUrl = coverImageUrl;
	}

	public List<ProjectReturnReq> getReturnList() {
		return returnList;
	}

	public void setReturnList(List<ProjectReturnReq> returnList) {
		this.returnList = returnList;
	}
	
}
