/*
 * 文 件 名:  UserCapitalCommonService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年11月28日
 */
package com.dimeng.modules.bus.services.impl.base;

import java.math.BigDecimal;
import java.util.Date;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.table.project.TProjectInfo;
import com.dimeng.entity.table.user.TUserAccountRecord;
import com.dimeng.entity.table.user.TUserCapitalAccount;
import com.dimeng.enums.AccountTradeTypeEnum;
import com.dimeng.enums.AccountTypeEnum;
import com.dimeng.enums.AuditStatusEnum;
import com.dimeng.enums.CapitalDirectionEnum;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.utils.UUIDGenerate;

/**
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年11月28日]
 */
public class UserCapitalCommonService extends BaseServiceImpl
{
    
    /**
     * 查询用户资金账户 (for update)
     * <功能详细描述>
     * @param capitalAccount
     * @return
     * @throws ServicesException
     */
    @SuppressWarnings("unchecked")
    public TUserCapitalAccount findUserCapital_FU(TUserCapitalAccount capitalAccount)
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
     * 判断项目是否已验证
     * <功能详细描述>
     * @param projectId
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public boolean isValidProject(String projectId)
        throws Exception
    {
        boolean flag = false;
        TProjectInfo req = new TProjectInfo();
        req.setProjectId(projectId);
        QueryEvent<TProjectInfo> event = new QueryEvent<TProjectInfo>();
        event.setStatement("findQProjectValidStatus");
        event.setObj(req);
        String auditStatus = (String)baseDao.findOneByCustom(event);
        if (AuditStatusEnum.SHTG.getDataBaseVal().equals(auditStatus))
            flag = true;
        return flag;
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
    
    /**
     * 更新可用账户、冻结账户（从冻结账户 -> 可用账户）
     * <功能详细描述>
     * @param userId
     * @param projectId
     * @return
     * @throws ServicesException
     */
    @SuppressWarnings("unchecked")
    public BaseDataResp updateAvailableAndFrozenAmount(String userId, String projectId, BigDecimal raisedAmount)
        throws ServicesException
    {
        //更新用户资金账户，生成交易流水
        TUserCapitalAccount capitalAccount = new TUserCapitalAccount();
        capitalAccount.setUserId(userId);
        capitalAccount = findUserCapital_FU(capitalAccount);
        //可用金额加上项目已筹金额，冻结金额减去项目已筹金额
        capitalAccount.setAvailableAmount(capitalAccount.getAvailableAmount().add(raisedAmount));
        capitalAccount.setFrozenAmount(capitalAccount.getFrozenAmount().subtract(raisedAmount));
        TUserAccountRecord accountRecord = new TUserAccountRecord();
        accountRecord.setId(UUIDGenerate.generateShortUuid());
        accountRecord.setUserId(userId);
        accountRecord.setTradeType(AccountTradeTypeEnum.ZCCGYYZ.getDataBaseVal());
        accountRecord.setCapitalDirection(CapitalDirectionEnum.SR.getDataBaseVal());
        accountRecord.setTradeAmount(raisedAmount);
        accountRecord.setDateCreate(new Date());
        accountRecord.setProjectId(projectId);
        accountRecord.setAccountType(AccountTypeEnum.KYZH.getDataBaseVal());
        if (baseDao.insert(accountRecord) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        if (baseDao.update(capitalAccount) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 更新可用账户（从平台账户 -> 可用账户）
     * <功能详细描述>
     * @param userId
     * @param projectId
     * @return
     * @throws Exception 
     */
    @SuppressWarnings("unchecked")
    public BaseDataResp updateAvailableAmount(String userId, String projectId, String projectType,
        BigDecimal raisedAmount)
        throws Exception
    {
        //更新用户资金账户，生成交易流水
        TUserCapitalAccount capitalAccount = new TUserCapitalAccount();
        capitalAccount.setUserId(userId);
        capitalAccount = findUserCapital_FU(capitalAccount);
        capitalAccount.setAvailableAmount(capitalAccount.getAvailableAmount().add(raisedAmount));
        TUserAccountRecord accountRecord = new TUserAccountRecord();
        accountRecord.setId(UUIDGenerate.generateShortUuid());
        accountRecord.setUserId(userId);
        accountRecord.setTradeType(AccountTradeTypeEnum.ZCCGYYZ.getDataBaseVal());
        accountRecord.setCapitalDirection(CapitalDirectionEnum.SR.getDataBaseVal());
        accountRecord.setTradeAmount(raisedAmount);
        accountRecord.setDateCreate(new Date());
        accountRecord.setProjectId(projectId);
        accountRecord.setAccountType(AccountTypeEnum.KYZH.getDataBaseVal());
        if (baseDao.insert(accountRecord) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        if (baseDao.update(capitalAccount) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 更新冻结账户（从平台账户 -> 冻结账户）
     * <功能详细描述>
     * @param userId
     * @param projectId
     * @return
     * @throws Exception 
     */
    @SuppressWarnings("unchecked")
    public BaseDataResp updateFrozenAmount(String userId, String projectId, String projectType, BigDecimal raisedAmount)
        throws Exception
    {
        //更新用户资金账户，生成交易流水
        TUserCapitalAccount capitalAccount = new TUserCapitalAccount();
        capitalAccount.setUserId(userId);
        capitalAccount = findUserCapital_FU(capitalAccount);
        capitalAccount.setFrozenAmount(capitalAccount.getFrozenAmount().add(raisedAmount));
        TUserAccountRecord accountRecord = new TUserAccountRecord();
        accountRecord.setId(UUIDGenerate.generateShortUuid());
        accountRecord.setUserId(userId);
        accountRecord.setTradeType(AccountTradeTypeEnum.ZCCGWYZ.getDataBaseVal());
        accountRecord.setCapitalDirection(CapitalDirectionEnum.SR.getDataBaseVal());
        accountRecord.setTradeAmount(raisedAmount);
        accountRecord.setDateCreate(new Date());
        accountRecord.setProjectId(projectId);
        accountRecord.setAccountType(AccountTypeEnum.SDZH.getDataBaseVal());
        if (baseDao.insert(accountRecord) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        if (baseDao.update(capitalAccount) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
}
