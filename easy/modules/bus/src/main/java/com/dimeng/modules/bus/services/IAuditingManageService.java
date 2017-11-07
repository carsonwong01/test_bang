package com.dimeng.modules.bus.services;

import com.dimeng.framework.domain.BaseDataResp;
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

/**
 * 审核管理业务
 * 项目审核、评论审核、动态审核、举报审核
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月9日]
 */
public interface IAuditingManageService
{
    /**
     * 查看项目审核列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findProjectAuditList(FindProjectAuditListReq req);
    
    /**
     * 审核管理-项目动态列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findDynamicsList(FindDynamicsListReq req);
    
    /**
     * 后台-业务管理-审核管理-项目动态管理-详情
     * 后台的所有项目动态详情共用
     * @param req
     * @return
     */
    public BaseDataResp findDynamicsDetails(IdPageReq req);
    
    /**
     * 审核管理-删除项目动态
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException 
     */
    public BaseDataResp deleteDynamics(DeleteDynamicsReq req)
        throws ServicesException;
    
    /**
     * 后台-业务管理-审核管理-评论管理-列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findCommentList(FindCommentListReq req);
    
    /**
     * 删除评论
     * 根据评论id或订单id删除评论
     * @param req
     * @return
     * @throws ServicesException 
     */
    public BaseDataResp deleteComment(DeleteCommentReq req)
        throws ServicesException;
    
    /**
     * 审核管理-查询评论详情列表
     * 前后端共用
     * @param req
     * @return
     */
    public BaseDataResp findCommentDetailList(IdReq req);
    
    /**
     * 审核管理-查询举报列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findInformantList(FindInformantListReq req);
    
    /**
     * 审核管理-查询举报详情列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findInformantDetailList(FindInformantDetailListReq req);
    
    /**
     * 审核管理-查询举报内容
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findInformantContent(IdReq req);
    
    /**
     * 验证审核记录
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp authenticatedRecord(FindAuthenRecordReq req);
    
    /**
     * 审核管理-项目验证审核
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException 
     * @throws Exception 
     */
    public BaseDataResp commonVerificateAudit(CommonVerificateAuditReq req)
        throws ServicesException, Exception;
    
}
