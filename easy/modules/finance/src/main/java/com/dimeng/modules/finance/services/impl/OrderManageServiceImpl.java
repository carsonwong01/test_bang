package com.dimeng.modules.finance.services.impl;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.finance.FindPaymentListResp;
import com.dimeng.entity.ext.finance.FindRefundListResp;
import com.dimeng.entity.ext.finance.SupportDetailResp;
import com.dimeng.entity.ext.finance.SupportOrderStatusResp;
import com.dimeng.entity.table.bus.TQBusProjectComment;
import com.dimeng.entity.table.order.TOrderSupport;
import com.dimeng.entity.table.project.TProjectDynamic;
import com.dimeng.entity.table.project.TProjectInfo;
import com.dimeng.entity.table.project.TProjectReturn;
import com.dimeng.entity.table.system.TSystemRegionInfo;
import com.dimeng.entity.table.user.TUser;
import com.dimeng.entity.table.user.TUserShippingAddress;
import com.dimeng.enums.OrderCheckStatusEnum;
import com.dimeng.enums.PaymentListTypeEnum;
import com.dimeng.enums.ProjectDynamicTypeEnum;
import com.dimeng.enums.ProjectStatusEnum;
import com.dimeng.enums.ProjectTypeEnum;
import com.dimeng.enums.QOrderStatusEnum;
import com.dimeng.enums.RefundListTypeEnum;
import com.dimeng.enums.RefundTypeEnum;
import com.dimeng.enums.SerialNumberTypeEnum;
import com.dimeng.enums.variable.TrustVariables;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.FindPaymentListReq;
import com.dimeng.model.finance.FindRefundListReq;
import com.dimeng.model.finance.PayOrderReq;
import com.dimeng.model.finance.SupportDetailReq;
import com.dimeng.model.finance.SupportOrderReq;
import com.dimeng.model.pay.OrderPayReq;
import com.dimeng.model.pay.RefundReq;
import com.dimeng.modules.finance.services.IOrderManageService;
import com.dimeng.modules.finance.services.impl.base.BaseFinanceService;
import com.dimeng.util.SerialNumberUtil;
import com.dimeng.utils.ExportUtil;
import com.dimeng.utils.SystemCache;
import com.dimeng.utils.UUIDGenerate;

/**
 * 订单管理实现类
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月27日]
 */
