package com.dimeng.modules.stat.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.statistics.PlatformEarningsStatResp;
import com.dimeng.entity.ext.statistics.SupportStatResp;
import com.dimeng.entity.ext.statistics.UserInitiateStatResp;
import com.dimeng.entity.ext.statistics.UserStatResp;
import com.dimeng.entity.ext.statistics.UserSupportStatResp;
import com.dimeng.entity.ext.statistics.WithdrawStatResp;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.statistics.FindCommonStatReq;
import com.dimeng.modules.stat.services.IStatManageService;
import com.dimeng.utils.ExportUtil;

/**
 * 
 * <统计管理实现>
 * <功能详细描述>
 * 
 * @author  song
 * @version  [版本号, 2016年5月19日]
 */
@Service
public class StatManageServiceImpl extends BaseServiceImpl implements IStatManageService
{
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findWithdrawStat(FindCommonStatReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        Map<String, Object> map = new HashMap<String, Object>();
        //累计统计
        event.setStatement("findWithdrawStat");
        WithdrawStatResp statEntity = (WithdrawStatResp)baseDao.findOneByCustom(event);
        map.put(CommonConstant.JSON_KEY_STAT_RESULT, statEntity);
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        //统计列表
        event.setStatement("findWithdrawStatList");
        event.setObj(req);
        List<WithdrawStatResp> list = baseDao.findAllIsPageByCustom(event);
        PageResult result = new PageResult(page, list);
        map.put(CommonConstant.JSON_KEY_PAGERESULT, result);
        //列合计
        event.setStatement("findWithdrawStatTotal");
        WithdrawStatResp totalEntity = (WithdrawStatResp)baseDao.findOneByCustom(event);
        map.put(CommonConstant.JSON_KEY_COLUMNSTAT_RESULT, totalEntity);
         /**
         * 导出
         */ 
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Object[] params =
                {"合计", "", totalEntity.getWithdrawDengesAmount(), totalEntity.getWithdrawCount(),
                    totalEntity.getWithdrawUserCount(), totalEntity.getAddWithdrawUserCount()};
            ExportUtil.export(req, list, params);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        resp.setData(map);
        return resp;
    }
     
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findPlatformEarningsStat(FindCommonStatReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        Map<String, Object> map = new HashMap<String, Object>();
        //累计统计
        event.setStatement("findPlatformEarningsStat");
        PlatformEarningsStatResp statEntity = (PlatformEarningsStatResp)baseDao.findOneByCustom(event);
        if (statEntity == null)
        {
            statEntity = new PlatformEarningsStatResp();
        }
        map.put(CommonConstant.JSON_KEY_STAT_RESULT, statEntity);
        //统计列表
        event.setStatement("findPlatformEarningsList");
        event.setObj(req);
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        List<PlatformEarningsStatResp> list = baseDao.findAllIsPageByCustom(event);
        PageResult result = new PageResult(page, list);
        map.put(CommonConstant.JSON_KEY_PAGERESULT, result);
        //列合计
        event.setStatement("findPlatformEarningsTotal");
        PlatformEarningsStatResp totalEntity = (PlatformEarningsStatResp)baseDao.findOneByCustom(event);
        if (totalEntity == null)
        {
            totalEntity = new PlatformEarningsStatResp();
        }
        map.put(CommonConstant.JSON_KEY_COLUMNSTAT_RESULT, totalEntity);
        /**
         * 导出
         */ 
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Object[] param =
                {"合计", "", "",totalEntity.getWithdrawFee()};
            ExportUtil.export(req, list, param);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        resp.setData(map);
        return resp;
    }
    
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findUserStat(FindCommonStatReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        Map<String, Object> map = new HashMap<String, Object>();
        //累计统计
        event.setStatement("findUserStatInfo");
        UserStatResp statEntity = (UserStatResp)baseDao.findOneByCustom(event);
        map.put(CommonConstant.JSON_KEY_STAT_RESULT, statEntity);
        //统计列表
        event.setStatement("findUserStatList");
        event.setObj(req);
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        List<UserStatResp> list = baseDao.findAllIsPageByCustom(event);
        PageResult result = new PageResult(page, list);
        map.put(CommonConstant.JSON_KEY_PAGERESULT, result);
        //列合计
        event.setStatement("findUserStatTotal");
        UserStatResp totalEntity = (UserStatResp)baseDao.findOneByCustom(event);
        map.put(CommonConstant.JSON_KEY_COLUMNSTAT_RESULT, totalEntity);
        
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Object[] params =
                {"合计", "", totalEntity.getRegisterCount(), totalEntity.getLoginUserCount(),
                    totalEntity.getNewPayUserCount(), totalEntity.getRegWxCount(),totalEntity.getRegAppCount(),totalEntity.getRegPcCount()};
            ExportUtil.export(req, list, params);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        resp.setData(map);
        return resp;
    }
/*
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findUserInitiateStat(FindCommonStatReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        Map<String, Object> map = new HashMap<String, Object>();
        //进入页面的时候需要查询累计的数据，搜索和分页是不需要重复查询
        if(!StringUtil.isEmpty(req.getType())){
          //累计统计
            event.setStatement("findUserInitiateStatInfo");
            UserInitiateStatResp statEntity = (UserInitiateStatResp)baseDao.findOneByCustom(event);
            map.put(CommonConstant.JSON_KEY_STAT_RESULT, statEntity);  
            map.put("type", "true"); 
        } 
        //统计列表
        event.setStatement("findUserInitiateList");
        event.setObj(req);
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        List<UserInitiateStatResp> list = baseDao.findAllIsPageByCustom(event);
        PageResult result = new PageResult(page, list);
        map.put(CommonConstant.JSON_KEY_PAGERESULT, result);
        //列合计
        event.setStatement("findUserInitiateTotal");
        UserInitiateStatResp totalEntity = (UserInitiateStatResp)baseDao.findOneByCustom(event);
        map.put(CommonConstant.JSON_KEY_COLUMNSTAT_RESULT, totalEntity);
        
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Object[] params =
                {"合计", "","",totalEntity.getInitiateProCount(), totalEntity.getSuccessProCount(),
                    totalEntity.getFailProCount(), totalEntity.getDeleteProCount(),totalEntity.getInitiateAmt(),totalEntity.getRefundAmt()};
            ExportUtil.export(req, list, params);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        resp.setData(map);
        return resp;
    } 
     */
    
    

    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findUserInitiateStat(FindCommonStatReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        Map<String, Object> map = new HashMap<String, Object>();
        //进入页面的时候需要查询累计的数据，搜索和分页是不需要重复查询
        if(!StringUtil.isEmpty(req.getType())){
          //累计统计
            event.setStatement("findUserInitiateStatInfo");
            UserInitiateStatResp statEntity = (UserInitiateStatResp)baseDao.findOneByCustom(event);
            map.put(CommonConstant.JSON_KEY_STAT_RESULT, statEntity);  
            map.put("type", "true"); 
        } 
        
        //统计列表
        event.setObj(req);
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        //1 查询用户list resp--带分页
        event.setStatement("findUserIdList"); 
        List<SupportStatResp> statList = baseDao.findAllIsPageByCustom(event);  
        //查出数据list
        //计算limit
        Integer statIndex = req.getReqPageNum();
        statIndex = (statIndex-1)*(req.getMaxResults());
        req.setStatIndex(statIndex);
        req.setResults(req.getMaxResults());
        event.setObj(req);
        event.setStatement("findUserInitiateList");  
        List<UserSupportStatResp> list = baseDao.findAllIsPageByCustom(event); 
        statList.get(0).setDataList(list);
        PageResult result = new PageResult(page, statList);
        map.put(CommonConstant.JSON_KEY_PAGERESULT, result);
      /*  //列合计
        event.setStatement("findUserInitiateTotal");
        UserInitiateStatResp totalEntity = (UserInitiateStatResp)baseDao.findOneByCustom(event);
        map.put(CommonConstant.JSON_KEY_COLUMNSTAT_RESULT, totalEntity);
        
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Object[] params =
                {"合计", "","",totalEntity.getInitiateProCount(), totalEntity.getSuccessProCount(),
                    totalEntity.getFailProCount(), totalEntity.getDeleteProCount(),totalEntity.getInitiateAmt(),totalEntity.getRefundAmt()};
            ExportUtil.export(req, list, params);
        }*/
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        resp.setData(map);
        return resp;
    } 
    
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findUserSupportStat(FindCommonStatReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        Map<String, Object> map = new HashMap<String, Object>();
        
        //进入页面的时候需要查询累计的数据，搜索和分页是不需要重复查询
        if(!StringUtil.isEmpty(req.getType())){
            //累计统计
            event.setStatement("findUserSupportStatInfo");
            UserSupportStatResp statEntity = (UserSupportStatResp)baseDao.findOneByCustom(event);
            map.put(CommonConstant.JSON_KEY_STAT_RESULT, statEntity);
            map.put("type", "true");
        }
        //统计列表
        event.setObj(req);
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        
        //1 查询用户list resp--带分页
        event.setStatement("findUserIdList"); 
        List<SupportStatResp> statList = baseDao.findAllIsPageByCustom(event); 
        //查出数据list
        //计算limit
        Integer statIndex = req.getReqPageNum();
        statIndex = (statIndex-1)*(req.getMaxResults());
        req.setStatIndex(statIndex);
        req.setResults(req.getMaxResults());
        event.setObj(req);
        event.setStatement("findUserSupportStatList");  
        List<UserSupportStatResp> list = baseDao.findAllIsPageByCustom(event); 
        statList.get(0).setDataList(list); 
        PageResult result = new PageResult(page, statList);
        map.put(CommonConstant.JSON_KEY_PAGERESULT, result); 
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        resp.setData(map);
        return resp;
    }  
}
