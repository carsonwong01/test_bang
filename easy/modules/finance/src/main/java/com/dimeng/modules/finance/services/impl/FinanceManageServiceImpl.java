package com.dimeng.modules.finance.services.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.finance.FindCapitalDetailsListResp;
import com.dimeng.entity.ext.finance.FindOrderCheckListResp;
import com.dimeng.entity.ext.finance.PlatformAdjustResp;
import com.dimeng.entity.ext.user.ConsoleUserInfo;
import com.dimeng.entity.table.bus.TQBusProjectComment;
import com.dimeng.entity.table.bus.TSystemAdjust;
import com.dimeng.entity.table.order.TOrderSupport;
import com.dimeng.entity.table.project.TProjectDynamic;
import com.dimeng.entity.table.project.TProjectInfo;
import com.dimeng.entity.table.project.TProjectReturn;
import com.dimeng.entity.table.user.TUserAccountFlowRecord;
import com.dimeng.entity.table.user.TUserCapitalAccount;
import com.dimeng.enums.CapitalDirectionEnum;
import com.dimeng.enums.OrderCheckStatusEnum;
import com.dimeng.enums.ProjectDynamicTypeEnum;
import com.dimeng.enums.ProjectStatusEnum;
import com.dimeng.enums.ProjectTypeEnum;
import com.dimeng.enums.QOrderStatusEnum;
import com.dimeng.enums.RefundTypeEnum;
import com.dimeng.enums.SerialNumberTypeEnum;
import com.dimeng.enums.UserFlowTradeTypeEnum;
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
import com.dimeng.model.finance.FindCapitalDetailsListReq;
import com.dimeng.model.finance.FindOrderCheckListReq;
import com.dimeng.model.finance.FindPlatformAdjustReq;
import com.dimeng.model.finance.TiaoZhangReq;
import com.dimeng.model.pay.OrderPayCheckReq;
import com.dimeng.model.pay.RefundReq;
import com.dimeng.modules.finance.services.IFinanceManageService;
import com.dimeng.modules.finance.services.impl.base.BaseFinanceService;
import com.dimeng.util.SerialNumberUtil;
import com.dimeng.utils.ExportUtil;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.SystemCache;
import com.dimeng.utils.UUIDGenerate;

@Service
public class FinanceManageServiceImpl extends BaseFinanceService implements IFinanceManageService
{
    

