/*
 * 文 件 名:  ProjectBasicController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月9日
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
import com.dimeng.model.bus.FindCollectionListReq;
import com.dimeng.model.bus.FindProjectBaseReq;
import com.dimeng.model.bus.InsertDreamProjectReq;
import com.dimeng.model.bus.InsertProjectDynamicReq;
import com.dimeng.model.bus.InsertReturnProjectReq;
import com.dimeng.model.bus.InsertWelfareProjectReq;
import com.dimeng.model.bus.ProjectBasicReq;
import com.dimeng.model.bus.UpdateDreamProjectReq;
import com.dimeng.model.bus.UpdateReturnProjectReq;
import com.dimeng.model.bus.UpdateWelfareProjectReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.modules.bus.services.IProjectBasicService;
import com.dimeng.utils.LoginCache;

/**
 * 项目基础业务controller
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月9日]
 */
@RequestMapping("project/operate")
@Controller
public class ProjectBasicController extends BaseController
{
    
    @Autowired
    IProjectBasicService projectBasicService;
    
    /**
     * 发起公益项目
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/initWelfareProject", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object insertWelfareProject(HttpEntity<InsertWelfareProjectReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.insertWelfareProject(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 修改公益项目
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/modifyWelfareProject", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object updateWelfareProject(HttpEntity<UpdateWelfareProjectReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.updateWelfareProject(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 发起回报项目
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/initReturnProject", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object insertReturnProject(HttpEntity<InsertReturnProjectReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.insertReturnProject(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 修改回报项目
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/modifyReturnProject", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object updateReturnProject(HttpEntity<UpdateReturnProjectReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.updateReturnProject(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 发起梦想项目
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/initDreamProject", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object insertDreamProject(HttpEntity<InsertDreamProjectReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.insertDreamProject(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 修改梦想项目
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/modifyDreamProject", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object updateDreamProject(HttpEntity<UpdateDreamProjectReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.updateDreamProject(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 提前结束项目
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/finish", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object commonFinish(HttpEntity<ProjectBasicReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.commonFinish(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 我发起的项目列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/myInitProjectList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findMyInitProjectList(HttpEntity<FindProjectBaseReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.findMyInitProjectList(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 我关注的项目列表
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/collectionList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findCollectionList(HttpEntity<FindCollectionListReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.findCollectionList(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 关注项目
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/collect", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object insertCollection(HttpEntity<IdReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.insertCollection(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 取消关注
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/cancelCollect", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object deleteCollection(HttpEntity<IdReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        httpEntity.getBody().setUserId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.deleteCollection(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 更新项目动态
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/addDynamic", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object insertDynamic(HttpEntity<InsertProjectDynamicReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.insertDynamic(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 查询项目状态
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findProjectStatus", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findProjectStatus(HttpEntity<IdReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.findProjectStatus(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 查询项目标题
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findProjectTitle", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findProjectTitle(HttpEntity<IdReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.findProjectTitle(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 查询项目存在基本信息,判断该项目是否属于当前用户适用
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findExsitProjectInfo", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findExsitProjectInfo(HttpEntity<IdReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicService.findExsitProjectInfo(httpEntity.getBody());
        }
        return resp;
    }
    
}
