/*
 * 文 件 名:  FindProjectValidationReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月13日
 */
package com.dimeng.model.bus;

import com.dimeng.framework.domain.BaseReq;

/**
 * 项目验证详情请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月13日]
 */
public class FindProjectValidationReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 928380867969688812L;
    
    /**
     * 验证ID
     */
    private String validationId;
    
    /**
     * 项目ID
     */
    private String projectId;
    
    /**
     * @return 返回 validationId
     */
    public String getValidationId()
    {
        return validationId;
    }
    
    /**
     * @param 对validationId进行赋值
     */
    public void setValidationId(String validationId)
    {
        this.validationId = validationId;
    }
    
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
    
}
