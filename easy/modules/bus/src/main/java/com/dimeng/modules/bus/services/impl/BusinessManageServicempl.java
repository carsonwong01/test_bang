package com.dimeng.modules.bus.services.impl;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.bus.GetProjectReasonResp;
import com.dimeng.entity.table.order.TOrderSupport;
import com.dimeng.entity.table.project.TProjectAttachment;
import com.dimeng.entity.table.project.TProjectDynamic;
import com.dimeng.entity.table.project.TProjectInfo;
import com.dimeng.entity.table.project.TProjectReport;
import com.dimeng.entity.table.site.TSiteInfo;
import com.dimeng.enums.*;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.constants.DigitalAndStringConstant.DigitalConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.bus.ChangeProjectStatusReq;
import com.dimeng.model.bus.GetProjectReasonReq;
import com.dimeng.model.bus.InformReq;
import com.dimeng.model.bus.UpdateProjectShieldStatusReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.modules.bus.services.IBusinessManageService;
import com.dimeng.modules.message.services.IMessageService;
import com.dimeng.util.SerialNumberUtil;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.UUIDGenerate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 项目业务操作类
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月8日]
 */
@Service
public class BusinessManageServicempl extends BaseServiceImpl implements IBusinessManageService
{
    @Resource
    private IMessageService msgService;
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateProjectStatus(ChangeProjectStatusReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        TOrderSupport tOrderSupport = new TOrderSupport();
        TProjectDynamic tProjectDynamic = new TProjectDynamic();
        
        TProjectInfo projectInfo = findProjectInfo(req.getProjectId());
        if (!ProjectStatusEnum.ZCZ.getDataBaseVal().equals(projectInfo.getProjectStatus()))
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.ERROR_PROJECTSTATUS);
        }
        if (ProjectStatusEnum.YSC.getDataBaseVal().equals(req.getProjectStatus()))
        {
            projectInfo.setOperatorDeleteId(req.getUserId());
            if (StringUtil.notEmpty(req.getReason()))
            {
                projectInfo.setDeleteReason(req.getReason());
            }
            else
            //给默认原因
            {
                projectInfo.setDeleteReason("用户自行删除项目");
            }
            projectInfo.setDateProjectDelete(DateUtil.getNow());
            //订单退款状态
            tOrderSupport.setRefundType(RefundTypeEnum.XMSCTK.dataBaseVal);
            tOrderSupport.setRefundReason(RefundTypeEnum.XMSCTK.descr);
            //删除项目动态类型
            tProjectDynamic.setDynamicType(ProjectDynamicTypeEnum.SCXM.dataBaseVal);
        }
        else if (ProjectStatusEnum.ZCSB.getDataBaseVal().equals(req.getProjectStatus()))
        {
            projectInfo.setOperatorFailureId(req.getUserId());
            projectInfo.setFailureReason(req.getReason());
            projectInfo.setDateProjectFailure(DateUtil.getNow());
            //订单退款状态
            tOrderSupport.setRefundType(RefundTypeEnum.ZCSBTK.dataBaseVal);
            tOrderSupport.setRefundReason(RefundTypeEnum.ZCSBTK.descr);
            //众筹失败动态类型
            tProjectDynamic.setDynamicType(ProjectDynamicTypeEnum.ZCSB.dataBaseVal);
        }
        else
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.ERROR_PROJECTSTATUS);
        }
        //更新项目状态
        projectInfo.setProjectStatus(req.getProjectStatus());
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(projectInfo))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        
        Map<String, String> deleteParams = new HashMap<String, String>();
        
        //增加项目动态
        tProjectDynamic.setCreator(projectInfo.getProjectCreatorId());
        tProjectDynamic.setDateCreate(DateUtil.getNow());
        tProjectDynamic.setDynamicId(UUIDGenerate.generateShortUuid());
        tProjectDynamic.setProjectId(req.getProjectId());
        if (StringUtil.isEmpty(req.getReason()))
        {
            //其他用户非法删除其他人项目
            if (!projectInfo.getProjectCreatorId().equals(LoginCache.getFrontUserInfo().getUserId()))
            {
                throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
            }
            tProjectDynamic.setDynamicInfo("用户自行删除项目");
            //取消关注
            deleteParams = new HashMap<String, String>();
            deleteParams.put("projectId", req.getProjectId());
            deleteParams.put("userId", LoginCache.getFrontUserInfo().getUserId());
            deleteParams.put("type", DigitalAndStringConstant.StringConstant.ONE);
            baseDao.executeSQL("delete", "deleteUserFocusProject", deleteParams);
        }
        else
        {
            tProjectDynamic.setDynamicInfo(req.getReason());
        }
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(tProjectDynamic))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        
        //查询项目的所有已支付用户id： 3:已支付\r\n            4:待发货\r\n            5:待收货\r\n            6:已收货\r\n     
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("projectId", projectInfo.getProjectId());
        List<String> supportUserIds =
            (List<String>)baseDao.executeSQL("select", "findProjectSupportUserPhones", params);
        //查询项目创建发起人的电话号码
        params = new HashMap<String, Object>();
        params.put("userId", projectInfo.getProjectCreatorId());
        List<String> phone = (List<String>)baseDao.executeSQL("select", "findUserPhoneByUserId", params);
        
        //更新待支付订单的状态为已取消
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setProjectId(projectInfo.getProjectId());
        if ((Integer)baseDao.executeSQL("update", "updateOrderToFail", orderSupport) < DigitalAndStringConstant.DigitalConstant.ZERO)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        
        //更新订单状态为待退款
        Map<String, String> refundOrderListParams = new HashMap<String, String>();
        refundOrderListParams.put("projectId", req.getProjectId());
        List<String> refundOrderList =
            (List<String>)baseDao.executeSQL("select", "findOrderIdListForUpdate", refundOrderListParams);
        if (refundOrderList != null)
        {
            tOrderSupport.setStatus(PayStatusEnum.DTK.dataBaseVal);
            for (String orderId : refundOrderList)
            {
                tOrderSupport.setOrderId(orderId);
                tOrderSupport.setDateRefund(DateUtil.getNow());
                tOrderSupport.setRefundNo(SerialNumberUtil.buildSn(SerialNumberTypeEnum.TK.getDataBaseVal()));
                if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(tOrderSupport))
                {
                    throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                }
            }
        }
        
        //从首页项目推荐列表删除项目
        deleteParams = new HashMap<String, String>();
        deleteParams.put("projectId", req.getProjectId());
        baseDao.executeSQL("delete", "deleteByProjectId", deleteParams);
        
        //从缓存中获得站点信息
        TSiteInfo siteInfo = (TSiteInfo)systemCache.get(SystemConstant.CacheKey.SITE_INFO).getObjectValue();
        //发送短信
        //取消项目-即项目失败
        if (DigitalAndStringConstant.StringConstant.THREE.equals(req.getProjectStatus()))
        {
            //发给项目发起人
            Object[] pars =
                new String[] {siteInfo.getSiteName(), projectInfo.getProjectName(), siteInfo.getServicePhone()};
            msgService.sendSms("0", TemplateTypeEnumEasy.CROW_FAIL_NOTICE_SPONSOR.dataBaseVal, pars, phone.get(0));
            //发给项目支持人
            if (supportUserIds != null && supportUserIds.size() > 0)
            {
                //多少天后退款天数,不使用常量
                //String maxDays = SystemCache.getProperty(EasySystemVariable.REFUND_AFTER_DAYS);
                pars = new String[] {siteInfo.getSiteName(), projectInfo.getProjectName(), siteInfo.getServicePhone()};
                for (String phoneItem : supportUserIds)
                {
                    msgService.sendSms("0",
                        TemplateTypeEnumEasy.CROW_FAIL_NOTICE_SUPPORTOR.dataBaseVal,
                        pars,
                        phoneItem);
                }
            }
        }
        //项目删除
        else if (DigitalAndStringConstant.StringConstant.FOUR.equals(req.getProjectStatus()))
        {
            
            //取消关注该项目的人的关注
            deleteParams = new HashMap<String, String>();
            deleteParams.put("projectId", req.getProjectId());
            deleteParams.put("type", DigitalAndStringConstant.StringConstant.ONE);
            baseDao.executeSQL("delete", "deleteUserFocusProject", deleteParams);
            
            //发给项目支持人
            if (supportUserIds != null && supportUserIds.size() > 0)
            {
                //多少天后退款天数，不使用常量
                //String maxDays = SystemCache.getProperty(EasySystemVariable.REFUND_AFTER_DAYS);
                Object[] pars =
                    new String[] {siteInfo.getSiteName(), projectInfo.getProjectName(), siteInfo.getServicePhone()};
                for (String phoneItem : supportUserIds)
                {
                    msgService.sendSms("0",
                        TemplateTypeEnumEasy.PROJECT_DELETE_NOTICE_SUPPORTOR.dataBaseVal,
                        pars,
                        phoneItem);
                }
            }
        }
        
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 更新已付款的订单状态为待退款状态
     * <功能详细描述>
     * @param tOrderSupport
     * @return
     * @throws ServicesException 
     */
    @SuppressWarnings("unused")
    private int updateOrderSupportStatus(TOrderSupport tOrderSupport)
        throws ServicesException
    {
        if ((int)baseDao.executeSQL("update", "updateOrderSupportStatus", tOrderSupport) < 0)
        {
            logs.info("更新订单转态为退款状态失败");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        return 1;
    }
    
    /**
     * 查询项目Id查询项目信息
     * <功能详细描述>
     * @return
     * @throws Exception
     */
    @SuppressWarnings({"unchecked", "unused"})
    public TProjectInfo findProjectInfo(String projectId)
        throws ServicesException
    {
        //查询项目信息
        IdReq pbObj = new IdReq();
        pbObj.setId(projectId);
        QueryEvent<IdReq> event = new QueryEvent<IdReq>();
        event.setStatement("findByIdTProjectInfoForUpdate");
        event.setObj(pbObj);
        TProjectInfo projectInfo = (TProjectInfo)baseDao.findOneByCustom(event);
        if (null == pbObj)
        {
            //项目不存在
            throw new ServicesException(IDiMengResultCode.Finance.PROJECT_NOT_EXIST, null);
        }
        return projectInfo;
    }
    
    @Override
    public BaseDataResp getOperateReason(GetProjectReasonReq req)
        throws ServicesException
    {
        QueryEvent<GetProjectReasonReq> event = new QueryEvent<GetProjectReasonReq>();
        event.setStatement("getOperateReason");
        event.setObj(req);
        GetProjectReasonResp projectReasonResp = (GetProjectReasonResp)baseDao.findOneByCustom(event);
        if (null == projectReasonResp)
        {
            projectReasonResp = new GetProjectReasonResp();
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, projectReasonResp);
        BaseDataResp resp = new BaseDataResp();
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonInform(InformReq req)
        throws ServicesException
    {
        QueryEvent event = new QueryEvent();
        event.setStatement("findProjectId");
        event.setObj(req);
        List<TProjectInfo> list = baseDao.findAllIsPageByCustom(event);
        BaseDataResp resp = new BaseDataResp();
        if (null == list || list.size() == 0)
        {
            resp.setCode("000001");
        }else{
            TProjectReport projectReport = new TProjectReport();
            projectReport.setReportId(UUIDGenerate.generateShortUuid());
            projectReport.setProjectId(req.getProjectId());
            projectReport.setDateReport(DateUtil.getNow());
            projectReport.setReportName(req.getName());
            projectReport.setReportPhone(req.getPhone());
            projectReport.setReportReason(req.getContent());
            projectReport.setReportUserId(req.getUserId());
            if (DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.insert(projectReport))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
            //更新附件
            String[] imgIds = req.getImgIds();
            if (imgIds != null && imgIds.length > 0)
            {
                TProjectAttachment projectAttachment = null;
                for (String id : imgIds)
                {
                    if (StringUtil.notEmpty(id))
                    {
                        projectAttachment = new TProjectAttachment();
                        projectAttachment.setFileId(id);
                        projectAttachment.setAssociatedId(projectReport.getReportId());
                        if (DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.update(projectAttachment))
                        {
                            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                        }
                        projectAttachment = null;
                    }
                }
            }
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        }
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonUpdateProjectShieldStatus(UpdateProjectShieldStatusReq req)
        throws ServicesException
    {
        TProjectInfo projectInfo = new TProjectInfo();
        projectInfo.setProjectId(req.getProjectId());
        projectInfo = (TProjectInfo)baseDao.findById(projectInfo);
        if (null == projectInfo)
        {
            //项目不存在
            throw new ServicesException(IDiMengResultCode.Finance.PROJECT_NOT_EXIST, null);
        }
        //非众筹成功、众筹失败项目状态不允许屏蔽操作
        if (!((ProjectStatusEnum.ZCCG.getDataBaseVal().equals(projectInfo.getProjectStatus()) && DigitalAndStringConstant.StringConstant.ONE.equals(req.getSource())) || (ProjectStatusEnum.ZCSB.getDataBaseVal()
            .equals(projectInfo.getProjectStatus()) && DigitalAndStringConstant.StringConstant.TWO.equals(req.getSource()))))
        {
            throw new ServicesException(IDiMengResultCode.ProjectManage.ERROR_PROJECTSTATUS);
        }
        //状态不一样，则更新数据库，状态一样，那么则跳过更新，提示成功
        if (!req.getShiledStatus().equals(projectInfo.getShieldStatus()))
        {
            projectInfo = new TProjectInfo();
            projectInfo.setProjectId(req.getProjectId());
            if (ProjectShieldStatusEnum.YPB.dataBaseVal.equals(req.getShiledStatus()))
            {
                projectInfo.setShieldStatus(ProjectShieldStatusEnum.YPB.dataBaseVal);
            }
            else
            {
                projectInfo.setShieldStatus(ProjectShieldStatusEnum.WPB.dataBaseVal);
            }
            if (DigitalConstant.DATABASE_OP_SUCCESS_INT > baseDao.update(projectInfo))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
            }
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
}
