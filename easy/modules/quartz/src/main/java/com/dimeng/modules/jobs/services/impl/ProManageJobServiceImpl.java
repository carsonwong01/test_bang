package com.dimeng.modules.jobs.services.impl;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.bus.FindQscProjectListResp;
import com.dimeng.entity.table.order.TOrderSupport;
import com.dimeng.entity.table.project.TProjectDynamic;
import com.dimeng.entity.table.project.TProjectInfo;
import com.dimeng.entity.table.site.TSiteHomeProject;
import com.dimeng.entity.table.site.TSiteInfo;
import com.dimeng.entity.table.user.TUserAccountRecord;
import com.dimeng.entity.table.user.TUserCapitalAccount;
import com.dimeng.enums.*;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.IMapperConstant;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.modules.jobs.services.ProManageJobService;
import com.dimeng.modules.message.services.IMessageService;
import com.dimeng.util.SerialNumberUtil;
import com.dimeng.utils.UUIDGenerate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 项目众筹中转众筹成功或失败-状态修改定时任务
 * <一句话功能简述> 
 * @author  song
 * @version  [版本号, 2016年10月19日]
 */
@Service
public class ProManageJobServiceImpl  extends BaseServiceImpl implements ProManageJobService
{
    @Resource
    private IMessageService msgService;
    
    @SuppressWarnings({"rawtypes", "unchecked"})
    public void commonProManageRunJob() throws Exception
    {
        logs.info("#####项目筹资期限到期项目状态修改定时任务开始#####");
        QueryEvent event = new QueryEvent();
        event.setStatement("findExpireProList");
        //查询到期的项目
        List<FindQscProjectListResp> list = baseDao.findAllIsPageByCustom(event);
        if (list.size() == 0)
        {
            logs.info("####无筹资到期的项目####");
            return;
        }
        //只要项目正常结束就算众筹成功
        List<FindQscProjectListResp> successList = new ArrayList<>();
        //只有取消项目时才是项目失败，这里注释掉
//        List<FindQscProjectListResp> failList = new ArrayList<>();
        for (FindQscProjectListResp req : list)
        {
        	//到期的把推荐项目列表给下了
            if(!"N".equals(req.getRecommendStatus())){
            	TSiteHomeProject homePro = new TSiteHomeProject();
            	homePro.setId(req.getRecommendStatus());
            	 baseDao.delete(homePro);
            }
        	 
//            BigDecimal b1 = new BigDecimal(req.getFacTarget());
//            BigDecimal b2 = new BigDecimal(req.getSupportAmt());
//            if(b2.compareTo(b1) < 0){
//                failList.add(req);
//                continue;
//            }
            successList.add(req); 
        }
        if(successList.size() != 0){
            Map map = new HashMap();
            map.put("list", successList);
            map.put("status", 2);
            baseDao.executeSQL(IMapperConstant.COMMON_UPDATE, "updateProStatus", map);
            commonProSuccess(successList);
        }
//        if(failList.size() != 0){
//            Map map = new HashMap();
//            map.put("list", failList);
//            map.put("status", 3);
//            baseDao.executeSQL(IMapperConstant.COMMON_UPDATE, "updateProStatus", map);
//            commonProFail(failList);
//        }
        logs.info("####项目众筹中筹资到期状态修改定时任务结束###");
        
    }
    
