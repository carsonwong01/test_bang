package com.dimeng.platform.controller.user;

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
import com.dimeng.model.user.FindAddressDetailReq;
import com.dimeng.model.user.NotPageUserIdReq;
import com.dimeng.model.user.UpdateAddressReq;
import com.dimeng.modules.user.services.UserAddressManageService;
import com.dimeng.utils.LoginCache;

/**
 * 用户管理controller
 * @author  song
 * @version  [版本号, 2016年9月28日]
 */
@Controller
@RequestMapping("user/addressManage")
public class UserAddressManageController extends BaseController
{
    @Autowired
    UserAddressManageService addressManageService;
    
    /**
     * 收货地址管理-查询
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findAddress", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findAddress()
        throws Exception
    {
        NotPageUserIdReq req = new NotPageUserIdReq();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        return addressManageService.findAddress(req);
    }
    
    /**
     * 收货地址管理-查看地址详情
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findAddressDetail", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findAddressDetail(HttpEntity<FindAddressDetailReq> httpEntity)
        throws Exception
    {
        FindAddressDetailReq req = httpEntity.getBody();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = addressManageService.findAddressDetail(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 收货地址管理-添加/修改/删除收货地址
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/updateAddress", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object updateAddress(HttpEntity<UpdateAddressReq> httpEntity)
        throws Exception
    {
        UpdateAddressReq req = httpEntity.getBody();
        req.setUserId(LoginCache.getFrontUserInfo().getUserId());
        BaseDataResp resp = this.validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = addressManageService.updateAddress(req);
        }
        return resp;
    }
}
