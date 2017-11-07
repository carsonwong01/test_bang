package com.dimeng.modules.bus.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.bus.AuthenticatedRecordResp;
import com.dimeng.entity.ext.bus.FindCommentDetailListResp;
import com.dimeng.entity.ext.bus.FindDynamicsListResp;
import com.dimeng.entity.ext.bus.FindInformantContentImgsResp;
import com.dimeng.entity.ext.bus.FindInformantDetailListResp;
import com.dimeng.entity.ext.bus.FindInformantListResp;
import com.dimeng.entity.ext.bus.FindProjectAuditListResp;
import com.dimeng.entity.ext.bus.FindProjectValidationResp;
import com.dimeng.entity.ext.bus.ProjectAttachmentResp;
import com.dimeng.entity.ext.bus.ProjectDynamicResp;
import com.dimeng.entity.table.bus.TQBusProjectComment;
import com.dimeng.entity.table.project.TProjectAduitRecord;
import com.dimeng.entity.table.project.TProjectDynamic;
import com.dimeng.entity.table.project.TProjectInfo;
import com.dimeng.entity.table.project.TProjectReport;
import com.dimeng.entity.table.project.TProjectValidation;
import com.dimeng.entity.table.site.TSiteInfo;
import com.dimeng.enums.AuditStatusEnum;
import com.dimeng.enums.ProjectAttachmentTypeEnum;
import com.dimeng.enums.ProjectStatusEnum;
import com.dimeng.enums.ProjectTypeEnum;
import com.dimeng.enums.TemplateTypeEnumEasy;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.constants.DigitalAndStringConstant.DigitalConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.bus.CommonVerificateAuditReq;
import com.dimeng.model.bus.DeleteCommentReq;
import com.dimeng.model.bus.DeleteDynamicsReq;
import com.dimeng.model.bus.FindAuthenRecordReq;
import com.dimeng.model.bus.FindCommentListReq;
import com.dimeng.model.bus.FindDynamicsListReq;
import com.dimeng.model.bus.FindInformantDetailListReq;
import com.dimeng.model.bus.FindInformantListReq;
import com.dimeng.model.bus.FindProjectAuditListReq;
import com.dimeng.model.bus.FindProjectValidationReq;
import com.dimeng.model.bus.ProjectAttachmentReq;
import com.dimeng.model.common.IdPageReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.modules.bus.services.IAuditingManageService;
import com.dimeng.modules.bus.services.impl.base.UserCapitalCommonService;
import com.dimeng.modules.message.services.IMessageService;
import com.dimeng.utils.ExportUtil;
import com.dimeng.utils.UUIDGenerate;

/**
 * 审核管理业务
 * 项目审核、评论审核、动态审核、举报审核
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月9日]
 */
