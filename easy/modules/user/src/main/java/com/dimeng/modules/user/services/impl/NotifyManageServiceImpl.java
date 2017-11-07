package com.dimeng.modules.user.services.impl;

import org.springframework.stereotype.Service;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.table.user.TUserNotify;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.model.user.FindByUserIdReq;
import com.dimeng.modules.user.services.NotifyManageService;
import com.dimeng.utils.LoginCache;

/**
 * 用户消息通知管理service-免打扰设置
 * @author  song
 * @version  [版本号, 2016年10月17日]
 */
@Service
public class NotifyManageServiceImpl extends BaseServiceImpl implements NotifyManageService
{

    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findNotify(FindByUserIdReq req)
    {
        TUserNotify notify = new TUserNotify();
        notify.setUserId(req.getUserId());
        BaseDataResp resp = new BaseDataResp();
        notify = (TUserNotify)baseDao.findById(notify);
        resp.setData(notify); 
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateNotify(TUserNotify req) throws ServicesException
    {
        BaseDataResp resp = new BaseDataResp();
        if(LoginCache.getFrontUserInfo() != null){
            req.setUserId(LoginCache.getFrontUserInfo().getUserId());
            if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(req))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
            }
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            return resp;
        } 
        return null;
    }
    
}
