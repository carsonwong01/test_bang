/*
 * 文 件 名:  FeedbackServiceImpl.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.modules.expand.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.expand.FindFeedbackResp;
import com.dimeng.entity.table.site.TOperateFeedback;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.expand.FindFeedbackReq;
import com.dimeng.model.site.TOperateFeedbackReq;
import com.dimeng.modules.expand.services.IFeedbackService;
import com.dimeng.utils.DaoUtil;
import com.dimeng.utils.ExportUtil;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.UUIDGenerate;

/**
 * 意见反馈Service实现类
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
@Service
public class FeedbackServiceImpl extends BaseServiceImpl implements IFeedbackService
{
    
    /** {@inheritDoc} */
    
    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    public BaseDataResp findFeedbackList(FindFeedbackReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        Map<String, Object> data = new HashMap<>();
        //分页设置
        PageContext page = DaoUtil.setPagePars(req, resp);
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        event.setObj(req);
        //查询
        event.setStatement("findFeedbackList");
        List<FindFeedbackResp> list = baseDao.findAllIsPageByCustom(event);
        PageResult result = new PageResult(page, list);
        data.put(CommonConstant.JSON_KEY_PAGERESULT, result);
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            ExportUtil.export(req, list);
        }
        //组装成功数据
        DaoUtil.setSuccessData(resp, data);
        return resp;
    }

    @SuppressWarnings("unchecked")
    public BaseDataResp commonFeedback(TOperateFeedbackReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        TOperateFeedback tOperateFeedback= (TOperateFeedback) DimengBeanUtil.copyProperties(TOperateFeedback.class, req);
        
        if(req != null){
        	tOperateFeedback.setFeedbackId(UUIDGenerate.generateShortUuid());
        	tOperateFeedback.setUserId(LoginCache.getFrontUserInfo().getUserId());
        	tOperateFeedback.setDateCommit(DateUtil.getNow());
            if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(tOperateFeedback))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        }else{
            resp.setCode(IDiMengResultCode.Commons.ERROR_UNKNOWN);
        }
        return resp;
    }
    
}
