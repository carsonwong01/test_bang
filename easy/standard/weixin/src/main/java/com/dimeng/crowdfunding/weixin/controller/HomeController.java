package com.dimeng.crowdfunding.weixin.controller;

import com.dimeng.crowdfunding.weixin.util.FileUtil;
import com.dimeng.crowdfunding.weixin.util.HttpBase;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

//@Scope("prototype")
@Controller
@RequestMapping("/home")
public class HomeController
{
    
    public String inferce = "/home"; // 映射地址
    
    public String app_inferce = FileUtil.getValueProperties("app_inferce"); //接口地址
    
    public String version = FileUtil.getValueProperties("app_version"); //版本
    
    public String serverAddress = app_inferce + inferce ; //完整地址
    
    /*
     * 首页数据及轮播图
     * 
     * */
    @ResponseBody
    @RequestMapping(value = "/frontInfo/v/frontTotalInfo")
    public String frontTotalInfo(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String url = new String(serverAddress + "/frontInfo/v/frontTotalInfo");

        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        
        map.put("opSource", "2");
       
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,null);
        
        return httpBase.getRespondata();
        
    }
   
    /*
     * 登录
    */
    @ResponseBody
    @RequestMapping(value = "/frontInfo/v/loginCheck")
    public String loginCheck(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/frontInfo/v/loginCheck");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("userName", request.getParameter("phoneNumber"));
    	map.put("loginYzm", request.getParameter("loginYzm"));
    	map.put("source", "2");//1是PC  2是微信  3是安卓   4是IOS
    	
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,null);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 绑定登录登录
     */
    @ResponseBody
    @RequestMapping(value = "/frontInfo/v/frontRegisterUser")
    public String frontRegisterUser(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/frontInfo/v/frontRegisterUser");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("openid", request.getParameter("openid"));
    	map.put("token", request.getParameter("token"));
    	map.put("tokenExpireIn", request.getParameter("tokenExpireIn"));
    	map.put("headPortrait", request.getParameter("headImgUrl"));
    	map.put("nickname", request.getParameter("nickname"));
    	map.put("sex", request.getParameter("sex"));
    	map.put("thirdType", request.getParameter("thirdType"));//绑定来源  登录授权方式（1 手机  2 微信 3 微博 4 QQ 5 微信公众号）
    	map.put("phoneNumber", request.getParameter("phoneNumber"));
    	map.put("telCode", request.getParameter("loginYzm"));
    	map.put("unionId", request.getParameter("unionId"));
    	map.put("source", "2");//1是PC  2是微信  3是安卓   4是IOS
    	
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,null);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 首页推荐列表
     * 
     */
    @ResponseBody
    @RequestMapping(value = "/frontInfo/v/findRecommendList")
    public String findRecommendList(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String url = new String(serverAddress + "/frontInfo/v/findRecommendList");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        
//        map.put("opSource", "2");
        map.put("reqPageNum", request.getParameter("reqPageNum"));
        map.put("maxResults", request.getParameter("maxResults"));
//        map.put("tagType", request.getParameter("tagType"));
        map.put("projectType", request.getParameter("projectType"));
        map.put("opSource", "2");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,null);
        
        return httpBase.getRespondata();
        
    }
    /*
     * 上传项目图片附件
     */
    @ResponseBody
    @RequestMapping(value = "/appData/v/uploadAttachment")
    public String uploadAttachment(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/appData/v/uploadAttachment");
    	Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("fileType", request.getParameter("fileType"));//图片类型
        
        
        
        MultipartHttpServletRequest multipartRequest = null;  
        LinkedList<MultipartFile> files = null;  
        List<MultipartFile> test = new ArrayList<MultipartFile>(0);  
        try 
        {  
            multipartRequest = (MultipartHttpServletRequest) request;  
            Iterator<String> iter = multipartRequest.getFileNames();
            while (iter.hasNext()) 
            {
                // 取得上传文件
            	files = (LinkedList<MultipartFile>) multipartRequest.getFiles(iter.next());
            	test.add(files.getFirst());
            }
        } 
        catch (Exception e) 
        {  
        	e.printStackTrace();
        }  
        map.put("opSource", "2");
    	HttpBase httpBase = new HttpBase();
    	httpBase.setReqData(map);
    	String Authorization = request.getHeader("Authorization");
    	httpBase.sendImg(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization,test);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 上传单独图片
     */
    @ResponseBody
    @RequestMapping(value = "/appData/v/uploadFile")
    public String uploadFile(@RequestParam("file") MultipartFile file,HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/appData/v/uploadFile");
    	Map<String, String> map = new HashMap<String, String>();
    	
    	List<MultipartFile> test = new ArrayList<MultipartFile>(0);  
    	test.add(file);
    	
    	String Authorization = request.getHeader("Authorization");
    	HttpBase httpBase = new HttpBase();
    	httpBase.sendImg(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization,test);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 退出登录
     * 
     */
    @ResponseBody
    @RequestMapping(value = "/frontInfo/v/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String url = new String(serverAddress + "/frontInfo/v/logout");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("opSource", "2");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,null);
        
        return httpBase.getRespondata();
        
    }
}
