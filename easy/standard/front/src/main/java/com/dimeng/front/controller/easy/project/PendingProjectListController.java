package com.dimeng.front.controller.easy.project;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.enums.ProjectStatusEnum;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.bus.FindProjectListReq;
import com.dimeng.model.expand.ProjectLabelReq;
import com.dimeng.model.home.FrontIndexReq;
import com.dimeng.utils.CommonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


/**
 * 项目列表
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年11月7日]
 */
@Controller
@RequestMapping("project")
public class PendingProjectListController extends BaseController
{
    /**
     * 前台 -项目列表页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/frontPendingProject.do")
    public Object projectList(HttpServletRequest request, HttpServletResponse response)
    {
        
        ModelAndView mv = new ModelAndView("easy/project/pendingProjectList.page");
        return mv;
    }
    
    /**
     * 后台-查询众筹中项目列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/frontPendingProjectAjax.do")
    public Object pendingList(FindProjectListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        req.setOpSource("1");
        req.setMaxResults(9);
        req.setProjectStatus(ProjectStatusEnum.ZCZ.getDataBaseVal());
        String data =
                new CommonUtil().callInterfaceMethod(req, "home/frontInfo/v/frontAllProject", RequestMethod.POST, request);
        map.put("pendingProjectList",CommonUtil.getJSONObject(data, null));
        map.put("req", req);
        return map;
    }



    /**
     * front--未删除的-已认证的所有项目
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/allProList.do")
    public Object allProList(HttpServletRequest request, HttpServletResponse response, ProjectLabelReq req,FrontIndexReq frontReq)
    {
        ModelAndView mv = new ModelAndView("easy/project/allProjectList.page");
        String data = new CommonUtil().callInterfaceMethod(req,
                "home/frontInfo/v/findProLabel",RequestMethod.POST,request);
        mv.addObject("proLabelList", JSONObject.parseObject(data).getJSONObject("data").get("list"));
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/allProListAjax.do")
    public Object allProList(FrontIndexReq req, HttpServletRequest request, HttpServletResponse response)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        req.setOpSource("1");
        req.setMaxResults(12);
        String data =
                new CommonUtil().callInterfaceMethod(req, "home/frontInfo/v/frontAllProList", RequestMethod.POST, request);
        map.put("frontAllProList",CommonUtil.getJSONObject(data, null));
        map.put("req", req);
        return map;
    }

}

