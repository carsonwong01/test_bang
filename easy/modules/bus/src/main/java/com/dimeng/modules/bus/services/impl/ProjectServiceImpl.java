package com.dimeng.modules.bus.services.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.bus.FindCommentDetailListResp;
import com.dimeng.entity.ext.bus.FindInitiateProListResp;
import com.dimeng.entity.ext.bus.FindProjectReturnListResp;
import com.dimeng.entity.ext.bus.FindQscProjectListResp;
import com.dimeng.entity.ext.bus.FindUserCommentResp;
import com.dimeng.entity.ext.bus.ProjectContentResp;
import com.dimeng.entity.ext.bus.ProjectDetailsResp;
import com.dimeng.entity.ext.bus.ProjectDynamicResp;
import com.dimeng.entity.ext.user.ConsoleUserInfo;
import com.dimeng.entity.table.bus.TQBusProjectComment;
import com.dimeng.entity.table.project.TProjectAttachment;
import com.dimeng.entity.table.site.TSiteHomeProject;
import com.dimeng.enums.ProjectAttachmentTypeEnum;
import com.dimeng.enums.ProjectTypeEnum;
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
import com.dimeng.model.bus.DynamicListReq;
import com.dimeng.model.bus.FindProListByUserIdReq;
import com.dimeng.model.bus.FindProjectListReq;
import com.dimeng.model.bus.FindUserCommentReq;
import com.dimeng.model.bus.InsertUserCommentReq;
import com.dimeng.model.bus.ProjectDetailsReq;
import com.dimeng.model.bus.RecommendProReq;
import com.dimeng.model.common.IdPageReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.modules.bus.services.IProjectService;
import com.dimeng.utils.ExportUtil;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.UUIDGenerate;

/**
 * 项目业务类
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年12月9日]
 */
