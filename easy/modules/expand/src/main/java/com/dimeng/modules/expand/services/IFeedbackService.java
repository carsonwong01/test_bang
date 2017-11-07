/*
 * 文 件 名:  IFeedbackService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.modules.expand.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.FindFeedbackReq;
import com.dimeng.model.site.TOperateFeedbackReq;

/**
 * 意见反馈Service
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
public interface IFeedbackService
{
    
    /**
     * 意见反馈列表查询
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findFeedbackList(FindFeedbackReq req)
        throws Exception;
    
    /**
     * 新增意见反馈
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp commonFeedback(TOperateFeedbackReq req) throws Exception;
}
