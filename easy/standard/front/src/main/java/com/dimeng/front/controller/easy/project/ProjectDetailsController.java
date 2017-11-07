package com.dimeng.front.controller.easy.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemFrontLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.entity.ext.bus.ProjectDetailsResp;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.bus.DynamicListReq;
import com.dimeng.model.bus.FindUserCommentReq;
import com.dimeng.model.bus.InsertUserCommentReq;
import com.dimeng.model.bus.ProjectDetailsReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.LoginCache;

/**
 * 项目详情页面
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月28日]
 */
@Controller
@RequestMapping("project")
public class ProjectDetailsController extends BaseController
{
    /**
     * 项目基础信息
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/projectDetails.do")
    public Object projectDetails(ProjectDetailsReq req,HttpServletRequest request, HttpServletResponse response)
    {
        
        ModelAndView mv = new ModelAndView("easy/project/projectDetails.page");
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        if (userInfo != null)
        {
            req.setUserId(userInfo.getUserId());
        }
        String data = new CommonUtil().callInterfaceMethod(req,
          "project/query/v/projectDetails",
          RequestMethod.POST,request);
        JSONObject  object = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        ProjectDetailsResp projectDetail = object.toJavaObject(ProjectDetailsResp.class);
        if("4".equals(projectDetail.getProjectStatus()))
        {
            mv.setViewName("easy/project/projectDetailsNull.page"); 
            mv.addObject("status","1"); 
        }else if("1".equals(projectDetail.getShieldStatus())){
            mv.setViewName("easy/project/projectDetailsNull.page"); 
            mv.addObject("status","2"); 
        }else{
            mv.addObject("projectDetails",object); 
        }
        return mv;
    }
    
    /**
     * 项目动态列表
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/projectDynamicAjax.do")
    public Object projectDynamicAjax(DynamicListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/query/v/dynamic",
                RequestMethod.POST,
                request);
        return CommonUtil.getJSONObject(data, null);
    }
    
    /**
     * 项目支持评论列表
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/commentListAjax.do")
    public Object commentListAjax(FindUserCommentReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/query/v/commentList",
                RequestMethod.POST,
                request);
        return CommonUtil.getJSONObject(data, null);
    }
    /**
     * 关注项目
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/collectAjax.do")
    @SystemFrontLog(desc = "前台用户关注项目", modul = "项目模块")
    public Object collectAjax(IdReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/collect",
                RequestMethod.POST,
                request);
        return JSONObject.parseObject(data);
    }
    
    /**
     * 取消关注项目
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "前台用户取消关注项目", modul = "项目模块")
    @ResponseBody
    @RequestMapping(value = "/cancalCollectAjax.do")
    public Object cancalCollectAjax(IdReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/cancelCollect",
                RequestMethod.POST,
                request);
        return JSONObject.parseObject(data);
    }
    
    /**
     * 项目评论
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "前台用户评论项目", modul = "项目模块")
    @ResponseBody
    @RequestMapping(value = "/commentAjax.do")
    public Object cancalCollectAjax(InsertUserCommentReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/query/v/insertComment",
                RequestMethod.POST,
                request);
        return JSONObject.parseObject(data);
    }
}

 