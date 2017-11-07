package com.dimeng.modules.stat.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.statistics.FindCommonStatReq;

/**
 * <统计管理>
 * @author  song
 * @version  [版本号, 2016年10月9日]
 */
public interface IStatManageService
{ 
    /**
     * <用户统计>
     * <功能详细描述>
     * @return
     * @throws Exception
     */
    public BaseDataResp findUserStat(FindCommonStatReq req)
        throws Exception;
    
    /**
     * <提现统计>
     * <功能详细描述>
     * @return
     * @throws Exception
     */ 
    public BaseDataResp findWithdrawStat(FindCommonStatReq req)
        throws Exception;
     
    /**
     * <查询平台收益统计>
     * <功能详细描述>
     * @return
     * @throws Exception
     */ 
    public BaseDataResp findPlatformEarningsStat(FindCommonStatReq req)
        throws Exception;
    
    /**
     * <查询用户发起项目统计>
     * <功能详细描述>
     * @return
     * @throws Exception
     */ 
    public BaseDataResp findUserInitiateStat(FindCommonStatReq req)
        throws Exception;
    
    /**
     * <查询用户支持统计>
     * <功能详细描述>
     * @return
     * @throws Exception
     */ 
    public BaseDataResp findUserSupportStat(FindCommonStatReq req)
        throws Exception;
   
}
