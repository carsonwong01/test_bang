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
@RequestMapping("/common")
public class CommonController
{
    
    public String inferce = "/common"; // 映射地址
    
    public String app_inferce = FileUtil.getValueProperties("app_inferce"); //接口地址
    
    public String version = FileUtil.getValueProperties("app_version"); //版本
    
    public String serverAddress = app_inferce + inferce ; //完整地址
    
    /*
     * 获取验证码
    */
    @ResponseBody
    @RequestMapping(value = "/message/v/verifyCode")
    public String verifyCode(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/message/v/verifyCode");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("verifyMethod", request.getParameter("verifyMethod"));
    	map.put("type", request.getParameter("type"));
    	map.put("verifyCode", request.getParameter("verifyCode"));
    	
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,null);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 校验验证码
     */
    @ResponseBody
    @RequestMapping(value = "/message/v/commonVerifyCode")
    public String commonVerifyCode(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/message/v/commonVerifyCode");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("verifyMethod", request.getParameter("verifyMethod"));
    	map.put("type", request.getParameter("type"));
    	map.put("verifyCode", request.getParameter("verifyCode"));
    	
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,null);
    	
    	return httpBase.getRespondata();
    	
    }
    
    
    
}
