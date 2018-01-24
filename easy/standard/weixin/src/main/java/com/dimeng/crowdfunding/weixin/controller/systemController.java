package com.dimeng.crowdfunding.weixin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dimeng.crowdfunding.weixin.util.DataUtil;
import com.dimeng.crowdfunding.weixin.util.FileUtil;
import com.dimeng.crowdfunding.weixin.util.HttpBase;

//@Scope("prototype")
@Controller
@RequestMapping("/system")
public class systemController
{
    
    public String inferce = "/system"; // 映射地址
    
    public String app_inferce = FileUtil.getValueProperties("app_inferce"); //接口地址
    
    public String version = FileUtil.getValueProperties("app_version"); //版本
    
    public String serverAddress = app_inferce + inferce ; //完整地址
    
    /*
     * 省、市、区地址
     */
    @ResponseBody
    @RequestMapping(value = "/common/v/provincialLeague")
    public String provincialLeague(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/common/v/provincialLeague");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	String provinceId = DataUtil.getParams(request, "provinceId");
    	String cityId = DataUtil.getParams(request, "cityId");
    	if(!StringUtils.isEmpty(provinceId)){
    		map.put("provinceId", provinceId);
    	}
    	if(!StringUtils.isEmpty(cityId)){
    		map.put("cityId", cityId);
    	}
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.GETMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    }
    
    
    /*
     * 系统常量
     */
    @ResponseBody
    @RequestMapping(value = "/cache/v/findCache")
    public String findCache(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/cache/v/findCache");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("key", request.getParameter("key"));
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    }
    
    /*
     * 获取用户缓存信息
     */
    @ResponseBody
    @RequestMapping(value = "/cache/v/findLoginCache")
    public String findLoginCache(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/cache/v/findLoginCache");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("key", request.getParameter("key"));
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    }
    
}
