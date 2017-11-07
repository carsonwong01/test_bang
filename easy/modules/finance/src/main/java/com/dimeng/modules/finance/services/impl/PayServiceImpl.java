/*
 * 文 件 名:  IRechargeService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  chenwb
 * 修改时间:  2016年1月13日
 */
package com.dimeng.modules.finance.services.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.finance.SupportDetailResp;
import com.dimeng.entity.table.order.TOrderSupport;
import com.dimeng.enums.PaysFunctionNumCode;
import com.dimeng.enums.QOrderStatusEnum;
import com.dimeng.enums.variable.CommonVariables;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.model.pay.OrderPayReq;
import com.dimeng.modules.finance.services.IOrderManageService;
import com.dimeng.modules.finance.services.IPayService;
import com.dimeng.utils.SystemCache;

/**
 * 线上支付接口
 * 
 * @author sunqiuyan
 * @version [版本号, 2016年1月13日]
 */
@Service("payService")
public class PayServiceImpl extends BaseServiceImpl implements IPayService
{
    
    @Resource
    private IOrderManageService orderManageService;
    
    @Override
    public BaseDataResp invokeService(OrderPayReq req)
        throws Exception, Throwable
    {
        String orderId = this.commonCreateOrder(req);
        boolean isTrue = Boolean.parseBoolean(SystemCache.getProperty(CommonVariables.IS_TRUST));
        Map<String, Object> param = new HashMap<String, Object>();
        if (isTrue)
        {
            return this.commonSubmit(req, param);
        }
        else
        {
            this.commonSubmit(orderId, param);
            return this.commonConfirm(orderId, param);
        }
    }
    
    @Override
    public String commonCreateOrder(OrderPayReq req)
        throws Exception
    {
        // TODO Auto-generated method stub
        return req.getOrderId();
    }
    
    @Override
    public BaseDataResp commonSubmit(String orderId, Map<String, Object> param)
        throws Exception, Throwable
    {
        
        return null;
    }
    
    @Override
    public BaseDataResp commonSubmit(OrderPayReq req, Map<String, Object> param)
        throws Exception, Throwable
    {
        // TODO Auto-generated method stub
        return null;
    }
    
    @Override
    public void commconSubmitAll(String[] orderIds, Map<String, Object> param)
        throws Exception
    {
        // TODO Auto-generated method stub
        
    }
    
    @Override
    public BaseDataResp commonConfirm(String orderId, Map<String, Object> param)
        throws Exception
    {
        return orderManageService.commonSupportCallBack(orderId, param);
    }
    
    @Override
    public void commonConfirmAll(String[] orderIds, Map<String, Object> param)
        throws Exception
    {
        // TODO Auto-generated method stub
        
    }
    
    @Override
    public BaseDataResp doSubmit(String orderId, Map<String, Object> param)
        throws Exception
    {
        // TODO Auto-generated method stub
        return null;
    }
    
    @Override
    public BaseDataResp doConfirm(String orderId, Map<String, Object> param)
        throws Exception
    {
        // TODO Auto-generated method stub
        return null;
    }
    
    @Override
    public BaseDataResp commonOrderFail(String orderId, Map<String, Object> param)
        throws Exception
    {
        // TODO Auto-generated method stub
        return null;
    }
    
    @Override
    public OrderPayReq findOrder(String orderId)
        throws Exception
    {
        QueryEvent event = new QueryEvent();
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setOrderId(orderId);
        event.setObj(orderSupport);
        event.setStatement("findOrderSupportPay");
        SupportDetailResp supportDetailResp = (SupportDetailResp)baseDao.findOneByCustom(event);
        
        OrderPayReq orderPayReq = new OrderPayReq();
        orderPayReq.setPayType(PaysFunctionNumCode.WECHATPAY.functionNumCode());
        orderPayReq.setOrderId(supportDetailResp.getOrderId());
        orderPayReq.setOrderNo(supportDetailResp.getOrderNo());
        orderPayReq.setAmount(new BigDecimal(supportDetailResp.getAmount()));
        orderPayReq.setBody(supportDetailResp.getProjectTile());
        //        orderPayReq.setOrderDatetime(orderSupport.getDateCreate().toString());
        event.setStatement("findUserOpenId");
        event.putParameter("id", supportDetailResp.getUserId());
        String openId = (String)baseDao.findOneByCustom(event);
        System.out.println("=-==============" + openId);
        orderPayReq.setOpenId(openId);
        orderPayReq.setUserIp("");
        return orderPayReq;
    }
    
}
