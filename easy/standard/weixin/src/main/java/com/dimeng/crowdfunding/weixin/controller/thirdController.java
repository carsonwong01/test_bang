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
@RequestMapping("/thirdAuthorize")
public class thirdController
{
    
    public String inferce = "/thirdAuthorize"; // 映射地址
    
    public String app_inferce = FileUtil.getValueProperties("app_inferce"); //接口地址
    
    public String version = FileUtil.getValueProperties("app_version"); //版本
    
    public String serverAddress = app_inferce + inferce ; //完整地址
    
    /*
     * 微信授权
    */
    @ResponseBody
    @RequestMapping(value = "/v/gzhCallback")
    public String gzhCallback(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/v/gzhCallback");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("code", request.getParameter("code"));//授权返回code
        map.put("opSource", "2");//微信标识
        map.put("sourceType", "5");//授权类型
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    /*
     * 微博授权
     */
    @ResponseBody
    @RequestMapping(value = "/v/wbCallback")
    public String wbCallback(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/v/wbCallback");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("code", request.getParameter("code"));//授权返回code
        map.put("opSource", "2");//微信标识
        map.put("sourceType", "3");//授权类型
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata(); 
    }
    /*
     * QQ授权
     */
    @ResponseBody
    @RequestMapping(value = "/v/qqCallback")
    public String qqCallback(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/v/qqCallback");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("code", request.getParameter("code"));//授权返回code
        map.put("opSource", "2");//微信标识
        map.put("sourceType", "4");//授权类型
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata(); 
    }
}
