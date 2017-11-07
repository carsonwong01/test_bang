package com.dimeng.console.controller.easy.site;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemConsoleLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.model.site.helpCenter.DeleteHelpCenterByIdReq;
import com.dimeng.model.site.helpCenter.FindHelpCenterByTypeReq;
import com.dimeng.model.site.helpCenter.InsertHelpCenterReq;
import com.dimeng.model.site.helpCenter.UpdateHelpCenterReq;
import com.dimeng.utils.CommonUtil;

/**
 * 帮助中心
 * @author  song
 * @version  [版本号, 2016年10月18日]
 */
@RequestMapping(value = "site/helpCenter")
@Controller
public class HelpCenterController  extends BaseController
{
    /**
     * 跳往列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "siteArticleGuide/queryArticleGuideList.do")
    @ResponseBody
    public ModelAndView articleGuid(HttpServletRequest request, HttpServletResponse response,
        FindHelpCenterByTypeReq req)
    {
        ModelAndView mv = new ModelAndView("pages/easy/site/helpCenter/articleGuideList");
        mv.addObject(CommonConstant.TYPE, req.getType());
        return mv;
    }
    
    /**
     * 帮助中心列表Ajax
     * <功能详细描述>
     * @param categoryReq
     * @param request
     * @param response
     * @param req
     * @return
     */
    @RequestMapping(value = "/articleGuidAjax.do")
    @ResponseBody
    @RequiresPermissions(value = {"ZDGL_BZZX_FQXM_MU", "ZDGL_BZZX_XMGL_MU","ZDGL_BZZX_ZCXM_MU","ZDGL_BZZX_QTWT_MU"}, logical = Logical.OR)
    public Map<String, Object> articleGuidAjax(HttpServletRequest request, HttpServletResponse response,
        FindHelpCenterByTypeReq req)
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        Map<String, Object> map = new HashMap<String, Object>();
        String data =
            new CommonUtil().callInterfaceMethod(req, "site/helpCenter/v/helpCenterList", RequestMethod.GET, request);
        map.put(CommonConstant.JSON_KEY_PAGERESULT, CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_PAGERESULT));
        map.put(CommonConstant.TYPE, req.getType());//返回所有对象
        return map;
    }
    
    /**
     * 跳往新增 
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     * @return
     */
    @RequestMapping("siteArticleGuide/addArticleInfo.do")
    public ModelAndView addArticleInfo(HttpServletRequest request, HttpServletResponse response,
        FindHelpCenterByTypeReq req)
    {
        ModelAndView mv = new ModelAndView("pages/easy/site/helpCenter/articleGuideAdd");
        mv.addObject(CommonConstant.TYPE, req.getType());
        return mv;
    }
    
    /**
     * 新增 
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     * @return
     */
    @SystemConsoleLog(desc = "新增", modul = "站点管理")
    @ResponseBody
    @RequestMapping("addArticleInfoAjax.do")
    @RequiresPermissions(value = {"ZDGL_BZZX_FQXM_XZ", "ZDGL_BZZX_XMGL_XZ","ZDGL_BZZX_ZCXM_XZ","ZDGL_BZZX_QTWT_XZ"}, logical = Logical.OR)
    public Object addArticleInfoAjax(HttpServletRequest request, HttpServletResponse response, InsertHelpCenterReq req)
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        String data =
            new CommonUtil().callInterfaceMethod(req, "site/helpCenter/v/helpCenter", RequestMethod.POST, request);
        JSONObject json = JSONObject.parseObject(data);
        return json;
    }
    
    /**
     * 跳往修改 
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     * @return
     */
    @RequestMapping("siteArticleGuide/changeArticleGuide.do")
    public ModelAndView changeArticleGuide(HttpServletRequest request, HttpServletResponse response,
        FindHelpCenterByTypeReq req)
    {
        ModelAndView mv = new ModelAndView("pages/easy/site/helpCenter/articleGuideEdit");
        mv.addObject("id", req.getId());
        mv.addObject("type", req.getType());
        return mv;
    }
    
    /**
     * 修改 
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     * @return
     */
    @SystemConsoleLog(desc = "修改", modul = "站点管理")
    @ResponseBody
    @RequestMapping("updateArticleInfoAjax.do")
    @RequiresPermissions(value = {"ZDGL_BZZX_FQXM_XG", "ZDGL_BZZX_XMGL_XG","ZDGL_BZZX_ZCXM_XG","ZDGL_BZZX_QTWT_XG"}, logical = Logical.OR)
    public Object updateArticleInfoAjax(HttpServletRequest request, HttpServletResponse response,
        UpdateHelpCenterReq req)
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        String data =
            new CommonUtil().callInterfaceMethod(req, "site/helpCenter/v/helpCenter", RequestMethod.PUT, request);
        JSONObject json = JSONObject.parseObject(data);
        return json;
    }
    
    /**
     * 跳往详情
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     * @return
     */
    @RequestMapping("siteArticleGuide/queryArticleGuideById.do")
    public ModelAndView queryArticleGuideById(HttpServletRequest request, HttpServletResponse response,
        FindHelpCenterByTypeReq req)
    {
        ModelAndView mv = new ModelAndView("pages/easy/site/helpCenter/articleGuideDetail");
        mv.addObject("id", req.getId());
        mv.addObject("type", req.getType());
        return mv;
    }
    
    /**
     * 置顶
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     * @return
     */
    @SystemConsoleLog(desc = "置顶操作", modul = "站点管理")
    @ResponseBody
    @RequestMapping("articleGuideTop.do")
    @RequiresPermissions(value = {"ZDGL_BZZX_FQXM_ZD", "ZDGL_BZZX_XMGL_ZD","ZDGL_BZZX_ZCXM_ZD","ZDGL_BZZX_QTWT_ZD"}, logical = Logical.OR)
    public Object articleGuideTop(HttpServletRequest request, HttpServletResponse response, UpdateHelpCenterReq req)
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        req.setDateTop(DateUtil.getDatetimeString(new Date()));
        String data =
            new CommonUtil().callInterfaceMethod(req, "site/helpCenter/v/helpCenter", RequestMethod.PUT, request);
        JSONObject json = JSONObject.parseObject(data);
        return json;
    }
    
    /**
     * 删除
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     * @return
     */
    @SystemConsoleLog(desc = "删除操作", modul = "站点管理")
    @ResponseBody
    @RequestMapping("articleGuideDel.do")
    @RequiresPermissions(value = {"ZDGL_BZZX_FQXM_SC", "ZDGL_BZZX_XMGL_SC","ZDGL_BZZX_ZCXM_SC","ZDGL_BZZX_QTWT_SC"}, logical = Logical.OR)
    public Object articleGuideDel(HttpServletRequest request, HttpServletResponse response, DeleteHelpCenterByIdReq req)
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        String data =
            new CommonUtil().callInterfaceMethod(req, "site/helpCenter/v/helpCenter", RequestMethod.DELETE, request);
        JSONObject json = JSONObject.parseObject(data);
        
        return json;
    }
}
