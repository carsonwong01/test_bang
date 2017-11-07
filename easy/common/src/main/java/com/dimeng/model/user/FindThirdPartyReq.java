package com.dimeng.model.user;

import com.dimeng.model.expand.FindExportExcelParamsReq;

public class FindThirdPartyReq extends FindExportExcelParamsReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 2574327553673915281L;
    
    private String userId;
    
    private String id;
    
    private String type;
    
    private String opendId;

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getOpendId()
    {
        return opendId;
    }

    public void setOpendId(String opendId)
    {
        this.opendId = opendId;
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
