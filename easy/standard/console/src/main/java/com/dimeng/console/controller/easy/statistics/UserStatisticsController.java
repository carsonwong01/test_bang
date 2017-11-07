package com.dimeng.console.controller.easy.statistics;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.statistics.FindCommonStatReq;
import com.dimeng.model.statistics.FindStatsUserOnlineReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;

/**
 * 统计管理-用户统计
 * @author  song
 * @version  [版本号, 2016年10月8日]
 */
@RequestMapping("statistics")
@Controller
public class UserStatisticsController extends BaseController
{
    
    /**
     * 跳转在线用户统计页面
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     * @return
     */
    @RequestMapping("/userOnlineStatistics.do")
    public ModelAndView userOnlineStatistics(HttpServletRequest request, HttpServletResponse response,
        FindStatsUserOnlineReq req)
    {
        ModelAndView mv = new ModelAndView("pages/easy/statistics/userstatistics/userOnlineStatistics");
        return mv;
    }
    
    /**
     * 在线用户统计Ajax
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     * @return
     */
    @RequiresPermissions("TJGL_YHTJ_ZXYH_MU")
    @RequestMapping(value = "userOnlineStatisticsAjax.do")
    @ResponseBody
    public Object userOnlineStatisticsAjax(HttpServletRequest request, HttpServletResponse response,
        @Param("startTime")
        FindStatsUserOnlineReq req)
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        if (StringUtil.isEmpty(req.getStartTime()))
        {
            req.setStartTime(DateUtil.getDateString(new Date()));
        }
        String result =
            new CommonUtil().callInterfaceMethod(req, "statistics/statManage/v/onlineStat", RequestMethod.GET, request);
        return CommonUtil.getJSONObject(result, null);
        
    }
    
    /**
     * 跳转用户统计页面
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     * @return
     */
    @RequestMapping("/userRelevantStatistics.do")
    public ModelAndView userCapitalStatistics(HttpServletRequest request, HttpServletResponse response,
        FindCommonStatReq req)
    {
        ModelAndView mv = new ModelAndView("pages/easy/statistics/userstatistics/userRelevantStatistics");
        return mv;
    }
    
    /**
     * 用户统计Ajax
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     * @return
     */
    @RequiresPermissions("TJGL_YHTJ_YHTJ_MU")
    @RequestMapping(value = "userRelevantStatisticsAjax.do")
    @ResponseBody
    public Object userCapitalStatisticsAjax(HttpServletRequest request, HttpServletResponse response,
        FindCommonStatReq req)
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        String result =
            new CommonUtil().callInterfaceMethod(req, "statistics/statManage/v/userStat", RequestMethod.POST, request);
        return CommonUtil.getJSONObject(result, null);
    }
    
    /**
     * 用户统计列表导出
     * <功能详细描述>
     * @param request
     * @param response
     * @param req
     */
    @RequiresPermissions("TJGL_YHTJ_YHTJ_DC")
    @RequestMapping(value = "userRelevantStatisticsExport.do")
    public void userRelevantStatisticsExport(HttpServletRequest request, HttpServletResponse response,
        FindCommonStatReq req)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "statistics/statManage/v/userStat", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
}
