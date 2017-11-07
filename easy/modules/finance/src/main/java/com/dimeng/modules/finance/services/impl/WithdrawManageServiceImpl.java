package com.dimeng.modules.finance.services.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.finance.FindWithdrawListResp;
import com.dimeng.entity.table.bus.TBusWithdrawApply;
import com.dimeng.entity.table.site.TSiteInfo;
import com.dimeng.entity.table.user.TQUserBankCard;
import com.dimeng.entity.table.user.TUser;
import com.dimeng.entity.table.user.TUserAccountFlowRecord;
import com.dimeng.entity.table.user.TUserAccountRecord;
import com.dimeng.entity.table.user.TUserCapitalAccount;
import com.dimeng.enums.AccountTradeTypeEnum;
import com.dimeng.enums.AccountTypeEnum;
import com.dimeng.enums.CapitalDirectionEnum;
import com.dimeng.enums.TemplateTypeEnumEasy;
import com.dimeng.enums.UserFlowTradeTypeEnum;
import com.dimeng.enums.WithdrawStatusEnum;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.AuditWithdrawReq;
import com.dimeng.model.finance.FindWithdrawListReq;
import com.dimeng.model.finance.WithdrawApplyReq;
import com.dimeng.modules.finance.services.IWithdrawManageService;
import com.dimeng.modules.finance.services.impl.base.BaseFinanceService;
import com.dimeng.modules.message.services.IMessageService;
import com.dimeng.utils.Base64Decoder;
import com.dimeng.utils.ExportUtil;
import com.dimeng.utils.UUIDGenerate;

/**
 * 提现管理实现类
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年9月28日]
 */
@Service
public class WithdrawManageServiceImpl extends BaseFinanceService implements IWithdrawManageService
{
    @Resource
    private IMessageService msgService;
    
