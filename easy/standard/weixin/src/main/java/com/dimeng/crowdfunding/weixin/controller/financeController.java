package com.dimeng.crowdfunding.weixin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dimeng.crowdfunding.weixin.util.FileUtil;
import com.dimeng.crowdfunding.weixin.util.HttpBase;

//@Scope("prototype")
@Controller
@RequestMapping("/finance")
public class financeController
{
    
    public String inferce = "/finance"; // 映射地址
    
    public String app_inferce = FileUtil.getValueProperties("app_inferce"); // 接口地址
    
    public String version = FileUtil.getValueProperties("app_version"); // 版本
    
    public String serverAddress = app_inferce + inferce; // 完整地址
    
    
    /*
     * 发起项目订单支持详情
     */
    @ResponseBody
    @RequestMapping(value = "/paymentManage/v/supportDetail")
    public String supportDetail(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/paymentManage/v/supportDetail");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("orderId", request.getParameter("orderId"));//订单id
        map.put("orderNo", request.getParameter("orderNo"));//订单编号
     
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    /*
     * 支持订单
     */
    @ResponseBody
    @RequestMapping(value = "/paymentManage/v/support")
    public String support(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/paymentManage/v/support");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("projectId", request.getParameter("projectId"));//项目id（Y）
    	map.put("amount", request.getParameter("amount"));//支持金额（Y）
    	map.put("returnId", request.getParameter("returnId"));//回报/梦想ID（N）
    	map.put("returnNumber", request.getParameter("returnNumber"));//回报数量（N）
    	map.put("deliveryAddrId", request.getParameter("deliveryAddrId"));//收货地址ID（N）
    	map.put("message", request.getParameter("message"));//项目留言（N）
      	map.put("userIP", request.getParameter("userIP"));//用户IP（N）
    	map.put("opSource","2");//微信2
    	
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 申请提现
     */
    @ResponseBody
    @RequestMapping(value = "/withdrawManage/v/insertWithdraw")
    public String insertWithdraw(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/withdrawManage/v/insertWithdraw");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("bankCardId", request.getParameter("bankCardId"));//订单id
        map.put("withdrawAmt", request.getParameter("withdrawAmt"));//订单编号
     
        map.put("opSource", "2");//微信标识
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    /*
     * 支付订单
     */
    @ResponseBody
    @RequestMapping(value = "/paymentManage/{v}/payOrder")
    public String payOrder(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/paymentManage/{v}/payOrder");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("orderId", request.getParameter("orderId"));//订单id
    	map.put("userIP", request.getParameter("userIP"));//用户ip
    	
    	map.put("opSource", "2");//微信标识
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata(); 
    }
    /*
     * 支付订单结果详情
     */
    @ResponseBody
    @RequestMapping(value = "/paymentManage/v/supportOrderStatus")
    public String supportOrderStatus(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/paymentManage/v/supportOrderStatus");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("orderId", request.getParameter("orderId"));//订单id
    	
    	map.put("opSource", "2");//微信标识
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata(); 
    }
    
}
