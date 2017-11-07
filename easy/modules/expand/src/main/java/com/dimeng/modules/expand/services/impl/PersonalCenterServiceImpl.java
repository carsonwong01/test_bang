package com.dimeng.modules.expand.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.table.site.TSiteInfo;
import com.dimeng.entity.table.user.TQUserBasic;
import com.dimeng.entity.table.user.TUser;
import com.dimeng.enums.TemplateTypeEnumEasy;
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.expand.UpdateUserBaseInfoReq;
import com.dimeng.model.user.NotPageUserIdReq;
import com.dimeng.model.user.UpdateTradePasswordReq;
import com.dimeng.modules.expand.services.IPersonalCenterService;
import com.dimeng.modules.message.services.IMessageService;
import com.dimeng.utils.SystemCache;

/**
 *  <前台个人中心service接口>
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月19日]
 */
@Service
public class PersonalCenterServiceImpl extends BaseServiceImpl implements IPersonalCenterService
{
    @Resource
    private IMessageService msgService;
    
    /** {@inheritDoc} 
     * @throws  Exception */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    public BaseDataResp updateTradePwd(UpdateTradePasswordReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        TUser bean = (TUser)DimengBeanUtil.copyProperties(TUser.class, req);
        TUser tUser = (TUser)baseDao.findById(bean);
        //1.判断用户是否存在
        if (null == tUser)
        {
            resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
            return resp;
        }
        //新提现密码不能和登录密码相同
        if (req.getNewTradePassword() != null && req.getNewTradePassword().equals(tUser.getPassword()))
        {
            
            resp.setCode(IDiMengResultCode.UserManager.WITHDRAWAL_PWD_SAME_PWD);
            return resp;
        }
        
        tUser.setTradePwd(req.getNewTradePassword());
        //修改密码，只有修改密码的时候，才有oldpwd
        if (req.getOldTradePassword() != null && !req.getOldTradePassword().equals(""))
        {
            //2 .判断新提现密码是否与原提现密码相同
            if (req.getNewTradePassword().equals(bean.getTradePwd()))
            {
                resp.setCode(IDiMengResultCode.UserManager.ERROR_WITHDRAWAL_PASSWORD_IS_SAME);
                return resp;
            }
            QueryEvent event = new QueryEvent();
            event.setStatement("findTradePassword");
            event.putParameter("userId", req.getUserId());
            event.putParameter("tradePassword", req.getOldTradePassword());
            //3. 判断用户输入的旧密码是否是正确的
            if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != (int)baseDao.count(event))
            {
                resp.setCode(IDiMengResultCode.UserManager.ERROR_WITHDRAWAL_PASSWORD_INVALID);
                return resp;
            }
        }
        //4. 密码修改
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(tUser))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        //从缓存中获得站点信息
        TSiteInfo siteInfo = (TSiteInfo)systemCache.get(SystemConstant.CacheKey.SITE_INFO).getObjectValue();
        //查询用户电话号码
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userId", req.getUserId());
        List<String> phone = (List<String>)baseDao.executeSQL("select", "findUserPhoneByUserId", params);
        //发送短信
        String[] pars =
            new String[] {siteInfo.getSiteName(), DateUtil.getDatetimeString(DateUtil.getNow()),
                siteInfo.getServicePhone()};
        msgService.sendSms("0", TemplateTypeEnumEasy.MODIFY_WITHDRAWAL_PWD_SUCCESS.dataBaseVal, pars, phone.get(0));
        
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp checkSettingTradePwd(NotPageUserIdReq req)
        throws ServicesException
    {
        BaseDataResp resp = new BaseDataResp();
        boolean isTrue = Boolean.parseBoolean(SystemCache.getProperty(EasySystemVariable.SETTING_WITHDRAWAL_PASSWORD));
        if (isTrue)
        {
            QueryEvent<NotPageUserIdReq> event = new QueryEvent<NotPageUserIdReq>();
            event.setStatement("checkSettingTradePwd");
            event.setObj(req);
            int count = (int)baseDao.count(event);
            //首先判断用户是否设置提现密码
            if (count == 0)
            {
                resp.setCode(IDiMengResultCode.UserManager.UNSET_WITHDRAWAL_PASSWORD_INVALID);
                return resp;
            }
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateUserBaseInfo(UpdateUserBaseInfoReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        if (StringUtil.isEmpty(req.getImageUrl()) && StringUtil.isEmpty(req.getNickName()))
        {
            resp.setCode(IDiMengResultCode.CpProjectManage.PARAMETERS_ERROR);
            return resp;
        }
        
        TUser bean = (TUser)DimengBeanUtil.copyProperties(TUser.class, req);
        TUser tUser = (TUser)baseDao.findById(bean);
        //判断用户是否存在
        if (null == tUser)
        {
            resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
            return resp;
        }
        //更新用户基本信息表
        TQUserBasic tqUserBasic = new TQUserBasic();
        tqUserBasic.setUserId(req.getUserId());
        tqUserBasic.setNickName(req.getNickName());
        tqUserBasic.setImageId(StringUtil.notEmpty(req.getImageId()) ? req.getImageId() : null);
        tqUserBasic.setImageUrl(StringUtil.notEmpty(req.getImageUrl()) ? req.getImageUrl() : null);
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(tqUserBasic))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
}
