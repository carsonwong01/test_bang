/*
 * 文 件 名:  ProjectValidationServiceImpl.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月12日
 */
package com.dimeng.modules.bus.services.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.bus.FindProAuthenStatuResp;
import com.dimeng.entity.ext.bus.FindProjectValidationResp;
import com.dimeng.entity.ext.bus.ProjectAttachmentResp;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.entity.table.project.TProjectAttachment;
import com.dimeng.entity.table.project.TProjectInfo;
import com.dimeng.entity.table.project.TProjectValidation;
import com.dimeng.enums.AuditStatusEnum;
import com.dimeng.enums.ProjectAttachmentTypeEnum;
import com.dimeng.enums.ProjectStatusEnum;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.framework.utils.FrameworkConfigurer;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.bus.FindProjectValidationReq;
import com.dimeng.model.bus.ProjectAttachmentReq;
import com.dimeng.model.bus.ProjectValidationReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.modules.bus.services.IProjectValidationService;
import com.dimeng.utils.Base64Decoder;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.UUIDGenerate;

/**
 * 项目验证接口实现
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月12日]
 */
@Service
public class ProjectValidationServiceImpl extends BaseServiceImpl implements IProjectValidationService
{
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonProAuthenticated(ProjectValidationReq req)
        throws Exception
    {
        //同时存在收款人和受助人身份证，判断两者不能相同
        if (!StringUtil.isEmpty(req.getReceiveIdCard()) && !StringUtil.isEmpty(req.getRecipient())
            && req.getReceiveIdCard().equals(req.getRecipient()))
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.ERROR_IDCARD_SAME);
        }
        TProjectInfo projectInfo = new TProjectInfo();
        //项目验证id存在，设置项目id
        if (!StringUtil.isEmpty(req.getValidationId()))
        {
            TProjectValidation validation = new TProjectValidation();
            validation.setValidationId(req.getValidationId());
            validation = (TProjectValidation)baseDao.findById(validation);
            if (validation != null)
            {
                req.setProjectId(validation.getProjectId());
            }
        }
        projectInfo.setProjectId(req.getProjectId());
        projectInfo = (TProjectInfo)baseDao.findById(projectInfo);
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        //判断项目是否属于该用户
        if (!userInfo.getUserId().equals(projectInfo.getProjectCreatorId()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
        }
        //判断项目是否存在或者是否还处于众筹中
        if (projectInfo == null || !ProjectStatusEnum.ZCZ.getDataBaseVal().equals(projectInfo.getProjectStatus()))
        {
            throw new ServicesException(IDiMengResultCode.Finance.PROJECT_NOT_EXIST);
        }
        
        IdReq idReq = new IdReq();
        idReq.setId(req.getProjectId());
        QueryEvent<IdReq> event = new QueryEvent<IdReq>();
        event.setObj(idReq);
        event.setStatement("findProAuthenStatu");
        FindProAuthenStatuResp statuResp = (FindProAuthenStatuResp)baseDao.findOneByCustom(event);
        if (statuResp != null
            && (AuditStatusEnum.DSH.getDataBaseVal().equals(statuResp.getStatus()) || AuditStatusEnum.SHTG.getDataBaseVal()
                .equals(statuResp.getStatus())))
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.ERROR_PROJECT_VALIDATION);
        }
        
        //解析身份证号
        String receiveIdCard = req.getReceiveIdCard();
        String recipient = req.getRecipient();
        if (!StringUtil.isEmpty(receiveIdCard))
        {
            receiveIdCard = Base64Decoder.decode(receiveIdCard);
            //身份证号处理加*号
            req.setReceiveIdCard2(new StringBuffer(receiveIdCard.substring(0, 3)).append("*** *** ***")
                .append(receiveIdCard.substring(receiveIdCard.length() - 2, receiveIdCard.length()))
                .toString());
        }
        if (!StringUtil.isEmpty(recipient))
        {
            recipient = Base64Decoder.decode(recipient);
            //身份证号处理加*号
            req.setRecipientIdCard(new StringBuffer(recipient.substring(0, 3)).append("*** *** ***")
                .append(recipient.substring(recipient.length() - 2, recipient.length()))
                .toString());
        }
        //项目验证ID
        String validationId =
            StringUtil.isEmpty(req.getValidationId()) ? UUIDGenerate.generateShortUuid() : req.getValidationId();
        TProjectAttachment attachment = null;
        
        //项目验证id存在，需删除要删除的图片附件后再进行图片附件关联
        if (!StringUtil.isEmpty(req.getValidationId()))
        {
            boolean isExist;
            TProjectAttachment tmp;
            File file;
            String path =
                (new StringBuilder()).append(FrameworkConfigurer.getProperties("fileStore.home"))
                    .toString()
                    .replace("fileStore", "");
            
            //查询项目验证附件
            ProjectAttachmentReq projectAttachmentReq = new ProjectAttachmentReq();
            projectAttachmentReq.setAssociatedId(req.getValidationId());
            projectAttachmentReq.setType(ProjectAttachmentTypeEnum.PROJECT_RECEIVECARD.getDataBaseVal());
            QueryEvent<ProjectAttachmentReq> attachmentEvent = new QueryEvent<ProjectAttachmentReq>();
            attachmentEvent.setObj(projectAttachmentReq);
            attachmentEvent.setStatement("findValidationImages");
            List<ProjectAttachmentResp> list = baseDao.findAllIsPageByCustom(attachmentEvent);
            for (ProjectAttachmentResp projectAttachmentResp : list)
            {
                //收款人身份证图片
                if (req.getReceiveCardImageIds() != null && req.getReceiveCardImageIds().length > 0)
                {
                    isExist = true;
                    for (String imageId : req.getReceiveCardImageIds())
                    {
                        if (projectAttachmentResp.getFileId().equals(imageId))
                        {
                            isExist = false;
                            break;
                        }
                    }
                    if (isExist)
                    {
                        //删除图片
                        tmp = new TProjectAttachment();
                        tmp.setFileId(projectAttachmentResp.getFileId());
                        baseDao.delete(tmp);
                        file = new File(path + projectAttachmentResp.getAddr());
                        file.setWritable(true);
                        file.delete();
                    }
                }
            }
            projectAttachmentReq.setType(ProjectAttachmentTypeEnum.PROJECT_RECIPIENTCARD.getDataBaseVal());
            attachmentEvent.setObj(projectAttachmentReq);
            list = baseDao.findAllIsPageByCustom(attachmentEvent);
            for (ProjectAttachmentResp projectAttachmentResp : list)
            {
                //受助人身份证图片
                if (req.getRecipientCardImageIds() != null && req.getRecipientCardImageIds().length > 0)
                {
                    isExist = true;
                    for (String imageId : req.getRecipientCardImageIds())
                    {
                        if (projectAttachmentResp.getFileId().equals(imageId))
                        {
                            isExist = false;
                            break;
                        }
                    }
                    if (isExist)
                    {
                        //删除图片
                        tmp = new TProjectAttachment();
                        tmp.setFileId(projectAttachmentResp.getFileId());
                        baseDao.delete(tmp);
                        file = new File(path + projectAttachmentResp.getAddr());
                        file.setWritable(true);
                        file.delete();
                    }
                }
            }
            projectAttachmentReq.setType(ProjectAttachmentTypeEnum.MEDICAL_CERTIFICATE.getDataBaseVal());
            attachmentEvent.setObj(projectAttachmentReq);
            list = baseDao.findAllIsPageByCustom(attachmentEvent);
            for (ProjectAttachmentResp projectAttachmentResp : list)
            {
                //医疗诊断证明图片
                if (req.getProveImgIds() != null && req.getProveImgIds().length > 0)
                {
                    isExist = true;
                    for (String imageId : req.getProveImgIds())
                    {
                        if (projectAttachmentResp.getFileId().equals(imageId))
                        {
                            isExist = false;
                            break;
                        }
                    }
                    if (isExist)
                    {
                        //删除图片
                        tmp = new TProjectAttachment();
                        tmp.setFileId(projectAttachmentResp.getFileId());
                        baseDao.delete(tmp);
                        file = new File(path + projectAttachmentResp.getAddr());
                        file.setWritable(true);
                        file.delete();
                    }
                }
            }
            projectAttachmentReq.setType(ProjectAttachmentTypeEnum.ACCOUNT_PHOTO.getDataBaseVal());
            attachmentEvent.setObj(projectAttachmentReq);
            list = baseDao.findAllIsPageByCustom(attachmentEvent);
            for (ProjectAttachmentResp projectAttachmentResp : list)
            {
                //户口本图片
                if (req.getAccountBookImgIds() != null && req.getAccountBookImgIds().length > 0)
                {
                    isExist = true;
                    for (String imageId : req.getAccountBookImgIds())
                    {
                        if (projectAttachmentResp.getFileId().equals(imageId))
                        {
                            isExist = false;
                            break;
                        }
                    }
                    if (isExist)
                    {
                        //删除图片
                        tmp = new TProjectAttachment();
                        tmp.setFileId(projectAttachmentResp.getFileId());
                        baseDao.delete(tmp);
                        file = new File(path + projectAttachmentResp.getAddr());
                        file.setWritable(true);
                        file.delete();
                    }
                }
            }
            projectAttachmentReq.setType(ProjectAttachmentTypeEnum.PROOF_USER_FUNDS.getDataBaseVal());
            attachmentEvent.setObj(projectAttachmentReq);
            list = baseDao.findAllIsPageByCustom(attachmentEvent);
            for (ProjectAttachmentResp projectAttachmentResp : list)
            {
                //资金用途证明图片
                if (req.getUseProveImgIds() != null && req.getUseProveImgIds().length > 0)
                {
                    isExist = true;
                    for (String imageId : req.getUseProveImgIds())
                    {
                        if (projectAttachmentResp.getFileId().equals(imageId))
                        {
                            isExist = false;
                            break;
                        }
                    }
                    if (isExist)
                    {
                        //删除图片
                        tmp = new TProjectAttachment();
                        tmp.setFileId(projectAttachmentResp.getFileId());
                        baseDao.delete(tmp);
                        file = new File(path + projectAttachmentResp.getAddr());
                        file.setWritable(true);
                        file.delete();
                    }
                }
            }
            projectAttachmentReq.setType(ProjectAttachmentTypeEnum.PROJECT_RELATED_CER_MATERIAL.getDataBaseVal());
            attachmentEvent.setObj(projectAttachmentReq);
            list = baseDao.findAllIsPageByCustom(attachmentEvent);
            for (ProjectAttachmentResp projectAttachmentResp : list)
            {
                //项目相关证明图片
                if (req.getProjectProveImgIds() != null && req.getProjectProveImgIds().length > 0)
                {
                    isExist = true;
                    for (String imageId : req.getProjectProveImgIds())
                    {
                        if (projectAttachmentResp.getFileId().equals(imageId))
                        {
                            isExist = false;
                            break;
                        }
                    }
                    if (isExist)
                    {
                        //删除图片
                        tmp = new TProjectAttachment();
                        tmp.setFileId(projectAttachmentResp.getFileId());
                        baseDao.delete(tmp);
                        file = new File(path + projectAttachmentResp.getAddr());
                        file.setWritable(true);
                        file.delete();
                    }
                }
            }
        }
        
        //更新收款人身份证图片
        if (req.getReceiveCardImageIds() != null && req.getReceiveCardImageIds().length > 0)
        {
            for (String imageId : req.getReceiveCardImageIds())
            {
                attachment = new TProjectAttachment();
                attachment.setFileId(imageId);
                attachment.setAssociatedId(validationId);
                if (baseDao.update(attachment) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
        }
        //更新受助人身份证图片
        if (req.getRecipientCardImageIds() != null && req.getRecipientCardImageIds().length > 0)
        {
            for (String imageId : req.getRecipientCardImageIds())
            {
                attachment = new TProjectAttachment();
                attachment.setFileId(imageId);
                attachment.setAssociatedId(validationId);
                if (baseDao.update(attachment) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
        }
        //更新医疗诊断证明图片
        if (req.getProveImgIds() != null && req.getProveImgIds().length > 0)
        {
            for (String imageId : req.getProveImgIds())
            {
                attachment = new TProjectAttachment();
                attachment.setFileId(imageId);
                attachment.setAssociatedId(validationId);
                if (baseDao.update(attachment) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
        }
        //更新户口本图片
        if (req.getAccountBookImgIds() != null && req.getAccountBookImgIds().length > 0)
        {
            for (String imageId : req.getAccountBookImgIds())
            {
                attachment = new TProjectAttachment();
                attachment.setFileId(imageId);
                attachment.setAssociatedId(validationId);
                if (baseDao.update(attachment) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
        }
        //更新资金用途证明图片
        if (req.getUseProveImgIds() != null && req.getUseProveImgIds().length > 0)
        {
            for (String imageId : req.getUseProveImgIds())
            {
                attachment = new TProjectAttachment();
                attachment.setFileId(imageId);
                attachment.setAssociatedId(validationId);
                if (baseDao.update(attachment) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
        }
        //更新项目相关证明图片
        if (req.getProjectProveImgIds() != null && req.getProjectProveImgIds().length > 0)
        {
            for (String imageId : req.getProjectProveImgIds())
            {
                attachment = new TProjectAttachment();
                attachment.setFileId(imageId);
                attachment.setAssociatedId(validationId);
                if (baseDao.update(attachment) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
        }
        
        //新增/更新项目验证信息
        TProjectValidation projectValidation =
            (TProjectValidation)DimengBeanUtil.copyProperties(TProjectValidation.class, req);
        projectValidation.setAuditStatus(AuditStatusEnum.DSH.getDataBaseVal());
        Date now = new Date();
        projectValidation.setDateUpdate(now);
        if (StringUtil.isEmpty(req.getValidationId()))
        {
            //项目验证ID不存在，新增项目验证
            projectValidation.setValidationId(validationId);
            projectValidation.setDateCreate(now);
            if (baseDao.insert(projectValidation) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
        }
        else
        {
            //项目验证ID存在，更新项目验证
            if (baseDao.update(projectValidation) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
            }
        }
        
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findProAuthenticated(FindProjectValidationReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        //查询项目验证信息
        QueryEvent<FindProjectValidationReq> event = new QueryEvent<FindProjectValidationReq>();
        event.setObj(req);
        event.setStatement("findProjectValidate");
        FindProjectValidationResp projectValidationResp = (FindProjectValidationResp)baseDao.findOneByCustom(event);
        if (projectValidationResp == null)
        {
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            return resp;
        }
        String receiveIdCard = projectValidationResp.getReceiveIdCard();
        projectValidationResp.setReceiveIdCard(StringUtil.isEmpty(receiveIdCard) ? ""
            : Base64Decoder.decode(receiveIdCard));
        String recipient = projectValidationResp.getRecipient();
        projectValidationResp.setRecipient(StringUtil.isEmpty(recipient) ? "" : Base64Decoder.decode(recipient));
        data.put(CommonConstant.JSON_KEY_SINGLE_RESULT, projectValidationResp);
        //图片集合
        List<ProjectAttachmentResp> proveImgIds = new ArrayList<>(0);
        List<ProjectAttachmentResp> accountBookImgIds = new ArrayList<>(0);
        List<ProjectAttachmentResp> useProveImgIds = new ArrayList<>(0);
        List<ProjectAttachmentResp> projectProveImgIds = new ArrayList<>(0);
        List<ProjectAttachmentResp> projectReceiveCardImgIds = new ArrayList<>(0);
        List<ProjectAttachmentResp> projectRecipientCardImgIds = new ArrayList<>(0);
        //查询项目验证附件
        if (projectValidationResp != null && !StringUtil.isEmpty(projectValidationResp.getValidationId()))
        {
            ProjectAttachmentReq projectAttachmentReq = new ProjectAttachmentReq();
            projectAttachmentReq.setAssociatedId(projectValidationResp.getValidationId());
            QueryEvent<ProjectAttachmentReq> attachmentEvent = new QueryEvent<ProjectAttachmentReq>();
            attachmentEvent.setObj(projectAttachmentReq);
            attachmentEvent.setStatement("findValidationImages");
            List<ProjectAttachmentResp> list = baseDao.findAllIsPageByCustom(attachmentEvent);
            if (list != null && list.size() > 0)
            {
                for (ProjectAttachmentResp projectAttachmentResp : list)
                {
                    if (ProjectAttachmentTypeEnum.MEDICAL_CERTIFICATE.getDataBaseVal()
                        .equals(projectAttachmentResp.getType()))
                    {
                        proveImgIds.add(projectAttachmentResp);
                    }
                    if (ProjectAttachmentTypeEnum.ACCOUNT_PHOTO.getDataBaseVal()
                        .equals(projectAttachmentResp.getType()))
                    {
                        accountBookImgIds.add(projectAttachmentResp);
                    }
                    if (ProjectAttachmentTypeEnum.PROOF_USER_FUNDS.getDataBaseVal()
                        .equals(projectAttachmentResp.getType()))
                    {
                        useProveImgIds.add(projectAttachmentResp);
                    }
                    if (ProjectAttachmentTypeEnum.PROJECT_RELATED_CER_MATERIAL.getDataBaseVal()
                        .equals(projectAttachmentResp.getType()))
                    {
                        projectProveImgIds.add(projectAttachmentResp);
                    }
                    if (ProjectAttachmentTypeEnum.PROJECT_RECEIVECARD.getDataBaseVal()
                        .equals(projectAttachmentResp.getType()))
                    {
                        projectReceiveCardImgIds.add(projectAttachmentResp);
                    }
                    if (ProjectAttachmentTypeEnum.PROJECT_RECIPIENTCARD.getDataBaseVal()
                        .equals(projectAttachmentResp.getType()))
                    {
                        projectRecipientCardImgIds.add(projectAttachmentResp);
                    }
                }
            }
        }
        //医疗诊断证明图片集合
        data.put("proveImgIds", proveImgIds);
        //户口本图片集合
        data.put("accountBookImgIds", accountBookImgIds);
        //资金用途证明图片集合
        data.put("useProveImgIds", useProveImgIds);
        //项目相关证明图片集合
        data.put("projectProveImgIds", projectProveImgIds);
        //收款人身份证图片集合
        data.put("receiveCardImageIds", projectReceiveCardImgIds);
        //受助人身份证图片集合
        data.put("recipientCardImageIds", projectRecipientCardImgIds);
        
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findProAuthenStatu(IdReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        //查询项目验证状态
        QueryEvent<IdReq> event = new QueryEvent<IdReq>();
        event.setObj(req);
        event.setStatement("findProAuthenStatu");
        FindProAuthenStatuResp statuResp = (FindProAuthenStatuResp)baseDao.findOneByCustom(event);
        if (statuResp == null)
        {
            statuResp = new FindProAuthenStatuResp();
            statuResp.setStatus(DigitalAndStringConstant.StringConstant.ZERO);
        }
        data.put(CommonConstant.JSON_KEY_SINGLE_RESULT, statuResp);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
}
