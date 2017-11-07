package com.dimeng.entity.table.site;

import java.util.Date;

public class TSiteTextInstructions {
    private String textId;

    private String textTitle;

    private Date dateUpdate;

    private String operatorId;

    private String textContext;

    public String getTextId() {
        return textId;
    }

    public void setTextId(String textId) {
        this.textId = textId == null ? null : textId.trim();
    }

    public String getTextTitle() {
        return textTitle;
    }

    public void setTextTitle(String textTitle) {
        this.textTitle = textTitle == null ? null : textTitle.trim();
    }

    public Date getDateUpdate() {
        return dateUpdate;
    }

    public void setDateUpdate(Date dateUpdate) {
        this.dateUpdate = dateUpdate;
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId == null ? null : operatorId.trim();
    }

    public String getTextContext() {
        return textContext;
    }

    public void setTextContext(String textContext) {
        this.textContext = textContext == null ? null : textContext.trim();
    }
}