package com.dimeng.entity.ext.expand;

import java.io.Serializable;

public class RecomNewsResp implements Serializable {
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
