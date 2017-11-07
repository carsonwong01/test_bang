package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 审核管理-查询举报内容图片集合返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月12日]
 */
public class FindInformantContentImgsResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 5071324463290380743L;
    
    /**
     * 举报图片url
     */
    private String url;
    
    /**
     * 举报图片id
     */
    private String id;
    
    public String getUrl()
    {
        return url;
    }
    
    public void setUrl(String url)
    {
        this.url = url;
    }
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
    }
    
}