    /**
     * 后台-财务管理-财务管理-平台调账管理列表
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findPfTiaoZhangList(FindPlatformAdjustReq req)
    {
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        //列表查询
        QueryEvent<FindPlatformAdjustReq> event = new QueryEvent<FindPlatformAdjustReq>();
        event.setStatement("findPfTiaoZhangList");
        event.setObj(req);
        List<PlatformAdjustResp> findPfTiaoZhangList = baseDao.findAllIsPageByCustom(event);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findPfTiaoZhangList));
        //合计查询
        event.setStatement("findPfTiaoZhangListTotal");
        PlatformAdjustResp result = (PlatformAdjustResp)baseDao.findOneByCustom(event);
        map.put(CommonConstant.JSON_KEY_COLUMNSTAT_RESULT, result);
        //如果是第一次进页面则查询累计
        if(CommonConstant.ONE.equals(req.getType()))
        {
          //累计查询
            event.setStatement("findPfTiaoZhangListStat");
            PlatformAdjustResp resultStat = (PlatformAdjustResp)baseDao.findOneByCustom(event);
            map.put(CommonConstant.JSON_KEY_STAT_RESULT, resultStat);
        }
        
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Object[] param = {"合计", "",result.getIncomeTotal(),result.getExpenditureTotal(), "", "", "", ""};
            ExportUtil.export(req, findPfTiaoZhangList,param);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    /**
     * 后台-财务管理-财务管理-查看调账备注
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findTiaoZhangRemark(IdReq req)
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<IdReq> event = new QueryEvent<IdReq>();
        event.setStatement("findTiaoZhangRemark");
        event.setObj(req);
        data.put(CommonConstant.JSON_KEY_SINGLE_RESULT, baseDao.findOneByCustom(event));
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    
    /**
     * 后台-财务管理-财务管理-平台调账管理-调账
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonTiaoZhang(TiaoZhangReq req) throws Exception
    {
        //新增调账记录
        TSystemAdjust  systemAdjust = new TSystemAdjust();
        systemAdjust.setId(UUIDGenerate.generateShortUuid());
        systemAdjust.setAdjustType(req.getType());
        systemAdjust.setMoney(new BigDecimal(req.getTiaozhangAmt()));
        systemAdjust.setRemark(req.getRemark());
        systemAdjust.setDateCreate(DateUtil.getNow());
        ConsoleUserInfo user = LoginCache.getConsoleUserInfo();
        systemAdjust.setCreatorId(user.getUserId());
        systemAdjust.setFlowNo(SerialNumberUtil.buildSn(SerialNumberTypeEnum.TZ.getDataBaseVal()));
        TUserCapitalAccount platformAccount = findPlatformAccount();
        //调账后账户可用金额
        BigDecimal availableAmount = CapitalDirectionEnum.SR.dataBaseVal.equals(req.getType())?platformAccount.getAvailableAmount()
            .add(systemAdjust.getMoney()):platformAccount.getAvailableAmount().subtract(systemAdjust.getMoney());
        systemAdjust.setAccountBalance(availableAmount);
        platformAccount.setAvailableAmount(availableAmount);
        if (baseDao.insert(systemAdjust)< DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            //平台调账失败
            throw new ServicesException(IDiMengResultCode.Finance.PLATFORM_TIAOZHANG_ERROR);
        }
        //更新平台账户资金
        if (baseDao.update(platformAccount)< DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            //更新平台账户资金失败
            throw new ServicesException(IDiMengResultCode.Finance.PLATFORM_TIAOZHANG_ERROR);
        }
        //调账成功后生成资金流水
        TUserAccountFlowRecord userAccountFlowRecord = new TUserAccountFlowRecord();
        userAccountFlowRecord.setId(systemAdjust.getFlowNo());
        userAccountFlowRecord.setTradeType(UserFlowTradeTypeEnum.TZ.dataBaseVal);
        userAccountFlowRecord.setCapitalDirection(systemAdjust.getAdjustType());
        userAccountFlowRecord.setTradeAmount(systemAdjust.getMoney());
        userAccountFlowRecord.setDateCreate(DateUtil.getNow());
        userAccountFlowRecord.setUserId(platformAccount.getUserId());
        userAccountFlowRecord.setAccountBalance(systemAdjust.getAccountBalance());
        String remark = CapitalDirectionEnum.SR.dataBaseVal.equals(req.getType())?"平台调账收入":"平台调账收入";
        userAccountFlowRecord.setRemark(remark);
        if (baseDao.insert(userAccountFlowRecord)< DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            //资金流水记录插入失败
            throw new ServicesException(IDiMengResultCode.Finance.PLATFORM_TIAOZHANG_ERROR);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 查询平台账户
     * <功能详细描述>
     * @return
     * @throws Exception
     */
    @SuppressWarnings({"unchecked"})
    public TUserCapitalAccount findPlatformAccount()
        throws Exception
    {
        QueryEvent<IdReq> event = new QueryEvent<IdReq>();
        event.setStatement("findPlatformAccount");
        return (TUserCapitalAccount)baseDao.findOneByCustom(event);
    }

