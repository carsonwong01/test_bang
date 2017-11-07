/*
 * 文 件 名:  InformReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年11月8日
 */
package com.dimeng.model.bus;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 项目举报
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年11月8日]
 */
public class InformReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8871910064198982128L;
    
    /**
     * 项目ID
     */
    @NotBlank
    @Length(max = 25)
    private String projectId;
    
    /**
     * 举报人姓名
     */
    @NotBlank
    @Length(max = 25)
    private String name;
    
    /**
     * 举报人联系电话
     */
    @NotBlank
    @Length(max = 20)
    private String phone;
    
    /**
     * 举报内容
     */
    @NotBlank
    @Length(max = 200)
    private String content;
    
    /**
     * 举报图片ID集合
     */
    private String[] imgIds;
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    public String getName()
    {
        return name;
    }
    
    public void setName(String name)
    {
        this.name = name;
    }
    
    public String getPhone()
    {
        return phone;
    }
    
    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    
    public String getContent()
    {
        return content;
    }
    
    public void setContent(String content)
    {
        this.content = content;
    }
    
    public String[] getImgIds()
    {
        return imgIds;
    }
    
    public void setImgIds(String[] imgIds)
    {
        this.imgIds = imgIds;
    }
    
}
