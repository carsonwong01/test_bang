package com.dimeng.modules.home.services;

import com.dimeng.framework.domain.BaseDataResp;

/**
 * 后台首页接口
 * @author  song
 * @version  [版本号, 2016年9月27日]
 */
public interface BackgroundHomeService
{
    /**
     * 今日数据
     * <功能详细描述>
     * @author  song
     * @return
     * @throws Exception
     */
    public BaseDataResp findHomeTodayData()
        throws Exception;
    
    /**
     * 数据统计
     * <功能详细描述>
     * @author  song
     * @return
     * @throws Exception
     */
    public BaseDataResp findHomeStatData()
        throws Exception;
    
    /**
     * 待办事项
     * <功能详细描述>
     * @author  song
     * @return
     * @throws Exception
     */
    public BaseDataResp findHomeBacklog()
        throws Exception;

    
}
