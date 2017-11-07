package com.dimeng.modules.jobs.services.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.IDiMengResultCode; 
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.modules.jobs.services.OrdManageJobService;
import com.dimeng.utils.SystemCache;

@Service
public class OrdManageJobServiceImpl extends BaseServiceImpl implements OrdManageJobService
{
    public void commonOrdManageRunJob()
        throws Exception
    {
        logs.info("#####扫描待支付订单失效任务开始#####");
        if ((Integer)baseDao.executeSQL("update", "overdueOrderJob", null) < DigitalAndStringConstant.DigitalConstant.ZERO)
        {
            logs.info("###更新订单状态错误###");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        logs.info("#####扫描待支付订单失效任务结束#####");
         
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    public void commonTakeDeliveryRunJob()
        throws Exception
    {
        logs.info("#####扫描待收货订单任务开始#####");
        Map map = new HashMap();
        map.put("day", SystemCache.getProperty(EasySystemVariable.DEFAULT_RECEIPT_PERIOD));
        if ((Integer)baseDao.executeSQL("update", "takeDeliveryJob", map) < DigitalAndStringConstant.DigitalConstant.ZERO)
        {
            logs.info("###更新订单状态错误###");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        logs.info("#####扫描待收货订单任务结束#####");
    }
    
}
