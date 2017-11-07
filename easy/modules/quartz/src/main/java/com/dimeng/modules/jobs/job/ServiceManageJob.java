package com.dimeng.modules.jobs.job;
import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;

import com.dimeng.modules.jobs.services.OrdManageJobService;
import com.dimeng.modules.jobs.services.ProManageJobService;
import com.dimeng.utils.SpringBeanUtil;

/** 
 *  一、项目众筹中时间到期状态修改定时任务
 *       1).众筹到期筹集资金未达目标金额，项目状态修改为众筹失败，所有支持订单修改为待退款 
 *       2).众筹到期筹集资金达到目标金额，状态修改为众筹成功
 *  二、订单失效时间到期定时任务
 *  三、默认收货定时任务
 * @author  song
 * @version  [版本号, 2016年10月19日]
 */
@Service
public class ServiceManageJob
{
    @Autowired
    private SpringBeanUtil springBeanUtil;
    
    @Autowired
    private ProManageJobService proService;
    
    @Autowired
    private OrdManageJobService ordService;
    
    @Resource(name = "executor")
    private TaskExecutor taskExecutor;
    
    @SuppressWarnings("unused")
    private Log logs=LogFactory.getLog(super.getClass());;
    
    public void proExecute()
    {
        try
        {
            taskExecutor.execute(new Thread(new UpdateProJobThread()));
        }
        catch (Exception e)
        {
            e.printStackTrace();
        } 
    }
    
    public void orderExecute()
    {
        try
        {
            taskExecutor.execute(new Thread(new UpdateOrdJobThread()));
        }
        catch (Exception e)
        {
            e.printStackTrace();
        } 
    }
    
    public void takeDelivery(){
        try
        {
            taskExecutor.execute(new Thread(new TakeDeliveryJobThread()));
        }
        catch (Exception e)
        {
            e.printStackTrace();
        } 
    }
    
    
    class UpdateProJobThread implements Runnable
    { 
        @Override
        public void run()
        {
            try
            {
                proService.commonProManageRunJob();
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }  
        }
    }  
    
    class UpdateOrdJobThread implements Runnable
    { 
        @Override
        public void run()
        {
            try
            {
                ordService.commonOrdManageRunJob();
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }  
        }
    }  
    
    class TakeDeliveryJobThread implements Runnable
    { 
        @Override
        public void run()
        {
            try
            {
                ordService.commonTakeDeliveryRunJob();
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }  
        }
    }  
    
     
}
