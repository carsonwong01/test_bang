/*
 * 文 件 名:  ProjectBasicSetReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月28日
 */
package com.dimeng.model.expand;

import com.dimeng.framework.domain.BaseReq;

/**
 * 运营管理基本设置参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月28日]
 */
public class FindProjectBasicSetReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -7905209241602672438L;
    
    /**
     * 修改人
     */
    private String updateUser;
    
    /**
     * 开始时间
     */
    private String staDate;
    
    /**
     * 结束时间
     */
    private String endDate;
    
    /**
     * 项目类型：
     * 1回报项目
     * 2梦想项目
     */
    private Integer proType;
    
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
     * @return 返回 staDate
     */
    public String getStaDate()
    {
        return staDate;
    }
    
    /**
     * @param 对staDate进行赋值
     */
    public void setStaDate(String staDate)
    {
        this.staDate = staDate;
    }
    
    /**
     * @return 返回 endDate
     */
    public String getEndDate()
    {
        return endDate;
    }
    
    /**
     * @param 对endDate进行赋值
     */
    public void setEndDate(String endDate)
    {
        this.endDate = endDate;
    }
    
    /**
     * @return 返回 proType
     */
    public Integer getProType()
    {
        return proType;
    }
    
    /**
     * @param 对proType进行赋值
     */
    public void setProType(Integer proType)
    {
        this.proType = proType;
    }
    
}
