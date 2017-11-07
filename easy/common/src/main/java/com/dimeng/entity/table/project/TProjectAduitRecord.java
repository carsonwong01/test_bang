package com.dimeng.entity.table.project;

import java.util.Date;

public class TProjectAduitRecord {
    private String aduitId;

    private String validationId;

    private Date dateAduit;

    private String aduitResult;

    private String aduitUserId;

    private String aduitOption;

    public String getAduitId() {
        return aduitId;
    }

    public void setAduitId(String aduitId) {
        this.aduitId = aduitId == null ? null : aduitId.trim();
    }

    public String getValidationId() {
        return validationId;
    }

    public void setValidationId(String validationId) {
        this.validationId = validationId == null ? null : validationId.trim();
    }

    public Date getDateAduit() {
        return dateAduit;
    }

    public void setDateAduit(Date dateAduit) {
        this.dateAduit = dateAduit;
    }

    public String getAduitResult() {
        return aduitResult;
    }

    public void setAduitResult(String aduitResult) {
        this.aduitResult = aduitResult == null ? null : aduitResult.trim();
    }

    public String getAduitUserId() {
        return aduitUserId;
    }

    public void setAduitUserId(String aduitUserId) {
        this.aduitUserId = aduitUserId == null ? null : aduitUserId.trim();
    }

    public String getAduitOption() {
        return aduitOption;
    }

    public void setAduitOption(String aduitOption) {
        this.aduitOption = aduitOption == null ? null : aduitOption.trim();
    }
}