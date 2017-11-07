package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 审核管理-查询举报详情列表返回实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月12日]
 */
public class FindInformantDetailListResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 7069317711452865720L;
    /**
     * 举报详情id
     */
    private String id;
    /**
     * 举报人
     */
    private String complainant;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 姓名
     */
    private String name;
    /**
     * 联系方式
     */
    private String contact;
    /**
     * 举报原因
     */
    private String reason;
    /**
     * 举报时间
     */
    private String time;
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
    }
    
    public String getComplainant()
    {
        return complainant;
    }
    
    public void setComplainant(String complainant)
    {
        this.complainant = complainant;
    }
    
    public String getNickname()
    {
        return nickname;
    }
    
    public void setNickname(String nickname)
    {
        this.nickname = nickname;
    }
    
    public String getName()
    {
        return name;
    }
    
    public void setName(String name)
    {
        this.name = name;
    }
    
    public String getContact()
    {
        return contact;
    }
    
    public void setContact(String contact)
    {
        this.contact = contact;
    }
    
    public String getReason()
    {
        return reason;
    }
    
    public void setReason(String reason)
    {
        this.reason = reason;
    }
    
    public String getTime()
    {
        return time;
    }
    
    public void setTime(String time)
    {
        this.time = time;
    }
    
}
