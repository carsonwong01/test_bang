/*
 * 文 件 名:  ProjectAttachmentServiceImpl.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月8日
 */
package com.dimeng.modules.bus.services.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.bus.ProjectAttachmentResp;
import com.dimeng.entity.table.project.TProjectAttachment;
import com.dimeng.entity.table.system.TSystemFiles;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.framework.utils.FrameworkConfigurer;
import com.dimeng.model.bus.DeleteProjectAttachmentReq;
import com.dimeng.model.bus.InsertFilesReq;
import com.dimeng.model.bus.InsertProjectAttachmentReq;
import com.dimeng.model.bus.InsertProjectAttachmentsReq;
import com.dimeng.model.bus.ProjectAttachmentReq;
import com.dimeng.modules.bus.services.IProjectAttachmentService;

/**
 * 项目图片附件接口实现类
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月8日]
 */
@Service
public class ProjectAttachmentServiceImpl extends BaseServiceImpl implements IProjectAttachmentService
{
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertFile(InsertProjectAttachmentReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        TProjectAttachment projectAttachment = new TProjectAttachment();
        DimengBeanUtil.copyProperties(projectAttachment, req);
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(projectAttachment))
        {
            throw new ServicesException(IDiMengResultCode.Commons.ERROR_DATABASE_OP, "项目图片文件上传");
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertFiles(InsertProjectAttachmentsReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        if (req == null || req.getAttachmentsReqs() == null || req.getAttachmentsReqs().size() < 1)
        {
            return resp;
        }
        TProjectAttachment projectAttachment = new TProjectAttachment();
        if (baseDao.batchInsert(projectAttachment,
            null,
            req.getAttachmentsReqs()) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.Commons.ERROR_DATABASE_OP, "项目图片文件上传");
        }
        
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp deleteFile(DeleteProjectAttachmentReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        TProjectAttachment projectAttachment = new TProjectAttachment();
        projectAttachment.setFileId(req.getFileId());
        TProjectAttachment tmp = (TProjectAttachment)baseDao.findById(projectAttachment);
        baseDao.delete(projectAttachment);
        String path = (new StringBuilder()).append(FrameworkConfigurer.getProperties("fileStore.home"))
            .toString()
            .replace("fileStore", "");
        if (null != tmp) //如果附件表中存在附件,再做删除
        {
            File file = new File(path + tmp.getAddr());
            file.setWritable(true);
            file.delete();
        }
        //如果不存在，返回删除成功
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findFilesList(ProjectAttachmentReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<ProjectAttachmentReq> event = new QueryEvent<ProjectAttachmentReq>();
        event.setObj(req);
        event.setStatement("findProjectAttachmentList");
        List<ProjectAttachmentResp> list = baseDao.findAllIsPageByCustom(event);
        data.put(CommonConstant.JSON_KEY_LIST, list);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateFile(ProjectAttachmentReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        TProjectAttachment projectAttachment = new TProjectAttachment();
        DimengBeanUtil.copyProperties(projectAttachment, req);
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(projectAttachment))
        {
            throw new ServicesException(IDiMengResultCode.Commons.ERROR_DATABASE_OP, "项目图片文件信息更新");
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertSystemFiles(InsertFilesReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        if (req == null || req.getFiles() == null || req.getFiles().size() < 1)
        {
            return resp;
        }
        TSystemFiles systemFiles = new TSystemFiles();
        if (baseDao.batchInsert(systemFiles,
            null,
            req.getFiles()) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.Commons.ERROR_DATABASE_OP, "文件上传");
        }
        return resp;
    }
    
}
