/*
 * 文 件 名:  UpdateProjectShieldStatusReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年11月16日
 */
package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 更新项目屏蔽状态
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年11月16日]
 */
public class UpdateProjectShieldStatusReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 4061918376764799326L;
    
    /**
     * 项目id
     */
    @NotBlank
    private String projectId;
    
    /**
     * 屏蔽状态，1-屏蔽，2-取消屏蔽
     */
    @NotBlank
    private String shiledStatus;
    
    /**
     * 来源：1-众筹成功列表，2-众筹失败列表
     */
    private String source;
    
    public String getProjectId()
    {
        return projectId;
    }
    
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    public String getShiledStatus()
    {
        return shiledStatus;
    }
    
    public void setShiledStatus(String shiledStatus)
    {
        this.shiledStatus = shiledStatus;
    }

    public String getSource()
    {
        return source;
    }

    public void setSource(String source)
    {
        this.source = source;
    }
    
}
