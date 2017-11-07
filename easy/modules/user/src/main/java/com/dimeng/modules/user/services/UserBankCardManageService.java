/*
 * 文 件 名:  AddressManageService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月14日
 */
package com.dimeng.modules.user.services;

import java.lang.reflect.InvocationTargetException;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.user.AddBankCardReq;
import com.dimeng.model.user.NotPageUserIdReq;

/**
 * 银行卡管理
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月14日]
 */
public interface UserBankCardManageService
{
    /**
     * 银行卡管理-查询银行卡列表
     * <功能详细描述>
     * @param id
     * @return
     */
    public BaseDataResp findCardList(NotPageUserIdReq req);
    
    /**
     * 添加银行卡
     * <功能详细描述>
     * @param req
     * @return
     * @throws InvocationTargetException 
     * @throws IllegalAccessException 
     * @throws InstantiationException 
     * @throws ServicesException 
     * @throws Throwable 
     */
    public BaseDataResp insertBankCard(AddBankCardReq req)
        throws InstantiationException, IllegalAccessException, InvocationTargetException, ServicesException, Throwable;
    
    /**
     * 删除银行卡
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException 
     */
    public BaseDataResp deleteBankCard(IdReq req)
        throws ServicesException;
}
