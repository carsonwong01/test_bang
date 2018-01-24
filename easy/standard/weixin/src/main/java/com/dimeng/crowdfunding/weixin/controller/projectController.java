package com.dimeng.crowdfunding.weixin.controller;

import com.alibaba.fastjson.JSON;
import com.dimeng.crowdfunding.weixin.model.ProjectReturnReq;
import com.dimeng.crowdfunding.weixin.util.DataUtil;
import com.dimeng.crowdfunding.weixin.util.FileUtil;
import com.dimeng.crowdfunding.weixin.util.HttpBase;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//@Scope("prototype")
@Controller
@RequestMapping("/project")
public class projectController
{
    
    public String inferce = "/project"; // 映射地址
    
    public String app_inferce = FileUtil.getValueProperties("app_inferce"); //接口地址
    
    public String version = FileUtil.getValueProperties("app_version"); //版本
    
    public String serverAddress = app_inferce + inferce ; //完整地址


    /*
     * 项目列表
     */
    @ResponseBody
    @RequestMapping(value = "/query/v/projectList")
    public String projetList(HttpServletRequest request,HttpServletResponse response)
            throws Exception{
        String url = new String(serverAddress+"/query/v/projectList");

        HttpBase httpBase = new HttpBase();
        Map<String,Object> map = new HashMap<String,Object>();

        map.put("reqPageNum", request.getParameter("reqPageNum"));
        map.put("maxResults", request.getParameter("maxResults"));
        map.put("projectId",request.getParameter("projectId"));
        map.put("opSource","2");

        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
                HttpBase.POSTMETHOD,Authorization);
        return httpBase.getRespondata();
    }


    /*
     * 项目详情
     */
    @ResponseBody
    @RequestMapping(value = "/query/v/projectDetails")
    public String projectDetails(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/query/v/projectDetails");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("projectId", request.getParameter("projectId"));//项目ID
        map.put("projectNo", request.getParameter("projectNo"));//项目编号
        map.put("userId", request.getParameter("userId"));//用户userId

        map.put("opSource", "2");//微信标识
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
   
    /*
     * 获取关注列表
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/collectionList")
    public String collectionList(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/operate/v/collectionList");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("reqPageNum", request.getParameter("reqPageNum"));////页数
        map.put("maxResults", request.getParameter("maxResults"));//每页显示几条
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    
    /*
     * 获取我的订单（支持）列表
     */
    @ResponseBody
    @RequestMapping(value = "/order/v/user/supportList")
    public String supportList(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/order/v/user/supportList");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("reqPageNum", request.getParameter("reqPageNum"));////页数
        map.put("maxResults", request.getParameter("maxResults"));//每页显示几条
        map.put("status", request.getParameter("status"));//每页显示几条
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    
    /*
     * 获取我发起的项目列表
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/myInitProjectList")
    public String myInitProjectList(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/operate/v/myInitProjectList");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("reqPageNum", request.getParameter("reqPageNum"));////页数
        map.put("maxResults", request.getParameter("maxResults"));//每页显示几条
        String projectStatus = request.getParameter("projectStatus");
        if(StringUtils.isNotEmpty(projectStatus)){
        	map.put("projectStatus", request.getParameter("projectStatus"));//状态
        }
        
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    
    /*
     * 项目动态
     */
    @ResponseBody
    @RequestMapping(value = "/query/v/dynamic")
    public String dynamic(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/query/v/dynamic");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("reqPageNum", request.getParameter("reqPageNum"));////页数
        map.put("maxResults", request.getParameter("maxResults"));//每页显示几条
        map.put("projectId", request.getParameter("projectId"));//项目编号
        map.put("userId", request.getParameter("userId"));//用户ID
        map.put("opSource", "2");//微信标识
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    /*
     * 发布回报项目
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/initReturnProject")
    public String initReturnProject(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/operate/v/initReturnProject");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	
    	List<ProjectReturnReq> returns = (List<ProjectReturnReq>) JSON.parseArray(request.getParameter("returnList"), ProjectReturnReq.class);

    	map.put("projectName", request.getParameter("projectName"));//项目标题
    	map.put("projectLabel", request.getParameter("projectLabel"));//项目标签(用逗号隔开，例如“,生鲜水果,良心之作,”)
    	map.put("targetAmount", DataUtil.getParams(request, "targetAmount"));//目标金额
    	map.put("financingDays", DataUtil.getParams(request, "financingDays"));//筹资期限
    	String isNeddAddr = DataUtil.getParams(request, "isNeddAddr");
    	map.put("isNeddAddr", isNeddAddr.equals("true")?"1":"2");//支持者提供收货地址（1：是,2：否）
    	//if("true".equals(isNeddAddr)){
    		map.put("freightDescribe", request.getParameter("freightDescribe"));//运费说明
    		map.put("deliverDescribe", request.getParameter("deliverDescribe"));//发货时间
    	//}
    	
    	map.put("projectIntro", request.getParameter("projectIntro"));//项目简介
    	map.put("projectDetails", request.getParameter("projectDetails"));//项目内容
    	String[] imgIds = request.getParameter("imgIds").split(",");//项目图片ID数组
    	map.put("imagesIds", imgIds);
    	map.put("coverImageId", DataUtil.getParams(request, "coverImageId"));//项目封面ID
    	map.put("coverImageUrl", DataUtil.getParams(request, "coverImageUrl"));//封面url
    	map.put("returnList", returns);//项目回报List
    	
    	map.put("opSource", "2");
    	
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 编辑回报项目
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/modifyReturnProject")
    public String modifyReturnProject(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/operate/v/modifyReturnProject");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	
    	List<ProjectReturnReq> returns = (List<ProjectReturnReq>) JSON.parseArray(request.getParameter("returnList"), ProjectReturnReq.class);
    	
    	map.put("projectId", request.getParameter("projectId"));//项目id
    	map.put("isOrdered", request.getParameter("isOrdered"));//项目是否有订单：1有2无
    	map.put("projectName", request.getParameter("projectName"));//项目标题
    	map.put("projectLabel", request.getParameter("projectLabel"));//项目标签(用逗号隔开，例如“,生鲜水果,良心之作,”)
    	map.put("targetAmount", DataUtil.getParams(request, "targetAmount"));//目标金额
    	map.put("financingDays", DataUtil.getParams(request, "financingDays"));//筹资期限
    	String isNeddAddr = DataUtil.getParams(request, "isNeddAddr");
    	map.put("isNeddAddr", isNeddAddr.equals("true")?"1":"2");//支持者提供收货地址（1：是,2：否）
    	if("true".equals(isNeddAddr)){
    		map.put("freightDescribe", request.getParameter("freightDescribe"));//运费说明
    		map.put("deliverDescribe", request.getParameter("deliverDescribe"));//发货时间
    	}
    	
    	map.put("projectIntro", request.getParameter("projectIntro"));//项目简介
    	map.put("projectDetails", request.getParameter("projectDetails"));//项目内容
    	String[] imgIds = request.getParameter("imgIds").split(",");//项目图片ID数组
    	map.put("imagesIds", imgIds);
    	map.put("coverImageId", DataUtil.getParams(request, "coverImageId"));//项目封面ID
    	map.put("coverImageUrl", DataUtil.getParams(request, "coverImageUrl"));//封面url
    	map.put("returnList", returns);//项目回报List
    	
    	map.put("opSource", "2");
    	
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 发布梦想项目
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/initDreamProject")
    public String initDreamProject(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/operate/v/initDreamProject");
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	List<ProjectReturnReq> returns = (List<ProjectReturnReq>) JSON.parseArray(request.getParameter("returnList"), ProjectReturnReq.class);

    	map.put("projectName", request.getParameter("projectName"));//项目标题
    	map.put("projectLabel", request.getParameter("projectLabel"));//项目标签(用逗号隔开，例如“,生鲜水果,良心之作,”)
    	map.put("targetAmount", DataUtil.getParams(request, "targetAmount"));//目标金额
    	map.put("financingDays", DataUtil.getParams(request, "financingDays"));//筹资期限
    	String isNeddAddr = DataUtil.getParams(request, "isNeddAddr");
    	map.put("isNeddAddr", isNeddAddr.equals("true")?"1":"2");//支持者提供收货地址（1：是,2：否）
    	if("true".equals(isNeddAddr)){
    		map.put("freightDescribe", request.getParameter("freightDescribe"));//运费说明
    		map.put("deliverDescribe", request.getParameter("deliverDescribe"));//发货时间
    	}
    	
    	map.put("projectIntro", request.getParameter("projectIntro"));//项目简介
    	map.put("projectDetails", request.getParameter("projectDetails"));//项目内容
    	
    	String[] imgIds = request.getParameter("imgIds").split(",");//项目图片ID数组
    	map.put("imagesIds", imgIds);
    	map.put("coverImageId", DataUtil.getParams(request, "coverImageId"));//项目封面ID
    	map.put("coverImageUrl", DataUtil.getParams(request, "coverImageUrl"));//封面url
    	
    	map.put("targetList", returns);//梦想目标List
    	
    	map.put("opSource", "2");
    	
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 编辑梦想项目
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/modifyDreamProject")
    public String modifyDreamProject(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/operate/v/modifyDreamProject");
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	List<ProjectReturnReq> returns = (List<ProjectReturnReq>) JSON.parseArray(request.getParameter("returnList"), ProjectReturnReq.class);
    	
    	map.put("projectId", request.getParameter("projectId"));//项目标题
    	map.put("isOrdered", request.getParameter("isOrdered"));//项目标题
    	map.put("projectName", request.getParameter("projectName"));//项目标题
    	map.put("projectLabel", request.getParameter("projectLabel"));//项目标签(用逗号隔开，例如“,生鲜水果,良心之作,”)
    	map.put("targetAmount", DataUtil.getParams(request, "targetAmount"));//目标金额
    	map.put("financingDays", DataUtil.getParams(request, "financingDays"));//筹资期限
    	String isNeddAddr = DataUtil.getParams(request, "isNeddAddr");
    	map.put("isNeddAddr", isNeddAddr.equals("true")?"1":"2");//支持者提供收货地址（1：是,2：否）
    	map.put("projectIntro", request.getParameter("projectIntro"));//项目简介
    	map.put("projectDetails", request.getParameter("projectDetails"));//项目内容
    	
    	String[] imgIds = request.getParameter("imgIds").split(",");//项目图片ID数组
    	map.put("imagesIds", imgIds);
    	map.put("coverImageId", DataUtil.getParams(request, "coverImageId"));//项目封面ID
    	map.put("coverImageUrl", DataUtil.getParams(request, "coverImageUrl"));//封面url
    	
    	map.put("targetList", returns);//梦想目标List
    	
    	map.put("opSource", "2");
    	
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 发布公益项目
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/initWelfareProject")
    public String initWelfareProject(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/operate/v/initWelfareProject");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("projectName", request.getParameter("projectName"));//项目标题
    	map.put("projectType", DataUtil.getParams(request, "projectType"));//项目类型（1.	大病救助2.	灾难救助3.	动物保护4.	扶贫助学5.	其它救助）
    	map.put("targetAmount", DataUtil.getParams(request, "targetAmount"));//目标金额
    	map.put("financingDays", DataUtil.getParams(request, "financingDays"));//筹资期限
    	map.put("projectIntro", request.getParameter("projectIntro"));//项目简介
    	map.put("projectDetails", request.getParameter("projectDetails"));//项目内容
    	String[] imgIds = request.getParameter("imgIds").split(",");//项目图片ID数组
    	map.put("imagesIds", imgIds);
    	map.put("coverImageId", DataUtil.getParams(request, "coverImageId"));//项目封面ID
    	map.put("coverImageUrl", DataUtil.getParams(request, "coverImageUrl"));//封面url
    	map.put("opSource", "2");
    	
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 编辑公益项目
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/modifyWelfareProject")
    public String modifyWelfareProject(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/operate/v/modifyWelfareProject");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("projectId", request.getParameter("projectId"));//项目ID
    	map.put("isOrdered", request.getParameter("isOrdered"));//项目是否有订单：1有2无
    	map.put("projectName", request.getParameter("projectName"));//项目标题
    	map.put("targetAmount", DataUtil.getParams(request, "targetAmount"));//目标金额
    	map.put("financingDays", DataUtil.getParams(request, "financingDays"));//筹资期限
    	map.put("projectIntro", request.getParameter("projectIntro"));//项目简介
    	map.put("projectDetails", request.getParameter("projectDetails"));//项目内容
    	String[] imgIds = request.getParameter("imgIds").split(",");//项目图片ID数组
    	map.put("imagesIds", imgIds);
    	map.put("coverImageId", DataUtil.getParams(request, "coverImageId"));//项目封面ID
    	map.put("coverImageUrl", DataUtil.getParams(request, "coverImageUrl"));//封面url
    	map.put("modifyReason", request.getParameter("modifyReason"));//资金修改原因(当已有订单修改公益项目时此字段必填)
    	map.put("opSource", "2");
    	
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     * 项目支持评论
     */
    @ResponseBody
    @RequestMapping(value = "/query/v/commentList")
    public String commentList(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/query/v/commentList");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("reqPageNum", request.getParameter("reqPageNum"));////页数
        map.put("maxResults", request.getParameter("maxResults"));//每页显示几条
        map.put("projectId", request.getParameter("projectId"));//项目编号
        map.put("userId", request.getParameter("userId"));//用户ID
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    
    /*
     * 项目插入评论
     */
    @ResponseBody
    @RequestMapping(value = "/query/v/insertComment")
    public String insertComment(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/query/v/insertComment");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("orderId", request.getParameter("orderId"));//定单ID
        map.put("replyId", request.getParameter("replyId"));//回复人ID
        map.put("commentContent", request.getParameter("commentContent"));//回复内容
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    
    /*
     * 项目验证状态
     */
    @ResponseBody
    @RequestMapping(value = "/validate/v/isProAuthenticated")
    public String isProAuthenticated(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/validate/v/isProAuthenticated");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("id", request.getParameter("projectId"));//项目ID
    	map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata(); 
    }
    /*
     * 项目验证
     */
    @ResponseBody
    @RequestMapping(value = "/validate/v/proAuthenticated")
    public String proAuthenticated(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/validate/v/proAuthenticated");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	String validationId = request.getParameter("validationId");//验证ID
    	
    	if(StringUtils.isNotEmpty(validationId)){
    		map.put("validationId", request.getParameter("validationId"));//验证ID
    	}
    	map.put("projectId", request.getParameter("projectId"));//项目ID
    	map.put("validationType", request.getParameter("validationType"));//验证类型：1本人验证(个人验证)2亲属验证3夫妻验证4组织验证(企业验证)
    	map.put("receiveRealName", request.getParameter("receiveRealName"));//真实姓名(法人姓名)
    	map.put("receiveIdCard", request.getParameter("receiveIdCard"));//身份证号(加密)
    	map.put("receivePhone", request.getParameter("receivePhone"));//联系电话
    	map.put("recipientRealName", request.getParameter("recipientRealName"));//受助人真实姓名
    	map.put("recipient", request.getParameter("recipient"));//受助人身份证号(加密)
    	map.put("organizationName", request.getParameter("organizationName"));//组织名称
    	map.put("organizationPhone", request.getParameter("organizationPhone"));//组织联系电话
    	map.put("organizationAptitudeId", request.getParameter("organizationAptitudeId"));//组织机构资质/营业执照图片ID
    	map.put("organizationAptitudeUrl", request.getParameter("organizationAptitudeUrl"));//组织机构资质/营业执照图片URL
    	map.put("disease", request.getParameter("disease"));//所患疾病
    	map.put("hospitalRegionId", request.getParameter("hospitalRegionId"));//医院省市ID
    	map.put("hospitalName", request.getParameter("hospitalName"));//医院名称
    	map.put("weddingPictureId", request.getParameter("weddingPictureId"));//结婚证照片ID
    	map.put("weddingPictureUrl", request.getParameter("weddingPictureUrl"));//结婚证照片URL
    	String proveImgIds = request.getParameter("proveImgIds");
    	if(StringUtils.isNotEmpty(proveImgIds)){
    		map.put("proveImgIds", proveImgIds.split(","));//医疗诊断证明图片ID集合
    	}
    	String accountBookImgIds = request.getParameter("accountBookImgIds");
    	if(StringUtils.isNotEmpty(accountBookImgIds)){
    		map.put("accountBookImgIds", accountBookImgIds.split(","));//户口本图片ID集合
    	}
    	String useProveImgIds = request.getParameter("useProveImgIds");
    	if(StringUtils.isNotEmpty(useProveImgIds)){
    		map.put("useProveImgIds", useProveImgIds.split(","));//资金用途证明图片ID集合
    	}
    	String projectProveImgIds = request.getParameter("projectProveImgIds");
    	if(StringUtils.isNotEmpty(projectProveImgIds)){
    		map.put("projectProveImgIds", projectProveImgIds.split(","));//项目相关证明图片ID集合
    	}
    	String receiveCardImageIds = request.getParameter("receiveCardImageIds");
    	if(StringUtils.isNotEmpty(receiveCardImageIds)){
    		map.put("receiveCardImageIds", receiveCardImageIds.split(","));//手持身份证照片ID集合
    	}
    	String recipientCardImageIds = request.getParameter("recipientCardImageIds");
    	if(StringUtils.isNotEmpty(recipientCardImageIds)){
    		map.put("recipientCardImageIds", recipientCardImageIds.split(","));//受助人手持身份证照片ID集合
    	}
    	
    	
    	map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata(); 
    }
    
    /*
     * 关注项目
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/collect")
    public String collect(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/operate/v/collect");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
      
        map.put("id", request.getParameter("id"));//项目id
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    
    /*
     * 取消关注项目
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/cancelCollect")
    public String cancelCollect(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/operate/v/cancelCollect");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
      
        map.put("id", request.getParameter("id"));//项目id
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    
    /*
     * 项目订单（支持）列表
     */
    @ResponseBody
    @RequestMapping(value = "/order/v//supportList")
    public String prosupportList(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/order/v//supportList");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("reqPageNum", request.getParameter("reqPageNum"));////页数
        map.put("maxResults", request.getParameter("maxResults"));//每页显示几条
        map.put("projectId", request.getParameter("projectId"));//项目id
        String status = request.getParameter("status");
        if(StringUtils.isNotEmpty(status)){
        	map.put("status", request.getParameter("status"));//状态
        }
        map.put("type", request.getParameter("type"));//查询总计
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    /*
     * 验证信息详情
     */
    @ResponseBody
    @RequestMapping(value = "/validate/{v}/proAuthenticatedDetail")
    public String proAuthenticatedDetail(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/validate/{v}/proAuthenticatedDetail");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("validationId", request.getParameter("validationId"));//项目id
    	map.put("projectId", request.getParameter("projectId"));//项目id
    	map.put("opSource", "2");//微信标识
    	
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata(); 
    }
    

    /*
     * 举报项目
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/inform")
    public String inform(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/operate/v/inform");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("name", request.getParameter("name"));//举报人姓名
        map.put("phone", request.getParameter("phone"));//举报人电话
        map.put("content", request.getParameter("content"));//举报内容
        String imgIds = request.getParameter("imgIds");
    	if(StringUtils.isNotEmpty(imgIds)){
    		map.put("imgIds", imgIds.split(","));//举报图片ID集合
    	}
        map.put("projectId", request.getParameter("projectId"));//项目id
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    
    
    /*
     * 删除项目
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/delete")
    public String delete(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/operate/v/delete");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("projectId", request.getParameter("projectId"));//项目id
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    
    
    /*
     * 提前结束
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/finish")
    public String finish(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/operate/v/finish");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("projectId", request.getParameter("projectId"));//项目id
        map.put("finishReason", request.getParameter("finishReason"));//结束原因
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }

    /*
     * 更新项目动态
     */
    @ResponseBody
    @RequestMapping(value = "/operate/v/addDynamic")
    public String addDynamic(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/operate/v/addDynamic");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("projectId", request.getParameter("projectId"));//项目id
    	map.put("dynamicInfo", request.getParameter("dynamicInfo"));//更新内容
    	String imgsIds = request.getParameter("imgsIds");
    	if(StringUtils.isNotEmpty(imgsIds)){
    		map.put("imgsIds", imgsIds.split(","));//医疗诊断证明图片ID集合
    	}
    	map.put("opSource", "2");
    	
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     * 回报/梦想列表
     */
    @ResponseBody
    @RequestMapping(value = "/query/v/findReturnOrDreamList")
    public String findReturnOrDreamList(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	
    	String url = new String(serverAddress + "/query/v/findReturnOrDreamList");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("id", request.getParameter("projectId"));//项目id（Y）
    	map.put("opSource", "2");
    	
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     * 取消订单
     */
    @ResponseBody
    @RequestMapping(value = "/order/v/user/cancel")
    public String cancel(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/order/v/user/cancel");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
      
        map.put("id", request.getParameter("id"));//订单id
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    
    /*
     * 订单发货
     */
    @ResponseBody
    @RequestMapping(value = "/order/v/post")
    public String post(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/order/v/post");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
      
        map.put("orderId", request.getParameter("orderId"));//订单id Y
        map.put("courierCompany", request.getParameter("courierCompany"));//快递公司
        map.put("courierNumber", request.getParameter("courierNumber"));//快递单号
        map.put("isLogistics", request.getParameter("isLogistics"));//是否发物流（1：是 2：否） Y
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
    
    /*
     * 确认收货
     */
    @ResponseBody
    @RequestMapping(value = "/order/v/user/confirmReceipt")
    public String confirmReceipt(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
      
        String url = new String(serverAddress + "/order/v/user/confirmReceipt");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();
      
        map.put("id", request.getParameter("id"));//订单id Y
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
   

}
