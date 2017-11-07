package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 审核管理-查询举报详情列表
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月12日]
 */
public class FindInformantDetailListReq extends FindExportExcelParamsReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -1897378813669630184L;
    
    /**
     * 项目id
     */
    @NotBlank
    private String id;
    
    /**
     * 举报人姓名
     */
    private String complainant;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 姓名
     */
    private String name;
    
    /**
     * 联系方式
     */
    private String contact;
    
    /**
     * 开始举报时间
     */
    private String beginTime;
    
    /**
     * 结束举报时间
     */
    private String endTime;
    
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
    
    public String getNickName()
    {
        return nickName;
    }
    
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
    public String getContact()
    {
        return contact;
    }
    
    public void setContact(String contact)
    {
        this.contact = contact;
    }
    
    public String getBeginTime()
    {
        return beginTime;
    }
    
    public void setBeginTime(String beginTime)
    {
        this.beginTime = beginTime;
    }
    
    public String getEndTime()
    {
        return endTime;
    }
    
    public void setEndTime(String endTime)
    {
        this.endTime = endTime;
    }
    
    public String getName()
    {
        return name;
    }
    
    public void setName(String name)
    {
        this.name = name;
    }
    
}
