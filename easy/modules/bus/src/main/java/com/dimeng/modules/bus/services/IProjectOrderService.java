/*
 * 文 件 名:  IProjectOrderService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月14日
 */
package com.dimeng.modules.bus.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.model.bus.FindSupportListReq;
import com.dimeng.model.bus.FindUserSupportListReq;
import com.dimeng.model.bus.UpdateOrderSupportReq;
import com.dimeng.model.common.IdReq;

/**
 * 用户订单管理接口
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月14日]
 */
public interface IProjectOrderService
{
    
    /**
     * 项目支持订单列表
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findSupportList(FindSupportListReq req)
        throws Exception;
    
    /**
     * 发货
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp updateOrderSupport(UpdateOrderSupportReq req)
        throws Exception;
    
    /**
     * 我支持的项目订单列表
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findUserSupportList(FindUserSupportListReq req)
        throws Exception;
    
    /**
     * 用户取消订单
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException 
     */
    public BaseDataResp commonCancelOrder(IdReq req)
        throws ServicesException;
    
    /**
     * 用户确认收货
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException 
     */
    public BaseDataResp commonConfirmReceipt(IdReq req)
        throws ServicesException;
}
