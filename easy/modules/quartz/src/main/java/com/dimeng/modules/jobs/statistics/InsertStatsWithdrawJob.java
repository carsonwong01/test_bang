package com.dimeng.modules.jobs.statistics;

import com.dimeng.entity.table.stat.TStatWithdraw;
import com.dimeng.framework.service.impl.BaseServiceImpl;

/**
 * 
 * <提现统计定时任务>
 * <功能详细描述>
 * 
 * @author  song
 * @version  [版本号, 2016年5月25日]
 */
public class InsertStatsWithdrawJob extends BaseServiceImpl
{
    /**
     * <提现统计定时任务执行方法>
     * <功能详细描述>
     */
    public void execute()
        throws Exception
    {
        TStatWithdraw entity = new TStatWithdraw();
        CommonStatsHelp.excuteInsertForDay(baseDao,
            "`t_stat_withdraw`",
            entity,
            logs,
            "提现统计定时任务开始",
            "提现统计定时任务结束",
            "提现统计定时任务插入出错");
    }
}
