package com.dimeng.entity.ext.home.front;

import java.io.Serializable;

public class FrontNoticeAndNewsInfoResp implements Serializable{

        private static final long serialVersionUID = -7980191270097857675L;
        private String id;
        private String infoTitle;
        private String dateCreate;
        private String investmentInfoType;
        private String infoContent;
        private String viewCount;
        private String dateCreateDay;

    public String getDateCreateDay() {
        return dateCreateDay;
    }

    public void setDateCreateDay(String dateCreateDay) {
        this.dateCreateDay = dateCreateDay;
    }

    public String getViewCount() {
        return viewCount;
    }

    public void setViewCount(String viewCount) {
        this.viewCount = viewCount;
    }

    public FrontNoticeAndNewsInfoResp() {
        }

        public String getInvestmentInfoType() {
            return this.investmentInfoType;
        }

        public void setInvestmentInfoType(String investmentInfoType) {
            this.investmentInfoType = investmentInfoType;
        }

        public String getId() {
            return this.id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getInfoTitle() {
            return this.infoTitle;
        }

        public void setInfoTitle(String infoTitle) {
            this.infoTitle = infoTitle;
        }

        public String getDateCreate() {
            return this.dateCreate;
        }

        public void setDateCreate(String dateCreate) {
            this.dateCreate = dateCreate;
        }

        public String getInfoContent() {
            return this.infoContent;
        }

        public void setInfoContent(String infoContent) {
            this.infoContent = infoContent;
        }
}
