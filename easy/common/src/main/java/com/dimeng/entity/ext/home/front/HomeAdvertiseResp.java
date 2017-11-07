package com.dimeng.entity.ext.home.front;

import java.io.Serializable;

/**
 * 前台首页 -广告图片
 * @author  song
 * @version  [版本号, 2016年10月12日]
 */
public class HomeAdvertiseResp implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 7838516788850586622L;
    
    /**
     * 标题
     */
    private String adTitle;
    
    /**
     * 图片url
     */
    private String adImageUrl;
    
    /**
     * 连接地址
     */
    private String adPartnerUrl;
    
    /**
     * 打开方式
     */
    private String openType;

    public String getAdTitle()
    {
        return adTitle;
    }

    public void setAdTitle(String adTitle)
    {
        this.adTitle = adTitle;
    }

    public String getAdImageUrl()
    {
        return adImageUrl;
    }

    public void setAdImageUrl(String adImageUrl)
    {
        this.adImageUrl = adImageUrl;
    }

    public String getAdPartnerUrl()
    {
        return adPartnerUrl;
    }

    public void setAdPartnerUrl(String adPartnerUrl)
    {
        this.adPartnerUrl = adPartnerUrl;
    }

    public String getOpenType()
    {
        return openType;
    }

    public void setOpenType(String openType)
    {
        this.openType = openType;
    }
    
}
