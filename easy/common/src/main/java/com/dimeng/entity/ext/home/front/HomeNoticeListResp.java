package com.dimeng.entity.ext.home.front;

import java.io.Serializable;

/**
 * 公告列表
 * @author  song
 * @version  [版本号, 2016年10月12日]
 */
public class HomeNoticeListResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 967580211088433381L; 
    
    /**
     * 公告id
     */
    private String noticeId;
    
    /**
     * 公告标题
     */
    private String noticeTitle;

    public String getNoticeId()
    {
        return noticeId;
    }

    public void setNoticeId(String noticeId)
    {
        this.noticeId = noticeId;
    }

    public String getNoticeTitle()
    {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle)
    {
        this.noticeTitle = noticeTitle;
    }
    
}
