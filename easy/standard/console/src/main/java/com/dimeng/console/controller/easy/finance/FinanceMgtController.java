package com.dimeng.console.controller.easy.finance;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.FindCapitalDetailsListReq;
import com.dimeng.model.finance.FindPlatformAdjustReq;
import com.dimeng.model.finance.TiaoZhangReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;

/**
 * 财务管理
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月11日]
 */
@Controller
@RequestMapping(value = "finance")
public class FinanceMgtController extends BaseController
{
    /**
     * 后台-财务管理-财务管理-查看调账列表页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchPlatformAdjustList.do")
    public Object searchPlatformAdjustList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/finance/platformAdjustList");
        
        return mv;
    }  
    
    /**
     * 后台-财务管理-财务管理-查看调账列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TKGL_PTTZGL_MU")
    @ResponseBody
    @RequestMapping(value = "searchPlatformAdjustListAjax.do")
    public Object searchPlatformAdjustListAjax(FindPlatformAdjustReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/financeManage/v/findPfTiaoZhangList",
                RequestMethod.POST,
                request);
        JSONObject searchPlatformAdjustList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchPlatformAdjustList;
    }
    
    /**
     * 后台-财务管理-财务管理-调账列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_TKGL_PTTZGL_DC")
    @RequestMapping(value = "searchPlatformAdjustListExport.do")
    public void searchPlatformAdjustListExport(FindPlatformAdjustReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "finance/financeManage/v/findPfTiaoZhangList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 后台-财务管理-财务管理-查看调账备注
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TKGL_PTTZGL_CK")
    @ResponseBody
    @RequestMapping(value = "searchTiaoZhangRemark.do")
    public Object searchTiaoZhangRemark(IdReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/financeManage/v/findTiaoZhangRemark",
                RequestMethod.POST,
                request);
        return data;
    }
    
    /**
     * 后台-财务管理-财务管理-平台调账管理-调账
     * <功能详细描述>
     * @param Req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TKGL_PTTZGL_TZ")
    @SystemConsoleLog(desc = "平台调账", modul = "财务管理", isRetrunVal = false)
    @ResponseBody
    @RequestMapping(value = "tiaoZhangAjax.do")
    public Object tiaoZhangAjax(TiaoZhangReq Req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(Req, "finance/financeManage/v/commonTiaoZhang", request);
        return result;
    }
    
    /**
     * 后台-财务管理-财务管理-平台资金明细页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchPFCapitalDetailsList.do")
    public Object searchPFCapitalDetailsList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/finance/pfCapitalDetailsList");
        
        return mv;
    }
    
    /**
     * 后台-财务管理-财务管理-平台资金明细列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TKGL_PTZJMX_MU")
    @ResponseBody
    @RequestMapping(value = "searchPFCapitalDetailsListAjax.do")
    public Object searchPFCapitalDetailsListAjax(FindCapitalDetailsListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询平台资金明细列表
        req.setListType(CommonConstant.ZERO);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/financeManage/v/findCapitalDetailsList",
                RequestMethod.POST,
                request);
        JSONObject searchPFCapitalDetailsList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchPFCapitalDetailsList;
    }
    
    /**
     * 后台-财务管理-财务管理-平台资金明细列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_TKGL_PTZJMX_DC")
    @RequestMapping(value = "searchPFCapitalDetailsListExport.do")
    public void searchPFCapitalDetailsListExport(FindCapitalDetailsListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询平台资金明细列表
        req.setListType(CommonConstant.ZERO);
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "finance/financeManage/v/findCapitalDetailsList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 后台-财务管理-财务管理-用户资金明细页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchUserCapitalDetailsList.do")
    public Object searchUserCapitalDetailsList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/finance/userCapitalDetailsList");
        
        return mv;
    }
    
    /**
     * 后台-财务管理-财务管理-用户资金明细列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TKGL_YHZJMX_MU")
    @ResponseBody
    @RequestMapping(value = "searchUserCapitalDetailsListAjax.do")
    public Object searchUserCapitalDetailsListAjax(FindCapitalDetailsListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询用户资金明细列表
        req.setListType(CommonConstant.ONE);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/financeManage/v/findCapitalDetailsList",
                RequestMethod.POST,
                request);
        JSONObject searchUserCapitalDetailsList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchUserCapitalDetailsList;
    }
    
    /**
     * 后台-财务管理-财务管理-用户资金明细列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_TKGL_YHZJMX_DC")
    @RequestMapping(value = "searchUserCapitalDetailsListExport.do")
    public void searchUserCapitalDetailsListExport(FindCapitalDetailsListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询用户资金明细列表
        req.setListType(CommonConstant.ONE);
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "finance/financeManage/v/findCapitalDetailsList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
}
