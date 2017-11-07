/*
 * 文 件 名:  WithdrawSetServiceImpl.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月23日
 */
package com.dimeng.modules.expand.services.impl;

import java.math.BigDecimal;

import org.springframework.stereotype.Service;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.table.expand.TBusFeesBasicSet;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.model.expand.WithdrawSetReq;
import com.dimeng.modules.expand.services.IWithdrawSetService;

import net.sf.ehcache.Element;

/**
 * 平台提现设置接口实现
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月23日]
 */
@Service
public class WithdrawSetServiceImpl extends BaseServiceImpl implements IWithdrawSetService
{
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonWithdrawSet(WithdrawSetReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        TBusFeesBasicSet busFeesBasicSet = new TBusFeesBasicSet();
        busFeesBasicSet.setMinWithdraw(new BigDecimal(req.getMinWithdrawAmt()));
        busFeesBasicSet.setMaxWithdraw(new BigDecimal(req.getMaxWithdrawAmt()));
        busFeesBasicSet.setWithdrawHighest(new BigDecimal(req.getMaxPoundage()));
        busFeesBasicSet.setWithdrawRate(Float.parseFloat(req.getWithdrawRate()));
        baseDao.delete(busFeesBasicSet);
        if (baseDao.insert(busFeesBasicSet) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        
        //最小提现金额
        systemCache.put(new Element(SystemConstant.CacheKey.MIN_WITHDRAW, req.getMinWithdrawAmt()));
        //最高提现金额
        systemCache.put(new Element(SystemConstant.CacheKey.MAX_WITHDRAW, req.getMaxWithdrawAmt()));
        //提现最高手续费
        systemCache.put(new Element(SystemConstant.CacheKey.WITHDRAW_HIGHEST, req.getMaxPoundage()));
        //提现收取
        systemCache.put(new Element(SystemConstant.CacheKey.WITHDRAW_RATE, req.getWithdrawRate()));
        
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    public BaseDataResp findWithdrawSet()
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        event.setStatement("findByIdTBusFeesBasicSet");
        TBusFeesBasicSet busFeesBasicSet = (TBusFeesBasicSet)baseDao.findOneByCustom(event);
        if (busFeesBasicSet == null)
        {
            busFeesBasicSet = new TBusFeesBasicSet();
        }
        resp.setData(busFeesBasicSet);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
}
