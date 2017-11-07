/*
 * 文 件 名:  IAbst.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  chenwb
 * 修改时间:  2016年1月17日
 */
package com.dimeng.modules.finance.services.base;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.pay.OrderPayCheckReq;
import com.dimeng.model.pay.RefundCheckReq;
import com.dimeng.model.pay.RefundReq;

/**
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年1月17日]
 */
public interface BaseCommonInterface<T> 
{
    
    /**
     * Controller统一入口
     * @author  chenwb
     * @param findRefundReq
     * @return
     * @throws Exception
     * @throws Throwable 
     */
    public BaseDataResp invokeService(T req)
        throws Exception, Throwable;

    /**
     * 生成订单
     * <功能详细描述>
     * @author  chenwb
     * @param req
     * @return
     * @throws Exception;
     */
    public String commonCreateOrder(T req)
        throws Exception;

  
    /**
     * 提交订单
     * <功能详细描述>
     * @author  chenwb
     * @param orderId
     * @param param
     * @return
     * @throws Exception;
     * @throws Throwable 
     */
    public BaseDataResp commonSubmit(String orderId, Map<String, Object> param)
        throws Exception, Throwable;
    /**
     * 提交订单
     * <功能详细描述>
     * @author  chenwb
     * @param orderId
     * @param param
     * @return
     * @throws Exception;
     * @throws Throwable 
     */
    public BaseDataResp commonSubmit(T req,Map<String, Object> param)
        throws Exception, Throwable;
    
    
    /**
     * 提交订单
     * 批量处理
     * @author  chenwb
     * @param orderIds
     * @param param
     * @return
     * @throws Exception;
     */
    public void commconSubmitAll(String[] orderIds, Map<String, Object> param)
        throws Exception;
    
    /**
     * 确认订单
     * <功能详细描述>
     * @author  chenwb
     * @param orderId
     * @param param
     * @return
     * @throws Exception;
     */
    public BaseDataResp commonConfirm(String orderId, Map<String, Object> param)
        throws Exception;
    
    /**
     * 确认订单
     * 批量处理
     * @author  chenwb
     * @param orderId
     * @param param
     * @return
     * @throws Exception;
     */
    public void commonConfirmAll(String[] orderIds, Map<String, Object> param)
        throws Exception;
        
     
    
    /**
     * 提交订单
     * <功能详细描述>
     * @author  chenwb
     * @param orderId
     * @param param
     * @return
     * @throws Exception;
     */
    public BaseDataResp doSubmit(String orderId, Map<String, Object> param)
        throws Exception;
    
    /**
     * 确认订单
     * <功能详细描述>
     * @author  chenwb
     * @param orderId
     * @param param
     * @return
     * @throws Exception;
     */
    public BaseDataResp doConfirm(String orderId, Map<String, Object> param)
        throws Exception;
    
    /**
     * 失败订单
     * <功能详细描述>
     * @author  chenwb
     * @param orderId
     * @param param
     * @return
     * @throws Exception;
     */
    public BaseDataResp commonOrderFail(String orderId, Map<String, Object> param)
        throws Exception;


	 

 
  

}