    /**
     * 提现管理提现记录列表
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findWithdrawList(FindWithdrawListReq req)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        QueryEvent<FindWithdrawListReq> event = new QueryEvent<FindWithdrawListReq>();
        event.setStatement("findWithdrawList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        //列表查询
        List<FindWithdrawListResp> findWithdrawList = baseDao.findAllIsPageByCustom(event);
        for (FindWithdrawListResp withdraw : findWithdrawList)
        {
            withdraw.setBankCardNo(Base64Decoder.decode(withdraw.getBankCardNo()));
        }
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findWithdrawList));
        //统计查询
        event.setStatement("findWithdrawTotal");
        FindWithdrawListResp result = (FindWithdrawListResp)baseDao.findOneByCustom(event);
        map.put(CommonConstant.JSON_KEY_COLUMNSTAT_RESULT, result);
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            //提现成功、待放款
            if (DigitalAndStringConstant.StringConstant.TWO.equals(req.getType())
                || DigitalAndStringConstant.StringConstant.ONE.equals(req.getType()))
            {
                Object[] param =
                    {"合计", "", "", "", "", "", result.getWithdrawTotal(), result.getPoundageTotal(),
                        result.getActualTotal(), "", "", ""};
                ExportUtil.export(req, findWithdrawList, param);
            }
            else
            //待审核-提现失败
            {
                Object[] param =
                    {"合计", "", "", "", result.getWithdrawTotal(), result.getPoundageTotal(), result.getActualTotal(),
                        "", "", ""};
                ExportUtil.export(req, findWithdrawList, param);
            }
            
        }
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 查询审核失败原因
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findWithdrawFailReason(IdReq req)
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<IdReq> event = new QueryEvent<IdReq>();
        event.setObj(req);
        event.setStatement("findWithdrawFailReason");
        data.put(CommonConstant.JSON_KEY_SINGLE_RESULT, baseDao.findOneByCustom(event));
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 提现审核
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonWithdrawAudit(AuditWithdrawReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        String checkStatus = req.getStatus();
        TBusWithdrawApply tBusWithdrawApply = new TBusWithdrawApply();
        tBusWithdrawApply.setId(req.getId());
        tBusWithdrawApply = (TBusWithdrawApply)baseDao.findById(tBusWithdrawApply);
        if (null == tBusWithdrawApply)
        {
            //提现记录不存在
            throw new ServicesException(IDiMengResultCode.Finance.WITHDRAW_RECORD_NOT_EXIST);
        }
        //更新提现记录
        tBusWithdrawApply.setCheckOpinion(req.getAuditInfo());
        tBusWithdrawApply.setWithdrawStatus(checkStatus.equals(CommonConstant.ONE) ? WithdrawStatusEnum.SHTG.getDataBaseVal()
            : WithdrawStatusEnum.TXSB.getDataBaseVal());
        tBusWithdrawApply.setAuditor(req.getUserId());
        tBusWithdrawApply.setDateCheck(DateUtil.getNow());
        if (baseDao.update(tBusWithdrawApply) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            //提现审核失败
            throw new ServicesException(IDiMengResultCode.Finance.WITHDRAW_CHECK_ERROR);
        }
        //审核不通过，向可用账户返回提现金额并向账户记录表插入一条提现失败记录。
        if (CommonConstant.TWO.equals(checkStatus))
        {
            //审核不通过业务处理
            commonWithdrawFail(tBusWithdrawApply);
            //提现失败发送短信
            //从缓存中获得站点信息
            TSiteInfo siteInfo = (TSiteInfo)systemCache.get(SystemConstant.CacheKey.SITE_INFO).getObjectValue();
            TUser user = new TUser();
            user.setUserId(tBusWithdrawApply.getUserId());
            user = (TUser)baseDao.findById(user);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Object[] parameter =
                new String[] {siteInfo.getSiteName(), formatter.format(tBusWithdrawApply.getDateCreate()),
                    tBusWithdrawApply.getWithdrawAmount().toString(), siteInfo.getServicePhone()};
            msgService.sendSms("0",
                TemplateTypeEnumEasy.CASH_WITHDRAWAL_AUDIT_NOPASS.dataBaseVal,
                parameter,
                user.getMobile());
            
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 提现审核不通过业务处理
     * 向可用账户返回提现金额并向账户记录表插入一条提现失败记录
     * @param tBusWithdrawApply
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    private void commonWithdrawFail(TBusWithdrawApply tBusWithdrawApply)
        throws Exception
    {
        //查询用户资金账户
        TUserCapitalAccount capitalAccount = new TUserCapitalAccount();
        capitalAccount.setUserId(tBusWithdrawApply.getUserId());
        capitalAccount = findUserCapital(capitalAccount);
        //账户可用余额
        BigDecimal availableAmount = capitalAccount.getAvailableAmount();
        //返回提现金额
        availableAmount = availableAmount.add(tBusWithdrawApply.getWithdrawAmount());
        capitalAccount.setAvailableAmount(availableAmount);
        if (baseDao.update(capitalAccount) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        //插入一条提现失败记录
        TUserAccountRecord tUserAccountRecord = new TUserAccountRecord();
        tUserAccountRecord.setId(UUIDGenerate.generateShortUuid());
        tUserAccountRecord.setUserId(tBusWithdrawApply.getUserId());
        tUserAccountRecord.setTradeType(AccountTradeTypeEnum.TXSB.dataBaseVal);
        tUserAccountRecord.setCapitalDirection(CapitalDirectionEnum.SR.dataBaseVal);
        tUserAccountRecord.setTradeAmount(tBusWithdrawApply.getWithdrawAmount());
        tUserAccountRecord.setDateCreate(DateUtil.getNow());
        tUserAccountRecord.setAccountType(AccountTypeEnum.KYZH.dataBaseVal);
        if (baseDao.insert(tUserAccountRecord) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
    }
    
    /**
     * 提现审核通过业务处理
     * <功能详细描述>
     * @param tBusWithdrawApply
     * @throws Exception
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    private void commonWithdrawSucc(TBusWithdrawApply tBusWithdrawApply, String userName)
        throws Exception
    {
        //用户资金明细表插入两条记录，分别为提现收入和手续费支出记录
        TUserAccountFlowRecord userAccountFlowRecord = new TUserAccountFlowRecord();
        userAccountFlowRecord.setId(UUIDGenerate.generateShortUuid());
        userAccountFlowRecord.setUserId(tBusWithdrawApply.getUserId());
        userAccountFlowRecord.setTradeType(UserFlowTradeTypeEnum.TX.dataBaseVal);
        userAccountFlowRecord.setCapitalDirection(CapitalDirectionEnum.SR.dataBaseVal);
        userAccountFlowRecord.setTradeAmount(tBusWithdrawApply.getWithdrawAmount());
        userAccountFlowRecord.setDateCreate(DateUtil.getNow());
        userAccountFlowRecord.setRemark("提现");
        if (baseDao.insert(userAccountFlowRecord) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        TUserAccountFlowRecord feeFlow = new TUserAccountFlowRecord();
        feeFlow.setId(UUIDGenerate.generateShortUuid());
        feeFlow.setUserId(tBusWithdrawApply.getUserId());
        feeFlow.setTradeType(UserFlowTradeTypeEnum.TXSXF.dataBaseVal);
        feeFlow.setCapitalDirection(CapitalDirectionEnum.ZC.dataBaseVal);
        feeFlow.setTradeAmount(tBusWithdrawApply.getPoundage());
        feeFlow.setDateCreate(DateUtil.getNow());
        feeFlow.setRemark("提现手续费");
        if (baseDao.insert(feeFlow) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        //平台账户资金明细插入两条记录，分别为提现支出和手续费收入记录
        QueryEvent event = new QueryEvent();
        event.setStatement("findPlatformAccount");
        TUserCapitalAccount platformAccount = (TUserCapitalAccount)baseDao.findOneByCustom(event);
        //减去提现金额后平台的可用余额
        BigDecimal availableAmount =
            platformAccount.getAvailableAmount().subtract(tBusWithdrawApply.getWithdrawAmount());
        //平台支出提现金额记录
        TUserAccountFlowRecord platformFlowRecord = new TUserAccountFlowRecord();
        platformFlowRecord.setId(UUIDGenerate.generateShortUuid());
        platformFlowRecord.setTradeType(UserFlowTradeTypeEnum.TX.getDataBaseVal());
        platformFlowRecord.setCapitalDirection(CapitalDirectionEnum.ZC.getDataBaseVal());
        platformFlowRecord.setTradeAmount(tBusWithdrawApply.getWithdrawAmount());
        platformFlowRecord.setDateCreate(DateUtil.getNow());
        platformFlowRecord.setOrderId(tBusWithdrawApply.getId());
        platformFlowRecord.setUserId(platformAccount.getUserId());
        platformFlowRecord.setRemark("用户" + userName + "提现");
        platformFlowRecord.setAccountBalance(availableAmount);
        if (baseDao.insert(platformFlowRecord) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        //平台收取提现手续费记录
        TUserAccountFlowRecord feeFlowRecord = new TUserAccountFlowRecord();
        //加上手续费后平台的可用余额
        availableAmount = availableAmount.add(tBusWithdrawApply.getPoundage());
        feeFlowRecord.setId(UUIDGenerate.generateShortUuid());
        feeFlowRecord.setTradeType(UserFlowTradeTypeEnum.TXSXF.getDataBaseVal());
        feeFlowRecord.setCapitalDirection(CapitalDirectionEnum.SR.getDataBaseVal());
        feeFlowRecord.setTradeAmount(tBusWithdrawApply.getPoundage());
        feeFlowRecord.setDateCreate(DateUtil.getNow());
        feeFlowRecord.setOrderId(tBusWithdrawApply.getId());
        feeFlowRecord.setUserId(platformAccount.getUserId());
        feeFlowRecord.setRemark("提现手续费");
        feeFlowRecord.setAccountBalance(availableAmount);
        if (baseDao.insert(feeFlowRecord) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        //更新平台账户资金
        platformAccount.setAvailableAmount(availableAmount);
        if (baseDao.update(platformAccount) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
    }
    
    /**
     * 查询用户资金账户 (for update)
     * <功能详细描述>
     * @param capitalAccount
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public TUserCapitalAccount findUserCapital(TUserCapitalAccount capitalAccount)
        throws Exception
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
     * 提现放款审核
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonWithdrawLoan(AuditWithdrawReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        String checkStatus = req.getStatus();
        TBusWithdrawApply tBusWithdrawApply = new TBusWithdrawApply();
        tBusWithdrawApply.setId(req.getId());
        tBusWithdrawApply = (TBusWithdrawApply)baseDao.findById(tBusWithdrawApply);
        if (null == tBusWithdrawApply)
        {
            //提现记录不存在
            throw new ServicesException(IDiMengResultCode.Finance.WITHDRAW_RECORD_NOT_EXIST);
        }
        //从缓存中获得站点信息
        TSiteInfo siteInfo = (TSiteInfo)systemCache.get(SystemConstant.CacheKey.SITE_INFO).getObjectValue();
        TUser user = new TUser();
        user.setUserId(tBusWithdrawApply.getUserId());
        user = (TUser)baseDao.findById(user);
        if (CommonConstant.ONE.equals(req.getStatus()))
        {
            this.commonWithdrawSucc(tBusWithdrawApply, user.getUserName());
            //如果是第一次提交则向第一次交易记录表插入一条记录
            commonFirstTrade(tBusWithdrawApply.getUserId(),
                tBusWithdrawApply.getId(),
                tBusWithdrawApply.getWithdrawAmount(),
                CommonConstant.TWO);
            //提现成功发送短信
            //实际到账金额
            String realAmount =
                tBusWithdrawApply.getWithdrawAmount().subtract(tBusWithdrawApply.getPoundage()).toString();
            //获取银行卡号后四位
            TQUserBankCard userBankCard = new TQUserBankCard();
            userBankCard.setId(tBusWithdrawApply.getBankCardId());
            userBankCard = (TQUserBankCard)baseDao.findById(userBankCard);
            String bankCard = userBankCard.getCardNumber();
            bankCard = bankCard.substring(bankCard.length() - 4, bankCard.length());
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Object[] parameter =
                new String[] {siteInfo.getSiteName(), formatter.format(DateUtil.getNow()),
                    tBusWithdrawApply.getWithdrawAmount().toString(), tBusWithdrawApply.getPoundage().toString(),
                    realAmount, bankCard, siteInfo.getServicePhone()};
            msgService.sendSms("0",
                TemplateTypeEnumEasy.CASH_WITHDRAWAL_AUDIT_PASS.dataBaseVal,
                parameter,
                user.getMobile());
        }
        else
        {
            this.commonWithdrawFail(tBusWithdrawApply);
            //提现失败发送短信
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Object[] parameter =
                new String[] {siteInfo.getSiteName(), formatter.format(tBusWithdrawApply.getDateCreate()),
                    tBusWithdrawApply.getWithdrawAmount().toString(), siteInfo.getServicePhone()};
            msgService.sendSms("0",
                TemplateTypeEnumEasy.CASH_WITHDRAWAL_AUDIT_NOPASS.dataBaseVal,
                parameter,
                user.getMobile());
        }
        //更新提现记录
        tBusWithdrawApply.setLoanOpinion(req.getAuditInfo());
        tBusWithdrawApply.setWithdrawStatus(checkStatus.equals(CommonConstant.ONE) ? WithdrawStatusEnum.TXCG.getDataBaseVal()
            : WithdrawStatusEnum.TXSB.getDataBaseVal());
        tBusWithdrawApply.setLoaner(req.getUserId());
        tBusWithdrawApply.setDateLoan(DateUtil.getNow());
        if (baseDao.update(tBusWithdrawApply) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            //提现放款审核失败
            throw new ServicesException(IDiMengResultCode.Finance.WITHDRAW_LOAN_ERROR);
        }
        
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 前台-用户提现申请
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertWithdraw(WithdrawApplyReq req)
        throws Exception
    {
        //判断提现金额是否正确
        TUserCapitalAccount userAccount = new TUserCapitalAccount();
        userAccount.setUserId(req.getUserId());
        userAccount = (TUserCapitalAccount)baseDao.findById(userAccount);
        if (userAccount.getAvailableAmount().compareTo(new BigDecimal(req.getWithdrawAmt())) < 0)
        {
            throw new ServicesException(IDiMengResultCode.Finance.WITHDRAW_QUOTA_NOT_CORRECT);
        }
        double minWithdrawAmount =
            Double.parseDouble(systemCache.get(SystemConstant.CacheKey.MIN_WITHDRAW).getObjectValue().toString());
        double maxWithdrawAmount =
            Double.parseDouble(systemCache.get(SystemConstant.CacheKey.MAX_WITHDRAW).getObjectValue().toString());
        if (maxWithdrawAmount < Double.parseDouble(req.getWithdrawAmt())
            || minWithdrawAmount > Double.parseDouble(req.getWithdrawAmt()))
        {
            throw new ServicesException(IDiMengResultCode.Finance.WITHDRAW_QUOTA_NOT_CORRECT);
        }
        
        //提现手续费
        BigDecimal fee = new BigDecimal(this.commonWithdrawFee(req).getData().toString());
        //新增提现记录
        TBusWithdrawApply busWithdrawApply = new TBusWithdrawApply();
        busWithdrawApply.setId(UUIDGenerate.generateShortUuid());
        busWithdrawApply.setUserId(req.getUserId());
        busWithdrawApply.setWithdrawAmount(new BigDecimal(req.getWithdrawAmt()));
        busWithdrawApply.setPoundage(fee);
        busWithdrawApply.setBankCardId(req.getBankCardId());
        busWithdrawApply.setDateCreate(DateUtil.getNow());
        busWithdrawApply.setWithdrawStatus(WithdrawStatusEnum.DSH.getDataBaseVal());
        if (baseDao.insert(busWithdrawApply) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        //更新用户账户可用资金，并生成一条账户表交易明细
        //查询用户资金账户
        TUserCapitalAccount capitalAccount = new TUserCapitalAccount();
        capitalAccount.setUserId(req.getUserId());
        capitalAccount = findUserCapital(capitalAccount);
        //账户可用余额
        BigDecimal availableAmount = capitalAccount.getAvailableAmount();
        //返回提现金额
        availableAmount = availableAmount.subtract(busWithdrawApply.getWithdrawAmount());
        capitalAccount.setAvailableAmount(availableAmount);
        if (baseDao.update(capitalAccount) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        //账户交易表插入一条提现申请记录
        TUserAccountRecord tUserAccountRecord = new TUserAccountRecord();
        tUserAccountRecord.setId(UUIDGenerate.generateShortUuid());
        tUserAccountRecord.setUserId(req.getUserId());
        tUserAccountRecord.setTradeType(AccountTradeTypeEnum.TXSQ.dataBaseVal);
        tUserAccountRecord.setCapitalDirection(CapitalDirectionEnum.ZC.dataBaseVal);
        tUserAccountRecord.setTradeAmount(busWithdrawApply.getWithdrawAmount());
        tUserAccountRecord.setDateCreate(DateUtil.getNow());
        tUserAccountRecord.setAccountType(AccountTypeEnum.KYZH.dataBaseVal);
        if (baseDao.insert(tUserAccountRecord) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        //申请成功发送短信
        //从缓存中获得站点信息
        TSiteInfo siteInfo = (TSiteInfo)systemCache.get(SystemConstant.CacheKey.SITE_INFO).getObjectValue();
        TUser user = new TUser();
        user.setUserId(busWithdrawApply.getUserId());
        user = (TUser)baseDao.findById(user);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Object[] parameter =
            new String[] {siteInfo.getSiteName(), formatter.format(DateUtil.getNow()),
                busWithdrawApply.getWithdrawAmount().toString(), siteInfo.getServicePhone()};
        msgService.sendSms("0",
            TemplateTypeEnumEasy.CASH_WITHDRAWAL_APPLICATION.dataBaseVal,
            parameter,
            user.getMobile());
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 前台-计算提现手续费
     */
    @Override
    public BaseDataResp commonWithdrawFee(WithdrawApplyReq req)
    {
        BigDecimal withdrawRate =
            new BigDecimal(systemCache.get(SystemConstant.CacheKey.WITHDRAW_RATE).getObjectValue().toString()).divide(new BigDecimal(
                100));
        BigDecimal maxPoundage =
            new BigDecimal(systemCache.get(SystemConstant.CacheKey.WITHDRAW_HIGHEST).getObjectValue().toString());
        //手续费
        BigDecimal fee = new BigDecimal(req.getWithdrawAmt()).multiply(withdrawRate);
        //提现手续大于最大提现费率时，提现费为最大提现费
        if (maxPoundage.compareTo(fee) < 0)
        {
            fee = maxPoundage;
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setData(fee);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
}
