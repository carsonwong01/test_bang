/*
 * 文 件 名:  ProjectOrderController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月14日
 */
package com.dimeng.platform.controller.bus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.bus.FindSupportListReq;
import com.dimeng.model.bus.FindUserSupportListReq;
import com.dimeng.model.bus.UpdateOrderSupportReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.modules.bus.services.IProjectOrderService;
import com.dimeng.utils.LoginCache;

/**
 * 用户订单管理控制器
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月14日]
 */
@Controller
@RequestMapping(value = "project/order")
public class ProjectOrderController extends BaseController
{
    
    @Autowired
    IProjectOrderService projectOrderService;
    
    /**
     * 项目支持订单列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "{v}/supportList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findSupportList(HttpEntity<FindSupportListReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectOrderService.findSupportList(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 发货
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "{v}/post", method = RequestMethod.POST, produces = {"application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object updateOrderSupport(HttpEntity<UpdateOrderSupportReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectOrderService.updateOrderSupport(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 我支持的项目订单列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "{v}/user/supportList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findUserSupportList(HttpEntity<FindUserSupportListReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectOrderService.findUserSupportList(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 用户取消订单
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "{v}/user/cancel", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object cancelOrder(HttpEntity<IdReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectOrderService.commonCancelOrder(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 用户确认收货
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "{v}/user/confirmReceipt", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object commonConfirmReceipt(HttpEntity<IdReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectOrderService.commonConfirmReceipt(httpEntity.getBody());
        }
        return resp;
    }
    
}
