/*
 * 文 件 名:  TextInstructServiceImpl.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.modules.expand.services.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.ehcache.Element;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.expand.FindAllTextInstructResp;
import com.dimeng.entity.ext.expand.FindTextInstructResp;
import com.dimeng.entity.ext.user.ConsoleUserInfo;
import com.dimeng.entity.table.site.TSiteTextInstructions;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.domain.BaseReq;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.expand.TextInstructReq;
import com.dimeng.modules.expand.services.ITextInstructService;
import com.dimeng.utils.LoginCache;

/**
 * 文本说明service实现
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
@Service
public class TextInstructServiceImpl extends BaseServiceImpl implements ITextInstructService
{
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findTextInstructList(TextInstructReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<BaseReq> event = new QueryEvent<BaseReq>();
        event.setObj(req);
        event.setStatement("findTextInstructList");
        List<FindTextInstructResp> list = baseDao.findAllIsPageByCustom(event);
        data.put(CommonConstant.JSON_KEY_LIST, list);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonTextInstruct(TextInstructReq req)
        throws Exception
    {
        if (!StringUtil.isEmpty(req.getTextContext()) && req.getTextContext().length() > 6000)
        {
            throw new ServicesException(IDiMengResultCode.SiteManage.ERROR_ARTICLE_CONTENT_OVERSIZE);
        }
        TSiteTextInstructions tSiteTextInstructions =
            (TSiteTextInstructions)DimengBeanUtil.copyProperties(TSiteTextInstructions.class, req);
        tSiteTextInstructions.setDateUpdate(new Date());
        ConsoleUserInfo user = LoginCache.getConsoleUserInfo();
        tSiteTextInstructions.setOperatorId(user.getUserId());
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(tSiteTextInstructions))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        
        //更新文本内容缓存
        updateTextInstructCache();
        
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    private void updateTextInstructCache()
    {
        QueryEvent<BaseReq> event = new QueryEvent<BaseReq>();
        event.setStatement("findAllTextInstruct");
        List<FindAllTextInstructResp> list = baseDao.findAllIsPageByCustom(event);
        systemCache.put(new Element(SystemConstant.CacheKey.TEXT_INSTRUCT_LIST, list));
    }
    
}
