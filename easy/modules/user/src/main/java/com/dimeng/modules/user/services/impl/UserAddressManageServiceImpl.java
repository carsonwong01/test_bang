/*
 * 文 件 名:  AddressManageServiceImpl.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月14日
 */
package com.dimeng.modules.user.services.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.user.FindAddressDetailResp;
import com.dimeng.entity.ext.user.FindAddressResp;
import com.dimeng.entity.table.user.TUserShippingAddress;
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.constants.DigitalAndStringConstant.DigitalConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.user.FindAddressDetailReq;
import com.dimeng.model.user.NotPageUserIdReq;
import com.dimeng.model.user.UpdateAddressReq;
import com.dimeng.modules.user.services.UserAddressManageService;
import com.dimeng.utils.SystemCache;
import com.dimeng.utils.UUIDGenerate;

/**
 * 用户收货地址管理
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月14日]
 */
@Service
public class UserAddressManageServiceImpl extends BaseServiceImpl implements UserAddressManageService
{
    
    @SuppressWarnings({"unchecked"})
    @Override
    public BaseDataResp findAddress(NotPageUserIdReq req)
    {
        
        Map<String, Object> map = new HashMap<String, Object>();
        BaseDataResp resp = new BaseDataResp();
        
        QueryEvent<NotPageUserIdReq> event = new QueryEvent<NotPageUserIdReq>();
        event.setStatement("findAddress");
        event.setObj(req);
        List<FindAddressResp> result = baseDao.findAllIsPageByCustom(event);
        if (result != null)
        {
            for (FindAddressResp findAddressResp : result)
            {
                String phoneNumber = findAddressResp.getPhoneNumber();
                findAddressResp.setPhoneNumber(phoneNumber.replace(phoneNumber.substring(3, 7), "****"));
            }
        }
        else
        {
            result = new ArrayList<FindAddressResp>();
        }
        map.put(CommonConstant.JSON_KEY_LIST, result);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findAddressDetail(FindAddressDetailReq req)
        throws ServicesException
    {
        Map<String, Object> map = new HashMap<String, Object>();
        BaseDataResp resp = new BaseDataResp();
        
        QueryEvent<FindAddressDetailReq> event = new QueryEvent<FindAddressDetailReq>();
        event.setStatement("findAddressDetail");
        event.setObj(req);
        FindAddressDetailResp result = (FindAddressDetailResp)baseDao.findOneByCustom(event);
        //记录不存在
        if (result == null)
        {
            throw new ServicesException(IDiMengResultCode.Common.RECORD_NOT_EXSIT);
        }
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, result);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateAddress(UpdateAddressReq req)
        throws ServicesException, InstantiationException, IllegalAccessException, InvocationTargetException
    {
        TUserShippingAddress tUserShippingAddress =
            (TUserShippingAddress)DimengBeanUtil.copyProperties(TUserShippingAddress.class, req);
        BaseDataResp resp = new BaseDataResp();
        switch (req.getOperationType())
        {
        
            case CommonConstant.ZERO: //新增
                //所有字段都不能为空
                if (StringUtil.isEmpty(req.getConsigneeAddress()) || StringUtil.isEmpty(req.getConsigneeCity())
                    || StringUtil.isEmpty(req.getConsigneeName()) || StringUtil.isEmpty(req.getConsigneePhone())
                    || StringUtil.isEmpty(req.getUserId()))
                {
                    throw new ServicesException(IDiMengResultCode.Commons.ERROR_PARAMETER);
                }
                //判断收货地址是否达到最大个数
                NotPageUserIdReq notPageUserIdReq = new NotPageUserIdReq();
                notPageUserIdReq.setUserId(req.getUserId());
                QueryEvent<NotPageUserIdReq> event = new QueryEvent<NotPageUserIdReq>();
                event.setStatement("countUserAddress");
                event.setObj(notPageUserIdReq);
                int userAddressCount = (int)baseDao.count(event);
                Integer maxCount = Integer.parseInt(SystemCache.getProperty(EasySystemVariable.ADDRESS_MAX_COUNT));
                if (userAddressCount >= maxCount.intValue())
                {
                    throw new ServicesException(IDiMengResultCode.UserManager.CONSIGNEE_ADDRESS_NUMBER_CEILING);
                }
                //只有一个地址，则设置为默认地址
                if (userAddressCount == 0)
                {
                    tUserShippingAddress.setIsDefault(DigitalAndStringConstant.StringConstant.ONE);
                }
                else
                {
                    tUserShippingAddress.setIsDefault(DigitalAndStringConstant.StringConstant.TWO);
                }
                tUserShippingAddress.setAddrId(UUIDGenerate.generateShortUuid());
                
                if (DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.insert(tUserShippingAddress))
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
                }
                break;
            case CommonConstant.ONE://修改
                if (StringUtil.isEmpty(req.getAddrId()))
                {
                    throw new ServicesException(IDiMengResultCode.Commons.ERROR_PARAMETER);
                }
                
                TUserShippingAddress bean = new TUserShippingAddress();
                bean.setAddrId(req.getAddrId());
                TUserShippingAddress exsitTUserShippingAddress = (TUserShippingAddress)baseDao.findById(bean);
                //记录不存在
                if (exsitTUserShippingAddress == null)
                {
                    throw new ServicesException(IDiMengResultCode.Common.RECORD_NOT_EXSIT);
                }
                //没权限修改其他用户地址记录
                if (!exsitTUserShippingAddress.getUserId().equals(req.getUserId()))
                {
                    throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
                }
                
                if (String.valueOf(DigitalConstant.ONE).equals(tUserShippingAddress.getIsDefault()))
                {
                    //改变以前为默认的地址默认状态
                    NotPageUserIdReq idReq = new NotPageUserIdReq();
                    idReq.setUserId(req.getUserId());
                    baseDao.executeSQL(null, "updateAddressDefaultStatus", idReq);
                }
                
                //更新
                if (DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.update(tUserShippingAddress))
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
                //如果该地址为默认地址被修改为非默认地址，则获取第一条记录设置为默认地址
                if (String.valueOf(DigitalConstant.TWO).equals(tUserShippingAddress.getIsDefault())
                    && !exsitTUserShippingAddress.getIsDefault().equals(tUserShippingAddress.getIsDefault()))
                {
                    notPageUserIdReq = new NotPageUserIdReq();
                    notPageUserIdReq.setUserId(req.getUserId());
                    event = new QueryEvent<NotPageUserIdReq>();
                    event.setStatement("countUserAddress");
                    event.setObj(notPageUserIdReq);
                    //如果还有其他地址，那么就更新下一条记录为默认地址
                    if ((int)baseDao.count(event) > 0)
                    {
                        if (DigitalConstant.DATABASE_OP_SUCCESS_INT > (int)baseDao.executeSQL("update",
                            "updateOneAddressForDefault",
                            notPageUserIdReq))
                        {
                            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                        }
                    }
                }
                break;
            case CommonConstant.TWO: //删除
                if (StringUtil.isEmpty(req.getAddrId()))
                {
                    throw new ServicesException(IDiMengResultCode.Commons.ERROR_PARAMETER);
                }
                
                bean = new TUserShippingAddress();
                bean.setAddrId(req.getAddrId());
                exsitTUserShippingAddress = (TUserShippingAddress)baseDao.findById(bean);
                //记录不存在
                if (exsitTUserShippingAddress == null)
                {
                    throw new ServicesException(IDiMengResultCode.Common.RECORD_NOT_EXSIT);
                }
                //没权限删除其他用户地址记录
                if (!exsitTUserShippingAddress.getUserId().equals(req.getUserId()))
                {
                    throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
                }
                if (DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.delete(tUserShippingAddress))
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_DETELE);
                }
                //如果该地址为默认地址，则获取下一条记录设置为默认地址
                if (exsitTUserShippingAddress.getIsDefault().equals(DigitalAndStringConstant.StringConstant.ONE))
                {
                    notPageUserIdReq = new NotPageUserIdReq();
                    notPageUserIdReq.setUserId(req.getUserId());
                    event = new QueryEvent<NotPageUserIdReq>();
                    event.setStatement("countUserAddress");
                    event.setObj(notPageUserIdReq);
                    //如果还有其他地址，那么就更新下一条记录为默认地址
                    if ((int)baseDao.count(event) > 0)
                    {
                        if (DigitalConstant.DATABASE_OP_SUCCESS_INT > (int)baseDao.executeSQL("update",
                            "updateOneAddressForDefault",
                            notPageUserIdReq))
                        {
                            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                        }
                    }
                }
                break;
            default:
                throw new ServicesException(IDiMengResultCode.Commons.ERROR_PARAMETER);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
}
