package com.dimeng.modules.bus.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.model.bus.DynamicListReq;
import com.dimeng.model.bus.FindProListByUserIdReq;
import com.dimeng.model.bus.FindProjectListReq;
import com.dimeng.model.bus.FindUserCommentReq;
import com.dimeng.model.bus.InsertUserCommentReq;
import com.dimeng.model.bus.ProjectDetailsReq;
import com.dimeng.model.bus.RecommendProReq;
import com.dimeng.model.common.IdPageReq;
import com.dimeng.model.common.IdReq;

/**
 * 项目业务类
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月30日]
 */
public interface IProjectService
{
    /**
     * 后台-业务管理-项目管理-项目列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findProjectList(FindProjectListReq req);
    
    /**
     * 查询项目详情
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp getProjectDetails(ProjectDetailsReq req);
    
    /**
     * 查询项目内容
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp getProjectContent(ProjectDetailsReq req);
    
    /**
     * 查询项目汇报列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findProjectReturnList(IdPageReq req);
    
    /**
     * 查询项目动态
     * 前台查询项目动态列表
     * @param req
     * @return
     */
    public BaseDataResp getProjectDynamicList(DynamicListReq req);
    
    /**
     * 前台查询评论留言列表
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findUserCommentList(FindUserCommentReq req)
        throws Exception;
    
    /**
     * 评论回复
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp insertComment(InsertUserCommentReq req)
        throws Exception;
    
    /**
     *  用户管理-个人信息-我发起的项目
     * @param req
     * @return
     */
    public BaseDataResp findInitiateProList(FindProListByUserIdReq req);
    
    /*********推荐项目管理***************/
    /**
     * 后台-站点管理-项目推荐管理-项目列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findRecommendProList(FindProjectListReq req);
    
    /**
     * 后台-站点管理-项目推荐管理-推荐项目
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp commonRecommendPro(RecommendProReq req)
        throws ServicesException;
    
    /**
     * 后台-站点管理-项目推荐管理-修改推荐
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp updateRecommendPro(RecommendProReq req)
        throws ServicesException;
    
    /**
     * 后台-站点管理-项目推荐管理-查看推荐详情
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findrecommendInfo(RecommendProReq req);
    
    /**
     * 后台-业务管理-项目管理-项目列表-回报项目订单管理-回报金额列表
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp returnAmtList(IdReq req);
    
    /**
     * 查询项目回报、梦想列表（包含已支持人次）
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findProjectReturnOrDreamList(IdReq req);
}
