package com.dimeng.entity.table.site;

import java.util.Date;

public class TOperateFeedback {
    private String feedbackId;

    private String userId;

    private String contactEmail;

    private String feedbackDetails;

    private Date dateCommit;

    public String getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(String feedbackId) {
        this.feedbackId = feedbackId == null ? null : feedbackId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail == null ? null : contactEmail.trim();
    }

    public String getFeedbackDetails() {
        return feedbackDetails;
    }

    public void setFeedbackDetails(String feedbackDetails) {
        this.feedbackDetails = feedbackDetails == null ? null : feedbackDetails.trim();
    }

    public Date getDateCommit() {
        return dateCommit;
    }

    public void setDateCommit(Date dateCommit) {
        this.dateCommit = dateCommit;
    }
}