/*
 * 文 件 名:  ProjectBasicSetServiceImpl.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月28日
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
import com.dimeng.entity.ext.expand.FindAllTProjectLabelTypeResp;
import com.dimeng.entity.ext.expand.FindAllTSiteImageTemplateResp;
import com.dimeng.entity.ext.expand.FindProjectLabelSetResp;
import com.dimeng.entity.table.project.TProjectLabelType;
import com.dimeng.entity.table.site.TSiteImageTemplate;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.domain.BaseReq;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.model.expand.FindProjectBasicSetReq;
import com.dimeng.model.expand.ImgModelReq;
import com.dimeng.model.expand.ProjectLabelReq;
import com.dimeng.modules.expand.services.IProjectBasicSetService;
import com.dimeng.utils.UUIDGenerate;

/**
 * 运营管理基本设置Service实现
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月28日]
 */
@Service
public class ProjectBasicSetServiceImpl extends BaseServiceImpl implements IProjectBasicSetService
{
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findLabelList(FindProjectBasicSetReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FindProjectBasicSetReq> event = new QueryEvent<FindProjectBasicSetReq>();
        event.setObj(req);
        event.setStatement("findProjectLabelList");
        List<FindProjectLabelSetResp> list = baseDao.findAllIsPageByCustom(event);
        data.put(CommonConstant.JSON_KEY_LIST, list);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findLabels(ProjectLabelReq req)
        throws Exception
    {
        TProjectLabelType tProjectLabelType =
            (TProjectLabelType)DimengBeanUtil.copyProperties(TProjectLabelType.class, req);
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<TProjectLabelType> event = new QueryEvent<TProjectLabelType>();
        event.setObj(tProjectLabelType);
        event.setStatement("findProjectLabels");
        List<TProjectLabelType> list = baseDao.findAllIsPageByCustom(event);
        data.put(CommonConstant.JSON_KEY_LIST, list);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertLabel(ProjectLabelReq req)
        throws Exception
    {
        TProjectLabelType projectLabelType =
            (TProjectLabelType)DimengBeanUtil.copyProperties(TProjectLabelType.class, req);
        projectLabelType.setLabelTypeId(UUIDGenerate.generateShortUuid());
        projectLabelType.setDateCreate(new Date());
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(projectLabelType))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        
        //更新缓存
        updateLabelCache();
        
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        data.put(CommonConstant.JSON_KEY_SINGLE_RESULT, projectLabelType);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp deleteLabel(ProjectLabelReq req)
        throws Exception
    {
        TProjectLabelType projectLabelType =
            (TProjectLabelType)DimengBeanUtil.copyProperties(TProjectLabelType.class, req);
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.delete(projectLabelType))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_DETELE);
        }
        
        //更新项目标签缓存
        updateLabelCache();
        
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findImgModel(ImgModelReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<ImgModelReq> event = new QueryEvent<ImgModelReq>();
        event.setObj(req);
        event.setStatement("findImageTemplateList");
        List<TSiteImageTemplate> list = baseDao.findAllIsPageByCustom(event);
        data.put(CommonConstant.JSON_KEY_LIST, list);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonImgModel(ImgModelReq req)
        throws Exception
    {
        TSiteImageTemplate tSiteImageTemplate =
            (TSiteImageTemplate)DimengBeanUtil.copyProperties(TSiteImageTemplate.class, req);
        tSiteImageTemplate.setDateUpdate(new Date());
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(tSiteImageTemplate))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        
        //更新图片模板缓存
        updateImgModelCache();
        
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    private void updateLabelCache()
    {
        QueryEvent<BaseReq> event = new QueryEvent<BaseReq>();
        event.setStatement("findAllProjectLabels");
        List<FindAllTProjectLabelTypeResp> list = baseDao.findAllIsPageByCustom(event);
        systemCache.put(new Element(SystemConstant.CacheKey.PROJECT_LABEL_LIST, list));
    }
    
    @SuppressWarnings("unchecked")
    private void updateImgModelCache()
    {
        QueryEvent<BaseReq> event = new QueryEvent<BaseReq>();
        event.setStatement("findAllImageTemplate");
        List<FindAllTSiteImageTemplateResp> list = baseDao.findAllIsPageByCustom(event);
        systemCache.put(new Element(SystemConstant.CacheKey.IMAGE_MODEL_LIST, list));
    }
    
}
