package com.dimeng.modules.home.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.home.back.HomeBacklogResp;
import com.dimeng.entity.ext.home.back.HomeStatDataResp;
import com.dimeng.entity.ext.home.back.HomeTodayDataResp;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.modules.home.services.BackgroundHomeService;
import com.dimeng.utils.DaoHelper;

@Service
public class BackgroundHomeServiceImpl  extends BaseServiceImpl  implements BackgroundHomeService
{
    
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findHomeTodayData()
        throws Exception
    {
        QueryEvent event = new QueryEvent();
        event.setStatement("findQscTodayData");
        /**
         * 1.查询今日数据
         */
        HomeTodayDataResp obj = (HomeTodayDataResp)baseDao.findOneByCustom(event);
        
        /**
         * 2.填充在线人数
         */
        int count = 0; //在线人数
        List<Object> list = loginCache.getKeys();
        if (list != null)
        {
            for (Object object : list)
            {
                Object user = loginCache.get(object).getObjectValue();
                if (user instanceof FrontUserInfo)
                {
                    count++;
                }
            }
        }
        obj.setOnlineUserCount(count + "");
        /**
         * 3.返回数据
         */
        Map<String, HomeTodayDataResp> map = new HashMap<String, HomeTodayDataResp>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, obj);
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findHomeStatData()
        throws Exception
    {
        /**
         * 1.查询今日数据
         */
        QueryEvent event = new QueryEvent();
        event.setStatement("findQscHomeStatData");
        HomeStatDataResp obj = (HomeStatDataResp)baseDao.findOneByCustom(event);
        
        Map<String, HomeStatDataResp> map = new HashMap<String, HomeStatDataResp>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, obj);
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findHomeBacklog()
        throws Exception
    {
        /**
         * 1.查询今日数据
         */
        QueryEvent event = new QueryEvent();
        event.setStatement("findQscHomeBacklog");
        HomeBacklogResp obj = (HomeBacklogResp)baseDao.findOneByCustom(event);
        
        Map<String, HomeBacklogResp> map = new HashMap<String, HomeBacklogResp>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, obj);
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp; 
    }
    

    
}
