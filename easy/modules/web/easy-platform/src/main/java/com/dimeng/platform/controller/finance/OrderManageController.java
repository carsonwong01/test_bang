package com.dimeng.platform.controller.finance;

import java.util.ArrayList;
import java.util.List;

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
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.enums.PaysFunctionNumCode;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.FindPaymentListReq;
import com.dimeng.model.finance.FindRefundListReq;
import com.dimeng.model.finance.PayOrderReq;
import com.dimeng.model.finance.SupportDetailReq;
import com.dimeng.model.finance.SupportOrderReq;
import com.dimeng.model.pay.OrderPayReq;
import com.dimeng.model.pay.RefundReq;
import com.dimeng.modules.finance.services.IOrderManageService;
import com.dimeng.modules.finance.services.IPayService;
import com.dimeng.modules.finance.services.IRefundService;
import com.dimeng.platform.controller.common.CommonBaseController;
import com.dimeng.utils.Base64Decoder;
import com.dimeng.utils.LoginCache;

/**
 * 
 * 订单
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月27日]
 */
@Controller
@RequestMapping(value = "finance/paymentManage")
public class OrderManageController extends CommonBaseController
{
    @Resource
    private IOrderManageService orderManageService;
    
 
    /**
     * 支持项目
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Throwable
     */
    @RequestMapping(value = "/{v}/support", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object insertSupportOrder(HttpEntity<SupportOrderReq> httpEntity, HttpServletRequest request)
        throws Throwable
    {

        BaseDataResp resp = validator(httpEntity.getBody());
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            String openId = userInfo.getGzhyhOpenId();
            if(openId == null){
                resp.setCode(IDiMengResultCode.PayResultCode.DATA_ERROR);
                return resp;
            }
            OrderPayReq orderPayReq = orderManageService.insertSupportOrder(httpEntity.getBody());
            orderPayReq.setOpenId(Base64Decoder.decode(openId));
            //            OrderPayReq orderPayReq=new OrderPayReq();
            //            orderPayReq.setPayType("200");
            PaysFunctionNumCode[] institutions = PaysFunctionNumCode.values();
            for (PaysFunctionNumCode paysFunctionNumCode : institutions)
            {
                if (paysFunctionNumCode.getFunctionNumCode().equals(orderPayReq.getPayType()))
                {
                    IPayService payService =
                        super.getAdaptBeanName(paysFunctionNumCode.prefix(), IPayService.class, "");
                    
                    resp = payService.invokeService(orderPayReq);
                }
            }
        }
          
        return resp;
    }
    
    /**
     *  个人中心订单支付
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Throwable
     */
    @RequestMapping(value = "/{v}/payOrder", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object payOrder(HttpEntity<PayOrderReq> httpEntity, HttpServletRequest request)
        throws Throwable
    {
        BaseDataResp resp = validator(httpEntity.getBody());
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            String openId = userInfo.getGzhyhOpenId();
            if(openId == null){
                resp.setCode(IDiMengResultCode.PayResultCode.DATA_ERROR);
                return resp;
            }
            OrderPayReq orderPayReq = orderManageService.findSupportOrder(httpEntity.getBody());
            orderPayReq.setOpenId(Base64Decoder.decode(openId));
            PaysFunctionNumCode[] institutions = PaysFunctionNumCode.values();
            for (PaysFunctionNumCode paysFunctionNumCode : institutions)
            {
                if (paysFunctionNumCode.getFunctionNumCode().equals(orderPayReq.getPayType()))
                {
                    IPayService payService =
                        super.getAdaptBeanName(paysFunctionNumCode.prefix(), IPayService.class, "");
                    
                    resp = payService.invokeService(orderPayReq);
                }
            }
        }
        return resp;
    }
    
    /**
     * 后台-财务管理-支付记录列表
     * 后台-用户管理-用户信息-支持的订单
     * 后台-项目详情-支持记录
     * 后台-项目管理-订单管理
     * 后台-订单管理-所有订单
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findPaymentList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findPaymentList(HttpEntity<FindPaymentListReq> httpEntity, HttpServletRequest request)
        throws Exception
    {
        return orderManageService.findPaymentList(httpEntity.getBody());
    }
    
    /**
     * 后台-财务管理-退款管理列表
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findRefundList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findRefundList(HttpEntity<FindRefundListReq> httpEntity, HttpServletRequest request)
        throws Exception
    {
        return orderManageService.findRefundList(httpEntity.getBody());
    }
    
    /**
     * 后台-财务管理-退款管理-订单退款操作
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Throwable 
     */
    @RequestMapping(value = "/{v}/commonRefund", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object commonRefund(HttpEntity<IdReq> httpEntity, HttpServletRequest request)
        throws Throwable
    {
        BaseDataResp resp = orderManageService.commonRefund(httpEntity.getBody());
        RefundReq refundReq = (RefundReq)DimengBeanUtil.copyProperties(RefundReq.class, resp.getData());
        List<RefundReq> refundReqList = new ArrayList<RefundReq>();
        refundReqList.add(refundReq);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            PaysFunctionNumCode[] institutions = PaysFunctionNumCode.values();
            for (PaysFunctionNumCode paysFunctionNumCode : institutions)
            {
                if (paysFunctionNumCode.getFunctionNumCode().equals(refundReq.getPayType()))
                {
                    
                    IRefundService payService =
                        super.getAdaptBeanName(paysFunctionNumCode.prefix(), IRefundService.class, "");
                    resp = payService.invokeService(refundReqList);
                }
            }
        }
        return resp;
    }
    
    /**
     * 支付后查询订单状态
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/supportOrderStatus", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object supportOrderStatus(HttpEntity<SupportDetailReq> httpEntity, HttpServletRequest request)
        throws Exception
    {
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        return orderManageService.supportOrderStatus(httpEntity.getBody());
    }
    
    /**
     * 订单详情
     * <功能详细描述>
     * @param httpEntity
     * @param request
     * @author wenguanhai
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/supportDetail", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object supportDetail(HttpEntity<SupportDetailReq> httpEntity, HttpServletRequest request)
        throws Exception
    {
        return orderManageService.supportDetail(httpEntity.getBody());
    }
    
}
