package com.dimeng.entity.table.site;

import java.util.Date;

public class TSiteHomeProject {
    private String id;

    private String projectId;

    private String userOpt;

    private Date dateOpt;

    private String recommendPc;

    private Date datePc;

    private String recommendApp;

    private Date dateApp;

    private String recommendWeixin;

    private Date dateWeixin;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public String getUserOpt() {
        return userOpt;
    }

    public void setUserOpt(String userOpt) {
        this.userOpt = userOpt == null ? null : userOpt.trim();
    }

    public Date getDateOpt() {
        return dateOpt;
    }

    public void setDateOpt(Date dateOpt) {
        this.dateOpt = dateOpt;
    }

    public String getRecommendPc() {
        return recommendPc;
    }

    public void setRecommendPc(String recommendPc) {
        this.recommendPc = recommendPc == null ? null : recommendPc.trim();
    }

    public Date getDatePc() {
        return datePc;
    }

    public void setDatePc(Date datePc) {
        this.datePc = datePc;
    }

    public String getRecommendApp() {
        return recommendApp;
    }

    public void setRecommendApp(String recommendApp) {
        this.recommendApp = recommendApp == null ? null : recommendApp.trim();
    }

    public Date getDateApp() {
        return dateApp;
    }

    public void setDateApp(Date dateApp) {
        this.dateApp = dateApp;
    }

    public String getRecommendWeixin() {
        return recommendWeixin;
    }

    public void setRecommendWeixin(String recommendWeixin) {
        this.recommendWeixin = recommendWeixin == null ? null : recommendWeixin.trim();
    }

    public Date getDateWeixin() {
        return dateWeixin;
    }

    public void setDateWeixin(Date dateWeixin) {
        this.dateWeixin = dateWeixin;
    }
}