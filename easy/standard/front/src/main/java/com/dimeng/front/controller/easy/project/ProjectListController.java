package com.dimeng.front.controller.easy.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.expand.FindAllTProjectLabelTypeResp;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.home.FrontIndexReq;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.SystemCache;


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
    public Object projectList(HttpServletRequest request, HttpServletResponse response)
    {
        
        List<FindAllTProjectLabelTypeResp> allTProjectLabelType = (List<FindAllTProjectLabelTypeResp>)SystemCache.getCache(SystemConstant.CacheKey.PROJECT_LABEL_LIST);
        ModelAndView mv = new ModelAndView("easy/project/projectList.page");
        mv.addObject("allTProjectLabelType",allTProjectLabelType);
        return mv;
    }
    
    /**
     * 前台 -项目列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/projectListAjax.do")
    public Object projectListAjax(FrontIndexReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        req.setOpSource("1");
        req.setMaxResults(9);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "home/frontInfo/v/findRecommendList",
                RequestMethod.POST,
                request);
        map.put("projectList",CommonUtil.getJSONObject(data, null));
        map.put("req", req);
        return map;
    }
}

 