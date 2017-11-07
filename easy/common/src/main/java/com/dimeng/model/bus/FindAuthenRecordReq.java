/*
 * 文 件 名:  FindAuthenRecordReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年11月5日
 */
package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BasePageReq;

/**
 * 项目验证审核记录
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年11月5日]
 */
public class FindAuthenRecordReq extends BasePageReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -6564875568476453709L;
    
    /**
     * 项目验证ID
     */
    @NotBlank
    private String id;
    
    /**
     * 1：不分页
     * 2或不传值：分页
     */
    private String isFront;
    
    /**
     * @return 返回 id
     */
    public String getId()
    {
        return id;
    }
    
    /**
     * @param 对id进行赋值
     */
    public void setId(String id)
    {
        this.id = id;
    }
    
    /**
     * @return 返回 isFront
     */
    public String getIsFront()
    {
        return isFront;
    }
    
    /**
     * @param 对isFront进行赋值
     */
    public void setIsFront(String isFront)
    {
        this.isFront = isFront;
    }
    
}
