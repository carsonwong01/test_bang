/*
 * 文 件 名:  ProjectBasicServiceImpl.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月9日
 */
package com.dimeng.modules.bus.services.impl;

import java.io.File;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.bus.ProjectAttachmentResp;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.entity.table.expand.TProjectFavorites;
import com.dimeng.entity.table.order.TOrderSupport;
import com.dimeng.entity.table.project.TProjectAttachment;
import com.dimeng.entity.table.project.TProjectDynamic;
import com.dimeng.entity.table.project.TProjectInfo;
import com.dimeng.entity.table.project.TProjectReturn;
import com.dimeng.entity.table.site.TSiteInfo;
import com.dimeng.entity.table.system.TSystemFiles;
import com.dimeng.enums.ProjectAttachmentTypeEnum;
import com.dimeng.enums.ProjectDynamicTypeEnum;
import com.dimeng.enums.ProjectStatusEnum;
import com.dimeng.enums.ProjectTypeEnum;
import com.dimeng.enums.TemplateTypeEnumEasy;
import com.dimeng.enums.variable.SystemVariable;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.framework.utils.FrameworkConfigurer;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.bus.FindCollectionListReq;
import com.dimeng.model.bus.FindProjectBaseReq;
import com.dimeng.model.bus.InsertDreamProjectReq;
import com.dimeng.model.bus.InsertProjectDynamicReq;
import com.dimeng.model.bus.InsertReturnProjectReq;
import com.dimeng.model.bus.InsertWelfareProjectReq;
import com.dimeng.model.bus.ProjectAttachmentReq;
import com.dimeng.model.bus.ProjectBasicReq;
import com.dimeng.model.bus.ProjectReturnReq;
import com.dimeng.model.bus.UpdateDreamProjectReq;
import com.dimeng.model.bus.UpdateReturnProjectReq;
import com.dimeng.model.bus.UpdateWelfareProjectReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.modules.bus.services.IProjectBasicService;
import com.dimeng.modules.bus.services.impl.base.BaseCommonService;
import com.dimeng.modules.message.services.IMessageService;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.SystemCache;
import com.dimeng.utils.UUIDGenerate;

/**
 * 项目基础业务接口实现
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月9日]
 */
@Service
public class ProjectBasicServiceImpl extends BaseCommonService implements IProjectBasicService
{
    @Resource
    private IMessageService msgService;
    
    /** {@inheritDoc} */
    
