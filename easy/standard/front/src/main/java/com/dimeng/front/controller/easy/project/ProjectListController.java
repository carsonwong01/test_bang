package com.dimeng.front.controller.easy.project;

import com.alibaba.fastjson.JSON;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.bus.FindProjectListReq;
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
public class ProjectListController extends BaseController
{
    /**
     * 前台 -项目列表页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/projectList.do")
    public Object recomProjectList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("easy/project/projectList.page");
        return mv;
    }
    
    /**
     * 前台 -推荐项目列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/projectListAjax.do")
    public Object recomProjectListAjax( HttpServletRequest request,
        HttpServletResponse response,FrontIndexReq req)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        req.setOpSource("1");
        req.setMaxResults(2);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "home/frontInfo/v/findRecommendList",
                RequestMethod.POST,
                request);
        map.put("projectList",CommonUtil.getJSONObject(data, null));
        map.put("req", req);
        return map;
    }

    /**
     * 前台---查询所有项目列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getFrontProjectListAjax.do")
    public Object allProjectListAjax(FindProjectListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/projectList", RequestMethod.POST, request);
        return JSON.parse(data);
    }
}

