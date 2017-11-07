package com.dimeng.modules.jobs.statistics;

import com.dimeng.entity.table.stat.TQStatsUser;
import com.dimeng.framework.service.impl.BaseServiceImpl;

public class InsertStatsUserJob extends BaseServiceImpl
{
    /**
     * <用户统计定时任务执行方法>
     * <功能详细描述>
     */
    public void execute()
        throws Exception
    {
        TQStatsUser entity = new TQStatsUser();
        CommonStatsHelp.excuteInsertForDay(baseDao,
            "`t_q_stats_user`",
            entity,
            logs,
            "用户统计定时任务开始",
            "用户统计定时任务结束",
            "用户统计定时任务插入报错");
    }
}
