package com.dimeng.console.controller.easy.bus;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.enums.PaymentListTypeEnum;
import com.dimeng.enums.ProjectTypeEnum;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.common.IdPageReq;
import com.dimeng.model.finance.FindPaymentListReq;
import com.dimeng.model.finance.SupportDetailReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;

/**
 * 
 * 订单管理
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月29日]
 */
@Controller
@RequestMapping(value = "bus/orderManage")
public class OrderManageController extends BaseController
{
    /**
     * 后台-业务管理-订单管理-订单列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "allOrderList.do")
    public Object allOrderList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/orderManage/allOrderList");
        
        return mv;
    }
    
    /**
     * 后台-业务管理-项目管理-订单管理-项目订单列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "projectOrderList.do")
    public Object projectOrderList(@ModelAttribute("projectId")
    String projectId, @ModelAttribute("type")
    Integer type, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = null;
        if (ProjectTypeEnum.DBJZ.getDbvalue().equals(type) || ProjectTypeEnum.ZNJZ.getDbvalue().equals(type)
            || ProjectTypeEnum.DWBH.getDbvalue().equals(type) || ProjectTypeEnum.FPZX.getDbvalue().equals(type)
            || ProjectTypeEnum.QTJZ.getDbvalue().equals(type))
        {
            mv = new ModelAndView("pages/easy/bus/orderManage/publicWelfareProOrderList");
        }
        else if (ProjectTypeEnum.HBXM.getDbvalue().equals(type))
        {
            mv = new ModelAndView("pages/easy/bus/orderManage/returnProOrderList");
            IdPageReq req = new IdPageReq();
            req.setId(projectId);
            String result =
                new CommonUtil().callInterfaceMethod(req, "project/query/v/returnAmtList", RequestMethod.POST, request);
            mv.addObject("returnAmtList", JSONObject.parseObject(result).getJSONObject("data").get("list"));
        }
        else if (ProjectTypeEnum.MXXM.getDbvalue().equals(type))
        {
            mv = new ModelAndView("pages/easy/bus/orderManage/dreamProOrderList");
        }
        else
        {
        }
        
        mv.addObject("projectName", URLDecoder.decode(request.getParameter("projectName")));
        
        return mv;
    }
    
    /**
     * 后台-业务管理-订单管理-所有订单列表
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "allOrderListAjax.do")
    @RequiresPermissions("YWGL_DDGL_SYDD_MU")
    public Object allOrderListAjax(FindPaymentListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        req.setType(PaymentListTypeEnum.SYDD.dataBaseVal);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/paymentManage/v/findPaymentList",
                RequestMethod.POST,
                request);
        JSONObject searchPaymentRecordsList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchPaymentRecordsList;
    }
    
    /**
     * 后台-业务管理-订单管理-订单列表导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequestMapping(value = "allOrderListExport.do")
    @RequiresPermissions("YWGL_DDGL_SYDD_DC")
    public void allOrderListExport(FindPaymentListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        req.setType(PaymentListTypeEnum.SYDD.dataBaseVal);
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
    
    /**
     * 后台-业务管理-项目管理-项目列表-订单管理
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "projectOrderListAjax.do")
    public Object projectOrderListAjax(FindPaymentListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/paymentManage/v/findPaymentList",
                RequestMethod.POST,
                request);
        JSONObject searchPaymentRecordsList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchPaymentRecordsList;
    }
    
    /**
     * 订单详情
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * entry参数来区分是从哪里进来的详情页面
     * extraParameter 额外根据来源附属参数
     * @return
     */
    @RequestMapping(value = "orderDetail.do")
    @RequiresPermissions("YWGL_DDGL_SYDD_DDXQ")
    public Object orderDetail(SupportDetailReq req, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/orderManage/orderDetail");
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/paymentManage/v/supportDetail",
                RequestMethod.POST,
                request);
        JSONObject orderDetail = (JSONObject)CommonUtil.getJSONObject(data, null);
        mv.addObject("orderDetail", orderDetail.get("singleResult"));
        return mv;
    }
    
}
