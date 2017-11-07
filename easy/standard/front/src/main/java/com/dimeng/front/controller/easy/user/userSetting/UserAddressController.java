/*
 * 文 件 名:  UserAddressController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月20日
 */
package com.dimeng.front.controller.easy.user.userSetting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dimeng.abilitys.annotation.SystemFrontLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.user.FindAddressDetailReq;
import com.dimeng.model.user.UpdateAddressReq;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.SystemCache;

/**
 * 用户收货地址
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月20日]
 */
@Controller
@RequestMapping("user/addressManage")
public class UserAddressController extends BaseController
{
    /**
     * 查询用户收货地址列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/userAddressList.do")
    public Object userAddressList(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        ModelAndView mv = new ModelAndView("easy/user/userSetting/userAddress_temple");
        String data =
            new CommonUtil().callInterfaceMethod(null, "user/addressManage/v/findAddress", RequestMethod.POST, request);
        Object addressList = CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_LIST);
        mv.addObject("addressList", addressList).addObject("maxCount",
            SystemCache.getProperty(EasySystemVariable.ADDRESS_MAX_COUNT));
        return mv;
    }
    
    /**
     * 查询收货地址详情
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findAddressDetail.do")
    public Object findAddressDetail(FindAddressDetailReq req, HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "user/addressManage/v/findAddressDetail",
                RequestMethod.POST,
                request);
        
        return JSON.parse(data);
    }
    
    /**
     * 更新收货地址
     * 增删改共用
     * @param req
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @SystemFrontLog(desc = "更新收货地址(增删改)", modul = "用户收货地址管理")
    @RequestMapping(value = "/updateAddress.do")
    public Object updateAddress(UpdateAddressReq req, HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "user/addressManage/v/updateAddress", RequestMethod.POST, request);
        return JSON.parse(data);
    }
    
}