@Service
public class ProjectServiceImpl extends BaseServiceImpl implements IProjectService
{
    @Override
    @SuppressWarnings("unchecked")
    public BaseDataResp findProjectList(FindProjectListReq req)
    {
        //去掉前后空格
        if (StringUtil.notEmpty(req.getProjectNo()))
        {
            req.setProjectNo(req.getProjectNo().trim());
        }
        QueryEvent<FindProjectListReq> event = new QueryEvent<FindProjectListReq>();
        event.setStatement("findProjectList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        
        List<FindQscProjectListResp> findProjectList = baseDao.findAllIsPageByCustom(event);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findProjectList));
        
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Map<String, String> enumsValue = new HashMap<String, String>();
            //导出的一些状态码
            enumsValue.put("type", "com.dimeng.enums.BProjectTypeEnum");
            enumsValue.put("projectStatus", "com.dimeng.enums.ProjectStatusEnum");
            req.setEnumsValue(enumsValue);
            ExportUtil.export(req, findProjectList);
        }
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findRecommendProList(FindProjectListReq req)
    {
        //去掉前后空格
        if (StringUtil.notEmpty(req.getProjectNo()))
        {
            req.setProjectNo(req.getProjectNo().trim());
        }
        QueryEvent<FindProjectListReq> event = new QueryEvent<FindProjectListReq>();
        event.setStatement("findRecommendProList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        List<FindQscProjectListResp> findProjectList = baseDao.findAllIsPageByCustom(event);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findProjectList));
        
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Map<String, String> enumsValue = new HashMap<String, String>();
            enumsValue.put("type", "com.dimeng.enums.ProjectTypeEnum");
            req.setEnumsValue(enumsValue);
            ExportUtil.export(req, findProjectList);
        }
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonRecommendPro(RecommendProReq req)
        throws ServicesException
    {
        BaseDataResp resp = new BaseDataResp();
        TSiteHomeProject homePro = new TSiteHomeProject();
        String uuid = UUIDGenerate.generateShortUuid();
        ConsoleUserInfo info = LoginCache.getConsoleUserInfo();
        homePro.setId(uuid);
        homePro.setProjectId(req.getProId());
        if (!StringUtil.isEmpty(req.getIsApp()))
        {
            homePro.setRecommendApp(req.getIsApp());
            homePro.setDateApp(DateUtil.getNow());
        }
        if (!StringUtil.isEmpty(req.getIsPc()))
        {
            homePro.setRecommendPc(req.getIsPc());
            homePro.setDatePc(DateUtil.getNow());
        }
        if (!StringUtil.isEmpty(req.getIsWeixin()))
        {
            homePro.setRecommendWeixin(req.getIsWeixin());
            homePro.setDateWeixin(DateUtil.getNow());
        }
        homePro.setUserOpt(info.getName());
        homePro.setDateOpt(DateUtil.getNow());
        if (baseDao.insert(homePro) != 1)
        {
            logs.info("数据新增出错");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateRecommendPro(RecommendProReq req)
        throws ServicesException
    {
        BaseDataResp resp = new BaseDataResp();
        TSiteHomeProject homePro = new TSiteHomeProject();
        ConsoleUserInfo info = LoginCache.getConsoleUserInfo();
        homePro.setId(req.getId());
        boolean isOk = true;
        if (!StringUtil.isEmpty(req.getIsApp()))
        {
            homePro.setRecommendApp(req.getIsApp());
            if ("1".equals(req.getIsApp()))
            {
                isOk = false;
                homePro.setDateApp(DateUtil.getNow());
            }
        }
        if (!StringUtil.isEmpty(req.getIsPc()))
        {
            homePro.setRecommendPc(req.getIsPc());
            if ("1".equals(req.getIsPc()))
            {
                isOk = false;
                homePro.setDateWeixin(DateUtil.getNow());
            }
        }
        if (!StringUtil.isEmpty(req.getIsWeixin()))
        {
            homePro.setRecommendWeixin(req.getIsWeixin());
            if ("1".equals(req.getIsWeixin()))
            {
                isOk = false;
                homePro.setDateWeixin(DateUtil.getNow());
            }
        }
        if (isOk)
        {
            baseDao.delete(homePro);
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            return resp;
        }
        homePro.setUserOpt(info.getName());
        homePro.setDateOpt(DateUtil.getNow());
        if (baseDao.update(homePro) != 1)
        {
            logs.info("数据修改出错");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findrecommendInfo(RecommendProReq req)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        BaseDataResp resp = new BaseDataResp();
        
        QueryEvent event = new QueryEvent();
        event.setStatement("findrecommendInfo");
        event.setObj(req);
        RecommendProReq recommendInfo = (RecommendProReq)baseDao.findOneByCustom(event);
        if (recommendInfo == null)
        {
            resp.setCode(IDiMengResultCode.Commons.ERROR_PARAMETER);
            return resp;
        }
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, recommendInfo);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp getProjectDetails(ProjectDetailsReq req)
    {
        QueryEvent<ProjectDetailsReq> event = new QueryEvent<ProjectDetailsReq>();
        event.setStatement("projectDetails");
        event.setObj(req);
        ProjectDetailsResp projectDetailsResp = (ProjectDetailsResp)baseDao.findOneByCustom(event);
        //查询附件
        TProjectAttachment projectAttachment = new TProjectAttachment();
        projectAttachment.setAssociatedId(projectDetailsResp.getId());
        projectAttachment.setType(ProjectAttachmentTypeEnum.PROJECT_IMGS.getDataBaseVal());
        List<TProjectAttachment> imgs =
            (List<TProjectAttachment>)baseDao.executeSQL(null, "getProjectAttachments", projectAttachment);
        projectDetailsResp.setImgs(imgs);
        //查询回报、梦想列表
        if (ProjectTypeEnum.MXXM.getDataBaseVal().equals(projectDetailsResp.getType())
            || ProjectTypeEnum.HBXM.getDataBaseVal().equals(projectDetailsResp.getType()))
        {
            IdPageReq returnListReq = new IdPageReq();
            returnListReq.setId(req.getProjectId());
            QueryEvent<IdPageReq> returnEvent = new QueryEvent<IdPageReq>();
            returnEvent.setStatement("findProjectReturnOrDreamList");
            returnEvent.setObj(returnListReq);
            List<FindProjectReturnListResp> dreamTargets = baseDao.findAllIsPageByCustom(returnEvent);
            projectDetailsResp.setDreamTargets(dreamTargets);
        }
        //梦想项目、回报项目
        if (ProjectTypeEnum.HBXM.getDbvalue().toString().equals(projectDetailsResp.getType())
            || ProjectTypeEnum.MXXM.getDbvalue().toString().equals(projectDetailsResp.getType()))
        {
            //格式化标签为数组List
            String[] label = projectDetailsResp.getLabel().split(",");
            List<String> labels = new ArrayList<String>();
            for (String string : label)
            {
                if (StringUtil.notEmpty(string))
                {
                    labels.add(string);
                }
            }
            projectDetailsResp.setLabels(labels);
        }
        else
        //其他项目不含有标签
        {
            projectDetailsResp.setLabels(new ArrayList());
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, projectDetailsResp);
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp getProjectContent(ProjectDetailsReq req)
    {
        QueryEvent<ProjectDetailsReq> event = new QueryEvent<ProjectDetailsReq>();
        event.setStatement("getProjectContent");
        event.setObj(req);
        ProjectContentResp projectContentResp = (ProjectContentResp)baseDao.findOneByCustom(event);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, projectContentResp.getContent());
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findProjectReturnList(IdPageReq req)
    {
        QueryEvent<IdPageReq> event = new QueryEvent<IdPageReq>();
        event.setStatement("findProjectReturnList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(true);
        List<FindProjectReturnListResp> findProjectReturnList = baseDao.findAllIsPageByCustom(event);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findProjectReturnList));
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp getProjectDynamicList(DynamicListReq req)
    {
        QueryEvent<DynamicListReq> event = new QueryEvent<DynamicListReq>();
        event.setStatement("getProjectDynamicList");
        event.setObj(req);
        Map<String, Object> map = new HashMap<String, Object>();
        
        //微信端项目详情中项目动态不分页
        if (!StringUtil.isEmpty(req.getProjectId())
            && DigitalAndStringConstant.StringConstant.TWO.equals(req.getOpSource()))
        {
            List<ProjectDynamicResp> findProjectDynamicList = baseDao.findAllIsPageByCustom(event);
            map.put(CommonConstant.JSON_KEY_PAGERESULT, findProjectDynamicList);
        }
        else
        {
            //分页开关
            PageContext page = PageContext.getContext();
            page.setCurrentPage(req.getReqPageNum());
            page.setPageSize(req.getMaxResults());
            page.setPagination(true);
            List<ProjectDynamicResp> findProjectDynamicList = baseDao.findAllIsPageByCustom(event);
            map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findProjectDynamicList));
        }
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findInitiateProList(FindProListByUserIdReq req)
    {
        QueryEvent<FindProListByUserIdReq> event = new QueryEvent<FindProListByUserIdReq>();
        event.setStatement("findInitiateProList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        List<FindInitiateProListResp> findProjectList = baseDao.findAllIsPageByCustom(event);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findProjectList));
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp returnAmtList(IdReq req)
    {
        QueryEvent<IdReq> event = new QueryEvent<IdReq>();
        event.setStatement("findProjectReturnList");
        event.setObj(req);
        
        List<FindProjectReturnListResp> findProjectReturnList = baseDao.findAllIsPageByCustom(event);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_LIST, findProjectReturnList);
        
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findUserCommentList(FindUserCommentReq req)
        throws Exception
    {
        QueryEvent<FindUserCommentReq> event = new QueryEvent<FindUserCommentReq>();
        event.setStatement("findUserCommentList");
        event.setObj(req);
        //分页开关
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        page.setPagination(true);
        List<FindUserCommentResp> list = baseDao.findAllIsPageByCustom(event);
        Map<String, Object> data = new HashMap<String, Object>();
        PageResult pageResult = new PageResult(page, list);
        if (pageResult != null && pageResult.getList() != null && pageResult.getList().size() > 0)
        {
            QueryEvent<IdReq> detailListEvent = null;
            IdReq idReq = null;
            List<FindCommentDetailListResp> findCommentDetailListResps = null;
            for (FindUserCommentResp findUserCommentResp : (List<FindUserCommentResp>)pageResult.getList())
            {
                idReq = new IdReq();
                idReq.setId(findUserCommentResp.getOrderId());
                detailListEvent = new QueryEvent<IdReq>();
                detailListEvent.setStatement("findCommentDetailList");
                detailListEvent.setObj(idReq);
                findCommentDetailListResps = new ArrayList<FindCommentDetailListResp>(0);
                findCommentDetailListResps = baseDao.findAllIsPageByCustom(detailListEvent);
                findUserCommentResp.setComments(findCommentDetailListResps);
            }
        }
        data.put(CommonConstant.JSON_KEY_PAGERESULT, pageResult);
        BaseDataResp resp = new BaseDataResp();
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertComment(InsertUserCommentReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        //用户是否已支持该项目
        QueryEvent<InsertUserCommentReq> event = new QueryEvent<InsertUserCommentReq>();
        event.setStatement("findUserSupportCount");
        event.setObj(req);
        Integer count = (Integer)baseDao.findOneByCustom(event);
        if (count < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            logs.info("###该用户还未支持项目###");
            resp.setCode(IDiMengResultCode.ProjectManage.USER_NOT_SUPPORTPROJECT);
            return resp;
        }
        
        TQBusProjectComment comment =
            (TQBusProjectComment)DimengBeanUtil.copyProperties(TQBusProjectComment.class, req);
        String commentId = UUIDGenerate.generateShortUuid();
        comment.setCommentId(commentId);
        comment.setDateComment(new Date());
        if (baseDao.insert(comment) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            logs.info("###用户评论回复错误###");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        
        IdReq idReq = new IdReq();
        idReq.setId(commentId);
        QueryEvent<IdReq> queryEvent = new QueryEvent<IdReq>();
        queryEvent.setStatement("findByIdComment");
        queryEvent.setObj(idReq);
        FindCommentDetailListResp commentResp = (FindCommentDetailListResp)baseDao.findOneByCustom(queryEvent);
        
        Map<String, Object> data = new HashMap<String, Object>();
        //返回刚插入的评论回复信息
        data.put("comment", commentResp);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findProjectReturnOrDreamList(IdReq req)
    {
        QueryEvent<IdReq> returnEvent = new QueryEvent<IdReq>();
        returnEvent.setStatement("findProjectReturnOrDreamList");
        returnEvent.setObj(req);
        List<FindProjectReturnListResp> dreamTargets = baseDao.findAllIsPageByCustom(returnEvent);
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("comment", dreamTargets);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
}
