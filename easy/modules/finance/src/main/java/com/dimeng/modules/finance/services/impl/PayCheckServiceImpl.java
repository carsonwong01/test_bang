/*
 * 文 件 名:  IRechargeService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  chenwb
 * 修改时间:  2016年1月13日
 */
package com.dimeng.modules.finance.services.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dimeng.enums.variable.CommonVariables;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.model.pay.OrderPayCheckReq;
import com.dimeng.modules.finance.services.IFinanceManageService;
import com.dimeng.modules.finance.services.IPayCheckService;
import com.dimeng.utils.SystemCache;

/**
 * 线上支付对账接口实现类
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年1月13日]
 */
@Service("payCheckService")
public class PayCheckServiceImpl extends BaseServiceImpl implements IPayCheckService
{
    
    @Resource
    private IFinanceManageService financeManageService;
	@Override
	public BaseDataResp invokeService(OrderPayCheckReq req) throws Exception,
			Throwable {
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
	public String commonCreateOrder(OrderPayCheckReq req) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseDataResp commonSubmit(String orderId, Map<String, Object> param)
			throws Exception, Throwable {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseDataResp commonSubmit(OrderPayCheckReq req,
			Map<String, Object> param) throws Exception, Throwable {
	 return null;
	}

	@Override
	public void commconSubmitAll(String[] orderIds, Map<String, Object> param)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BaseDataResp commonConfirm(String orderId, Map<String, Object> param)
			throws Exception {
	    return financeManageService.commonSupportCheckCallBack(orderId, param);
	    
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderPayCheckReq findOrder(String orderId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
 
    
}
