/*
 * 文 件 名:  ProjectBasicSetController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月28日
 */
package com.dimeng.platform.controller.expand;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.user.ConsoleUserInfo;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.FindProjectBasicSetReq;
import com.dimeng.model.expand.ImgModelReq;
import com.dimeng.model.expand.ProjectLabelReq;
import com.dimeng.modules.expand.services.IProjectBasicSetService;
import com.dimeng.utils.LoginCache;

/**
 * 运营管理基本设置controller
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月28日]
 */
@RequestMapping(value = "operation/basicInfoSet")
@Controller
public class ProjectBasicSetController extends BaseController
{
    
    @Autowired
    IProjectBasicSetService projectBasicSetService;
    
    /**
     * 项目标签查询
     * <功能详细描述>
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findLabelList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findLabelList(HttpEntity<FindProjectBasicSetReq> httpEntity)
        throws Exception
    {
        return projectBasicSetService.findLabelList(httpEntity.getBody());
    }
    
    /**
     * 某项目类型下所有项目标签
     * <功能详细描述>
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findLabels", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findLabels(HttpEntity<ProjectLabelReq> httpEntity)
        throws Exception
    {
        return projectBasicSetService.findLabels(httpEntity.getBody());
    }
    
    /**
     * 新增项目标签
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/insertLabel", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object insertLabel(HttpEntity<ProjectLabelReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        ConsoleUserInfo userInfo = LoginCache.getConsoleUserInfo();
        httpEntity.getBody().setCreateId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicSetService.insertLabel(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 删除项目标签
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/deleteLabel", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object deleteLabel(HttpEntity<ProjectLabelReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            projectBasicSetService.deleteLabel(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 图片模板列表查询
     * <功能详细描述>
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findImgModel", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findImgModel(HttpEntity<ImgModelReq> httpEntity)
        throws Exception
    {
        return projectBasicSetService.findImgModel(httpEntity.getBody());
    }
    
    /**
     * 修改图片模板
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/commonImgModel", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object updateLabel(HttpEntity<ImgModelReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        ConsoleUserInfo userInfo = LoginCache.getConsoleUserInfo();
        httpEntity.getBody().setOperatorId(userInfo.getUserId());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectBasicSetService.commonImgModel(httpEntity.getBody());
        }
        return resp;
    }
    
}
