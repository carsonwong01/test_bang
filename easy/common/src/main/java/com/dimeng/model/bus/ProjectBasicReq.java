/*
 * 文 件 名:  ProjectBasicReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月13日
 */
package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 项目操作请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月13日]
 */
public class ProjectBasicReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 7548206186128582603L;
    
    /**
     * 项目ID
     */
    @NotBlank
    private String projectId;
    
    /**
     * 项目提前结束原因
     */
    @NotBlank
    private String finishReason;
    
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
     * @return 返回 finishReason
     */
    public String getFinishReason()
    {
        return finishReason;
    }
    
    /**
     * @param 对finishReason进行赋值
     */
    public void setFinishReason(String finishReason)
    {
        this.finishReason = finishReason;
    }
    
}
