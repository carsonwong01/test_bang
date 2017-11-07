/** 文 件 名:  HelpCenterController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年10月20日
 */

package com.dimeng.front.controller.easy.helpCenter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.site.helpCenter.FindHelpCenterByTypeReq;
import com.dimeng.utils.CommonUtil;

/**
* 帮助中心
* <功能详细描述>
* 
* @author  wenguanhai
* @version  [版本号, 2016年10月20日]
*/

@Controller
@RequestMapping("frontHome")
public class FontHelpCenterController extends BaseController
{
    /**
    * 跳转到帮助中心页面
    * <功能详细描述>
    * @author wenguanhai
    * @param request
    * @param response
    * @return
    */
    
    @RequestMapping(value = "/helpCenter.do")
    public Object helpCenter(HttpServletRequest request, HttpServletResponse response, String type)
    {
        ModelAndView mv = new ModelAndView("easy/helpCenter/helpCenter.page");
        if (null == type || "" == type)
        {
            type = "1";
        }
        return mv.addObject("type", type);
    }
    
    /**
    * 帮助中心Ajax查询
    * 帮助中心（新手指南、名词解释...）
    * @author wenguanhai
    * @param request
    * @return
    */
    
    @ResponseBody
    @RequestMapping(value = "/helpCenterAjax.do", method = RequestMethod.POST)
    public Object helpCenterAjax(FindHelpCenterByTypeReq findHelpCenterByTypeReq, HttpServletRequest req)
    {
        //帮助中心
        findHelpCenterByTypeReq.setStatus(DigitalAndStringConstant.StringConstant.ONE);
        String helpCenterlist =
            new CommonUtil().callInterfaceMethod(findHelpCenterByTypeReq,
                "site/helpCenter/v/helpCenterList",
                RequestMethod.GET,
                req);
        return CommonUtil.getJSONObject(helpCenterlist, null);
    }
    
}
