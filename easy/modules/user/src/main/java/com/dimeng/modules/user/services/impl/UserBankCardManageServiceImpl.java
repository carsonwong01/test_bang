package com.dimeng.modules.user.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.user.FindCardListResp;
import com.dimeng.entity.table.user.TQUserBankCard;
import com.dimeng.entity.table.user.TQUserBasic;
import com.dimeng.enums.EnabledStatus;
import com.dimeng.enums.IdCardStatusEnum;
import com.dimeng.enums.UserBankCardTypeEnum;
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.enums.variable.SystemVariable;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.constants.DigitalAndStringConstant.DigitalConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.user.AddBankCardReq;
import com.dimeng.model.user.FindIdCardUniqueCpReq;
import com.dimeng.model.user.NotPageUserIdReq;
import com.dimeng.modules.user.services.UserBankCardManageService;
import com.dimeng.service.INciicService;
import com.dimeng.utils.Base64Decoder;
import com.dimeng.utils.SystemCache;
import com.dimeng.utils.UUIDGenerate;

/**
 * 银行卡管理
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月17日]
 */
@Service
public class UserBankCardManageServiceImpl extends BaseServiceImpl implements UserBankCardManageService
{
    @Autowired
    private INciicService iNciicService;
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findCardList(NotPageUserIdReq req)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        BaseDataResp resp = new BaseDataResp();
        
        QueryEvent<NotPageUserIdReq> event = new QueryEvent<NotPageUserIdReq>();
        event.setStatement("findCardList");
        event.setObj(req);
        List<FindCardListResp> result = baseDao.findAllIsPageByCustom(event);
        
        map.put(CommonConstant.JSON_KEY_LIST, result == null ? new ArrayList<FindCardListResp>() : result);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertBankCard(AddBankCardReq req)
        throws Throwable
    {
        BaseDataResp resp = new BaseDataResp();
        
        //查询该用户是否已经存在或已经进行实名认证
        TQUserBasic tqUserBasic = new TQUserBasic();
        tqUserBasic.setUserId(req.getUserId());
        tqUserBasic = (TQUserBasic)baseDao.findById(tqUserBasic);
        if (tqUserBasic == null)
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
        }
        if (IdCardStatusEnum.WRZ.dataBaseVal.equals(tqUserBasic.getIdcardStatus()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_NOT_NCIIC);
        }
        //判断用户添加银行卡是否已达上限
        int bankCandCount = countUserBankCard(req.getUserId());
        int maxBanCardCount = Integer.valueOf(SystemCache.getProperty(EasySystemVariable.BIND_BANK_CARD_MAX_COUNT));
        if (bankCandCount >= maxBanCardCount)
        {
            throw new ServicesException(IDiMengResultCode.UserManager.BANK_CARD_MAX);
        }
        //查询银行卡号（已删除和未删除的都查出来）
        TQUserBankCard bean = new TQUserBankCard();
        bean.setCardNumberEncrypt(req.getCardNumberEncrypt());
        QueryEvent<TQUserBankCard> event = new QueryEvent<TQUserBankCard>();
        event.setObj(bean);
        event.setStatement("findUserBankCardByCardNumber");
        TQUserBankCard tUserBankCard = (TQUserBankCard)baseDao.findOneByCustom(event);
        
        if (null != tUserBankCard)
        {
            //判断这张银行卡是否已存在
            if (String.valueOf(EnabledStatus.ENABLE.ordinal()).equals(tUserBankCard.getCardStatus()))
            {
                throw new ServicesException(IDiMengResultCode.UserManager.BANK_CARD_IS_EXIST);
            }
            else
            {
                //直接更新启用状态
                tUserBankCard.setCardStatus(String.valueOf(EnabledStatus.ENABLE.ordinal()));
                if (DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.update(tUserBankCard))
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
        }
        else
        //银行卡信息不存在，那么就插入数据
        {
            tUserBankCard = (TQUserBankCard)DimengBeanUtil.copyProperties(TQUserBankCard.class, req);
            tUserBankCard.setDateCreate(DateUtil.getNow());
            String cardNumberEncrypt = tUserBankCard.getCardNumberEncrypt();
            String cardNumber = Base64Decoder.decode(cardNumberEncrypt);
            //如果添加银行卡是个人银行，则需要第三方验证
            if (tUserBankCard.getCardType().equals(UserBankCardTypeEnum.GRYH.dataBaseVal) //是否开启调用第三方
                && Boolean.parseBoolean(SystemCache.getProperty(SystemVariable.IS_NCIIC)))
            {
                //第三方绑卡校验
                //调用第三方  根据返回结果码
                FindIdCardUniqueCpReq personCertreq = new FindIdCardUniqueCpReq();
                personCertreq.setCardNum(cardNumber);
                personCertreq.setIdCard(Base64Decoder.decode(tqUserBasic.getIdCard()));
                personCertreq.setRealName(req.getCardUserName());
                personCertreq.setUserType(DigitalAndStringConstant.StringConstant.ONE);
                resp = iNciicService.nciic(personCertreq);
                if (!resp.getCode().equals(IDiMengResultCode.Commons.SUCCESS))
                {
                    resp.setCode(IDiMengResultCode.UserManager.ERROR_REALNAME_CARDNUMBER_IS_NOSAME);
                    resp.setDescription(null);
                    return resp;
                }
            }
            
            //银行卡号,前4位,后4位保留,其他星号代替
            cardNumber = cardNumber.substring(0, 4) + " **** **** " + cardNumber.substring(cardNumber.length() - 4);
            tUserBankCard.setCardNumber(cardNumber);
            tUserBankCard.setId(UUIDGenerate.generateShortUuid());
            tUserBankCard.setCardStatus(String.valueOf(EnabledStatus.ENABLE.ordinal()));
            if (DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.insert(tUserBankCard))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
        }
        tqUserBasic = new TQUserBasic();
        tqUserBasic.setUserId(req.getUserId());
        tqUserBasic.setPlatformCardBind(DigitalConstant.ONE);//设置用户基本表银行卡认证为：已认证
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(tqUserBasic))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp deleteBankCard(IdReq req)
        throws ServicesException
    {
        TQUserBankCard tqUserBankCard = new TQUserBankCard();
        tqUserBankCard.setId(req.getId());
        tqUserBankCard = (TQUserBankCard)baseDao.findById(tqUserBankCard);
        if (tqUserBankCard == null
            || String.valueOf(EnabledStatus.DISABLE.ordinal()).equals(tqUserBankCard.getCardStatus()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.BANK_CARD_NOT_EXIST);
        }
        if (!req.getUserId().equals(tqUserBankCard.getUserId()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
        }
        tqUserBankCard = new TQUserBankCard();
        tqUserBankCard.setId(req.getId());
        tqUserBankCard.setCardStatus(String.valueOf(EnabledStatus.DISABLE.ordinal()));
        if (DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.update(tqUserBankCard))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_DETELE);
        }
        
        TQUserBasic tUserBasic = new TQUserBasic();
        tUserBasic.setUserId(req.getUserId());
        tUserBasic.setPlatformCardBind(countUserBankCard(req.getUserId()) > 0 ? 1 : 0);//设置用户基本表银行卡是否认证
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(tUserBasic))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    private int countUserBankCard(String userId)
    {
        NotPageUserIdReq req = new NotPageUserIdReq();
        req.setUserId(userId);
        List<Integer> countList = (ArrayList<Integer>)baseDao.executeSQL(null, "findUserBankCardCount", req);
        return countList.get(0);
    }
}