    @SuppressWarnings("unchecked")
    public void commonProSuccess(List<FindQscProjectListResp> list) throws Exception{
        for (FindQscProjectListResp pro : list)
        {
            boolean isOk = true;
            //未验证的项目
            if("0".equals(pro.getProValidate())){
                isOk = false;
            }
            //生成发起项目动态
            TProjectDynamic projectDynamic = new TProjectDynamic();
            projectDynamic.setDynamicId(UUIDGenerate.generateShortUuid());
            projectDynamic.setProjectId(pro.getProjectId());
            projectDynamic.setDateCreate(DateUtil.getNow());
            projectDynamic.setCreator(pro.getUserId());
            //项目动态类型：1发布新项目；2支持项目；3更新动态；4提前结束项目；5删除项目；6项目修改(有订单时修改公益项目) 7项目成功、8项目失败
            projectDynamic.setDynamicType(ProjectDynamicTypeEnum.ZCCG.getDataBaseVal());
            //动态内容
            projectDynamic.setDynamicInfo("项目众筹成功！");
            if (baseDao.insert(projectDynamic) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                logs.info("###新增项目动态(众筹成功结束项目)错误###");
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
           //更新待支付订单的状态为已失败
            TOrderSupport orderSupport = new TOrderSupport();
            orderSupport.setProjectId(pro.getProjectId());
            if ((Integer)baseDao.executeSQL("update", "updateOrderToFail", orderSupport) < DigitalAndStringConstant.DigitalConstant.ZERO)
            {
                logs.info("###更新订单状态错误###");
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
            }
            Integer type = Integer.parseInt(pro.getType());
            //回报项目或者梦想项目则还需要将已支付的订单变更为待发货状态
            if(type == 6){
              //更新支付订单的状态为待发货
                if ((Integer)baseDao.executeSQL("update", "updateOrderToBeShipped", orderSupport) < DigitalAndStringConstant.DigitalConstant.ZERO)
                {
                    logs.info("###更新订单状态错误###");
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
            //更新用户资金账户，生成交易流水
            TUserCapitalAccount capitalAccount = new TUserCapitalAccount();
            capitalAccount.setUserId(pro.getUserId());
            capitalAccount = findUserCapitalInfo(capitalAccount);
            TUserAccountRecord accountRecord = new TUserAccountRecord();
            //公益项目-项目验证通过就往可用金额-不通过就往锁定账户走-回报和梦想项目全部往锁定账户走
            if(type == 6){
                //如果是回报项目，还要判断下是否全部发货，全部发货走可用，否则走锁定
            	if(isOk && isAllOrderSend(pro.getProjectId())){
            		 capitalAccount.getFrozenAmount().add(new BigDecimal(pro.getSupportAmt()));
                     accountRecord.setTradeType(AccountTradeTypeEnum.ZCCGWYZ.getDataBaseVal());
                     accountRecord.setAccountType(AccountTypeEnum.KYZH.getDataBaseVal());
            	}else{
            		 capitalAccount.getFrozenAmount().add(new BigDecimal(pro.getSupportAmt()));
                     accountRecord.setTradeType(AccountTradeTypeEnum.ZCCGWYZ.getDataBaseVal());
                     accountRecord.setAccountType(AccountTypeEnum.SDZH.getDataBaseVal());
            	}
            }else{ 
            	if(isOk){
                    capitalAccount.getAvailableAmount().add(new BigDecimal(pro.getSupportAmt()));
                    accountRecord.setTradeType(AccountTradeTypeEnum.ZCCGYYZ.getDataBaseVal());
                    accountRecord.setAccountType(AccountTypeEnum.KYZH.getDataBaseVal());
                }else{
                    capitalAccount.getFrozenAmount().add(new BigDecimal(pro.getSupportAmt()));
                    accountRecord.setTradeType(AccountTradeTypeEnum.ZCCGWYZ.getDataBaseVal());
                    accountRecord.setAccountType(AccountTypeEnum.SDZH.getDataBaseVal());
                } 
            }
            capitalAccount.setDateUpdate(DateUtil.getNow());
            //交易流水
            accountRecord.setId(UUIDGenerate.generateShortUuid());
            accountRecord.setUserId(pro.getUserId());
            accountRecord.setCapitalDirection(CapitalDirectionEnum.SR.getDataBaseVal());
            accountRecord.setTradeAmount(new BigDecimal(pro.getSupportAmt()));
            accountRecord.setDateCreate(DateUtil.getNow());
            accountRecord.setProjectId(pro.getProjectId());
            if (baseDao.insert(accountRecord) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                logs.info("###新增用户账户交易流水错误###");
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
            if (baseDao.update(capitalAccount) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                logs.info("###更新用户资金账户错误###");
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
            }
            //发送短信
           //从缓存中获得站点信息
            TSiteInfo siteInfo = (TSiteInfo)systemCache.get(SystemConstant.CacheKey.SITE_INFO).getObjectValue();
            //查询用户电话号码
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("userId", pro.getUserId());
            List<String> phone = (List<String>)baseDao.executeSQL("select", "findUserPhoneByUserId", params);
            //发送短信
            String[] pars = new String[] {siteInfo.getSiteName(), pro.getTitle()};
            msgService.sendSms("0", TemplateTypeEnumEasy.CROW_SUCCESS.dataBaseVal, pars, phone.get(0));
        }
    }
    
    @SuppressWarnings("unchecked")
    public void commonProFail(List<FindQscProjectListResp> list) throws ServicesException{
        for (FindQscProjectListResp pro : list)
        { 
            //生成发起项目动态
            TProjectDynamic projectDynamic = new TProjectDynamic();
            projectDynamic.setDynamicId(UUIDGenerate.generateShortUuid());
            projectDynamic.setProjectId(pro.getProjectId());
            projectDynamic.setDateCreate(DateUtil.getNow());
            projectDynamic.setCreator(pro.getUserId());
            //项目动态类型：1发布新项目；2支持项目；3更新动态；4提前结束项目；5删除项目；6项目修改(有订单时修改公益项目) 7项目成功、8项目失败
            projectDynamic.setDynamicType(ProjectDynamicTypeEnum.ZCSB.getDataBaseVal());
            //动态内容
            projectDynamic.setDynamicInfo("资金未筹满，项目众筹失败！");
            if (baseDao.insert(projectDynamic) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                logs.info("###新增项目动态(众筹失败结束项目)错误###");
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
            
            //更新订单状态为待退款
            Map<String, String> refundOrderListParams = new HashMap<String, String>();
            refundOrderListParams.put("projectId", pro.getProjectId());
            List<String> refundOrderList =
                (List<String>)baseDao.executeSQL("select", "findOrderIdListForUpdate", refundOrderListParams);
            if (refundOrderList != null)
            { 
                TOrderSupport orderSupport = new TOrderSupport();
                orderSupport.setStatus(PayStatusEnum.DTK.dataBaseVal);
                orderSupport.setRefundType(RefundTypeEnum.ZCSBTK.dataBaseVal);
                for (String orderId : refundOrderList)
                {
                	orderSupport.setOrderId(orderId);
                	orderSupport.setDateRefund(DateUtil.getNow());
                	orderSupport.setRefundReason(RefundTypeEnum.ZCSBTK.descr);
                	orderSupport.setRefundNo(SerialNumberUtil.buildSn(SerialNumberTypeEnum.TK.getDataBaseVal()));
                    if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(orderSupport))
                    {
                        throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                    }
                }
            } 
            //查询项目的所有已支付用户id： 3:已支付\r\n            4:待发货\r\n            5:待收货\r\n            6:已收货\r\n     
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("projectId", pro.getProjectId());
            List<String> supportUserIds =
                (List<String>)baseDao.executeSQL("select", "findProjectSupportUserPhones", params);
            //查询项目创建发起人的电话号码
            params = new HashMap<String, Object>();
            params.put("userId", pro.getUserId());
            List<String> phone = (List<String>)baseDao.executeSQL("select", "findUserPhoneByUserId", params);

            //从缓存中获得站点信息
            TSiteInfo siteInfo = (TSiteInfo)systemCache.get(SystemConstant.CacheKey.SITE_INFO).getObjectValue();
            //发送短信
            //发给项目发起人
            Object[] pars =
                new String[] {siteInfo.getSiteName(), pro.getTitle(), siteInfo.getServicePhone()};
            msgService.sendSms("0", TemplateTypeEnumEasy.CROW_FAIL_NOTICE_SPONSOR.dataBaseVal, pars, phone.get(0));
            //发给项目支持人
            if (supportUserIds != null && supportUserIds.size() > 0)
            { 
               pars = new String[] {siteInfo.getSiteName(), pro.getTitle(),
                        siteInfo.getServicePhone()};
                for (String phoneItem : supportUserIds)
                {
                    msgService.sendSms("0",
                        TemplateTypeEnumEasy.PROJECT_DELETE_NOTICE_SUPPORTOR.dataBaseVal,
                        pars,
                        phoneItem);
                }
            } 
        }
    }
    
    /**
     * 查询用户资金账户 (for update)
     * <功能详细描述>
     * @param capitalAccount
     * @return
     * @throws ServicesException
     */
    @SuppressWarnings("unchecked")
    public TUserCapitalAccount findUserCapitalInfo(TUserCapitalAccount capitalAccount)
        throws ServicesException
    {
        QueryEvent<TUserCapitalAccount> event = new QueryEvent<TUserCapitalAccount>();
        event.setStatement("findUserCapitalAccount");
        event.setObj(capitalAccount);
        capitalAccount = (TUserCapitalAccount)baseDao.findOneByCustom(event);
        //资金账户不存在
        if (null == capitalAccount)
        {
            throw new ServicesException(IDiMengResultCode.Finance.CAPITALACCOUNT_NOT_EXIST);
        }
        return capitalAccount;
    }
     
    /**
     * 判断项目是否全部发货完毕
     * <功能详细描述>
     * @param projectId
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public boolean isAllOrderSend(String projectId)
        throws Exception
    {
        boolean flag = false;
        TProjectInfo req = new TProjectInfo();
        req.setProjectId(projectId);
        QueryEvent<TProjectInfo> event = new QueryEvent<TProjectInfo>();
        event.setStatement("findQProjectNotSendCount");
        event.setObj(req);
        Integer notSendCount = (Integer)baseDao.findOneByCustom(event);
        if (notSendCount != null && notSendCount == 0)
            flag = true;
        return flag;
    }
    
}
