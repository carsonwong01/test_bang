/*
 * 文 件 名:  FeedbackController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.platform.controller.expand;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.entity.table.site.TOperateFeedback;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.expand.FindFeedbackReq;
import com.dimeng.model.site.TOperateFeedbackReq;
import com.dimeng.modules.expand.services.IFeedbackService;

/**
 * 意见反馈Controller
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
@RequestMapping(value = "operation/feedback")
@Controller
public class FeedbackController extends BaseController
{
    
    @Autowired
    IFeedbackService feedbackService;
    
    /**
     * 意见反馈列表查询
     * <功能详细描述>
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findFeedbackList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findFeedbackList(HttpEntity<FindFeedbackReq> httpEntity)
        throws Exception
    {
        return feedbackService.findFeedbackList(httpEntity.getBody());
    }
    
    /**
     * 新增意见反馈
     * <功能详细描述>
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/{v}/suggestion", method = RequestMethod.POST, produces = {"application/json",
    "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object insertFeedback(HttpEntity<TOperateFeedbackReq> httpEntity) throws Exception
    {
        return feedbackService.commonFeedback(httpEntity.getBody());
    }
    
}
