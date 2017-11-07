/*
 * 文 件 名:  FundsManagementController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年11月2日
 */
package com.dimeng.front.controller.easy.user.fundsManagement;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemFrontLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.user.FindAccMoneyListReq;
import com.dimeng.model.user.FindTradeListReq;
import com.dimeng.utils.AmountUtil;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.LoginCache;

/**
 * 资金管理：我的钱包
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年11月2日]
 */
@RequestMapping("user")
@Controller
public class FundsManagementController extends BaseController
{
    /**
     * 资金管理-我的钱包
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "myWallet.do")
    public Object myWallet(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        ModelAndView mv = new ModelAndView("easy/user/fundsManagement/myWallet_temple");
        String dataJson =
            new CommonUtil().callInterfaceMethod(null, "user/userManage/v/findAccCenter", RequestMethod.POST, request);
        JSONObject myWalletInfo = (JSONObject)CommonUtil.getJSONObject(dataJson, CommonConstant.JSON_KEY_SINGLE_RESULT);
        myWalletInfo.put("availableAmount", AmountUtil.format(myWalletInfo.getDoubleValue("availableAmount")));
        myWalletInfo.put("frozenAmount", AmountUtil.format(myWalletInfo.getDoubleValue("frozenAmount")));
        mv.addObject("myWalletInfo", myWalletInfo);
        mv.addObject("headPicUrl", LoginCache.getFrontUserInfo().getImageUrl());
        return mv;
    }
    
    /**
     * 资金管理-账户记录
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "findAccMoneyAjax.do")
    public Object findAccMoneyAjax(FindAccMoneyListReq req, HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String dataJson =
            new CommonUtil().callInterfaceMethod(req, "user/userManage/v/findAccMoney", RequestMethod.POST, request);
        return JSON.parse(dataJson);
    }
    
    /**
     * 资金管理-我的钱包
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "findTradeList.do")
    public Object findTradeList(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        ModelAndView mv = new ModelAndView("easy/user/fundsManagement/findTradeList_temple");
        return mv;
    }
    
    /**
     * 资金管理-账户记录
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "findTradeListAjax.do")
    public Object findTradeListAjax(FindTradeListReq req, String dateRangeType, HttpServletRequest request,
        HttpServletResponse response)
        throws Exception
    {
        if (StringUtil.notEmpty(dateRangeType))
        {
            Date now = new Date();
            String nowStr = DateUtil.getDatetimeString(now);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(now);
            switch (dateRangeType)
            {
                case "1"://七天
                    calendar.add(Calendar.DATE, -7);
                    break;
                case "2"://一个月
                    calendar.add(Calendar.MONTH, -1);
                    break;
                case "3"://三个月
                    calendar.add(Calendar.MONTH, -3);
                    break;
                case "4"://六个月
                    calendar.add(Calendar.MONTH, -6);
                    break;
                case "5"://十二个月
                    calendar.add(Calendar.MONTH, -12);
                    break;
            }
            req.setStartTime(DateUtil.getDatetimeString(calendar.getTime()));
            req.setEndTime(nowStr);
        }
        String dataJson =
            new CommonUtil().callInterfaceMethod(req, "user/userManage/v/findTradeList", RequestMethod.POST, request);
        return JSON.parse(dataJson);
    }
    
    /**
     * 资金管理-验证冻结项目
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "findFreezePro.do")
    public Object findFreezePro(@ModelAttribute("freezeAmount")
    String freezeAmount, HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        ModelAndView mv = new ModelAndView("easy/user/fundsManagement/findFreezePro_temple");
        return mv;
    }
    
    /**
     * 资金管理-验证冻结项目
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @SystemFrontLog(desc = "前台用户验证冻结项目", modul = "资金管理")
    @RequestMapping(value = "findFreezeProAjax.do")
    public Object findFreezeProAjax(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String dataJson =
            new CommonUtil().callInterfaceMethod(null, "user/userManage/v/findFreezePro", RequestMethod.POST, request);
        return JSON.parse(dataJson);
    }
}
