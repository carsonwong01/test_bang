package com.dimeng.modules.jobs.statistics;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.table.statistics.CommonStatisticsForDay;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.dao.IBaseDao;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.utils.DateUtil;

/**
 * <每天执行定时任务公用接口>
 * @author  song
 * @version  [版本号, 2016年10月9日]
 */
public class CommonStatsHelp
{
    /**
     * <每天执行定时任务公用方法>
     * <功能详细描述>
     * @param baseDao       baseDao
     * @param tableName     表名称
     * @param entity        实体名称
     * @param logs          日志
     * @param startLog      开始打印日志
     * @param endLog        结束打印日志
     * @param errorLog      错误日志
     * @throws Exception
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void excuteInsertForDay(IBaseDao baseDao, String tableName, CommonStatisticsForDay entity, Log logs,
        String startLog, String endLog, String errorLog)
        throws Exception
    {
        logs.warn(startLog + "--------------------");
        //查询最后一次的执行日期
        QueryEvent event = new QueryEvent();
        event.setStatement("findLastStatsDate");
        event.putParameter("tableName", tableName);
        String lastDate = (String)baseDao.findOneByCustom(event);
        int count = 0;
        if (StringUtils.isNotEmpty(lastDate))
        {
            count = DateUtil.daysBetween(lastDate, com.dimeng.framework.utils.DateUtil.getDateString(new Date())) - 1;
        }
        if (count == 0)
        {
            count = 1;
        }
        //循环插入数据
        while (count > 0)
        {
            entity.setCount(count);
            if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(entity))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
            count--;
        }
        logs.warn(endLog + "--------------------");
    }
}
