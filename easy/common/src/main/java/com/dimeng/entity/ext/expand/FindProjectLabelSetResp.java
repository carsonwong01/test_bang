/*
 * 文 件 名:  FindProjectLabelSetResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月28日
 */
package com.dimeng.entity.ext.expand;

import java.io.Serializable;

/**
 * 项目标签查询返回参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月28日]
 */
public class FindProjectLabelSetResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 4700233200883718854L;
    
    /**
     * 项目类型名称
     */
    private String proType;
    
    /**
     * 项目标签名称
     */
    private String labelNames;
    
    /**
     * 修改人
     */
    private String updateUser;
    
    /**
     * 更新时间
     */
    private String updateTime;
    
    /**
     * @return 返回 proType
     */
    public String getProType()
    {
        return proType;
    }
    
    /**
     * @param 对proType进行赋值
     */
    public void setProType(String proType)
    {
        this.proType = proType;
    }
    
    /**
     * @return 返回 labelNames
     */
    public String getLabelNames()
    {
        return labelNames;
    }
    
    /**
     * @param 对labelNames进行赋值
     */
    public void setLabelNames(String labelNames)
    {
        this.labelNames = labelNames;
    }
    
    /**
     * @return 返回 updateUser
     */
    public String getUpdateUser()
    {
        return updateUser;
    }
    
    /**
     * @param 对updateUser进行赋值
     */
    public void setUpdateUser(String updateUser)
    {
        this.updateUser = updateUser;
    }
    
    /**
     * @return 返回 updateTime
     */
    public String getUpdateTime()
    {
        return updateTime;
    }
    
    /**
     * @param 对updateTime进行赋值
     */
    public void setUpdateTime(String updateTime)
    {
        this.updateTime = updateTime;
    }
    
}
