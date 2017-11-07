/*
 * 文 件 名:  BankCardManageController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月20日
 */
package com.dimeng.front.controller.easy.user.userSetting;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.Element;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dimeng.abilitys.annotation.SystemFrontLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.table.user.TUserBank;
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.user.AddBankCardReq;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.SystemCache;

/**
 * 银行卡管理
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月20日]
 */
@Controller
@RequestMapping("user/bankCardManage")
public class BankCardManageController extends BaseController
{
    /**
     * 获取用户绑定银行卡列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findCardList.do")
    public Object findCardList(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        ModelAndView mv = new ModelAndView("easy/user/userSetting/bankCardManagement_temple");
        String data =
            new CommonUtil().callInterfaceMethod(null,
                "user/bankCardManage/v/findCardList",
                RequestMethod.POST,
                request);
        Object bankCardList = CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_LIST);
        mv.addObject("bankCardList", bankCardList)
            .addObject("idcardStatus", LoginCache.getFrontUserInfo().getIdcardStatus())
            .addObject("maxBankCardCount", SystemCache.getProperty(EasySystemVariable.BIND_BANK_CARD_MAX_COUNT));
        return mv;
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/toAddBankCard.do")
    public Object toAddBankCard(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        ModelAndView mv = new ModelAndView("easy/user/userSetting/addBankCard_temple");
        // 通过key获取缓存元素-银行列表
        Element bankElement = systemCache.get(SystemConstant.CacheKey.USERBANK_LIST);
        List<TUserBank> bankList = new ArrayList<TUserBank>();
        if (bankElement != null)
        {
            // 有缓存则获取缓存对象
            bankList = (List<TUserBank>)bankElement.getObjectValue();
        }
        //跳到实名认证页面
        String trueName = LoginCache.getFrontUserInfo().getRealName();
        return mv.addObject("trueName", trueName).addObject("bankList", bankList);
    }
    
    /**
     * 添加银行卡
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @SystemFrontLog(desc = "添加银行卡", modul = "银行卡管理")
    @RequestMapping(value = "/addBankCard.do")
    public Object addBankCardAjax(AddBankCardReq req, HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "user/bankCardManage/v/addBankCard", RequestMethod.POST, request);
        return JSON.parse(data);
    }
    
    /**
     * 删除银行卡
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @SystemFrontLog(desc = "删除银行卡", modul = "银行卡管理")
    @RequestMapping(value = "/deleteBankCard.do")
    public Object deleteBankCardAjax(IdReq req, HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "user/bankCardManage/v/deleteBankCard",
                RequestMethod.POST,
                request);
        return JSON.parse(data);
    }
}
