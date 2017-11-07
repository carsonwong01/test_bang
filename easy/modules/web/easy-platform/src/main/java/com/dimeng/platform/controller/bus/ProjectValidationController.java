/*
 * 文 件 名:  ProjectValidationController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月12日
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
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.bus.FindProjectValidationReq;
import com.dimeng.model.bus.ProjectValidationReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.modules.bus.services.IProjectValidationService;

/**
 * 项目验证controller
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月12日]
 */
@RequestMapping("project/validate")
@Controller
public class ProjectValidationController extends BaseController
{
    
    @Autowired
    private IProjectValidationService projectValidationService;
    
    /**
     * 项目验证/修改项目验证信息
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/proAuthenticated", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object commonProAuthenticated(HttpEntity<ProjectValidationReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectValidationService.commonProAuthenticated(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 项目验证详情
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/proAuthenticatedDetail", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findProAuthenticated(HttpEntity<FindProjectValidationReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectValidationService.findProAuthenticated(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 项目验证状态
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/isProAuthenticated", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object isProAuthenticated(HttpEntity<IdReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectValidationService.findProAuthenStatu(httpEntity.getBody());
        }
        return resp;
    }
    
}
