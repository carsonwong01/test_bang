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
import com.dimeng.enums.WithdrawStatusEnum;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.AuditWithdrawReq;
import com.dimeng.model.finance.FindWithdrawListReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;

/**
 * 后台-提现管理
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月28日]
 */
@Controller
@RequestMapping(value = "finance")
public class WithdrawMgtController extends BaseController
{
    /**
     * 提现待审核列表页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchWaitWithdraw.do")
    public Object searchWaitWithdraw(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/withdraw/waitWithdraw");
        
        return mv;
    }
    
    /**
     * 提现待审核列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TXGL_DSH_MU")
    @ResponseBody
    @RequestMapping(value = "searchWaitWithdrawAjax.do")
    public Object searchPaymentRecordsAjax(FindWithdrawListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //状态为待审核
        req.setType(WithdrawStatusEnum.DSH.dataBaseVal);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/withdrawManage/v/findWithdrawApplyList",
                RequestMethod.POST,
                request);
        JSONObject searchWaitWithdrawList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchWaitWithdrawList;
    }
    
    /**
     * 提现审核操作
     * <功能详细描述>
     * @param Req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TXGL_DSH_SH")
    @SystemConsoleLog(desc = "提现审核", modul = "财务管理", isRetrunVal = false)
    @ResponseBody
    @RequestMapping(value = "withdrawCheck.do")
    public Object withdrawCheck(AuditWithdrawReq Req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(Req, "finance/withdrawManage/v/commonWithdrawAudit", request);
        return result;
    }
    
    /**
     * 提现待审核列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_TXGL_DSH_DC")
    @RequestMapping(value = "searchWaitWithdrawExport.do")
    public void searchPaymentRecordsExport(FindWithdrawListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        //状态为待审核
        req.setType(WithdrawStatusEnum.DSH.dataBaseVal);
        new CommonUtil().callInterfaceMethod(req,
            "finance/withdrawManage/v/findWithdrawApplyList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 提现待放款列表页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchLoanWithdraw.do")
    public Object searchLoanWithdraw(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/withdraw/loanWithdraw");
        
        return mv;
    }
    
    /**
     * 提现待放款列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TXGL_DFK_MU")
    @ResponseBody
    @RequestMapping(value = "searchLoanWithdrawAjax.do")
    public Object searchLoanWithdrawAjax(FindWithdrawListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //状态为审核通过
        req.setType(WithdrawStatusEnum.SHTG.dataBaseVal);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/withdrawManage/v/findWithdrawApplyList",
                RequestMethod.POST,
                request);
        JSONObject searchLoanWithdrawList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchLoanWithdrawList;
    }
    
    /**
     * 提现放款审核操作
     * <功能详细描述>
     * @param Req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TXGL_DFK_FKSH")
    @SystemConsoleLog(desc = "提现放款", modul = "财务管理", isRetrunVal = false)
    @ResponseBody
    @RequestMapping(value = "withdrawLoanCheck.do")
    public Object withdrawLoanCheck(AuditWithdrawReq Req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(Req, "finance/withdrawManage/v/commonWithdrawLoan", request);
        return result;
    }
    
    /**
     * 提现待放款列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_TXGL_DFK_DC")
    @RequestMapping(value = "searchLoanWithdrawExport.do")
    public void searchLoanWithdrawExport(FindWithdrawListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        //状态为待审核
        req.setType(WithdrawStatusEnum.SHTG.dataBaseVal);
        new CommonUtil().callInterfaceMethod(req,
            "finance/withdrawManage/v/findWithdrawApplyList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    
    /**
     * 提现成功列表页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchSuccWithdraw.do")
    public Object searchSuccWithdraw(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/withdraw/succWithdraw");
        
        return mv;
    }
    
    /**
     * 提现成功列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TXGL_TXCG_MU")
    @ResponseBody
    @RequestMapping(value = "searchSuccWithdrawAjax.do")
    public Object searchSuccWithdrawAjax(FindWithdrawListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //状态为提现成功
        req.setType(WithdrawStatusEnum.TXCG.dataBaseVal);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/withdrawManage/v/findWithdrawApplyList",
                RequestMethod.POST,
                request);
        JSONObject searchSuccWithdrawList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchSuccWithdrawList;
    }
    
    /**
     * 提现成功列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_TXGL_TXCG_DC")
    @RequestMapping(value = "searchSuccWithdrawExport.do")
    public void searchSuccWithdrawExport(FindWithdrawListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        //状态为提现成功
        req.setType(WithdrawStatusEnum.TXCG.dataBaseVal);
        new CommonUtil().callInterfaceMethod(req,
            "finance/withdrawManage/v/findWithdrawApplyList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 提现失败列表页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchFailedWithdraw.do")
    public Object searchFailedWithdraw(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/withdraw/failedWithdraw");
        
        return mv;
    }
    
    /**
     * 提现失败列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TXGL_TXSB_MU")
    @ResponseBody
    @RequestMapping(value = "searchFailedWithdrawAjax.do")
    public Object searchFailedWithdrawAjax(FindWithdrawListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //状态为提现成功
        req.setType(WithdrawStatusEnum.TXSB.dataBaseVal);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/withdrawManage/v/findWithdrawApplyList",
                RequestMethod.POST,
                request);
        JSONObject searchFailedWithdrawList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchFailedWithdrawList;
    }
    
    /**
     * 提现失败列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_TXGL_TXSB_DC")
    @RequestMapping(value = "searchFailedWithdrawExport.do")
    public void searchFailedWithdrawExport(FindWithdrawListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        //状态为提现成功
        req.setType(WithdrawStatusEnum.TXSB.dataBaseVal);
        new CommonUtil().callInterfaceMethod(req,
            "finance/withdrawManage/v/findWithdrawApplyList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 提现失败原因
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_TXGL_TXSB_SBYY")
    @ResponseBody
    @RequestMapping(value = "searchFailedWithdrawReason.do")
    public Object searchFailedWithdrawReason(IdReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/withdrawManage/v/findAuditInfo",
                RequestMethod.POST,
                request);
        return data;
    }
}
