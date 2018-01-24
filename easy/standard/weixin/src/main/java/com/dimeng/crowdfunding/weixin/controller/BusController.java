package com.dimeng.crowdfunding.weixin.controller;

import com.dimeng.crowdfunding.weixin.util.FileUtil;
import com.dimeng.crowdfunding.weixin.util.HttpBase;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

//@Scope("prototype")
@Controller
@RequestMapping("/bus")
public class BusController
{
    
    public String inferce = "/bus"; // 映射地址
    
    public String app_inferce = FileUtil.getValueProperties("app_inferce"); //接口地址
    
    public String version = FileUtil.getValueProperties("app_version"); //版本
    
    public String serverAddress = app_inferce + inferce ; //完整地址
    
    /*
     * 查询某项目所有项目验证审核列表
     */
    @ResponseBody
    @RequestMapping(value = "/auditingManage/v/authenticatedRecord")
    public String isProAuthenticated(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/auditingManage/v/authenticatedRecord");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("id", request.getParameter("valiId"));//验证ID
    	map.put("isFront","1");//项目ID
    	map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata(); 
    }

}
