package com.dimeng.modules.jobs.services;

/**
 * 订单管理定时任务
 * @author  song
 * @version  [版本号, 2016年10月20日]
 */
public interface OrdManageJobService
{
    public void commonOrdManageRunJob() throws Exception;
    
    public void commonTakeDeliveryRunJob() throws Exception;
    
}
