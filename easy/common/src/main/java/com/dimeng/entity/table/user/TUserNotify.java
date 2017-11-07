package com.dimeng.entity.table.user;


public class TUserNotify { 

    private String userId;

    private String proStatusNotify;

    private String othPeoplePayNotify;

    private String peoplePayNotify;

    private String replyNotify;

    private String withdrawNotify;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getProStatusNotify() {
        return proStatusNotify;
    }

    public void setProStatusNotify(String proStatusNotify) {
        this.proStatusNotify = proStatusNotify == null ? null : proStatusNotify.trim();
    }

    public String getOthPeoplePayNotify() {
        return othPeoplePayNotify;
    }

    public void setOthPeoplePayNotify(String othPeoplePayNotify) {
        this.othPeoplePayNotify = othPeoplePayNotify == null ? null : othPeoplePayNotify.trim();
    }

    public String getPeoplePayNotify() {
        return peoplePayNotify;
    }

    public void setPeoplePayNotify(String peoplePayNotify) {
        this.peoplePayNotify = peoplePayNotify == null ? null : peoplePayNotify.trim();
    }

    public String getReplyNotify() {
        return replyNotify;
    }

    public void setReplyNotify(String replyNotify) {
        this.replyNotify = replyNotify == null ? null : replyNotify.trim();
    }

    public String getWithdrawNotify() {
        return withdrawNotify;
    }

    public void setWithdrawNotify(String withdrawNotify) {
        this.withdrawNotify = withdrawNotify == null ? null : withdrawNotify.trim();
    }
}