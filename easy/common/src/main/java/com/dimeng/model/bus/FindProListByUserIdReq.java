package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 用户管理-用户信息-用户发起的项目列表
 * @author  song
 * @version  [版本号, 2016年10月8日]
 */
public class FindProListByUserIdReq extends FindExportExcelParamsReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -2476160250281667748L;
    
    /**
     * 用户id
     */
    @NotBlank
    private String id;
    
    private String proNum;
    
    private String proName;
    
    private String proStatus;
    
    private String proType;

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getProNum()
    {
        return proNum;
    }

    public void setProNum(String proNum)
    {
        this.proNum = proNum;
    }

    public String getProName()
    {
        return proName;
    }

    public void setProName(String proName)
    {
        this.proName = proName;
    }

    public String getProStatus()
    {
        return proStatus;
    }

    public void setProStatus(String proStatus)
    {
        this.proStatus = proStatus;
    }

    public String getProType()
    {
        return proType;
    }

    public void setProType(String proType)
    {
        this.proType = proType;
    }
    
}
