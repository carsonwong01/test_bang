/*
 * 文 件 名:  WithdrawSetController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月27日
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

import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.expand.WithdrawSetReq;
import com.dimeng.modules.expand.services.IWithdrawSetService;

/**
 * 平台提现设置controller
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月27日]
 */
@RequestMapping(value = "operation/basicInfoSet")
@Controller
public class WithdrawSetController extends BaseController
{
    
    @Autowired
    IWithdrawSetService withdrawSetService;
    
    /**
     * 平台提现设置
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/commonWithdrawSet", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object commonWithdrawSet(HttpEntity<WithdrawSetReq> httpEntity)
        throws Exception
    {
        return withdrawSetService.commonWithdrawSet(httpEntity.getBody());
    }
    
    /**
     * 获取平台收费设置
     * <功能详细描述>
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findWithdrawSet", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findWithdrawSet()
        throws Exception
    {
        return withdrawSetService.findWithdrawSet();
    }
    
}
