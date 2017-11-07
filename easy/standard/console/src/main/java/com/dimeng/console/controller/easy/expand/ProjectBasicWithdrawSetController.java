/*
 * 文 件 名:  ProjectBasicWithdrawSetController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月27日
 */
package com.dimeng.console.controller.easy.expand;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemConsoleLog;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.expand.WithdrawSetReq;
import com.dimeng.utils.CommonUtil;

/**
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月27日]
 */
@RequestMapping("operations")
@Controller
public class ProjectBasicWithdrawSetController extends BaseController
{
    
    /**
     * 平台收费设置
     * <功能详细描述>
     * @param request
     * @return
     */
    @RequestMapping("/projectWithdrawSetPage.do")
    public ModelAndView projectWithdrawSetPage(HttpServletRequest request)
    {
        ModelAndView mv = new ModelAndView("pages/easy/operations/projectWithdrawSetPage");
        //初始化提现设置页面数据
        String json =
            new CommonUtil().callInterfaceMethod(null,
                "operation/basicInfoSet/v/findWithdrawSet",
                RequestMethod.POST,
                request);
        return mv.addObject("result", JSONObject.parse(json));
    }
    
    /**
     * 平台提现设置-提交
     * <功能详细描述>
     * @param chargeReq
     * @param request
     * @return
     */
    @SystemConsoleLog(desc = "修改平台提现设置", modul = "运营管理")
    @ResponseBody
    @RequestMapping(value = "updateProjectWithdrawSet.do")
    public Object updateProjectWithdrawSet(WithdrawSetReq withdrawSetReq, HttpServletRequest request)
    {
        String result =
            new CommonUtil().callInterfaceMethod(withdrawSetReq,
                "operation/basicInfoSet/v/commonWithdrawSet",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
}
