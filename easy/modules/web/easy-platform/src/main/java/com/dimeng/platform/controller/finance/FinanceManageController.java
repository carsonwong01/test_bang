package com.dimeng.platform.controller.finance;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.enums.PaysFunctionNumCode;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.FindCapitalDetailsListReq;
import com.dimeng.model.finance.FindOrderCheckListReq;
import com.dimeng.model.finance.FindPlatformAdjustReq;
import com.dimeng.model.finance.TiaoZhangReq;
import com.dimeng.model.pay.OrderPayCheckReq;
import com.dimeng.model.pay.RefundReq;
import com.dimeng.modules.finance.services.IFinanceManageService;
import com.dimeng.modules.finance.services.IPayCheckService;
import com.dimeng.modules.finance.services.IRefundCheckService;
import com.dimeng.platform.controller.common.CommonBaseController;

/**
 * 后台-财务管理-财务管理
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月10日]
 */
@Controller
@RequestMapping(value = "finance/financeManage")
public class FinanceManageController extends CommonBaseController
{
    @Resource
    private IFinanceManageService financeManageService;
    
    
    /**
     * 后台-财务管理-财务管理-平台调账管理列表
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findPfTiaoZhangList", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findPfTiaoZhangList(HttpEntity<FindPlatformAdjustReq> httpEntity,
        HttpServletRequest request)
        throws Exception
    {
        return financeManageService.findPfTiaoZhangList(httpEntity.getBody());
    }
    
    /**
     * 后台-财务管理-财务管理-查看调账备注
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findTiaoZhangRemark", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findTiaoZhangRemark(HttpEntity<IdReq> httpEntity,
        HttpServletRequest request)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = financeManageService.findTiaoZhangRemark((httpEntity.getBody()));
        }
        return resp;
    }
    
    /**
     * 后台-财务管理-财务管理-平台调账管理-调账
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/commonTiaoZhang", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object commonTiaoZhang(HttpEntity<TiaoZhangReq> httpEntity,
        HttpServletRequest request)
        throws Exception
    {
        return financeManageService.commonTiaoZhang((httpEntity.getBody()));
    }
    
    
    /**
     * 后台-财务管理-财务管理-平台资金明细列表
     * 后台-财务管理-财务管理-用户资金明细列表
     * 前台-个人中心-交易明细
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findCapitalDetailsList", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findCapitalDetailsList(HttpEntity<FindCapitalDetailsListReq> httpEntity,
        HttpServletRequest request)
        throws Exception
    {
        return financeManageService.findCapitalDetailsList(httpEntity.getBody());
    }
    
    
    /**
     * 后台-财务管理-对账管理-支付对账列表
     * 后台-财务管理-对账管理-退款对账列表
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findOrderCheckList", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findOrderCheckList(HttpEntity<FindOrderCheckListReq> httpEntity,
        HttpServletRequest request)
        throws Exception
    {
        return financeManageService.findOrderCheckList(httpEntity.getBody());
    }
    
    
    /**
     * 后台-财务管理-对账管理-支付对账操作
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Throwable 
     */
    @RequestMapping(value = "/{v}/commonPayCheck", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object commonPayCheck(HttpEntity<IdReq> httpEntity,
        HttpServletRequest request)
        throws Throwable
    {
        BaseDataResp resp = financeManageService.commonPayCheck(httpEntity.getBody());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            OrderPayCheckReq orderPayCheckReq= (OrderPayCheckReq)DimengBeanUtil.copyProperties(OrderPayCheckReq.class, resp.getData());
            PaysFunctionNumCode[] institutions = PaysFunctionNumCode.values();
            for (PaysFunctionNumCode paysFunctionNumCode : institutions)
            {
                if (paysFunctionNumCode.getFunctionNumCode().equals(orderPayCheckReq.getPayType()))
                {
                    
                    IPayCheckService  payCheckService = super.getAdaptBeanName(paysFunctionNumCode.prefix(), IPayCheckService.class, "");
                    resp = payCheckService.invokeService(orderPayCheckReq);
                }
            }
        }
        return resp;
    }
    
    
    /**
     * 后台-财务管理-对账管理-退款对账操作
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Throwable 
     */
    @RequestMapping(value = "/{v}/commonRefundCheck", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object commonRefundCheck(HttpEntity<IdReq> httpEntity,
        HttpServletRequest request)
        throws Throwable
    {
        
        BaseDataResp resp = financeManageService.commonRefundCheck(httpEntity.getBody());
        RefundReq refundCheckReq= (RefundReq)DimengBeanUtil.copyProperties(RefundReq.class, resp.getData());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            PaysFunctionNumCode[] institutions = PaysFunctionNumCode.values();
            for (PaysFunctionNumCode paysFunctionNumCode : institutions)
            {
                if (paysFunctionNumCode.getFunctionNumCode().equals(refundCheckReq.getPayType()))
                {
                    
                    IRefundCheckService  refundCheckService = super.getAdaptBeanName(paysFunctionNumCode.prefix(), IRefundCheckService.class, "");
                    resp = refundCheckService.invokeService(refundCheckReq);
                }
            }
        }
        return resp;
    }
}
