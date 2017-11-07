/*
 * 文 件 名:  WithdrawSetController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月27日
 */
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
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.domain.BaseResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.model.bus.DynamicListReq;
import com.dimeng.model.bus.FindProjectListReq;
import com.dimeng.model.bus.FindUserCommentReq;
import com.dimeng.model.bus.InsertUserCommentReq;
import com.dimeng.model.bus.ProjectDetailsReq;
import com.dimeng.model.bus.RecommendProReq;
import com.dimeng.model.common.IdPageReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.modules.bus.services.IProjectService;
import com.dimeng.utils.LoginCache;

/**
 * 项目管理controller
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月29日]
 */
@RequestMapping(value = "project/query")
@Controller
public class ProjectController extends BaseController
{
    
    @Autowired
    IProjectService projectService;
    
    /**
     * 项目管理-查询项目列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     */
    @RequestMapping(value = "/{v}/projectList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findProjectList(HttpEntity<FindProjectListReq> httpEntity)
    {
        return projectService.findProjectList(httpEntity.getBody());
    }
    
    /**
     *后台-业务管理-项目管理-查看项目-查看-项目详情
     * <功能详细描述>
     * @param httpEntity
     * @return
     */
    @RequestMapping(value = "/{v}/projectDetails", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object projectDetails(HttpEntity<ProjectDetailsReq> httpEntity)
    {
        return projectService.getProjectDetails(httpEntity.getBody());
    }
    
    /**
     * 后台-业务管理-项目管理-查看项目-查看-项目内容
     * <功能详细描述>
     * @param httpEntity
     * @return
     */
    @RequestMapping(value = "/{v}/projectContent", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object projectContent(HttpEntity<ProjectDetailsReq> httpEntity)
    {
        return projectService.getProjectContent(httpEntity.getBody());
    }
    
    /**
     * 后台-业务管理-项目管理-查看项目-查看-回报记录
     * <功能详细描述>
     * @param httpEntity
     * @return
     */
    @RequestMapping(value = "/{v}/returnTargetList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object returnTargetList(HttpEntity<IdPageReq> httpEntity)
    {
        BaseResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectService.findProjectReturnList(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 前台查询项目动态列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     */
    @RequestMapping(value = "/{v}/dynamic", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object dynamic(HttpEntity<DynamicListReq> httpEntity)
    {
        return projectService.getProjectDynamicList(httpEntity.getBody());
    }
    
    /**
     * 前台查询评论留言列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/{v}/commentList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findUserCommentList(HttpEntity<FindUserCommentReq> httpEntity)
        throws Exception
    {
        return projectService.findUserCommentList(httpEntity.getBody());
    }
    
    /**
     * 前台评论回复
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/{v}/insertComment", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object insertComment(HttpEntity<InsertUserCommentReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectService.insertComment(httpEntity.getBody());
        }
        return resp;
    }
    
    /*******推荐项目管理**********/
    /**
     * 站点管理-查询项目列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     */
    @RequestMapping(value = "/{v}/recommendProList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findRecommendProList(HttpEntity<FindProjectListReq> httpEntity)
    {
        return projectService.findRecommendProList(httpEntity.getBody());
    }
    
    /**
     * 站点管理-推荐项目 
     * @param httpEntity
     * @return
     * @throws ServicesException 
     */
    @RequestMapping(value = "/{v}/recommendPro", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object recommendPro(HttpEntity<RecommendProReq> httpEntity)
        throws ServicesException
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectService.commonRecommendPro(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 站点管理-修改推荐项目 
     * @param httpEntity
     * @return
     * @throws ServicesException 
     */
    @RequestMapping(value = "/{v}/updRecommendPro", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object updRecommendPro(HttpEntity<RecommendProReq> httpEntity)
        throws ServicesException
    {
        return projectService.updateRecommendPro(httpEntity.getBody());
    }
    
    /**
     * 站点管理-查询项目推荐信息
     * @param httpEntity
     * @return
     */
    @RequestMapping(value = "/{v}/findrecommendInfo", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findrecommendInfo(HttpEntity<RecommendProReq> httpEntity)
    {
        return projectService.findrecommendInfo(httpEntity.getBody());
    }
    
    /**
     * 查询回报项目所有回报金额
     * @param httpEntity
     * @return
     */
    @RequestMapping(value = "/{v}/returnAmtList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object returnAmtList(HttpEntity<IdReq> httpEntity)
    {
        BaseResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectService.returnAmtList(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 查询梦想或回报列表
     * @param httpEntity
     * @return
     */
    @RequestMapping(value = "/{v}/findReturnOrDreamList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findProjectReturnOrDreamList(HttpEntity<IdReq> httpEntity)
    {
        BaseResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectService.findProjectReturnOrDreamList(httpEntity.getBody());
        }
        return resp;
    }
}