@Service
public class AuditingManageServiceImpl extends UserCapitalCommonService implements IAuditingManageService
{
    @Resource
    private IMessageService msgService;
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findProjectAuditList(FindProjectAuditListReq req)
    {
        //去掉前后空格
        if (StringUtil.notEmpty(req.getProjectNo()))
        {
            req.setProjectNo(req.getProjectNo().trim());
        }
        QueryEvent<FindProjectAuditListReq> event = new QueryEvent<FindProjectAuditListReq>();
        event.setStatement("findProjectAuditList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        
        List<FindProjectAuditListResp> findProjectAuditList = baseDao.findAllIsPageByCustom(event);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findProjectAuditList));
        
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Map<String, String> enumsValue = new HashMap<String, String>();
            //导出的一些状态码
            enumsValue.put("projectType", "com.dimeng.enums.ProjectTypeEnum");
            enumsValue.put("projectStatus", "com.dimeng.enums.ProjectStatusEnum");
            enumsValue.put("auditStatus", "com.dimeng.enums.AuditStatusEnum");
            enumsValue.put("validationType", "com.dimeng.enums.ProjectValidationTypeEnum");
            req.setEnumsValue(enumsValue);
            ExportUtil.export(req, findProjectAuditList);
        }
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findDynamicsList(FindDynamicsListReq req)
    {
        QueryEvent<FindDynamicsListReq> event = new QueryEvent<FindDynamicsListReq>();
        event.setStatement("findDynamicsList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(true);
        List<FindDynamicsListResp> dynamicsListResps = baseDao.findAllIsPageByCustom(event);
        //避免内容太长
        if (dynamicsListResps != null)
        {
            for (FindDynamicsListResp findDynamicsListResp : dynamicsListResps)
            {
                String content = findDynamicsListResp.getContent();
                if (StringUtil.notEmpty(content) && content.length() > 50)
                {
                    findDynamicsListResp.setContent(content.substring(0, 50) + "...");
                }
            }
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, dynamicsListResps));
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findDynamicsDetails(IdPageReq req)
    {
        QueryEvent<IdPageReq> event = new QueryEvent<IdPageReq>();
        event.setStatement("findDynamicsDetails");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(true);
        List<ProjectDynamicResp> findProjectDynamicList = baseDao.findAllIsPageByCustom(event);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findProjectDynamicList));
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp deleteDynamics(DeleteDynamicsReq req)
        throws ServicesException
    {
        TProjectDynamic tProjectDynamic = new TProjectDynamic();
        tProjectDynamic.setDynamicId(req.getId());
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.delete(tProjectDynamic))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_DETELE);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findCommentList(FindCommentListReq req)
    {
        QueryEvent<FindCommentListReq> event = new QueryEvent<FindCommentListReq>();
        event.setStatement("findCommentList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(true);
        List<ProjectDynamicResp> findProjectDynamicList = baseDao.findAllIsPageByCustom(event);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findProjectDynamicList));
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp deleteComment(DeleteCommentReq req)
        throws ServicesException
    {
        TQBusProjectComment tqBusProjectComment = new TQBusProjectComment();
        if (StringUtil.isEmpty(req.getId()) && StringUtil.isEmpty(req.getOrderId()))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_DETELE);
        }
        if ((int)baseDao.executeSQL("delete", "deleteComment", req) < DigitalAndStringConstant.DigitalConstant.ZERO)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_DETELE);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findCommentDetailList(IdReq req)
    {
        QueryEvent<IdReq> event = new QueryEvent<IdReq>();
        event.setStatement("findCommentDetailList");
        event.setObj(req);
        List<FindCommentDetailListResp> findCommentDetailListResps = baseDao.findAllIsPageByCustom(event);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_LIST, findCommentDetailListResps);
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findInformantList(FindInformantListReq req)
    {
        //去掉前后空格
        if (StringUtil.notEmpty(req.getProjectNo()))
        {
            req.setProjectNo(req.getProjectNo().trim());
        }
        QueryEvent<FindInformantListReq> event = new QueryEvent<FindInformantListReq>();
        event.setStatement("findInformantList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        List<FindInformantListResp> findInformantListResps = baseDao.findAllIsPageByCustom(event);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findInformantListResps));
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Map<String, String> enumsValue = new HashMap<String, String>();
            //导出的一些状态码
            enumsValue.put("projectType", "com.dimeng.enums.BProjectTypeEnum");
            enumsValue.put("projectStatus", "com.dimeng.enums.ProjectStatusEnum");
            req.setEnumsValue(enumsValue);
            ExportUtil.export(req, findInformantListResps);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @Override
    public BaseDataResp findInformantDetailList(FindInformantDetailListReq req)
    {
        QueryEvent<FindInformantDetailListReq> event = new QueryEvent<FindInformantDetailListReq>();
        event.setStatement("FindInformantDetailList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        List<FindInformantDetailListResp> informantDetailList = baseDao.findAllIsPageByCustom(event);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, informantDetailList));
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            ExportUtil.export(req, informantDetailList);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findInformantContent(IdReq req)
    {
        //查询举报详情内容
        TProjectReport tProjectReport = new TProjectReport();
        tProjectReport.setReportId(req.getId());
        tProjectReport = (TProjectReport)baseDao.findById(tProjectReport);
        
        //查询举报详情的图片集合
        ProjectAttachmentReq attachmentReq = new ProjectAttachmentReq();
        attachmentReq.setAssociatedId(req.getId());
        attachmentReq.setType(ProjectAttachmentTypeEnum.PROJECT_REPORT.dataBaseVal);
        QueryEvent<ProjectAttachmentReq> event = new QueryEvent<ProjectAttachmentReq>();
        event.setObj(attachmentReq);
        event.setStatement("findProjectAttachmentList");
        List<ProjectAttachmentResp> list = baseDao.findAllIsPageByCustom(event);
        List<FindInformantContentImgsResp> informantContentImgs = new ArrayList<FindInformantContentImgsResp>();
        if (list != null && list.size() > 0)
        {
            FindInformantContentImgsResp informantContentImg;
            for (ProjectAttachmentResp projectAttachmentResp : list)
            {
                informantContentImg = new FindInformantContentImgsResp();
                informantContentImg.setUrl(projectAttachmentResp.getAddr());
                informantContentImgs.add(informantContentImg);
            }
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, tProjectReport.getReportReason());
        map.put(CommonConstant.JSON_KEY_LIST, informantContentImgs);
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings({"unchecked", "deprecation"})
    @Override
    public BaseDataResp authenticatedRecord(FindAuthenRecordReq req)
    {
        QueryEvent<FindAuthenRecordReq> event = new QueryEvent<FindAuthenRecordReq>();
        event.setStatement("authenticatedRecord");
        event.setObj(req);
        
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(true);
        List<AuthenticatedRecordResp> authenticatedRecords = baseDao.findAllIsPageByCustom(event);
        
        Map<String, Object> map = new HashMap<String, Object>();
        if (!StringUtil.isEmpty(req.getIsFront())
            && DigitalAndStringConstant.StringConstant.ONE.equals(req.getIsFront()))
        {
            //查询项目验证时间，并创建AuthenticatedRecordResp对象放入authenticatedRecords集合中
            FindProjectValidationReq validReq = new FindProjectValidationReq();
            validReq.setValidationId(req.getId());
            QueryEvent<FindProjectValidationReq> validEvent = new QueryEvent<FindProjectValidationReq>();
            validEvent.setObj(validReq);
            validEvent.setStatement("findProjectValidate");
            FindProjectValidationResp projectValidationResp =
                (FindProjectValidationResp)baseDao.findOneByCustom(validEvent);
            if (projectValidationResp != null)
            {
                AuthenticatedRecordResp recordResp = new AuthenticatedRecordResp();
                recordResp.setDateCheck(projectValidationResp.getDateCreate());
                recordResp.setDateFormat(DateUtil.format(DateUtil.parseDateTime(projectValidationResp.getDateCreate()),
                    "MM月dd日"));
                recordResp.setTitle("提交项目验证");
                authenticatedRecords.add(recordResp);
            }
            //进行数据处理
            List<AuthenticatedRecordResp> list = new ArrayList<AuthenticatedRecordResp>();
            if (StringUtil.isEmpty(authenticatedRecords.get(0).getStatus())
                || AuditStatusEnum.DSH.getDataBaseVal().equals(projectValidationResp.getAuditStatus()))
            {
                AuthenticatedRecordResp recordResp = new AuthenticatedRecordResp();
                recordResp.setDateFormat(authenticatedRecords.get(0).getDateFormat() + "~至今");
                recordResp.setTitle("项目验证中");
                list.add(recordResp);
            }
            if (authenticatedRecords.size() == 1)
            {
                list.addAll(authenticatedRecords);
            }
            else
            {
                list.add(getAuditName(authenticatedRecords.get(0)));
                for (int i = 0; i < authenticatedRecords.size() - 1; i++)
                {
                    AuthenticatedRecordResp recordRespPrev = authenticatedRecords.get(i);
                    AuthenticatedRecordResp recordRespNext = authenticatedRecords.get(i + 1);
                    AuthenticatedRecordResp recordRespTemp = new AuthenticatedRecordResp();
                    recordRespTemp.setDateFormat(recordRespNext.getDateFormat() + "~" + recordRespPrev.getDateFormat());
                    recordRespTemp.setTitle("项目验证中");
                    list.add(recordRespTemp);
                    list.add(getAuditName(recordRespNext));
                }
            }
            map.put(CommonConstant.JSON_KEY_PAGERESULT, list);
        }
        else
        {
            map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, authenticatedRecords));
        }
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    private AuthenticatedRecordResp getAuditName(AuthenticatedRecordResp recordResp)
    {
        if (AuditStatusEnum.DSH.getDataBaseVal().equals(recordResp.getStatus()))
        {
            recordResp.setTitle("项目验证待审核");
        }
        else if (AuditStatusEnum.SHBTG.getDataBaseVal().equals(recordResp.getStatus()))
        {
            recordResp.setTitle("项目验证不通过");
        }
        else if (AuditStatusEnum.SHTG.getDataBaseVal().equals(recordResp.getStatus()))
        {
            recordResp.setTitle("项目验证通过");
        }
        return recordResp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonVerificateAudit(CommonVerificateAuditReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        TProjectValidation tProjectValidation = new TProjectValidation();
        tProjectValidation.setValidationId(req.getId());
        tProjectValidation = (TProjectValidation)baseDao.findById(tProjectValidation);
        //如果审核记录已经审核
        if (!AuditStatusEnum.DSH.dataBaseVal.equals(tProjectValidation.getAuditStatus()))
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.VALID_AUDIT_STATUS_ERROR);
        }
        //审核通过
        if (req.getStatus().equals("1"))
        {
            tProjectValidation.setAuditStatus(AuditStatusEnum.SHTG.dataBaseVal);
            IdReq idReq = new IdReq();
            idReq.setId(tProjectValidation.getProjectId());
            QueryEvent<IdReq> event = new QueryEvent<IdReq>();
            event.setStatement("findExsitProjectInfo");
            event.setObj(idReq);
            TProjectInfo projectInfo = (TProjectInfo)baseDao.findOneByCustom(event);
            if (projectInfo == null)
            {
                throw new ServicesException(IDiMengResultCode.SiteManage.ERROR_PROJECT_BCZ);
            }
            //只有众筹成功的项目才会将其冻结金额状态可用金额
            //汇报项目：项目成功-发完货-项目已验证
            //其他项目：项目成功-项目已验证
            if (ProjectStatusEnum.ZCCG.getDataBaseVal().equals(projectInfo.getProjectStatus())
                && (ProjectTypeEnum.HBXM.getDataBaseVal().equals(projectInfo.getProjectType())
                    && this.isAllOrderSend(tProjectValidation.getProjectId()) || !ProjectTypeEnum.HBXM.getDataBaseVal()
                    .equals(projectInfo.getProjectType())))
            {
                //isAllOrderSend
                this.updateAvailableAndFrozenAmount(projectInfo.getProjectCreatorId(),
                    tProjectValidation.getProjectId(),
                    projectInfo.getRaisedAmount());
            }
        }
        else
        {
            tProjectValidation.setAuditStatus(AuditStatusEnum.SHBTG.dataBaseVal);
        }
        
        //修改审核状态
        tProjectValidation.setAduitUserId(req.getUserId());
        
        tProjectValidation.setDateAduit(DateUtil.getNow());
        if (DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.update(tProjectValidation))
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.ERROR_BUSAUDIT_INFO);
        }
        //添加审核记录
        TProjectAduitRecord tProjectAduitRecord = new TProjectAduitRecord();
        tProjectAduitRecord.setAduitId(UUIDGenerate.generateShortUuid());
        tProjectAduitRecord.setAduitOption(req.getAuditInfo());
        tProjectAduitRecord.setAduitResult(tProjectValidation.getAuditStatus());
        tProjectAduitRecord.setAduitUserId(tProjectValidation.getAduitUserId());
        tProjectAduitRecord.setDateAduit(tProjectValidation.getDateAduit());
        tProjectAduitRecord.setValidationId(req.getId());
        if (DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.insert(tProjectAduitRecord))
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.ERROR_BUSAUDIT_INFO);
        }
        //从缓存中获得站点信息
        TSiteInfo siteInfo = (TSiteInfo)systemCache.get(SystemConstant.CacheKey.SITE_INFO).getObjectValue();
        //查询项目信息
        TProjectInfo projectInfo = new TProjectInfo();
        projectInfo.setProjectId(tProjectValidation.getProjectId());
        projectInfo = (TProjectInfo)baseDao.findById(projectInfo);
        String[] pars = new String[] {siteInfo.getSiteName(), projectInfo.getProjectName()};
        //查询用户电话号码
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userId", projectInfo.getProjectCreatorId());
        List<String> phone = (List<String>)baseDao.executeSQL("select", "findUserPhoneByUserId", params);
        //发送短信
        msgService.sendSms("0",
            (AuditStatusEnum.SHTG.dataBaseVal.equals(tProjectValidation.getAuditStatus()) ? TemplateTypeEnumEasy.PROJECT_AUDIT_PASS.dataBaseVal
                : TemplateTypeEnumEasy.PROJECT_AUDIT_NOT_PASS.dataBaseVal),
            pars,
            phone.get(0));
        
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
}
