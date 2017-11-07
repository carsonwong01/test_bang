package com.dimeng.model.user;

import com.dimeng.framework.domain.BasePageReq;

public class FindFreezeProReq extends BasePageReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 5252536013797659637L;
    
    /**
     * 用户id
     */
    private String userId;

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }
    
}
