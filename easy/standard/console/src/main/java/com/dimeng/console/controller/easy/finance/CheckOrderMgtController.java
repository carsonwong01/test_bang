package com.dimeng.console.controller.easy.finance;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemConsoleLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.FindOrderCheckListReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;

/**
 * 支付/退款对账
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月12日]
 */
@Controller
@RequestMapping(value = "finance")
public class CheckOrderMgtController extends BaseController
{
    /**
     * 后台-财务管理-对账管理-支付对账页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchPayCheckList.do")
    public Object searchPayCheckList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/check/payCheckList");
        
        return mv;
    }  
    
    /**
     * 后台-财务管理-对账管理-支付对账列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_DZGL_ZFYCDZ_MU")
    @ResponseBody
    @RequestMapping(value = "searchPayCheckListAjax.do")
    public Object searchPayCheckListAjax(FindOrderCheckListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询支付对账列表
        req.setListType(CommonConstant.ONE);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/financeManage/v/findOrderCheckList",
                RequestMethod.POST,
                request);
        JSONObject searchPayCheckList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchPayCheckList;
    }
    
    /**
     * 后台-财务管理-对账管理-支付对账列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_DZGL_ZFYCDZ_DC")
    @RequestMapping(value = "searchPayCheckListExport.do")
    public void searchPayCheckListExport(FindOrderCheckListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
         //指定接口查询支付对账列表
        req.setListType(CommonConstant.ONE);
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "finance/financeManage/v/findOrderCheckList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    
    /**
     * 后台-财务管理-对账管理-支付对账操作
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_DZGL_ZFYCDZ_DZ")
    @SystemConsoleLog(desc = "支付对账", modul = "财务管理", isRetrunVal = false)
    @ResponseBody
    @RequestMapping(value = "payCheck.do")
    public Object payCheck(IdReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/financeManage/v/commonPayCheck",
                RequestMethod.POST,
                request);
        return JSON.parse(data);
    }
    
    /**
     * 后台-财务管理-对账管理-退款对账页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchRefundCheckList.do")
    public Object searchRefundCheckList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/check/refundCheckList");
        
        return mv;
    }  
    
    
    /**
     * 后台-财务管理-对账管理-退款对账列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_DZGL_TKYCDZ_MU")
    @ResponseBody
    @RequestMapping(value = "searchRefundCheckListAjax.do")
    public Object searchRefundCheckListAjax(FindOrderCheckListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询退款对账列表
        req.setListType(CommonConstant.TWO);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/financeManage/v/findOrderCheckList",
                RequestMethod.POST,
                request);
        JSONObject searchRefundCheckList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchRefundCheckList;
    }
    
    /**
     * 后台-财务管理-对账管理-退款对账列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_DZGL_TKYCDZ_DC")
    @RequestMapping(value = "searchRefundCheckListExport.do")
    public void searchRefundCheckListExport(FindOrderCheckListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
         //指定接口查询退款对账列表
        req.setListType(CommonConstant.TWO);
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "finance/financeManage/v/findOrderCheckList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    
    /**
     * 后台-财务管理-对账管理-退款对账操作
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_DZGL_TKYCDZ_DZ")
    @SystemConsoleLog(desc = "退款对账", modul = "财务管理", isRetrunVal = false)
    @ResponseBody
    @RequestMapping(value = "refundCheck.do")
    public Object refundCheck(IdReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/financeManage/v/commonRefundCheck",
                RequestMethod.POST,
                request);
        return JSON.parse(data);
    }
    
}
