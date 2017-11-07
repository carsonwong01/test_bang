package com.dimeng.platform.controller.statistics;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.statistics.FindCommonStatReq; 
import com.dimeng.modules.stat.services.IStatManageService;

/**
 * 统计管理controller
 * @author  song
 * @version  [版本号, 2016年10月9日]
 */
@Controller
@RequestMapping(value = "statistics/statManage")
public class StatManageController extends BaseController
{
    @Autowired
    IStatManageService statManageService;
    
    /**
     * 用户统计
     * @param v
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/userStat", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    @RequiresPermissions(value = {"TJGL_YHTJ_YHTJ_MU", "TJGL_YHTJ_YHTJ_DC"}, logical = Logical.OR)
    public Object findUserStat(@PathVariable
    String v, HttpEntity<FindCommonStatReq> req)
        throws Exception
    {
        return statManageService.findUserStat(req.getBody());
    }
    
    /**
     * 提现统计
     * @param v
     * @param httpEntity
     * @return
     * @throws Exception
     */
    
    @RequestMapping(value = "/{v}/withdrawStat", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    @RequiresPermissions(value = {"TJGL_ZJTJ_TXTJ_MU", "TJGL_ZJTJ_TXTJ_DC"}, logical = Logical.OR)
    public Object findWithdrawStat(@PathVariable
    String v, HttpEntity<FindCommonStatReq> req)
        throws Exception
    {
        return statManageService.findWithdrawStat(req.getBody());
    }
    

    /**
     * 查询平台收益统计
     * <功能详细描述>
     * @param v
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/platformEarningsStat", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findPlatformEarningsStat(@PathVariable
    String v, HttpEntity<FindCommonStatReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity.getBody());
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        return statManageService.findPlatformEarningsStat(httpEntity.getBody());
    }
    
    /**
     * 用户发起统计
     * @param v
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/userInitiateStat", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findUserInitiateStat(@PathVariable
    String v, HttpEntity<FindCommonStatReq> req)
        throws Exception
    {
        return statManageService.findUserInitiateStat(req.getBody());
    }
    
    /**
     * 用户支持统计
     * @param v
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/userSupportStat", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findUserSupportStat(@PathVariable
    String v, HttpEntity<FindCommonStatReq> req)
        throws Exception
    {
        return statManageService.findUserSupportStat(req.getBody());
    }
}