    @Override
    public BaseDataResp insertWelfareProject(InsertWelfareProjectReq req)
        throws Exception
    {
        //拉黑或锁定用户不能发起项目
        FrontUserInfo frontUser = LoginCache.getFrontUserInfo();
        if (DigitalAndStringConstant.StringConstant.TWO.equals(frontUser.getUserStatus())
            || DigitalAndStringConstant.StringConstant.THREE.equals(frontUser.getUserStatus()))
        {
            throw new ServicesException(IDiMengResultCode.CpProjectManage.USER_IS_BLACK);
        }
        //设置项目ID
        String projectId = UUIDGenerate.generateShortUuid();
        req.setProjectId(projectId);
        return commonTProjectInfo(req, req.getImagesIds());
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateWelfareProject(UpdateWelfareProjectReq req)
        throws Exception
    {
        TProjectInfo projectInfo = findProject(req.getProjectId());
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        //判断项目是否属于该用户
        if (!userInfo.getUserId().equals(projectInfo.getProjectCreatorId()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
        }
        //判断项目是否存在
        if (!ProjectStatusEnum.ZCZ.getDbvalue().toString().equals(projectInfo.getProjectStatus()))
        {
            throw new ServicesException(IDiMengResultCode.Finance.PROJECT_NOT_EXIST);
        }
        //无订单修改项目信息时先验证此时项目是否已有订单
        if (DigitalAndStringConstant.StringConstant.TWO.equals(req.getIsOrdered())
            && projectInfo.getRaisedAmount().compareTo(new BigDecimal(0)) > 0)
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.PROJECT_INFO_ERRORUPDATE);
        }
        //有订单时修改项目，防止恶意修改项目信息
        if (DigitalAndStringConstant.StringConstant.ONE.equals(req.getIsOrdered()))
        {
            req.setProjectName(null);
            req.setProjectIntro(null);
            req.setProjectDetails(null);
            req.setImagesIds(null);
            req.setCoverImageId(null);
            req.setCoverImageUrl(null);
        }
        
        Date now = new Date();
        Date dateCreate = projectInfo.getDateCreate();
        projectInfo = new TProjectInfo();
        projectInfo = (TProjectInfo)DimengBeanUtil.copyProperties(TProjectInfo.class, req);
        //更新项目操作人、更新时间、筹资期限截止日期以及项目图片
        projectInfo = updateTProjectInfo(projectInfo, req.getImagesIds(), userInfo.getUserId(), dateCreate);
        //更新项目
        BaseDataResp resp = updateProject(projectInfo);
        
        //项目已有订单时修改项目,生成更新项目动态(资金修改原因)
        if (DigitalAndStringConstant.StringConstant.ONE.equals(req.getIsOrdered()))
        {
            TProjectDynamic projectDynamic = new TProjectDynamic();
            projectDynamic.setDynamicId(UUIDGenerate.generateShortUuid());
            projectDynamic.setProjectId(projectInfo.getProjectId());
            projectDynamic.setDateCreate(now);
            projectDynamic.setDynamicInfo("修改了项目信息。修改原因：" + req.getModifyReason());
            //项目动态类型：1发布新项目；2支持项目；3更新动态；4提前结束项目；5删除项目；6项目修改(有订单时修改公益项目)
            projectDynamic.setDynamicType(ProjectDynamicTypeEnum.XMXG.getDataBaseVal());
            //操作人及昵称
            projectDynamic.setCreator(userInfo.getUserId());
            if (baseDao.insert(projectDynamic) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
        }
        
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertReturnProject(InsertReturnProjectReq req)
        throws Exception
    {
        //拉黑或锁定用户不能发起项目
        FrontUserInfo frontUser = LoginCache.getFrontUserInfo();
        if (DigitalAndStringConstant.StringConstant.TWO.equals(frontUser.getUserStatus())
            || DigitalAndStringConstant.StringConstant.THREE.equals(frontUser.getUserStatus()))
        {
            throw new ServicesException(IDiMengResultCode.CpProjectManage.USER_IS_BLACK);
        }
        //设置项目ID
        String projectId = UUIDGenerate.generateShortUuid();
        req.setProjectId(projectId);
        //设置项目类型：1大病救助；2灾难救助；3动物保护；4扶贫助学；5其他；6回报项目；7梦想项目
        req.setProjectType(ProjectTypeEnum.HBXM.getDbvalue().toString());
        
        //新增项目回报
        if (req.getReturnList() != null && req.getReturnList().size() > 0)
        {
            FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
            Date now = new Date();
            TProjectReturn projectReturn = null;
            for (ProjectReturnReq projectReturnReq : req.getReturnList())
            {
                projectReturn = new TProjectReturn();
                projectReturn = (TProjectReturn)DimengBeanUtil.copyProperties(TProjectReturn.class, projectReturnReq);
                projectReturn.setReturnId(UUIDGenerate.generateShortUuid());
                projectReturn.setProjectId(projectId);
                projectReturn.setCreateId(userInfo.getUserId());
                projectReturn.setUpdateId(userInfo.getUserId());
                projectReturn.setDateCreate(now);
                projectReturn.setDateUpdate(now);
                projectReturn.setSurplusCount(projectReturn.getUpperCount());
                if (baseDao.insert(projectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
                }
            }
        }
        
        return commonTProjectInfo(req, req.getImagesIds());
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings({"unchecked"})
    @Override
    public BaseDataResp updateReturnProject(UpdateReturnProjectReq req)
        throws Exception
    {
        TProjectInfo projectInfo = findProject(req.getProjectId());
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        //判断项目是否属于该用户
        if (!userInfo.getUserId().equals(projectInfo.getProjectCreatorId()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
        }
        //判断项目是否存在
        if (!ProjectStatusEnum.ZCZ.getDbvalue().toString().equals(projectInfo.getProjectStatus()))
        {
            throw new ServicesException(IDiMengResultCode.Finance.PROJECT_NOT_EXIST);
        }
        //无订单修改项目信息时先验证此时项目是否已有订单
        if (DigitalAndStringConstant.StringConstant.TWO.equals(req.getIsOrdered())
            && projectInfo.getRaisedAmount().compareTo(new BigDecimal(0)) > 0)
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.PROJECT_INFO_ERRORUPDATE);
        }
        //有订单时修改项目，防止恶意修改项目信息
        if (DigitalAndStringConstant.StringConstant.ONE.equals(req.getIsOrdered()))
        {
            req.setProjectName(null);
            req.setProjectIntro(null);
            req.setIsNeddAddr(null);
            req.setProjectDetails(null);
            req.setImagesIds(null);
            req.setCoverImageId(null);
            req.setCoverImageUrl(null);
        }
        
        Date now = new Date();
        //更新项目回报
        if (req.getReturnList() != null && req.getReturnList().size() > 0)
        {
            TProjectReturn projectReturn = null;
            if (DigitalAndStringConstant.StringConstant.ONE.equals(req.getIsOrdered()))
            {
                //有订单时，直接新增项目回报
                for (ProjectReturnReq projectReturnReq : req.getReturnList())
                {
                    if (!StringUtil.isEmpty(projectReturnReq.getReturnId()))
                    {
                        continue;
                    }
                    projectReturn = new TProjectReturn();
                    projectReturn =
                        (TProjectReturn)DimengBeanUtil.copyProperties(TProjectReturn.class, projectReturnReq);
                    projectReturn.setReturnId(UUIDGenerate.generateShortUuid());
                    projectReturn.setProjectId(projectInfo.getProjectId());
                    projectReturn.setCreateId(userInfo.getUserId());
                    projectReturn.setUpdateId(userInfo.getUserId());
                    projectReturn.setDateCreate(now);
                    projectReturn.setDateUpdate(now);
                    projectReturn.setSurplusCount(projectReturn.getUpperCount());
                    if (baseDao.insert(projectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                    {
                        throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
                    }
                }
            }
            else
            {
                //无订单时
                ProjectReturnReq returnReq = new ProjectReturnReq();
                returnReq.setProjectId(projectInfo.getProjectId());
                QueryEvent<ProjectReturnReq> event = new QueryEvent<ProjectReturnReq>();
                event.setObj(returnReq);
                event.setStatement("findTProjectReturnList");
                List<TProjectReturn> projectReturnList = baseDao.findAllIsPageByCustom(event);
                //删除回报
                if (projectReturnList != null && projectReturnList.size() > 0)
                {
                    boolean isExist;
                    TSystemFiles files;
                    File file;
                    String path =
                        (new StringBuilder()).append(FrameworkConfigurer.getProperties("fileStore.home"))
                            .toString()
                            .replace("fileStore", "");
                    for (TProjectReturn tProjectReturn : projectReturnList)
                    {
                        isExist = true;
                        for (ProjectReturnReq projectReturnReq : req.getReturnList())
                        {
                            if (!StringUtil.isEmpty(projectReturnReq.getReturnId())
                                && tProjectReturn.getReturnId().equals(projectReturnReq.getReturnId()))
                            {
                                isExist = false;
                                //修改前后回报图片不一致删除之前图片
                                if (!tProjectReturn.getImageId().equals(projectReturnReq.getImageId()))
                                {
                                    files = new TSystemFiles();
                                    files.setFileId(tProjectReturn.getImageId());
                                    baseDao.delete(files);
                                    file = new File(path + tProjectReturn.getImageUrl());
                                    file.setWritable(true);
                                    file.delete();
                                }
                                break;
                            }
                        }
                        if (isExist)
                        {
                            //删除回报图片
                            files = new TSystemFiles();
                            files.setFileId(tProjectReturn.getImageId());
                            baseDao.delete(files);
                            file = new File(path + tProjectReturn.getImageUrl());
                            file.setWritable(true);
                            file.delete();
                            
                            //删除回报
                            if (baseDao.delete(tProjectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                            {
                                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_DETELE);
                            }
                        }
                    }
                }
                //新增和更新回报
                for (ProjectReturnReq projectReturnReq : req.getReturnList())
                {
                    projectReturn = new TProjectReturn();
                    projectReturn =
                        (TProjectReturn)DimengBeanUtil.copyProperties(TProjectReturn.class, projectReturnReq);
                    projectReturn.setProjectId(projectInfo.getProjectId());
                    projectReturn.setUpdateId(userInfo.getUserId());
                    projectReturn.setDateUpdate(now);
                    projectReturn.setSurplusCount(projectReturn.getUpperCount());
                    if (StringUtil.isEmpty(projectReturn.getReturnId()))
                    {
                        //新增项目回报
                        projectReturn.setReturnId(UUIDGenerate.generateShortUuid());
                        projectReturn.setCreateId(userInfo.getUserId());
                        projectReturn.setDateCreate(now);
                        if (baseDao.insert(projectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                        {
                            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
                        }
                    }
                    else
                    {
                        //更新项目回报
                        if (baseDao.update(projectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                        {
                            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                        }
                    }
                }
            }
        }
        
        Date dateCreate = projectInfo.getDateCreate();
        projectInfo = new TProjectInfo();
        projectInfo = (TProjectInfo)DimengBeanUtil.copyProperties(TProjectInfo.class, req);
        //更新项目操作人、更新时间、筹资期限截止日期以及项目图片
        projectInfo = updateTProjectInfo(projectInfo, req.getImagesIds(), userInfo.getUserId(), dateCreate);
        //更新项目
        BaseDataResp resp = updateProject(projectInfo);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertDreamProject(InsertDreamProjectReq req)
        throws Exception
    {
        //拉黑或锁定用户不能发起项目
        FrontUserInfo frontUser = LoginCache.getFrontUserInfo();
        if (DigitalAndStringConstant.StringConstant.TWO.equals(frontUser.getUserStatus())
            || DigitalAndStringConstant.StringConstant.THREE.equals(frontUser.getUserStatus()))
        {
            throw new ServicesException(IDiMengResultCode.CpProjectManage.USER_IS_BLACK);
        }
        BigDecimal targetAmount = new BigDecimal(0);
        //设置项目ID
        String projectId = UUIDGenerate.generateShortUuid();
        req.setProjectId(projectId);
        //设置项目类型：1大病救助；2灾难救助；3动物保护；4扶贫助学；5其他；6回报项目；7梦想项目
        req.setProjectType(ProjectTypeEnum.MXXM.getDbvalue().toString());
        
        //新增项目梦想目标
        if (req.getTargetList() != null && req.getTargetList().size() > 0)
        {
            FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
            Date now = new Date();
            TProjectReturn projectReturn = null;
            for (ProjectReturnReq projectReturnReq : req.getTargetList())
            {
                projectReturn = new TProjectReturn();
                projectReturn = (TProjectReturn)DimengBeanUtil.copyProperties(TProjectReturn.class, projectReturnReq);
                projectReturn.setUpperCount(null);
                projectReturn.setImageId(null);
                projectReturn.setImageUrl(null);
                projectReturn.setReturnId(UUIDGenerate.generateShortUuid());
                projectReturn.setProjectId(projectId);
                projectReturn.setCreateId(userInfo.getUserId());
                projectReturn.setUpdateId(userInfo.getUserId());
                projectReturn.setDateCreate(now);
                projectReturn.setDateUpdate(now);
                projectReturn.setSurplusCount(Integer.parseInt(projectReturnReq.getSupportAmount()));
                if (baseDao.insert(projectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
                }
                
                //计算目标金额
                targetAmount = targetAmount.add(projectReturn.getSupportAmount());
            }
        }
        
        req.setTargetAmount(targetAmount.toString());
        return commonTProjectInfo(req, req.getImagesIds());
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateDreamProject(UpdateDreamProjectReq req)
        throws Exception
    {
        TProjectInfo projectInfo = findProject(req.getProjectId());
        BigDecimal targetAmount = projectInfo.getTargetAmount();
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        //判断项目是否属于该用户
        if (!userInfo.getUserId().equals(projectInfo.getProjectCreatorId()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
        }
        //判断项目是否存在
        if (!ProjectStatusEnum.ZCZ.getDbvalue().toString().equals(projectInfo.getProjectStatus()))
        {
            throw new ServicesException(IDiMengResultCode.Finance.PROJECT_NOT_EXIST);
        }
        //无订单修改项目信息时先验证此时项目是否已有订单
        if (DigitalAndStringConstant.StringConstant.TWO.equals(req.getIsOrdered())
            && projectInfo.getRaisedAmount().compareTo(new BigDecimal(0)) > 0)
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.PROJECT_INFO_ERRORUPDATE);
        }
        //有订单时修改项目，防止恶意修改项目信息
        if (DigitalAndStringConstant.StringConstant.ONE.equals(req.getIsOrdered()))
        {
            req.setProjectName(null);
            req.setProjectIntro(null);
            req.setIsNeddAddr(null);
            req.setProjectDetails(null);
            req.setImagesIds(null);
            req.setCoverImageId(null);
            req.setCoverImageUrl(null);
        }
        
        Date now = new Date();
        //更新项目梦想目标
        if (req.getTargetList() != null && req.getTargetList().size() > 0)
        {
            TProjectReturn projectReturn = null;
            if (DigitalAndStringConstant.StringConstant.ONE.equals(req.getIsOrdered()))
            {
                //有订单时，直接新增项目梦想目标
                for (ProjectReturnReq projectReturnReq : req.getTargetList())
                {
                    if (!StringUtil.isEmpty(projectReturnReq.getReturnId()))
                    {
                        continue;
                    }
                    projectReturn = new TProjectReturn();
                    projectReturn =
                        (TProjectReturn)DimengBeanUtil.copyProperties(TProjectReturn.class, projectReturnReq);
                    projectReturn.setUpperCount(null);
                    projectReturn.setImageId(null);
                    projectReturn.setImageUrl(null);
                    projectReturn.setReturnId(UUIDGenerate.generateShortUuid());
                    projectReturn.setProjectId(projectInfo.getProjectId());
                    projectReturn.setCreateId(userInfo.getUserId());
                    projectReturn.setUpdateId(userInfo.getUserId());
                    projectReturn.setDateCreate(now);
                    projectReturn.setDateUpdate(now);
                    projectReturn.setSurplusCount(Integer.parseInt(projectReturnReq.getSupportAmount()));
                    if (baseDao.insert(projectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                    {
                        throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
                    }
                    
                    //计算目标金额
                    targetAmount = targetAmount.add(projectReturn.getSupportAmount());
                }
            }
            else
            {
                //无订单时
                targetAmount = new BigDecimal(0);
                ProjectReturnReq returnReq = new ProjectReturnReq();
                returnReq.setProjectId(projectInfo.getProjectId());
                QueryEvent<ProjectReturnReq> event = new QueryEvent<ProjectReturnReq>();
                event.setObj(returnReq);
                event.setStatement("findTProjectReturnList");
                List<TProjectReturn> projectReturnList = baseDao.findAllIsPageByCustom(event);
                //删除项目梦想目标
                if (projectReturnList != null && projectReturnList.size() > 0)
                {
                    boolean isExist;
                    for (TProjectReturn tProjectReturn : projectReturnList)
                    {
                        isExist = true;
                        for (ProjectReturnReq projectReturnReq : req.getTargetList())
                        {
                            if (!StringUtil.isEmpty(projectReturnReq.getReturnId())
                                && tProjectReturn.getReturnId().equals(projectReturnReq.getReturnId()))
                            {
                                isExist = false;
                                break;
                            }
                        }
                        if (isExist)
                        {
                            //删除项目梦想目标
                            if (baseDao.delete(tProjectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                            {
                                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_DETELE);
                            }
                        }
                    }
                }
                //新增和更新项目梦想目标
                for (ProjectReturnReq projectReturnReq : req.getTargetList())
                {
                    projectReturn = new TProjectReturn();
                    projectReturn =
                        (TProjectReturn)DimengBeanUtil.copyProperties(TProjectReturn.class, projectReturnReq);
                    projectReturn.setUpperCount(null);
                    projectReturn.setImageId(null);
                    projectReturn.setImageUrl(null);
                    projectReturn.setProjectId(projectInfo.getProjectId());
                    projectReturn.setUpdateId(userInfo.getUserId());
                    projectReturn.setDateUpdate(now);
                    projectReturn.setSurplusCount(Integer.parseInt(projectReturnReq.getSupportAmount()));
                    if (StringUtil.isEmpty(projectReturn.getReturnId()))
                    {
                        //新增项目梦想目标
                        projectReturn.setReturnId(UUIDGenerate.generateShortUuid());
                        projectReturn.setCreateId(userInfo.getUserId());
                        projectReturn.setDateCreate(now);
                        if (baseDao.insert(projectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                        {
                            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
                        }
                    }
                    else
                    {
                        //更新项目梦想目标
                        if (baseDao.update(projectReturn) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                        {
                            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                        }
                    }
                    
                    //计算目标金额
                    targetAmount = targetAmount.add(projectReturn.getSupportAmount());
                }
            }
        }
        
        Date dateCreate = projectInfo.getDateCreate();
        projectInfo = new TProjectInfo();
        projectInfo = (TProjectInfo)DimengBeanUtil.copyProperties(TProjectInfo.class, req);
        projectInfo.setTargetAmount(targetAmount);
        //更新项目操作人、更新时间、筹资期限截止日期以及项目图片
        projectInfo = updateTProjectInfo(projectInfo, req.getImagesIds(), userInfo.getUserId(), dateCreate);
        //更新项目
        BaseDataResp resp = updateProject(projectInfo);
        return resp;
    }
    
    /**
     * 项目新增公共接口
     * <功能详细描述>
     * @param req
     * @param imagesIds
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public BaseDataResp commonTProjectInfo(Object req, String[] imagesIds)
        throws Exception
    {
        TProjectInfo projectInfo = (TProjectInfo)DimengBeanUtil.copyProperties(TProjectInfo.class, req);
        projectInfo.setProjectId(projectInfo.getProjectId());
        //处理富文本内图片路径
        projectInfo = handleProDetail(projectInfo);
        //设置项目编号
        projectInfo.setProjectNo(getProjectNo(req));
        //设置发起人
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        projectInfo.setProjectCreatorId(userInfo.getUserId());
        //创建时间
        Date now = new Date();
        projectInfo.setDateCreate(now);
        //设置项目状态
        projectInfo.setProjectStatus(String.valueOf(ProjectStatusEnum.ZCZ.getDbvalue()));
        //生成项目详情二维码
        projectInfo.setQrCodeAddr(getQRCodeAddr(projectInfo.getProjectId()));
        //更新项目操作人、更新时间、筹资期限截止日期以及项目图片
        projectInfo = updateTProjectInfo(projectInfo, imagesIds, userInfo.getUserId(), now);
        //新增项目
        BaseDataResp resp = insertProject(projectInfo);
        
        //生成发起项目动态
        TProjectDynamic projectDynamic = new TProjectDynamic();
        projectDynamic.setDynamicId(UUIDGenerate.generateShortUuid());
        projectDynamic.setProjectId(projectInfo.getProjectId());
        projectDynamic.setDateCreate(now);
        //项目动态类型：1发布新项目；2支持项目；3更新动态；4提前结束项目；5删除项目；6项目修改(有订单时修改公益项目)
        projectDynamic.setDynamicType(ProjectDynamicTypeEnum.FBXXM.getDataBaseVal());
        //项目动态内容
        projectDynamic.setDynamicInfo("发布新项目");
        //操作人及昵称
        projectDynamic.setCreator(userInfo.getUserId());
        if (baseDao.insert(projectDynamic) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        
        Map<String, Object> data = new HashMap<String, Object>();
        //项目ID
        data.put(CommonConstant.JSON_KEY_SINGLE_RESULT, projectInfo.getProjectId());
        resp.setData(data);
        return resp;
    }
    
    /**
     * 项目操作人、更新时间、筹资期限截止日期及项目图片公共更新方法
     * <功能详细描述>
     * @param projectInfo
     * @param imagesIds
     * @param modifyId
     * @param dateUpdate
     * @return
     * @throws ServicesException
     */
    @SuppressWarnings("unchecked")
    public TProjectInfo updateTProjectInfo(TProjectInfo projectInfo, String[] imagesIds, String modifyId,
        Date dateUpdate)
        throws ServicesException
    {
        //处理富文本内图片路径
        projectInfo = handleProDetail(projectInfo);
        //操作人及更新时间
        projectInfo.setModifyId(modifyId);
        projectInfo.setDateUpdate(dateUpdate);
        //筹资期限截止日期
        Integer days = Integer.parseInt(projectInfo.getFinancingDays());
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(dateUpdate);
        calendar.add(Calendar.DAY_OF_YEAR, days);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        calendar.set(Calendar.MILLISECOND, 0);
        projectInfo.setDateRaisedEnd(calendar.getTime());
        //项目标签处理
        if (!StringUtil.isEmpty(projectInfo.getProjectLabel()))
        {
            if (!projectInfo.getProjectLabel().startsWith(","))
            {
                projectInfo.setProjectLabel("," + projectInfo.getProjectLabel());
            }
            if (!projectInfo.getProjectLabel().endsWith(","))
            {
                projectInfo.setProjectLabel(projectInfo.getProjectLabel() + ",");
            }
        }
        //更新项目图片
        if (imagesIds != null && imagesIds.length > 0)
        {
            //查询修改前的项目
            ProjectAttachmentReq req = new ProjectAttachmentReq();
            req.setAssociatedId(projectInfo.getProjectId());
            req.setType(ProjectAttachmentTypeEnum.PROJECT_IMGS.getDataBaseVal());
            QueryEvent<ProjectAttachmentReq> event = new QueryEvent<ProjectAttachmentReq>();
            event.setObj(req);
            event.setStatement("findProjectAttachmentList");
            List<ProjectAttachmentResp> imgList = baseDao.findAllIsPageByCustom(event);
            if (imgList != null && imgList.size() > 0)
            {
                boolean flag;
                TProjectAttachment tmp;
                File file;
                String path =
                    (new StringBuilder()).append(FrameworkConfigurer.getProperties("fileStore.home"))
                        .toString()
                        .replace("fileStore", "");
                //删除要删除的图片
                for (ProjectAttachmentResp resp : imgList)
                {
                    flag = true;
                    for (String imageId : imagesIds)
                    {
                        if (resp.getFileId().equals(imageId))
                        {
                            flag = false;
                            break;
                        }
                    }
                    if (flag)
                    {
                        //删除图片
                        tmp = new TProjectAttachment();
                        tmp.setFileId(resp.getFileId());
                        baseDao.delete(tmp);
                        file = new File(path + resp.getAddr());
                        file.setWritable(true);
                        file.delete();
                    }
                }
            }
            
            TProjectAttachment attachment = null;
            for (String imageId : imagesIds)
            {
                attachment = new TProjectAttachment();
                attachment.setFileId(imageId);
                attachment.setAssociatedId(projectInfo.getProjectId());
                if (baseDao.update(attachment) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
        }
        return projectInfo;
    }
    
    /**
     * 处理项目详情中图片url
     * <功能详细描述>
     * @param projectInfo
     * @return
     */
    private TProjectInfo handleProDetail(TProjectInfo projectInfo)
    {
        if (projectInfo != null && !StringUtil.isEmpty(projectInfo.getProjectDetails()))
        {
            String path =
                (new StringBuffer()).append(SystemCache.getProperty(SystemVariable.PLATFORM_ADDR))
                    .append("/fileStore/")
                    .toString();
            String projectDetails = projectInfo.getProjectDetails();
            projectDetails = projectDetails.replaceAll("src=\"/fileStore/", "src=\"" + path);
            projectInfo.setProjectDetails(projectDetails);
        }
        return projectInfo;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonFinish(ProjectBasicReq req)
        throws Exception
    {
        Map<String, Object> data = new HashMap<String, Object>();
        TProjectInfo projectInfo = findProject_FU(req.getProjectId());
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        //判断项目是否属于该用户
        if (!userInfo.getUserId().equals(projectInfo.getProjectCreatorId()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
        }
        //判断项目是否存在
        if (!ProjectStatusEnum.ZCZ.getDbvalue().toString().equals(projectInfo.getProjectStatus()))
        {
            throw new ServicesException(IDiMengResultCode.Finance.PROJECT_NOT_EXIST);
        }
        //判断项目是否已验证
        if (!isValidProject(req.getProjectId()))
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.PROJECT_VALID_ERRORUPDATE);
        }
        //判断筹集金额是否为零
        if (projectInfo.getRaisedAmount().compareTo(new BigDecimal(0)) < 1)
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.ERROR_RAISED_AMOUNT_ZERO);
        }
        
        //生成发起项目动态
        TProjectDynamic projectDynamic = new TProjectDynamic();
        projectDynamic.setDynamicId(UUIDGenerate.generateShortUuid());
        projectDynamic.setProjectId(req.getProjectId());
        Date now = new Date();
        projectDynamic.setDateCreate(now);
        //项目动态类型：1发布新项目；2支持项目；3更新动态；4提前结束项目；5删除项目；6项目修改(有订单时修改公益项目)
        projectDynamic.setDynamicType(ProjectDynamicTypeEnum.TQJSXM.getDataBaseVal());
        //操作人及昵称
        projectDynamic.setCreator(userInfo.getUserId());
        //动态内容
        projectDynamic.setDynamicInfo(req.getFinishReason());
        if (baseDao.insert(projectDynamic) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        
        //更新待支付订单的状态为已取消
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setProjectId(projectInfo.getProjectId());
        if ((Integer)baseDao.executeSQL("update", "updateOrderToFail", orderSupport) < DigitalAndStringConstant.DigitalConstant.ZERO)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        
        //从首页项目推荐列表删除项目
        Map<String, String> deleteParams = new HashMap<String, String>();
        deleteParams.put("projectId", req.getProjectId());
        baseDao.executeSQL("delete", "deleteByProjectId", deleteParams);
        
        String status = "1";
        //回报项目且还未全部发货
        if (ProjectTypeEnum.HBXM.getDataBaseVal().equals(projectInfo.getProjectType())
            && !isAllOrderSend(req.getProjectId()))
        {
            updateFrozenAmount(userInfo.getUserId(),
                projectInfo.getProjectId(),
                projectInfo.getProjectType(),
                projectInfo.getRaisedAmount());
            status = "2";
        }
        else
        {
            updateAvailableAmount(userInfo.getUserId(),
                projectInfo.getProjectId(),
                projectInfo.getProjectType(),
                projectInfo.getRaisedAmount());
        }
        
        //设置项目状态
        projectInfo.setProjectStatus(ProjectStatusEnum.ZCCG.getDataBaseVal());
        //设置项目成功时间
        projectInfo.setDateSuccess(now);
        if (baseDao.update(projectInfo) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        
        BaseDataResp resp = new BaseDataResp();
        //从缓存中获得站点信息
        TSiteInfo siteInfo = (TSiteInfo)systemCache.get(SystemConstant.CacheKey.SITE_INFO).getObjectValue();
        //查询用户电话号码
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userId", projectInfo.getProjectCreatorId());
        List<String> phone = (List<String>)baseDao.executeSQL("select", "findUserPhoneByUserId", params);
        //发送短信
        String[] pars = new String[] {siteInfo.getSiteName(), projectInfo.getProjectName()};
        msgService.sendSms("0", TemplateTypeEnumEasy.CROW_SUCCESS.dataBaseVal, pars, phone.get(0));
        
        data.put(CommonConstant.JSON_KEY_SINGLE_RESULT, status);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @Override
    public BaseDataResp findMyInitProjectList(FindProjectBaseReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FindProjectBaseReq> event = new QueryEvent<FindProjectBaseReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(true);
        event.setStatement("findMyInitProjectList");
        event.setObj(req);
        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, baseDao.findAllIsPageByCustom(event)));
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @Override
    public BaseDataResp findCollectionList(FindCollectionListReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FindCollectionListReq> event = new QueryEvent<FindCollectionListReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(true);
        event.setStatement("findMyCollectionList");
        event.setObj(req);
        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, baseDao.findAllIsPageByCustom(event)));
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertCollection(IdReq req)
        throws Exception
    {
        TProjectFavorites projectFavorites =
            (TProjectFavorites)DimengBeanUtil.copyProperties(TProjectFavorites.class, req);
        projectFavorites.setProjectId(req.getId());
        
        //查询是否已经关注
        QueryEvent<TProjectFavorites> event = new QueryEvent<TProjectFavorites>();
        event.setObj(projectFavorites);
        event.setStatement("findProFavoriteCount");
        Integer count = (Integer)baseDao.findOneByCustom(event);
        if (count > 0)
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USER_IS_COC);
        }
        
        if (baseDao.insert(projectFavorites) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @Override
    public BaseDataResp deleteCollection(IdReq req)
        throws Exception
    {
        TProjectFavorites projectFavorites =
            (TProjectFavorites)DimengBeanUtil.copyProperties(TProjectFavorites.class, req);
        projectFavorites.setProjectId(req.getId());
        if ((int)baseDao.executeSQL("delete", "deleteProjectFavorite", projectFavorites) < DigitalAndStringConstant.DigitalConstant.ZERO)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_DETELE);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertDynamic(InsertProjectDynamicReq req)
        throws Exception
    {
        QueryEvent<IdReq> event = new QueryEvent<IdReq>();
        event.setStatement("findExsitProjectInfo");
        IdReq idReq = new IdReq();
        idReq.setId(req.getProjectId());
        event.setObj(idReq);
        TProjectInfo projectInfo = (TProjectInfo)baseDao.findOneByCustom(event);
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        //判断项目是否属于该用户
        if (!userInfo.getUserId().equals(projectInfo.getProjectCreatorId()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
        }
        //判断项目是否存在
        if (ProjectStatusEnum.YSC.getDbvalue().toString().equals(projectInfo.getProjectStatus()))
        {
            throw new ServicesException(IDiMengResultCode.Finance.PROJECT_NOT_EXIST);
        }
        TProjectDynamic projectDynamic = (TProjectDynamic)DimengBeanUtil.copyProperties(TProjectDynamic.class, req);
        String dynamicId = UUIDGenerate.generateShortUuid();
        projectDynamic.setDynamicId(dynamicId);
        projectDynamic.setDateCreate(new Date());
        projectDynamic.setDynamicType(ProjectDynamicTypeEnum.GXDT.getDataBaseVal());
        projectDynamic.setCreator(userInfo.getUserId());
        if (baseDao.insert(projectDynamic) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        
        //更新项目动态图片
        if (req.getImgsIds() != null && req.getImgsIds().length > 0)
        {
            TProjectAttachment attachment = null;
            for (String imageId : req.getImgsIds())
            {
                attachment = new TProjectAttachment();
                attachment.setFileId(imageId);
                attachment.setAssociatedId(dynamicId);
                if (baseDao.update(attachment) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
        }
        
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findProjectStatus(IdReq req)
        throws Exception
    {
        Object object = baseDao.executeSQL("select", "findProjectStatus", req);
        if (object == null)
        {
            throw new ServicesException(IDiMengResultCode.SiteManage.ERROR_PROJECT_BCZ);
        }
        List<Object> objects = (List<Object>)object;
        if (objects.size() == 0)
        {
            throw new ServicesException(IDiMengResultCode.SiteManage.ERROR_PROJECT_BCZ);
        }
        String projectStatus = (String)objects.get(0);
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, projectStatus);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findProjectTitle(IdReq req)
        throws Exception
    {
        Object object = baseDao.executeSQL("select", "findProjectTitle", req);
        if (object == null)
        {
            throw new ServicesException(IDiMengResultCode.SiteManage.ERROR_PROJECT_BCZ);
        }
        List<Object> objects = (List<Object>)object;
        if (objects.size() == 0)
        {
            throw new ServicesException(IDiMengResultCode.SiteManage.ERROR_PROJECT_BCZ);
        }
        String projectStatus = (String)objects.get(0);
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, projectStatus);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findExsitProjectInfo(IdReq req)
        throws Exception
    {
        QueryEvent<IdReq> event = new QueryEvent<IdReq>();
        event.setStatement("findExsitProjectInfo");
        event.setObj(req);
        TProjectInfo projectInfo = (TProjectInfo)baseDao.findOneByCustom(event);
        if (projectInfo == null)
        {
            throw new ServicesException(IDiMengResultCode.SiteManage.ERROR_PROJECT_BCZ);
        }
        if (!projectInfo.getProjectCreatorId().equals(req.getUserId()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
}