    /**
     * 后台-财务管理-财务管理-平台资金明细列表
     * 后台-财务管理-财务管理-用户资金明细列表
     * 前台-个人中心-交易明细
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findCapitalDetailsList(FindCapitalDetailsListReq req)
    {
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        //列表查询
        QueryEvent<FindCapitalDetailsListReq> event = new QueryEvent<FindCapitalDetailsListReq>();
        event.setStatement("findCapitalDetailsList");
        event.setObj(req);
        List<FindCapitalDetailsListResp> findCapitalDetailsList = baseDao.findAllIsPageByCustom(event);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findCapitalDetailsList));
        //合计查询
        event.setStatement("findCapitalDetailsListTotal");
        FindCapitalDetailsListResp result = (FindCapitalDetailsListResp)baseDao.findOneByCustom(event);
        map.put(CommonConstant.JSON_KEY_COLUMNSTAT_RESULT, result);
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Map<String, String> enumsValue = new HashMap<String, String>();
            enumsValue.put("type", "com.dimeng.enums.UserFlowTradeTypeEnum");
            req.setEnumsValue(enumsValue);
            Object[] param;
            if(CommonConstant.ZERO.equals(req.getListType()))
            {
                param = new Object[]{"合计", "",result.getIncomeTotal(),result.getExpenditureTotal(), "", "", "", "", ""};
            }
            else
            {
                param = new Object[]{"合计", "", "",result.getIncomeTotal(),result.getExpenditureTotal(), "", "", "", ""};
            }
            ExportUtil.export(req, findCapitalDetailsList,param);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    
    /**
     * 后台-财务管理-对账管理-支付对账列表
     * 后台-财务管理-对账管理-退款对账列表
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findOrderCheckList(FindOrderCheckListReq req)
    {
      //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        //列表查询
        QueryEvent<FindOrderCheckListReq> event = new QueryEvent<FindOrderCheckListReq>();
        event.setStatement("findOrderCheckList");
        event.setObj(req);
        List<FindOrderCheckListResp> findOrderCheckList = baseDao.findAllIsPageByCustom(event);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findOrderCheckList));
        
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Map<String, String> enumsValue = new HashMap<String, String>();
            enumsValue.put("payCheckStatus", "com.dimeng.enums.OrderCheckStatusEnum");
            enumsValue.put("refundCheckStatus", "com.dimeng.enums.OrderCheckStatusEnum");
            req.setEnumsValue(enumsValue);
            ExportUtil.export(req, findOrderCheckList);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 后台-财务管理-对账管理-支付对账
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonPayCheck(IdReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setOrderId(req.getId());
        orderSupport = (TOrderSupport)baseDao.findById(orderSupport);
        if(orderSupport == null)
        {
            throw new ServicesException(IDiMengResultCode.Finance.ORDER_NOT_EXIST);
        }
        //订单状态为待支付并且对账状态为未对账或对账失败才能去对账
        if(!(QOrderStatusEnum.DZF.getDataBaseVal().equals(orderSupport.getStatus())&& (OrderCheckStatusEnum.WDZ.getDataBaseVal()
            .equals(orderSupport.getPayCheckStatus())||OrderCheckStatusEnum.DZSB.getDataBaseVal().equals(orderSupport.getPayCheckStatus()))))
        {
            resp.setCode(IDiMengResultCode.OrderManager.ERROR_ORDER_OP_FAIL);
            return resp;
        }
        OrderPayCheckReq orderPayCheckReq = new OrderPayCheckReq();
        orderPayCheckReq.setOrderId(orderSupport.getOrderId());
        orderPayCheckReq.setOrderNo(orderSupport.getOrderNo());
        orderPayCheckReq.setOrderDatetime(orderSupport.getDateCreate().toString());
        orderPayCheckReq.setPayType(SystemCache.getProperty(TrustVariables.PAY_TYPE));
        resp.setData(orderPayCheckReq);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 后台-财务管理-对账管理-支付对账回调
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    public BaseDataResp commonSupportCheckCallBack(String orderId, Map<String, Object> param)throws Exception{
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
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
        orderSupport.setDatePayCheck(DateUtil.getNow());
        if (IDiMengResultCode.Commons.SUCCESS.equals(param.get("resultCode")))
        {
            //订单支付成功
            TProjectReturn projectReturn = new TProjectReturn();
            orderSupport.setPayFlowNo(param.get("transactionId").toString());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
            orderSupport.setDatePay(sdf.parse(param.get("timeEnd").toString()));
            orderSupport.setPayCheckStatus(OrderCheckStatusEnum.DZCG.getDataBaseVal());
            
            TProjectInfo projectInfo = new TProjectInfo();
            event.putParameter("projectId", orderSupport.getProjectId());
            event.setStatement("findByIdTProjectForUpdate");
            baseDao.findOneByCustom(event);
            projectInfo.setProjectId(orderSupport.getProjectId());
            projectInfo = (TProjectInfo)baseDao.findById(projectInfo);
            
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
                baseDao.findOneByCustom(event);
                projectReturn.setReturnId(orderSupport.getReturnId());
                projectReturn = (TProjectReturn)baseDao.findById(projectReturn);
                if (projectReturn.getSurplusCount()>=0 && projectReturn.getSurplusCount() < Integer.parseInt(orderSupport.getSupportCount()))
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
                if (projectInfo.getTargetAmount().compareTo(projectInfo.getRaisedAmount())<=0)
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
            if (orderSupport.getRemark() != null)
            {
                TQBusProjectComment projectComment = new TQBusProjectComment();
                projectComment.setCommentId(UUIDGenerate.generateShortUuid());
                projectComment.setOrderId(orderSupport.getOrderId());
                projectComment.setDateComment(DateUtil.getNow());
                projectComment.setCommentContent(orderSupport.getRemark());
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
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        }
        else if (IDiMengResultCode.PayResultCode.FAIL.equals(param.get("resultCode")))
        {
            //支付失败
            orderSupport.setStatus(QOrderStatusEnum.YSB.getDataBaseVal());
            orderSupport.setPayCheckStatus(OrderCheckStatusEnum.DZCG.getDataBaseVal());
            resp.setCode(IDiMengResultCode.OrderManager.ERROR_ORDER_PAY_FAIL);
        }
        else
        {
            //支付异常
            orderSupport.setPayCheckStatus(OrderCheckStatusEnum.DZSB.getDataBaseVal());
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
     * 后台-财务管理-对账管理-退款对账
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonRefundCheck(IdReq req)throws Exception
    {
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setOrderId(req.getId());
        orderSupport = (TOrderSupport)baseDao.findById(orderSupport);
        if(orderSupport == null)
        {
            throw new ServicesException(IDiMengResultCode.Finance.ORDER_NOT_EXIST);
        }
        //对账状态
        if(!QOrderStatusEnum.DTK.getDataBaseVal().equals(orderSupport.getStatus())||
            null ==orderSupport.getRefundCheckStatus()||"".equals(orderSupport.getRefundCheckStatus().trim()) )
        {
            throw new ServicesException(IDiMengResultCode.OrderManager.ERROR_ORDER_OP_FAIL);
        }
        RefundReq refundCheckReq = new RefundReq();
        refundCheckReq.setOrderId(orderSupport.getOrderId());
        refundCheckReq.setOrderNo(orderSupport.getOrderNo());
        refundCheckReq.setRefundNo(orderSupport.getRefundNo());
        refundCheckReq.setRefundFlowNo(orderSupport.getRefundFlowNo());
        refundCheckReq.setRefundAmount(orderSupport.getSupportAmount());
        refundCheckReq.setPayType(SystemCache.getProperty(TrustVariables.PAY_TYPE));
        BaseDataResp resp = new BaseDataResp();
        resp.setData(refundCheckReq);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    
    /**
     * 退款对账回调业务
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonRefundCheckCallBack(String orderId, Map<String, Object> param)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        //锁定订单表记录
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setOrderId(orderId);
        orderSupport = (TOrderSupport)baseDao.findById(orderSupport);
        //对账状态
        if(!QOrderStatusEnum.DTK.getDataBaseVal().equals(orderSupport.getStatus())||
            null ==orderSupport.getRefundCheckStatus()||"".equals(orderSupport.getRefundCheckStatus().trim()))
        {
            throw new ServicesException(IDiMengResultCode.OrderManager.ERROR_ORDER_OP_FAIL);
        }
        if (IDiMengResultCode.Commons.SUCCESS.equals(param.get("resultCode")))
        {
            //订单退款成功
            orderSupport.setStatus(QOrderStatusEnum.YTK.getDataBaseVal());
            orderSupport.setRefundCheckStatus(OrderCheckStatusEnum.DZCG.getDataBaseVal());
            orderSupport.setDateRefundFinish(DateUtil.getNow());
            orderSupport.setDateRefundCheck(DateUtil.getNow());
            orderSupport.setRefundFlowNo(param.get("refundFlowNo").toString());
            TProjectInfo projectInfo = new TProjectInfo();
            projectInfo.setProjectId(orderSupport.getProjectId());
            projectInfo = (TProjectInfo)baseDao.findById(projectInfo);
            //退款成功后的资金流水业务
            this.commonRefundSuccFlow(orderSupport, projectInfo);
            //支持失败发送短信
            super.sendOrderSms(orderSupport, projectInfo, CommonConstant.ONE);
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        }
        else if (IDiMengResultCode.PayResultCode.FAIL.equals(param.get("resultCode")))
        {
            //退款失败 退款订单还是为待退款
            orderSupport.setRefundCheckStatus(OrderCheckStatusEnum.DZCG.getDataBaseVal());
            orderSupport.setRemark(param.get("resultDes").toString());
        }
        else
        {
            //退款异常
            orderSupport.setRefundCheckStatus(OrderCheckStatusEnum.DZSB.getDataBaseVal());
            orderSupport.setRemark(param.get("resultDes").toString());
        }
        //更新订单状态
        if (baseDao.update(orderSupport) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        return resp;
    }
    
    @SuppressWarnings({"unchecked", "rawtypes"})
    public void commonRefundSuccFlow(TOrderSupport orderSupport, TProjectInfo projectInfo)
        throws Exception
    {
        QueryEvent event = new QueryEvent();
        //新增一条用户资金明细
        TUserAccountFlowRecord userFlow = new TUserAccountFlowRecord();
        userFlow.setId(UUIDGenerate.generateShortUuid());
        userFlow.setTradeType(UserFlowTradeTypeEnum.TK.getDataBaseVal());
        userFlow.setCapitalDirection(CapitalDirectionEnum.SR.getDataBaseVal());
        userFlow.setTradeAmount(orderSupport.getSupportAmount());
        userFlow.setDateCreate(DateUtil.getNow());
        userFlow.setOrderId(orderSupport.getOrderId());
        userFlow.setUserId(orderSupport.getUserId());
        userFlow.setRemark(orderSupport.getOrderNo() + "订单，"+RefundTypeEnum.getDescrByDataBaseVal(orderSupport.getRefundType())+"，（项目：" + projectInfo.getProjectName() + "）");
        if (baseDao.insert(userFlow) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        //新增一条平台资金，并更新平台资金。
        event.setStatement("findPlatformAccount");
        TUserCapitalAccount platformAccount = (TUserCapitalAccount)baseDao.findOneByCustom(event);
        BigDecimal availableAmount = platformAccount.getAvailableAmount().subtract(orderSupport.getSupportAmount());
        platformAccount.setAvailableAmount(availableAmount);
        if (baseDao.update(platformAccount) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        TUserAccountFlowRecord platformFlow = new TUserAccountFlowRecord();
        platformFlow.setId(UUIDGenerate.generateShortUuid());
        platformFlow.setTradeType(UserFlowTradeTypeEnum.TK.getDataBaseVal());
        platformFlow.setCapitalDirection(CapitalDirectionEnum.ZC.getDataBaseVal());
        platformFlow.setTradeAmount(orderSupport.getSupportAmount());
        platformFlow.setDateCreate(DateUtil.getNow());
        platformFlow.setOrderId(orderSupport.getOrderId());
        platformFlow.setUserId(platformAccount.getUserId());
        platformFlow.setRemark(orderSupport.getOrderNo() + "订单，"+RefundTypeEnum.getDescrByDataBaseVal(orderSupport.getRefundType()));
        platformFlow.setAccountBalance(availableAmount);
        if (baseDao.insert(platformFlow) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
    }
    
}
