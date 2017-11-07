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
import com.dimeng.enums.ProjectStatusEnum;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.domain.BaseResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.bus.ChangeProjectStatusReq;
import com.dimeng.model.bus.GetProjectReasonReq;
import com.dimeng.model.bus.InformReq;
import com.dimeng.model.bus.UpdateProjectShieldStatusReq;
import com.dimeng.model.pay.OrderPayReq;
import com.dimeng.modules.bus.services.IBusinessManageService;
import com.dimeng.modules.finance.services.IPayService;
import com.dimeng.utils.LoginCache;

/**
 * （前后台公用）项目管理-操作项目类
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月9日]
 */
@Controller
@RequestMapping("project/operate")
public class ProjectOperateController extends BaseController
{
    @Autowired
    IBusinessManageService businessManageService;
    
    @Autowired
    IPayService payService;
    
    /**
     * 后台-业务管理-项目管理-取消/删除
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/{v}/updateStatus ", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object updateProjectStatus(HttpEntity<ChangeProjectStatusReq> httpEntity)
        throws Exception
    {
        BaseResp resp = null;
        ChangeProjectStatusReq req = httpEntity.getBody();
        if (StringUtil.isEmpty(req.getReason()))
        {
            resp = new BaseResp();
            resp.setCode(IDiMengResultCode.Commons.ERROR_PARAMETER);
            return resp;
        }
        req.setUserId(LoginCache.getConsoleUserInfo().getUserName());
        resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = businessManageService.updateProjectStatus(req);
        }
        return resp;
    }
    
    /**
     * 前台-我的项目项目-删除
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/{v}/delete", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object delete(HttpEntity<ChangeProjectStatusReq> httpEntity)
        throws Exception
    {
        ChangeProjectStatusReq req = httpEntity.getBody();
        req.setProjectStatus(ProjectStatusEnum.YSC.getDataBaseVal());
        req.setUserId(LoginCache.getFrontUserInfo().getUserName());
        req.setReason(null);
        BaseResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = businessManageService.updateProjectStatus(req);
        }
        return resp;
    }
    
    /**
     * 后台-业务管理-项目管理-失败原因
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @RequestMapping(value = "/{v}/operateReason ", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object operateReason(HttpEntity<GetProjectReasonReq> httpEntity)
        throws ServicesException
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = businessManageService.getOperateReason(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 支持下单
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Throwable 
     */
    @RequestMapping(value = "{v}/support", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object addOrderSupport(HttpEntity<OrderPayReq> httpEntity)
        throws Throwable
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = payService.invokeService(httpEntity.getBody());
        }
        return resp;
    }
    
    @RequestMapping(value = "/{v}/inform", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object commonInform(HttpEntity<InformReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            httpEntity.getBody().setUserId(LoginCache.getFrontUserInfo().getUserId());
            resp = businessManageService.commonInform(httpEntity.getBody());
        }
        return resp;
    }
    
    @RequestMapping(value = "/{v}/updateProjectShieldStatus", method = RequestMethod.POST, produces = {
        "application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object updateProjectShieldStatus(HttpEntity<UpdateProjectShieldStatusReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = businessManageService.commonUpdateProjectShieldStatus(httpEntity.getBody());
        }
        return resp;
    }
}
