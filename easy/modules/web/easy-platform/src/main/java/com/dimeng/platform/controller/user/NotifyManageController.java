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
import com.dimeng.entity.table.user.TUserNotify;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.model.user.FindByUserIdReq;
import com.dimeng.modules.user.services.NotifyManageService;

/**
 * 用户消息通知管理-免打扰设置
 * @author  song
 * @version  [版本号, 2016年10月17日]
 */
@Controller
@RequestMapping("user/notifyManage")
public class NotifyManageController extends BaseController
{
    @Autowired
    NotifyManageService userNotifyService; 
    
    /**
     * 查询单个用户的免打扰消息通知设置
     * <功能详细描述>
     * @param req
     * @return
     */
    @RequestMapping(value = "/{v}/findNotify", method = RequestMethod.POST, produces = {"application/json",
    "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findNotify(HttpEntity<FindByUserIdReq> req){

        BaseDataResp resp = this.validator(req.getBody());
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        resp = userNotifyService.findNotify(req.getBody());
        return resp;
    }

    /**
     * 修改用户的免打扰设置
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException 
     */
    @RequestMapping(value = "/{v}/updateUserNotify", method = RequestMethod.POST, produces = {"application/json",
    "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object commonNotify(HttpEntity<TUserNotify> req) throws Exception
    {
        return  userNotifyService.updateNotify(req.getBody());
    }
}
