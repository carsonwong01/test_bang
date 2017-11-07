/*
 * 文 件 名:  MySupportProjectController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月26日
 */
package com.dimeng.front.controller.easy.user.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemFrontLog;
import com.dimeng.enums.FrontLogsTypeEnum;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.bus.FindCollectionListReq;
import com.dimeng.model.bus.FindUserSupportListReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.utils.CommonUtil;

/**
 * 我支持的项目
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月26日]
 */
@Controller
@RequestMapping("user/project")
public class MySupportProjectController extends BaseController
{
    /**
     * 取消订单
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "user/cancelOrderAjax.do")
    public Object cancelOrder(IdReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/order/v/user/cancel", RequestMethod.POST, request);
        JSONObject object = JSONObject.parseObject(data);
        return object;
    }
    
    /**
     * 跳转到我的关注页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "我的关注", modul = "项目管理", type = FrontLogsTypeEnum.BROWSE)
    @RequestMapping(value = "/myCollectionList.do")
    public Object myCollectionList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("easy/user/project/myCollectionList_temple");
        return mv;
    }
    
    /**
     * 项目管理--我的关注Ajax查询
     * 项目列表
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/myCollectionListAjax.do")
    public Object myCollectionListAjax(@ModelAttribute("req")
    FindCollectionListReq req, HttpServletRequest request)
    {
        String json =
            new CommonUtil().callInterfaceMethod(req, "project/operate/v/collectionList", RequestMethod.POST, request);
        return JSON.parse(json);
    }
    
    /**
     * 取消关注项目
     * <功能详细描述>
     * @param req
     * @param request
     * @return
     */
    @SystemFrontLog(desc = "前台用户取消关注项目", modul = "项目模块")
    @ResponseBody
    @RequestMapping(value = "/cancelCollectAjax.do")
    public Object cancelCollectAjax(@ModelAttribute("req")
    IdReq req, HttpServletRequest request)
    {
        String json =
            new CommonUtil().callInterfaceMethod(req, "project/operate/v/cancelCollect", RequestMethod.POST, request);
        return JSON.parse(json);
    }
    
    /**
     * 支持项目列表页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "user/supportProjectList.do")
    public Object supportProjectList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("easy/user/project/mySupportProjectList_temple");
        return mv;
    }
    
    /**
     * 支持项目列表ajax 查询
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "user/supportProjectListAjax.do")
    public Object supportProjectListAjax(FindUserSupportListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/order/v/user/supportList", RequestMethod.POST, request);
        JSONObject object = JSONObject.parseObject(data);
        return object;
    }
}
