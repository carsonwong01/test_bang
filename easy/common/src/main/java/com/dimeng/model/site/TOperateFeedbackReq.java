package com.dimeng.model.site;

import java.util.Date;

import com.dimeng.framework.domain.BaseReq;

public class TOperateFeedbackReq extends BaseReq{
 
	private static final long serialVersionUID = 1933871729601350411L;

	private String feedbackId;

    private String userId;

    private String contactEmail;

    private String feedbackDetails;

    private Date dateCommit;

	public String getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(String feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getFeedbackDetails() {
		return feedbackDetails;
	}

	public void setFeedbackDetails(String feedbackDetails) {
		this.feedbackDetails = feedbackDetails;
	}

	public Date getDateCommit() {
		return dateCommit;
	}

	public void setDateCommit(Date dateCommit) {
		this.dateCommit = dateCommit;
	}
    
}
