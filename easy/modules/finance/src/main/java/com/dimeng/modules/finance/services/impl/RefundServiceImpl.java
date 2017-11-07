/*
 * 文 件 名:  IRechargeService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  chenwb
 * 修改时间:  2016年1月13日
 */
package com.dimeng.modules.finance.services.impl;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.table.order.TOrderSupport;
import com.dimeng.enums.OrderCheckStatusEnum;
import com.dimeng.enums.QOrderStatusEnum;
import com.dimeng.enums.variable.CommonVariables;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.model.finance.FindRefundListReq;
import com.dimeng.model.pay.RefundCheckReq;
import com.dimeng.model.pay.RefundReq;
import com.dimeng.modules.finance.services.IRefundService;
import com.dimeng.utils.SystemCache;
 

/**
 * 退款接口
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年1月13日]
 */
@Service("refundService")
public class RefundServiceImpl extends BaseServiceImpl implements IRefundService
{

	@Override
	public BaseDataResp invokeService(List<RefundReq> req) throws Exception,
			Throwable {
	    String orderId = this.commonCreateOrder(req);
        boolean isTrue = Boolean.parseBoolean(SystemCache.getProperty(CommonVariables.IS_TRUST));
        Map<String, Object> param = new HashMap<String, Object>();
        if (isTrue)
        {
            return   commonSubmit(req,   param);
        }
        else
        {
            this.commonSubmit(orderId, param);
            return this.commonConfirm(orderId, param);
        }
	}

	@Override
	public String commonCreateOrder(List<RefundReq> req) throws Exception {
	     
		return null;
	}

	@Override
	public BaseDataResp commonSubmit(String orderId, Map<String, Object> param)
			throws Exception, Throwable {
	    BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        //锁定订单表记录
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setOrderId(orderId);
        orderSupport = (TOrderSupport)baseDao.findById(orderSupport);
        resp.setCode(IDiMengResultCode.OrderManager.ERROR_ORDER_PAY_FAIL);
        if (IDiMengResultCode.Commons.SUCCESS.equals(param.get("resultCode")))
        {
            orderSupport.setRefundCheckStatus(OrderCheckStatusEnum.WDZ.getDataBaseVal());
            //更新订单状态
            if (baseDao.update(orderSupport) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
            }
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            
        }
        
        return resp;
	 
	}
 
	@Override
	public void commconSubmitAll(String[] orderIds, Map<String, Object> param)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BaseDataResp commonConfirm(String orderId, Map<String, Object> param)
			throws Exception {
	    
	    BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        //锁定订单表记录
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setOrderId(orderId);
        orderSupport = (TOrderSupport)baseDao.findById(orderSupport);
        resp.setCode(IDiMengResultCode.OrderManager.ERROR_ORDER_OP_FAIL);
        if (IDiMengResultCode.Commons.SUCCESS.equals(param.get("resultCode")))
        {
            
            orderSupport.setStatus(QOrderStatusEnum.YTK.getDataBaseVal());
            //更新订单状态
            if (baseDao.update(orderSupport) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
            }
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            
        }
        
        return resp;
     
    }
	@Override
	public void commonConfirmAll(String[] orderIds, Map<String, Object> param)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BaseDataResp doSubmit(String orderId, Map<String, Object> param)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseDataResp doConfirm(String orderId, Map<String, Object> param)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseDataResp commonOrderFail(String orderId,
			Map<String, Object> param) throws Exception { 

	    BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        //锁定订单表记录
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setOrderId(orderId);
        orderSupport = (TOrderSupport)baseDao.findById(orderSupport);
        resp.setCode(IDiMengResultCode.OrderManager.ERROR_ORDER_OP_FAIL);
      
        orderSupport.setStatus(QOrderStatusEnum.DTK.getDataBaseVal());
        orderSupport.setRefundCheckStatus("");
        //更新订单状态
        if (baseDao.update(orderSupport) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        
		return resp;
	}

    
    @Override
     public    List<RefundReq> getRefundList(String type){
         FindRefundListReq findRefundListReq=new FindRefundListReq();
         findRefundListReq.setType(type);
         QueryEvent<FindRefundListReq> event = new QueryEvent<FindRefundListReq>();
         event.setStatement("findJobRefundList");
         event.setObj(findRefundListReq);
         return baseDao.findAllIsPageByCustom(event);
         
     }

    @Override
    public BaseDataResp commonSubmit(List<RefundReq> list, Map<String, Object> param)
        throws Exception, Throwable
    {
        // TODO Auto-generated method stub
        return null;
    }

 
     
    
    
}
