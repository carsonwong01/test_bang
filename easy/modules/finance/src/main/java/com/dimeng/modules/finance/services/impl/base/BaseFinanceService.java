package com.dimeng.modules.finance.services.impl.base;

import java.math.BigDecimal;

import javax.annotation.Resource;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.table.order.TOrderFirstTradeRecord;
import com.dimeng.entity.table.order.TOrderSupport;
import com.dimeng.entity.table.project.TProjectInfo;
import com.dimeng.entity.table.site.TSiteInfo;
import com.dimeng.entity.table.user.TUser;
import com.dimeng.entity.table.user.TUserAccountFlowRecord;
import com.dimeng.entity.table.user.TUserCapitalAccount;
import com.dimeng.enums.CapitalDirectionEnum;
import com.dimeng.enums.RefundTypeEnum;
import com.dimeng.enums.TemplateTypeEnumEasy;
import com.dimeng.enums.UserFlowTradeTypeEnum;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.modules.message.services.IMessageService;
import com.dimeng.utils.UUIDGenerate;

public class BaseFinanceService extends BaseServiceImpl
{
    @Resource
    private IMessageService msgService;
    /**
     * 支持项目成功后的资金流水
     * @throws Exception 
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public void commonSupportSuccFlow(TOrderSupport orderSupport, TProjectInfo projectInfo)
        throws Exception
    {
        QueryEvent event = new QueryEvent();
        //新增一条用户资金明细
        TUserAccountFlowRecord userFlow = new TUserAccountFlowRecord();
        userFlow.setId(UUIDGenerate.generateShortUuid());
        userFlow.setTradeType(UserFlowTradeTypeEnum.ZF.getDataBaseVal());
        userFlow.setCapitalDirection(CapitalDirectionEnum.ZC.getDataBaseVal());
        userFlow.setTradeAmount(orderSupport.getSupportAmount());
        userFlow.setDateCreate(DateUtil.getNow());
        userFlow.setOrderId(orderSupport.getOrderId());
        userFlow.setUserId(orderSupport.getUserId());
        userFlow.setRemark(orderSupport.getOrderNo() + "订单，支付，（项目：" + projectInfo.getProjectName() + "）");
        if (baseDao.insert(userFlow) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        //新增一条平台资金，并更新平台资金。
        event.setStatement("findPlatformAccount");
        TUserCapitalAccount platformAccount = (TUserCapitalAccount)baseDao.findOneByCustom(event);
        BigDecimal availableAmount = platformAccount.getAvailableAmount().add(orderSupport.getSupportAmount());
        platformAccount.setAvailableAmount(availableAmount);
        if (baseDao.update(platformAccount) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        TUserAccountFlowRecord platformFlow = new TUserAccountFlowRecord();
        platformFlow.setId(UUIDGenerate.generateShortUuid());
        platformFlow.setTradeType(UserFlowTradeTypeEnum.ZF.getDataBaseVal());
        platformFlow.setCapitalDirection(CapitalDirectionEnum.SR.getDataBaseVal());
        platformFlow.setTradeAmount(orderSupport.getSupportAmount());
        platformFlow.setDateCreate(DateUtil.getNow());
        platformFlow.setOrderId(orderSupport.getOrderId());
        platformFlow.setUserId(platformAccount.getUserId());
        platformFlow.setRemark(orderSupport.getOrderNo() + "订单，订单支付");
        platformFlow.setAccountBalance(availableAmount);
        if (baseDao.insert(platformFlow) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
    }
    
    /**
     * 用户第一次支付/提现，插入一条记录
     * <功能详细描述>
     * @param orderSupport
     * @throws Exception 
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public void commonFirstTrade(String userId,String orderId,BigDecimal amount,String type) throws Exception{
        QueryEvent event = new QueryEvent();
        event.putParameter("userId", userId);
        event.putParameter("type", type);
        event.setStatement("isFirstTrade");
        String isFirst = (String)baseDao.findOneByCustom(event);
        //"0"是   "1"不是
        if (CommonConstant.ZERO.equals(isFirst))
        {
            TOrderFirstTradeRecord orderFirstTradeRecord  = new TOrderFirstTradeRecord();
            orderFirstTradeRecord.setOrderId(orderId);
            orderFirstTradeRecord.setUserId(userId);
            orderFirstTradeRecord.setAmount(amount);
            orderFirstTradeRecord.setType(type);
            orderFirstTradeRecord.setDateTrade(DateUtil.getNow());
            if (baseDao.insert(orderFirstTradeRecord) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
        }
    }
    
    
    @SuppressWarnings("unchecked")
    public void sendOrderSms(TOrderSupport orderSupport,TProjectInfo projectInfo,String type)throws Exception{
        //从缓存中获得站点信息
        TSiteInfo siteInfo = (TSiteInfo)systemCache.get(SystemConstant.CacheKey.SITE_INFO).getObjectValue();
        
        TUser user = new TUser();
        user.setUserId(orderSupport.getUserId());
        user = (TUser)baseDao.findById(user);
        Object[] pars = null;
        String template = null ;
        if(CommonConstant.ZERO.equals(type)){
            pars = new String[] {siteInfo.getSiteName(), projectInfo.getProjectName(),
                orderSupport.getOrderNo(),orderSupport.getSupportAmount().toString()}; 
            template = TemplateTypeEnumEasy.ORDER_PAY_SUCCESS.dataBaseVal;
        }else{
            if(RefundTypeEnum.XMSCTK.getDataBaseVal().equals(orderSupport.getRefundType())){
                pars =new String[] {siteInfo.getSiteName(), projectInfo.getProjectName(),siteInfo.getServicePhone()}; 
                template = TemplateTypeEnumEasy.PROJECT_DELETE_REFUND.dataBaseVal;
            }else if(RefundTypeEnum.ZCSBTK.getDataBaseVal().equals(orderSupport.getRefundType())){
                pars =new String[] {siteInfo.getSiteName(), projectInfo.getProjectName(),siteInfo.getServicePhone()}; 
                template = TemplateTypeEnumEasy.CROW_FAIL_NOTICE_REFUND.dataBaseVal;
            }else{
            pars =new String[] {siteInfo.getSiteName(), projectInfo.getProjectName(),
                orderSupport.getOrderNo(),RefundTypeEnum.getDescrByDataBaseVal(orderSupport.getRefundType()),
                orderSupport.getSupportAmount().toString(),siteInfo.getServicePhone()};
            template = TemplateTypeEnumEasy.ORDER_PAY_OVERFLOW_REFUND.dataBaseVal;
            }
        }
        msgService.sendSms("0",
            template,
            pars,
            user.getMobile());
    }
    
}
