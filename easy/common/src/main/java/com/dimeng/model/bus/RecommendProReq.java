package com.dimeng.model.bus;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 站点管理-推荐项目req
 * @author  song
 * @version  [版本号, 2016年9月29日]
 */
public class RecommendProReq extends BaseReq
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -8278485045644138219L;

    /**
     * id
     */
    private String id;
    
    @NotBlank
    private String proId; 
    
    /**
     * 是否pc推荐   1 是 2 否
     */
    private String isPc;
    
    private String isWeixin;
    
    private String isApp;

    public String getProId()
    {
        return proId;
    }

    public void setProId(String proId)
    {
        this.proId = proId;
    }

    public String getIsPc()
    {
        return isPc;
    }

    public void setIsPc(String isPc)
    {
        this.isPc = isPc;
    }

    public String getIsWeixin()
    {
        return isWeixin;
    }

    public void setIsWeixin(String isWeixin)
    {
        this.isWeixin = isWeixin;
    }

    public String getIsApp()
    {
        return isApp;
    }

    public void setIsApp(String isApp)
    {
        this.isApp = isApp;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }
}
