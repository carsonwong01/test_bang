package com.dimeng.modules.user.services;

import com.dimeng.entity.table.user.TUserNotify;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.model.user.FindByUserIdReq;

public interface NotifyManageService
{
    /**
     * 用户免打扰查询
     * <功能详细描述>
     * @return
     */
    public BaseDataResp findNotify(FindByUserIdReq req);
    
    /**
     * 修改用户消息通知设置
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp updateNotify(TUserNotify req)  throws  ServicesException;
}
