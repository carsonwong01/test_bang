package com.dimeng.model.expand;

public class RecomNewsReq extends FindExportExcelParamsReq{
    private String newsId;
    private String newsTitle;

    public String getNewsId() {
        return newsId;
    }

    public void setNewsId(String newsId) {
        this.newsId = newsId;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }
}
