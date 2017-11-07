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
import com.dimeng.model.user.FindAddressDetailReq;
import com.dimeng.model.user.NotPageUserIdReq;
import com.dimeng.model.user.UpdateAddressReq;

/**
 * 用户收货地址管理
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月14日]
 */
public interface UserAddressManageService
{
    /**
     * 收货地址管理-查询
     * <功能详细描述>
     * @return
     */
    public BaseDataResp findAddress(NotPageUserIdReq req);
    
    /**
     * 收货地址管理-查看地址详情
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException 
     */
    public BaseDataResp findAddressDetail(FindAddressDetailReq req)
        throws ServicesException;
    
    /**
     * 收货地址管理-添加/修改/删除收货地址
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException 
     * @throws InvocationTargetException 
     * @throws IllegalAccessException 
     * @throws InstantiationException 
     */
    public BaseDataResp updateAddress(UpdateAddressReq req)
        throws ServicesException, InstantiationException, IllegalAccessException, InvocationTargetException;
}
