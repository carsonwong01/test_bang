package com.dimeng.console.controller.easy.statistics;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.statistics.FindCommonStatReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;

/**
 * 统计管理-资金统计
 * @author  song
 * @version  [版本号, 2016年10月9日]
 */
@RequestMapping("statistics")
@Controller
public class BusStatisticsController extends BaseController
{ 
    
    /**
     * 
     * 跳转提现统计页面
     * @param request
     * @param response
     * @param req
     * @return
     */ 
    @RequestMapping("/withdrawCapitalStatistics.do")
    public ModelAndView withdrawCapitalStatistics(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/statistics/fundstatistics/withdrawCapitalStatistics");
        return mv;
    }
    
     /**
     * 提现统计Ajax
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */ 
    @RequiresPermissions("TJGL_ZJTJ_TXTJ_MU")
    @RequestMapping(value = "withdrawCapitalAjax.do")
    @ResponseBody
    public Object withdrawCapitalAjax(FindCommonStatReq req, HttpServletRequest request, HttpServletResponse response)
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "statistics/statManage/v/withdrawStat",
                RequestMethod.POST,
                request);
        return CommonUtil.getJSONObject(result, null);
    }
    
     /**
     * 提现统计导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */ 
    @RequiresPermissions("TJGL_ZJTJ_TXTJ_DC")
    @RequestMapping(value = "withdrawCapitalExport.do")
    public void withdrawCapitalExport(FindCommonStatReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "statistics/statManage/v/withdrawStat", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    } 
    
    /**
     * 跳转平台资金统计页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */ 
    @RequestMapping("/platformCapitalStatistics.do")
    public ModelAndView platformCapitalStatistics(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/statistics/fundstatistics/platformCapitalStatistics");
        return mv;
    } 
      
     /**
     * 平台资金统计Ajax
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */  
    @RequestMapping(value = "platformCapitalAjax.do")
    @ResponseBody
    @RequiresPermissions("TJGL_ZJTJ_PTSY_MU")
    public Object platformCapitalAjax(FindCommonStatReq req, HttpServletRequest request, HttpServletResponse response)
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "statistics/statManage/v/platformEarningsStat",
                RequestMethod.POST,
                request);
        return CommonUtil.getJSONObject(result, null);
    }
    
     /**
     * 平台资金统计导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */  
    @RequestMapping(value = "platformCapitalExport.do")
    @RequiresPermissions("TJGL_ZJTJ_PTSY_DC")
    public void platformCapitalExport(FindCommonStatReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "statistics/statManage/v/platformEarningsStat",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    } 
    /**
     * 跳转用户支持统计页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */ 
    @RequestMapping("/userSupportStatistics.do")
    public ModelAndView userCapitalStatistics(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/statistics/fundstatistics/userSupportStatistics");
        return mv;
    }
    
     /**
     * 用户支持统计Ajax
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */ 
    @RequestMapping(value = "userSupportAjax.do")
    @ResponseBody
    @RequiresPermissions("TJGL_ZJTJ_YHZC_MU")
    public Object userCapitalAjax(FindCommonStatReq req, HttpServletRequest request, HttpServletResponse response)
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "statistics/statManage/v/userSupportStat",
                RequestMethod.POST,
                request);
        return CommonUtil.getJSONObject(result, null);
    }
    /**
     * 用户支持统计导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */ 
    @RequestMapping(value = "userSupportExport.do")
    @RequiresPermissions("TJGL_ZJTJ_YHZC_DC")
    public void userCapitalExport(FindCommonStatReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "statistics/statManage/v/userSupportStat", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
     /**
     * 跳转用户发起统计页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */ 
    @RequestMapping("/userInitiateStatistics.do")
    public ModelAndView rechageCapitalStatistics(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/statistics/fundstatistics/userInitiateStatistics");
        return mv;
    }
    
     /**
     * 用户发起统计Ajax
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */ 
    @RequestMapping(value = "userInitiateAjax.do")
    @ResponseBody
    @RequiresPermissions("TJGL_ZJTJ_YHFQ_MU")
    public Object rechageCapitalAjax(FindCommonStatReq req, HttpServletRequest request, HttpServletResponse response)
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "statistics/statManage/v/userInitiateStat",
                RequestMethod.POST,
                request);
        return CommonUtil.getJSONObject(result, null);
    }
    
     /**
     * 用户发起统计导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */ 
    @RequestMapping(value = "userInitiateExport.do")
    @RequiresPermissions("TJGL_ZJTJ_YHFQ_DC")
    public void rechageCapitalExport(FindCommonStatReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "statistics/statManage/v/userInitiateStat", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
}
