/*
 * 文 件 名:  InsertProjectDynamicReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月14日
 */
package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 更新项目动态请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月14日]
 */
public class InsertProjectDynamicReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -1147029115343811989L;
    
    /**
     * 项目ID
     */
    @NotBlank
    private String projectId;
    
    /**
     * 项目动态内容
     */
    @NotBlank
    private String dynamicInfo;
    
    /**
     * 项目动态图片附件IDs
     */
    private String[] imgsIds;
    
    /**
     * @return 返回 projectId
     */
    public String getProjectId()
    {
        return projectId;
    }
    
    /**
     * @param 对projectId进行赋值
     */
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    /**
     * @return 返回 dynamicInfo
     */
    public String getDynamicInfo()
    {
        return dynamicInfo;
    }
    
    /**
     * @param 对dynamicInfo进行赋值
     */
    public void setDynamicInfo(String dynamicInfo)
    {
        this.dynamicInfo = dynamicInfo;
    }
    
    /**
     * @return 返回 imgsIds
     */
    public String[] getImgsIds()
    {
        return imgsIds;
    }
    
    /**
     * @param 对imgsIds进行赋值
     */
    public void setImgsIds(String[] imgsIds)
    {
        this.imgsIds = imgsIds;
    }
    
}
