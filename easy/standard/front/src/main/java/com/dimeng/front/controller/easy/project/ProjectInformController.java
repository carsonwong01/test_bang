package com.dimeng.front.controller.easy.project;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.bus.InformReq;
import com.dimeng.utils.CommonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "project")
public class ProjectInformController extends BaseController {

    /**
     * 跳转到项目举报页面
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/toInformProject.do")
    public ModelAndView informProject(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView("easy/project/informProject.page");
        return mv;
    }
    /**
     * 根据项目ID举报项目
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping(value = "/addInformProject.do")
    public Object insertProjectInform(HttpServletRequest request, HttpServletResponse response,InformReq req){
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
//        FrontUserInfo frontUser = new FrontUserInfo();
        String data =
                new CommonUtil().callInterfaceMethod(req, "project/operate/v/inform",
                        RequestMethod.POST, request);
        JSONObject json = JSONObject.parseObject(data);
        return json;
    }

}
