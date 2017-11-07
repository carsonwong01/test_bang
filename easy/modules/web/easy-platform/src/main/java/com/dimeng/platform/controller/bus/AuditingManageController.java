package com.dimeng.platform.controller.bus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.domain.BaseResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.model.bus.CommonVerificateAuditReq;
import com.dimeng.model.bus.DeleteCommentReq;
import com.dimeng.model.bus.DeleteDynamicsReq;
import com.dimeng.model.bus.FindAuthenRecordReq;
import com.dimeng.model.bus.FindCommentListReq;
import com.dimeng.model.bus.FindDynamicsListReq;
import com.dimeng.model.bus.FindInformantDetailListReq;
import com.dimeng.model.bus.FindInformantListReq;
import com.dimeng.model.bus.FindProjectAuditListReq;
import com.dimeng.model.common.IdPageReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.modules.bus.services.IAuditingManageService;
import com.dimeng.utils.LoginCache;

/**
 * 审核操作类
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月9日]
 */
@Controller
@RequestMapping("bus/auditingManage")
public class AuditingManageController extends BaseController
{
    @Autowired
    IAuditingManageService auditingManageService;
    
    /**
     *后台-业务管理-审核管理-项目验证审核-列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @RequestMapping(value = "/{v}/findProjectAuditList ", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object updateProjectStatus(HttpEntity<FindProjectAuditListReq> httpEntity)
        throws ServicesException
    {
        return auditingManageService.findProjectAuditList(httpEntity.getBody());
    }
    
    /**
     * 后台-业务管理-审核管理-项目动态管理-列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @RequestMapping(value = "/{v}/findDynamicsList ", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findDynamicsList(HttpEntity<FindDynamicsListReq> httpEntity)
        throws ServicesException
    {
        return auditingManageService.findDynamicsList(httpEntity.getBody());
    }
    
    /**
     * 后台-业务管理-审核管理-项目动态管理-详情
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @RequestMapping(value = "/{v}/findDynamicsDetails", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findDynamicsDetails(HttpEntity<IdPageReq> httpEntity)
    {
        BaseResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = auditingManageService.findDynamicsDetails(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 审核管理-删除项目动态
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @RequestMapping(value = "/{v}/deleteDynamics", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object deleteDynamics(HttpEntity<DeleteDynamicsReq> httpEntity)
        throws ServicesException
    {
        BaseResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = auditingManageService.deleteDynamics(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 后台-业务管理-审核管理-评论管理-列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @RequestMapping(value = "/{v}/findCommentList ", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findCommentList(HttpEntity<FindCommentListReq> httpEntity)
        throws ServicesException
    {
        return auditingManageService.findCommentList(httpEntity.getBody());
    }
    
    /**
     * 后台-业务管理-审核管理-评论管理-删除记录
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @RequestMapping(value = "/{v}/deleteComment", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object deleteComment(HttpEntity<DeleteCommentReq> httpEntity)
        throws ServicesException
    {
        return auditingManageService.deleteComment(httpEntity.getBody());
    }
    
    /**
     * 审核管理-查询评论详情列表
     * 前后台共用
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @RequestMapping(value = "/{v}/findCommentDetailList ", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findCommentDetailList(HttpEntity<IdReq> httpEntity)
        throws ServicesException
    {
        BaseResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = auditingManageService.findCommentDetailList(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 审核管理-查询举报列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @RequestMapping(value = "/{v}/findInformantList ", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findInformantList(HttpEntity<FindInformantListReq> httpEntity)
        throws ServicesException
    {
        return auditingManageService.findInformantList(httpEntity.getBody());
    }
    
    /**
     * 审核管理-查询举报详情列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @RequestMapping(value = "/{v}/findInformantDetailList ", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findInformantDetailList(HttpEntity<FindInformantDetailListReq> httpEntity)
        throws ServicesException
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = auditingManageService.findInformantDetailList(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 审核管理-查询举报内容
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @RequestMapping(value = "/{v}/findInformantContent ", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findInformantContent(HttpEntity<IdReq> httpEntity)
        throws ServicesException
    {
        BaseResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = auditingManageService.findInformantContent(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 查询验证审核记录:前后台公用
     * 后台-业务管理-审核管理-项目验证审核-验证详情-审核记录列表
     * @param httpEntity
     * @return
     */
    @RequestMapping(value = "/{v}/authenticatedRecord", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object authenticatedRecord(HttpEntity<FindAuthenRecordReq> httpEntity)
    {
        BaseResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = auditingManageService.authenticatedRecord(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 后台-业务管理-审核管理-项目验证审核-验证详情-审核操作
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/{v}/commonVerificateAudit", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object commonVerificateAudit(HttpEntity<CommonVerificateAuditReq> httpEntity)
        throws Exception
    {
        CommonVerificateAuditReq req = httpEntity.getBody();
        req.setUserId(LoginCache.getConsoleUserInfo().getUserId());
        BaseResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = auditingManageService.commonVerificateAudit(httpEntity.getBody());
        }
        return resp;
    }
    
}
