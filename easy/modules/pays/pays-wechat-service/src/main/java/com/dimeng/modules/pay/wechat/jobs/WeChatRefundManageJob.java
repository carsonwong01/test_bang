package com.dimeng.modules.pay.wechat.jobs;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;

import com.dimeng.enums.variable.WeChatVaribles;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.model.pay.RefundReq;
import com.dimeng.modules.finance.services.IRefundCheckService;
import com.dimeng.modules.finance.services.IRefundService;
import com.dimeng.utils.SpringBeanUtil;
import com.dimeng.utils.SystemCache;

/** 
 *定时执行退款，退款对账操作
 *
 * @author  sunqiuyan
 * @version  [版本号, 2016年10月19日]
 */
@Service
public class WeChatRefundManageJob extends BaseServiceImpl
{
    @Autowired
    private SpringBeanUtil springBeanUtil;
    
    @Autowired
    private IRefundService wechatRefundService;
    @Autowired
    private IRefundCheckService wechatRefundCheckService;
    @Autowired
    private IRefundService refundService;
 
    @Resource(name = "executor")
    private TaskExecutor taskExecutor;
 
    private Log logs=LogFactory.getLog(super.getClass());
    
    public void refundExecute()
    {
        try
        {
            taskExecutor.execute(new Thread(new refundJob()));
        }
        catch (Exception e)
        {
            logs.error(e);
        } 
    }
    
    public void refundCheckExecute()
    {
        try
        {
            taskExecutor.execute(new Thread(new refundCheckJob()));
        }
        catch (Exception e)
        {
            logs.error(e);
        } 
    }
    
    
    
    class refundCheckJob implements Runnable
    { 
        @Override
        public void run()
        {
            
            logs.info("***********定时器退款对账开始**************");
            boolean isRun = Boolean.valueOf(SystemCache.getProperty(WeChatVaribles.IS_REFUND));
            if (!isRun)
            {
                return;
            }
            Map<String,Object> map=new HashMap<String,Object>();
            
            // 查询待退款中的订单
            List<RefundReq> resultList =refundService.getRefundList("4");
            
            if (resultList != null && resultList.size() > 0)
            {
                logs.info("***********定时器退款对账,总数：" + resultList.size());
                for (int i = 0; i < resultList.size(); i++)
                {
                    try
                    {
                        if (resultList.get(i) != null)
                        {
                            wechatRefundCheckService.commonSubmit(resultList.get(i), map);
                            
               
                        }
                    }
                    catch (Throwable e)
                    {
                        logs.error("***********定时器退款对账异常,订单号:" + resultList.get(i).getOrderId(), e);
                    }
                }
                
            }
            logs.info("***********定时器退款对账结束**************");
        }
        
        }
    
    class refundJob implements Runnable
    { 
        @Override
        public void run()
        {
            
            logs.info("***********定时器退款对账开始**************");
            boolean isRun = Boolean.valueOf(SystemCache.getProperty(WeChatVaribles.IS_REFUND));
            if (!isRun)
            {
                return;
            }
            Map<String,Object> map=new HashMap<String,Object>();
            
            // 查询待退款的订单
            List<RefundReq> resultList =refundService.getRefundList("1");
            
            if (resultList != null && resultList.size() > 0)
            {
                logs.info("***********定时器退款对账,总数：" + resultList.size());
                
                            try
                            {
                                wechatRefundService.commonSubmit(resultList, map);
                               
                            }
                            catch (Throwable e)
                            {
                                // TODO Auto-generated catch block
                                logs.error("===退款异常订单 "+e.getMessage());
                            }
                         
                }
                
            logs.info("***********定时器退款对账结束**************");
            }
        
        }
    
    
}
