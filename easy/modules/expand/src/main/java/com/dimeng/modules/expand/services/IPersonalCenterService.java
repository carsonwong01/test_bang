package com.dimeng.modules.expand.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.model.expand.UpdateUserBaseInfoReq;
import com.dimeng.model.user.NotPageUserIdReq;
import com.dimeng.model.user.UpdateTradePasswordReq;

/**
 * <前台个人中心service接口>
 * <功能详细描述>
 * 
 * @author wenguanhai
 * @version  [版本号, 2016年1月14日]
 */
public interface IPersonalCenterService
{
    /**
     * 更新用户交易密码
     * 适用：
     * 1、设置交易密码
     * 2、修改交易密码
     * 3、找回交易密码
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp updateTradePwd(UpdateTradePasswordReq req)
        throws Exception;
    
    /**
     * 检查用户是否已设置过交易密码
     * <功能详细描述>
     * @param userId
     * @return
     * @throws ServicesException
     */
    public BaseDataResp checkSettingTradePwd(NotPageUserIdReq req)
        throws ServicesException;
    
    /**
     * <修改个人用户基本信息>
     * <功能详细描述>
     * @author  liuzhen
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp updateUserBaseInfo(UpdateUserBaseInfoReq req)
        throws Exception;
    
}
