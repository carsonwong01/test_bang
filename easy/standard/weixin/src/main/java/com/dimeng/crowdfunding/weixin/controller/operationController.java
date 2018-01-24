package com.dimeng.crowdfunding.weixin.controller;

import com.dimeng.crowdfunding.weixin.util.FileUtil;
import com.dimeng.crowdfunding.weixin.util.HttpBase;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

//@Scope("prototype")
@Controller
@RequestMapping("/operation")
public class operationController
{
    
    public String inferce = "/operation"; // 映射地址
    
    public String app_inferce = FileUtil.getValueProperties("app_inferce"); //接口地址
    
    public String version = FileUtil.getValueProperties("app_version"); //版本
    
    public String serverAddress = app_inferce + inferce ; //完整地址
    
    /*
     * 项目标签
    */
    @ResponseBody
    @RequestMapping(value = "/basicInfoSet/v/findLabels")
    public String findLabels(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String url = new String(serverAddress + "/basicInfoSet/v/findLabels");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("projectType", request.getParameter("projectType"));
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata();
        
    }
    /*
     * 项目验证示例图
     */
    @ResponseBody
    @RequestMapping(value = "/basicInfoSet/v/findImgModel")
    public String findImgModel(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/basicInfoSet/v/findImgModel");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	String templateId = request.getParameter("templateId");
    	
    	if(StringUtils.isNotEmpty(templateId)){//不传id则查询全部 1用户头像2项目封面3身份证示例图片4医疗证明样例图片
    		map.put("templateId", templateId);
    	}
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 查询提现设置常量
    */
    @ResponseBody
    @RequestMapping(value = "/basicInfoSet/v/findWithdrawSet")
    public String findWithdrawSet(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String url = new String(serverAddress + "/basicInfoSet/v/findWithdrawSet");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("opSource", "2");
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata();
        
    }
    
    /*
     * 意见反馈
     */
    @ResponseBody
    @RequestMapping(value = "/feedback/v/suggestion")
    public String suggestion(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/feedback/v/suggestion");
    	
    	HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("feedbackDetails", request.getParameter("feedbackDetails"));//意见内容
        map.put("contactEmail", request.getParameter("contactEmail"));//联系邮箱
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    	
    }

}
