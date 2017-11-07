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
import com.dimeng.enums.RefundListTypeEnum;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.FindRefundListReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;

/**
 * 后台-财务管理
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月9日]
 */
@Controller
@RequestMapping(value = "finance")
public class RefundMgtController extends BaseController
{
    /**
     * 后台-财务管理-退款管理-订单待退款列表页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchWaitRefundList.do")
    public Object searchWaitRefundList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/refund/waitRefundList");
        
        return mv;
    }
    
    /**
     * 后台-财务管理-退款管理-订单待退款列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TKGL_DDDTK_MU")
    @ResponseBody
    @RequestMapping(value = "searchWaitRefundListAjax.do")
    public Object searchWaitRefundListAjax(FindRefundListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询待退款列表
        req.setType(RefundListTypeEnum.DTK.getDataBaseVal());
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/paymentManage/v/findRefundList",
                RequestMethod.POST,
                request);
        JSONObject searchWaitRefundList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchWaitRefundList;
    }
    
    /**
     * 后台-财务管理-退款管理-订单待退款列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_TKGL_DDDTK_DC")
    @RequestMapping(value = "searchWaitRefundListExport.do")
    public void searchWaitRefundListExport(FindRefundListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询待退款列表
        req.setType(RefundListTypeEnum.DTK.getDataBaseVal());
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "finance/paymentManage/v/findRefundList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 后台-财务管理-退款管理-订单退款失败页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchRefundFailedList.do")
    public Object searchRefundFailedList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/refund/refundFailedList");
        
        return mv;
    }
    
    /**
     * 后台-财务管理-退款管理-订单退款失败列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TKGL_DDTKSB_MU")
    @ResponseBody
    @RequestMapping(value = "searchRefundFailedListAjax.do")
    public Object searchRefundFailedListAjax(FindRefundListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询退款失败列表
        req.setType(RefundListTypeEnum.TKSB.getDataBaseVal());
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/paymentManage/v/findRefundList",
                RequestMethod.POST,
                request);
        JSONObject searchRefundFailedList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchRefundFailedList;
    }
    
    /**
     * 后台-财务管理-退款管理-订单退款失败列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_TKGL_DDTKSB_DC")
    @RequestMapping(value = "searchRefundFailedListExport.do")
    public void searchRefundFailedListExport(FindRefundListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询退款失败列表
        req.setType(RefundListTypeEnum.TKSB.getDataBaseVal());
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "finance/paymentManage/v/findRefundList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 后台-财务管理-退款管理-订单退款操作
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TKGL_DDTKSB_TK")
    @SystemConsoleLog(desc = "退款", modul = "财务管理", isRetrunVal = false)
    @ResponseBody
    @RequestMapping(value = "refundOperation.do")
    public Object refundOperation(IdReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/paymentManage/v/commonRefund",
                RequestMethod.POST,
                request);
        return JSON.parse(data);
    }
    
    
    /**
     * 后台-财务管理-退款管理-订单退款记录列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchRefundRecordList.do")
    public Object searchRefundRecordList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/refund/refundRecordList");
        
        return mv;
    }
    /**
     * 后台-财务管理-退款管理-订单退款记录列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TKGL_DDTKJL_MU")
    @ResponseBody
    @RequestMapping(value = "searchRefundRecordListAjax.do")
    public Object searchRefundRecordListAjax(FindRefundListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询退款记录列表
        req.setType(RefundListTypeEnum.TKJL.getDataBaseVal());
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/paymentManage/v/findRefundList",
                RequestMethod.POST,
                request);
        JSONObject searchRefundFailedList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchRefundFailedList;
    }
    
    /**
     * 后台-财务管理-退款管理-订单退款记录列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_TKGL_DDTKJL_DC")
    @RequestMapping(value = "searchRefundRecordListExport.do")
    public void searchRefundRecordListExport(FindRefundListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //指定接口查询退款记录列表
        req.setType(RefundListTypeEnum.TKJL.getDataBaseVal());
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "finance/paymentManage/v/findRefundList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
}
