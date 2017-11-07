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
import com.dimeng.enums.PaymentListTypeEnum;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.finance.FindPaymentListReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;

/**
 * 支付记录
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月28日]
 */
@Controller
@RequestMapping(value = "finance")
public class PaymentMgtController extends BaseController
{
    /**
     * 后台-财务管理-支付记录页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "searchPaymentRecords.do")
    public Object searchPaymentRecords(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/finance/payment/paymentRecords");
        
        return mv;
    }
    
    /**
     * 后台-财务管理-支付记录列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("CWGL_ZFJL_ZFJL_MU")
    @ResponseBody
    @RequestMapping(value = "searchPaymentRecordsAjax.do")
    public Object searchPaymentRecordsAjax(FindPaymentListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        req.setType(PaymentListTypeEnum.ZFJL.getDataBaseVal());
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/paymentManage/v/findPaymentList",
                RequestMethod.POST,
                request);
        JSONObject searchPaymentRecordsList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchPaymentRecordsList;
    }
    
    /**
     * 后台-财务管理-支付记录列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequiresPermissions("CWGL_ZFJL_ZFJL_DC")
    @RequestMapping(value = "searchPaymentRecordsExport.do")
    public void searchPaymentRecordsExport(FindPaymentListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        req.setType(PaymentListTypeEnum.ZFJL.getDataBaseVal());
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "finance/paymentManage/v/findPaymentList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
}
