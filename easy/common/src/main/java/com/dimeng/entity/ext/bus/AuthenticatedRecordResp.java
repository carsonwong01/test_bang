package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 验证审核记录返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月13日]
 */
public class AuthenticatedRecordResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -4847658724138882014L;
    
    /**
     * 审核记录ID
     */
    private String id;
    
    /**
     * 验证ID
     */
    private String authorId;
    
    /**
     * 审核时间
     */
    private String dateCheck;
    
    /**
     * 审核人
     */
    private String author;
    
    /**
     * 审核状态
     */
    private String status;
    
    /**
     * 审核意见
     */
    private String opinion;
    
    /**
     * 格式化后的日期
     */
    private String dateFormat;
    
    /**
     * 标题
     */
    private String title;
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
    }
    
    public String getAuthorId()
    {
        return authorId;
    }
    
    public void setAuthorId(String authorId)
    {
        this.authorId = authorId;
    }
    
    public String getDateCheck()
    {
        return dateCheck;
    }
    
    public void setDateCheck(String dateCheck)
    {
        this.dateCheck = dateCheck;
    }
    
    public String getAuthor()
    {
        return author;
    }
    
    public void setAuthor(String author)
    {
        this.author = author;
    }
    
    public String getStatus()
    {
        return status;
    }
    
    public void setStatus(String status)
    {
        this.status = status;
    }
    
    public String getOpinion()
    {
        return opinion;
    }
    
    public void setOpinion(String opinion)
    {
        this.opinion = opinion;
    }
    
    /**
     * @return 返回 dateFormat
     */
    public String getDateFormat()
    {
        return dateFormat;
    }
    
    /**
     * @param 对dateFormat进行赋值
     */
    public void setDateFormat(String dateFormat)
    {
        this.dateFormat = dateFormat;
    }
    
    /**
     * @return 返回 title
     */
    public String getTitle()
    {
        return title;
    }
    
    /**
     * @param 对title进行赋值
     */
    public void setTitle(String title)
    {
        this.title = title;
    }
    
}