@Service
public class OrderManageServiceImpl extends BaseFinanceService implements IOrderManageService
{

    
    /**
     * 后台-财务管理-支付记录列表
     * 后台-用户管理-用户信息-支持的订单
     * 后台-项目详情-支持记录
     * 后台-项目管理-订单管理
     * 后台-订单管理-所有订单
     */
    @Override
    @SuppressWarnings("unchecked")
    public BaseDataResp findPaymentList(FindPaymentListReq req)
    {
        QueryEvent<FindPaymentListReq> event = new QueryEvent<FindPaymentListReq>();
        event.setStatement("findPaymentList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        //列表查询
        List<FindPaymentListResp> findPaymentList = baseDao.findAllIsPageByCustom(event);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findPaymentList));
        //合计查询
        event.setStatement("findPaymentListTotal");
        FindPaymentListResp result = (FindPaymentListResp)baseDao.findOneByCustom(event);
        map.put(CommonConstant.JSON_KEY_COLUMNSTAT_RESULT, result);
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Map<String, String> enumsValue = new HashMap<String, String>();
            enumsValue.put("payType", "com.dimeng.enums.PayTypeEnum");
            enumsValue.put("paySource", "com.dimeng.enums.PaySourceEnum");
            //导出合计
            if (req.getType().equals(PaymentListTypeEnum.SYDD.dataBaseVal))
            {
                enumsValue.put("payStatus", "com.dimeng.enums.QOrderStatusEnum");
                req.setEnumsValue(enumsValue);
                //所有订单的合计样式
                Object[] param = {"合计", "", "", "", "", "", result.getSupportAmtTotal(), "", "", ""};
                ExportUtil.export(req, findPaymentList, param);
            }
            else
            {
                enumsValue.put("payStatus", "com.dimeng.enums.PayStatusEnum");
                req.setEnumsValue(enumsValue);
                //支付记录没有合计
                ExportUtil.export(req, findPaymentList);
            }
        }
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 后台-财务管理-退款管理列表
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findRefundList(FindRefundListReq req)
    {
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        //列表查询
        QueryEvent<FindRefundListReq> event = new QueryEvent<FindRefundListReq>();
        event.setStatement("findRefundList");
        event.setObj(req);
        List<FindRefundListResp> findRefundList = baseDao.findAllIsPageByCustom(event);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findRefundList));
        //合计查询
        event.setStatement("findRefundListTotal");
        FindRefundListResp result = (FindRefundListResp)baseDao.findOneByCustom(event);
        map.put(CommonConstant.JSON_KEY_COLUMNSTAT_RESULT, result);
        
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Map<String, String> enumsValue = new HashMap<String, String>();
            enumsValue.put("refundType", "com.dimeng.enums.RefundTypeEnum");
            enumsValue.put("supportSource", "com.dimeng.enums.PayTypeEnum");
            enumsValue.put("status", "com.dimeng.enums.QOrderStatusEnum");
            req.setEnumsValue(enumsValue);
            if (req.getType().equals(RefundListTypeEnum.DTK.dataBaseVal))
            {
                Object[] param = {"合计", "", "", "", result.getSupportTotal(), "", "", "", "", "", ""};
                ExportUtil.export(req, findRefundList, param);
            }
            else
            {
                ExportUtil.export(req, findRefundList);
            }
        }
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 后台-业务管理-订单管理-订单列表-订单详情
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp supportDetail(SupportDetailReq req)
    {
        QueryEvent<SupportDetailReq> event = new QueryEvent<SupportDetailReq>();
        event.setStatement("supportDetail");
        event.setObj(req);
        
        /**
         * 查询订单详情
         */
        SupportDetailResp supportDetailResp = (SupportDetailResp)baseDao.findOneByCustom(event);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, supportDetailResp);
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 支持项目
     */
    @SuppressWarnings({"unchecked"})
    @Override
    public OrderPayReq insertSupportOrder(SupportOrderReq req)
        throws Exception
    {
        //判断项目是否可以支持
        if (!this.isCanSupport(req.getProjectId(), req.getReturnId(), req.getReturnNumber(),req.getAmount()))
        {
            throw new ServicesException(IDiMengResultCode.Finance.CREATE_ORDER_FAIL);
        }
        //新增订单记录
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setOrderId(UUIDGenerate.generateShortUuid());
        orderSupport.setProjectId(req.getProjectId());
        orderSupport.setOrderNo(SerialNumberUtil.buildSn(SerialNumberTypeEnum.DD.getDataBaseVal()));
        //微信支付
        orderSupport.setPayType(SystemCache.getProperty(TrustVariables.PAY_TYPE));
        orderSupport.setPaySource(req.getOpSource());
        orderSupport.setUserId(req.getUserId());
        orderSupport.setReturnId((req.getReturnId() == null) ? null : req.getReturnId());
        orderSupport.setSupportCount(req.getReturnNumber() == null ? null : req.getReturnNumber());
        orderSupport.setSupportAmount(new BigDecimal(req.getAmount()));
        orderSupport.setStatus(QOrderStatusEnum.DZF.getDataBaseVal());
        orderSupport.setDateCreate(DateUtil.getNow());
        orderSupport.setMessage(req.getMessage());;
        orderSupport.setPayCheckStatus(OrderCheckStatusEnum.WDZ.getDataBaseVal());
        //订单失效时间
        int minutes;
        try
        {
            minutes = Integer.parseInt(SystemCache.getCache("ORDER_OVERDUE_TIME").toString());
        }
        catch (Exception e)
        {
            minutes = 1440;
        }
        long minutesCount = System.currentTimeMillis() + minutes * 60 * 1000;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        orderSupport.setDateInvalid(Timestamp.valueOf(sdf.format(minutesCount)));
        //收货信息
        if(null != req.getDeliveryAddrId())
        {
            TUserShippingAddress shippingAddr = new TUserShippingAddress();
            shippingAddr.setAddrId(req.getDeliveryAddrId());
            shippingAddr = (TUserShippingAddress)baseDao.findById(shippingAddr);
            orderSupport.setReceiveName(shippingAddr.getConsigneeName());
            orderSupport.setAddress(shippingAddr.getConsigneeAddress());
            orderSupport.setPhone(shippingAddr.getConsigneePhone());
            TSystemRegionInfo systemRegionInfo = new TSystemRegionInfo();
            systemRegionInfo.setRegionId(shippingAddr.getConsigneeCity());
            systemRegionInfo = (TSystemRegionInfo)baseDao.findById(systemRegionInfo);
            orderSupport.setRegion(systemRegionInfo.getProvince()+systemRegionInfo.getCity()+systemRegionInfo.getCounty());
        }
        if (baseDao.insert(orderSupport) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.Finance.CREATE_ORDER_FAIL);
        }
        //创建订单成功后构造第三方请求参数并返回
        return this.commmonCreateReq(orderSupport, req.getUserIP());
    }
    
    /**
     * 判断当前用户是否可以支持此项目
     * <功能详细描述>
     * @param projectId
     * @param returnId
     * @param returnNumber
     * @return
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    private boolean isCanSupport(String projectId, String returnId, String returnNumber,String amount)
    {
        //判断支持项目是否存在
        TProjectInfo project = new TProjectInfo();
        project.setProjectId(projectId);
        project = (TProjectInfo)baseDao.findById(project);
        if (project == null)
        {
            return false;
        }
        //判断是否已经超过投资期限或者不是认筹中
        Calendar cal = Calendar.getInstance();
        cal.setTime(project.getDateRaisedEnd());
        if (cal.getTime().getTime() < new Date().getTime()
            || !ProjectStatusEnum.ZCZ.getDataBaseVal().equals(project.getProjectStatus()))
        {
            return false;
        }
        //判断项目筹集金额是否已筹满
        QueryEvent event = new QueryEvent();
        event.putParameter("projectId", projectId);;
        event.setStatement("findRaisedIsFull");
        String isFull = (String)baseDao.findOneByCustom(event);
        //"1"代表已筹满
        if (CommonConstant.ONE.equals(isFull))
        {
            return false;
        }
        //判断回报数是否已满
        if (ProjectTypeEnum.HBXM.getDataBaseVal().equals(project.getProjectType()))
        {
            TProjectReturn projectReturn = new TProjectReturn();
            projectReturn.setReturnId(returnId);
            projectReturn = (TProjectReturn)baseDao.findById(projectReturn);
            if (projectReturn == null||(projectReturn.getSurplusCount()>=0 && projectReturn.getSurplusCount() < Integer.parseInt(returnNumber)))
            {
                return false;
            }
        }
        //判断梦想金额是否已满
        if (ProjectTypeEnum.MXXM.getDataBaseVal().equals(project.getProjectType()))
        {
            TProjectReturn projectReturn = new TProjectReturn();
            projectReturn.setReturnId(returnId);
            projectReturn = (TProjectReturn)baseDao.findById(projectReturn);
            if (projectReturn == null|| projectReturn.getSurplusCount() < Integer.parseInt(amount))
            {
                return false;
            }
        }
        return true;
    }
    
    @SuppressWarnings({"rawtypes", "unchecked"})
    private OrderPayReq commmonCreateReq(TOrderSupport orderSupport, String IP)
    {
        OrderPayReq orderPayReq = new OrderPayReq();
        orderPayReq.setPayType(SystemCache.getProperty(TrustVariables.PAY_TYPE));
        orderPayReq.setOrderId(orderSupport.getOrderId());
        orderPayReq.setOrderNo(orderSupport.getOrderNo());
        orderPayReq.setAmount(orderSupport.getSupportAmount());
        orderPayReq.setOrderDatetime(orderSupport.getDateCreate().toString());
        orderPayReq.setUserIp(IP);
        orderPayReq.setProjectId(orderSupport.getProjectId());
        QueryEvent event = new QueryEvent();
        event.setStatement("findProjectName");
        event.putParameter("projectId", orderSupport.getProjectId());;
        String projectName = (String)baseDao.findOneByCustom(event);
        orderPayReq.setBody(projectName);
        return orderPayReq;
    }
    
    
    /**
     * 订单支付
     */
    @SuppressWarnings("unchecked")
    @Override
    public OrderPayReq findSupportOrder(PayOrderReq req)throws Exception
    {
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setOrderId(req.getOrderId());
        orderSupport = (TOrderSupport)baseDao.findById(orderSupport);
        if(orderSupport == null)
        {
            throw new ServicesException(IDiMengResultCode.Finance.ORDER_NOT_EXIST);
        }
        if(!orderSupport.getUserId().equals(req.getUserId()))
        {
            throw new ServicesException(IDiMengResultCode.OrderManager.ERROR_ORDER_OP_FAIL);
        }
        if(!QOrderStatusEnum.DZF.getDataBaseVal().equals(orderSupport.getStatus()))
        {
            throw new ServicesException(IDiMengResultCode.OrderManager.ERROR_ORDER_OP_FAIL);
        }
        return this.commmonCreateReq(orderSupport, req.getUserIP());
    }
    
    
    /**
     * 支持项目回调业务
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    public BaseDataResp commonSupportCallBack(String orderId, Map<String, Object> param)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        //锁定订单表记录
        TOrderSupport orderSupport = new TOrderSupport();
        event.putParameter("orderId", orderId);
        event.setStatement("findTOrderSupportForUpdate");
        orderSupport = (TOrderSupport)baseDao.findOneByCustom(event);
        if(!(QOrderStatusEnum.DZF.getDataBaseVal().equals(orderSupport.getStatus())||
            QOrderStatusEnum.YQX.getDataBaseVal().equals(orderSupport.getStatus()))){
            return resp ;
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        if (IDiMengResultCode.Commons.SUCCESS.equals(param.get("resultCode")))
        {
            
            //订单支付成功
            TProjectReturn projectReturn = new TProjectReturn();
            orderSupport.setPayFlowNo(param.get("transactionId").toString());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            orderSupport.setDatePay(sdf.parse(param.get("timeEnd").toString()));
            orderSupport.setPayCheckStatus("");
            
            //锁定项目表记录
            TProjectInfo projectInfo = new TProjectInfo();
            event.putParameter("projectId", orderSupport.getProjectId());
            event.setStatement("findByIdTProjectForUpdate");
            projectInfo = (TProjectInfo)baseDao.findOneByCustom(event);
            
            TUser user = new TUser();
            user.setUserId(orderSupport.getUserId());
            user = (TUser)baseDao.findById(user);
            //支付成功发送短信
            super.sendOrderSms(orderSupport, projectInfo, CommonConstant.ZERO);
            //支付成功后的资金流水业务
            commonSupportSuccFlow(orderSupport, projectInfo);
            //判断是否是第一次支付， 如果是第一次则在首次交易记录表中插入一条数据
            commonFirstTrade(orderSupport.getUserId(),orderSupport.getOrderId(),orderSupport.getSupportAmount(),CommonConstant.ONE);
            //项目是否已失败
            if(ProjectStatusEnum.ZCSB.getDataBaseVal().equals(projectInfo.getProjectStatus())||
                ProjectStatusEnum.ZCCG.getDataBaseVal().equals(projectInfo.getProjectStatus()))
            {
                orderSupport.setRefundType(RefundTypeEnum.ZCSBTCTK.getDataBaseVal());
                resp.setCode(IDiMengResultCode.ProjectManage.ERROR_PROJECT__IS_FAILD);
            }
            //项目是否已删除
            else if(ProjectStatusEnum.YSC.getDataBaseVal().equals(projectInfo.getProjectStatus()))
            {
                orderSupport.setRefundType(RefundTypeEnum.XMSCYCTK.getDataBaseVal());
                resp.setCode(IDiMengResultCode.ProjectManage.ERROR_PROJECT__IS_DELETE);
            }
            //判断是否是回报项目
            else if (ProjectTypeEnum.HBXM.getDataBaseVal().equals(projectInfo.getProjectType()))
            {
                //回报项目则需要判断回报剩余可支持数是否不足
                event.putParameter("returnId", orderSupport.getReturnId());
                event.setStatement("findByIdTProjectReturnForUpdate");
                projectReturn = (TProjectReturn)baseDao.findOneByCustom(event);
                if ( projectReturn.getSurplusCount()>=0 && projectReturn.getSurplusCount() < Integer.parseInt(orderSupport.getSupportCount()))
                {
                    orderSupport.setRefundType(RefundTypeEnum.HBBZYCTK.getDataBaseVal());
                    resp.setCode(IDiMengResultCode.ProjectManage.ERROR_PROJECT_RETURN_OVERFLOW);
                }
            } 
            //判断是否是梦想项目
            else if (ProjectTypeEnum.MXXM.getDataBaseVal().equals(projectInfo.getProjectType()))
            {
                //梦想项目则需要判断梦想剩余可支持金额是否不足
                event.putParameter("returnId", orderSupport.getReturnId());
                event.setStatement("findByIdTProjectReturnForUpdate");
                projectReturn = (TProjectReturn)baseDao.findOneByCustom(event);
                if (new BigDecimal(projectReturn.getSurplusCount()).compareTo(orderSupport.getSupportAmount()) < 0)
                {
                    orderSupport.setRefundType(RefundTypeEnum.XMCEYCTK.getDataBaseVal());
                    resp.setCode(IDiMengResultCode.ProjectManage.ERROR_PROJECT_FINANCINGMAX);
                }
                //项目筹集金额是否已筹满
                if (projectInfo.getTargetAmount().compareTo(projectInfo.getRaisedAmount()) <= 0)
                {
                    orderSupport.setRefundType(RefundTypeEnum.XMCEYCTK.getDataBaseVal());
                    resp.setCode(IDiMengResultCode.ProjectManage.ERROR_PROJECT_FINANCINGMAX);
                } 
              //判断是否是公益项目   
            }else{
                //公益项目筹集金额是否已筹满
                if (projectInfo.getTargetAmount().compareTo(projectInfo.getRaisedAmount()) <= 0)
                {
                    orderSupport.setRefundType(RefundTypeEnum.XMCEYCTK.getDataBaseVal());
                    resp.setCode(IDiMengResultCode.ProjectManage.ERROR_PROJECT_FINANCINGMAX);
                } 
            }
            //支持失败，订单改为待退款
            if(!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode())){
                orderSupport.setStatus(QOrderStatusEnum.DTK.getDataBaseVal());
                orderSupport.setRefundNo(SerialNumberUtil.buildSn(SerialNumberTypeEnum.TK.getDataBaseVal()));
                orderSupport.setRefundReason(RefundTypeEnum.getDescrByDataBaseVal(orderSupport.getRefundType()));
                orderSupport.setDateRefund(DateUtil.getNow());
                //更新订单状态
                if (baseDao.update(orderSupport) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
                return resp;
            }
            //支持成功
            orderSupport.setStatus(QOrderStatusEnum.YZF.dataBaseVal);
            //更新已筹集金额
            projectInfo.setRaisedAmount(projectInfo.getRaisedAmount().add(orderSupport.getSupportAmount()));
            if (baseDao.update(projectInfo) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
            }
            //更新回报剩余可支持数
            if (ProjectTypeEnum.HBXM.getDataBaseVal().equals(projectInfo.getProjectType()))
            {
                orderSupport.setStatus(QOrderStatusEnum.DFH.dataBaseVal);
                projectReturn.setSurplusCount(projectReturn.getSurplusCount()
                    - Integer.parseInt(orderSupport.getSupportCount()));
                if (baseDao.update(projectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
            //更新梦想剩余可支持金额
            if (ProjectTypeEnum.MXXM.getDataBaseVal().equals(projectInfo.getProjectType()))
            {
                String supportAmount = orderSupport.getSupportAmount().toString();
                supportAmount = supportAmount.substring(0,supportAmount.length()-3);
                projectReturn.setSurplusCount(projectReturn.getSurplusCount() - Integer.parseInt(supportAmount));
                if (baseDao.update(projectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
            //用户是否有留言,有留言则向项目评论标插入一条记录
            if (orderSupport.getMessage() != null)
            {
                TQBusProjectComment projectComment = new TQBusProjectComment();
                projectComment.setCommentId(UUIDGenerate.generateShortUuid());
                projectComment.setOrderId(orderSupport.getOrderId());
                projectComment.setDateComment(DateUtil.getNow());
                projectComment.setCommentContent(orderSupport.getMessage());
                projectComment.setSupportAmount(orderSupport.getSupportAmount());
                projectComment.setUserId(orderSupport.getUserId());
                if (baseDao.insert(projectComment) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
                }
            }
            //插入一条项目动态
            TProjectDynamic projectDynamic = new TProjectDynamic();
            projectDynamic.setDynamicId(UUIDGenerate.generateShortUuid());
            projectDynamic.setProjectId(orderSupport.getProjectId());
            projectDynamic.setDateCreate(DateUtil.getNow());
            projectDynamic.setDynamicType(ProjectDynamicTypeEnum.ZCXM.getDataBaseVal());
            projectDynamic.setCreator(orderSupport.getUserId());
            projectDynamic.setSupportAmount(orderSupport.getSupportAmount());
            projectDynamic.setOrderNo(orderSupport.getOrderNo());
            if (baseDao.insert(projectDynamic) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
            
        }
        else if (IDiMengResultCode.PayResultCode.FAIL.equals(param.get("resultCode")))
        {
            //支付失败
            orderSupport.setStatus(QOrderStatusEnum.YSB.getDataBaseVal());
            resp.setCode(IDiMengResultCode.OrderManager.ERROR_ORDER_PAY_FAIL);
        }
        else
        {
            //支付异常
            orderSupport.setPayCheckStatus(OrderCheckStatusEnum.WDZ.getDataBaseVal());
            resp.setCode(IDiMengResultCode.OrderManager.ERROR_ORDER_PAY_EXCEPTION);
        }
        //更新订单状态
        if (baseDao.update(orderSupport) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        return resp;
    }
    
    /**
     * 支付后查询订单状态
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp supportOrderStatus(SupportDetailReq req)
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent<SupportDetailReq> event = new QueryEvent<SupportDetailReq>();
        event.setStatement("supportOrderStatus");
        event.setObj(req);
        
        /**
         * 查询订单详情
         */
        SupportOrderStatusResp supportOrderStatusResp = (SupportOrderStatusResp)baseDao.findOneByCustom(event);
        if(supportOrderStatusResp == null){
            resp.setCode(IDiMengResultCode.Finance.ORDER_NOT_EXIST);
            return resp;
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, supportOrderStatusResp);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    
    /**
     * 后台-财务管理-退款管理-订单退款失败-退款
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonRefund(IdReq req) throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        RefundReq refundReq = new RefundReq();
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setOrderId(req.getId());
        orderSupport = (TOrderSupport)baseDao.findById(orderSupport);
        if(orderSupport == null){
            throw new ServicesException(IDiMengResultCode.Finance.ORDER_NOT_EXIST);
        }
        if(!(QOrderStatusEnum.YSB.getDataBaseVal().equals(orderSupport.getStatus())&&OrderCheckStatusEnum.DZSB
            .getDataBaseVal().equals(orderSupport.getRefundCheckStatus()))){
            throw new ServicesException(IDiMengResultCode.OrderManager.ERROR_ORDER_OP_FAIL);
        }
        if (baseDao.update(orderSupport) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        refundReq.setOrderId(orderSupport.getOrderId());
        refundReq.setRefundAmount(orderSupport.getSupportAmount());
        refundReq.setPayType(SystemCache.getProperty(TrustVariables.PAY_TYPE));
        refundReq.setOrderNo(orderSupport.getOrderNo());
        refundReq.setOrderFlowNo(orderSupport.getPayFlowNo());
        refundReq.setRefundNo(orderSupport.getRefundNo());
        resp.setData(refundReq);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    
    
    


    
}
