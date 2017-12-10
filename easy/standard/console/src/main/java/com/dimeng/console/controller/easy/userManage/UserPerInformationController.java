package com.dimeng.console.controller.easy.userManage;

import com.dimeng.abilitys.annotation.SystemConsoleLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.bus.FindProListByUserIdReq;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.model.finance.FindPaymentListReq;
import com.dimeng.model.user.FindUserListReq;
import com.dimeng.model.user.NotPageUserIdReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户管理 
 * @author  song
 * @version  [版本号, 2016年9月27日]
 */
@Controller
@RequestMapping("userManage")
public class UserPerInformationController extends BaseController
{

    /**
     * 医院用户详细信息页面
     */
    @RequestMapping(value = "/hospitalUserList.do",method = RequestMethod.GET)
    public Object findHospitalUser(HospitalBasicReq req,HttpServletRequest request,
                                   HttpServletResponse response){
        ModelAndView mv = new ModelAndView("pages/easy/user/hosUserInfo");
        return mv;
    }

    /**
     * 医院用户列表信息
     */
    @RequestMapping(value = "/hospitalUserListAjax.do")
    @ResponseBody
    public Object findHospitalUserAjax(HospitalBasicReq req,HttpServletRequest request,
                                       HttpServletResponse response){
        String hospitalUser =
                new CommonUtil().callInterfaceMethod(req,
                        "user/userManage/v/findHospitalUser",
                        RequestMethod.POST,
                        request);
        return CommonUtil.getJSONObject(hospitalUser, null);
    }

//    /**
//     * 跳往医院用户详情界面
//     */
//    @RequestMapping(value = "/hosUserDetails.do", method = RequestMethod.GET)
//    @ResponseBody
//    public Object hosUserDetails(FindUserListReq userReq, HttpServletRequest req, HttpServletResponse response,String userId)
//    {
//        ModelAndView  mv = new ModelAndView("pages/easy/user/hosUserDetails");
//        mv.addObject("userId", userId);
//        return mv;
//    }
//
//    /**
//     * 医院用户详情信息
//     */
//    @RequestMapping(value = "/findHosUserDetailsAjax.do")
//    @ResponseBody
//    public Object findHosUserDetailsAjax(HospitalBasicReq req,HttpServletRequest request,
//                                         HttpServletResponse response){
//        //医院详情信息
//        String hosUserDetails =
//                new CommonUtil().callInterfaceMethod(req,
//                        "user/userManage/v/findHosUserDetails",
//                        RequestMethod.POST,
//                        request);
//        return CommonUtil.getJSONObject(hosUserDetails, null);
//    }


    /**
     * 跳转到用户中心个人信息列表页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/perInformation.do", method = RequestMethod.GET)
    public Object perInformation(FindUserListReq findUserListReq, HttpServletRequest request,
        HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/user/perInformation");
        return mv;
    }

    /**
     *ajax 获取用户列表数据
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/perInformationAjax.do")
    @ResponseBody
    @RequiresPermissions("YHGL_YHXX_GRXX_MU") 
    public Object perInformationAjax(FindUserListReq findUserListReq, HttpServletRequest request,
        HttpServletResponse response)
    {
        String perInformation =
            new CommonUtil().callInterfaceMethod(findUserListReq,
                "user/userManage/v/findUserList",
                RequestMethod.POST,
                request);
        return CommonUtil.getJSONObject(perInformation, null);
    }
    
    /**
     * 用户信息导出
     * @param req
     * @param request
     * @param response
     */ 
     @RequestMapping(value = "/perInformationExport.do")
     @RequiresPermissions("YHGL_YHXX_GRXX_DC")
    public void perInformationExport(FindUserListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "user/userManage/v/findUserList", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
      
    /**
     * 解锁/锁定/拉黑/取消拉黑 
     * @param response
     * @return
     */
    @SystemConsoleLog(desc = "操作用户状态", modul = "用户管理")
    @RequestMapping(value = "/updateStatus.do", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions(value = {"YHGL_YHXX_GRXX_SD", "YHGL_YHXX_GRXX_JS","YHGL_YHXX_GRXX_LH","YHGL_YHXX_GRXX_JH"}, logical = Logical.OR)
    public Map<String, Object> updateStatus(FindUserListReq userReq, HttpServletRequest req, HttpServletResponse response)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        String perInformation =
            new CommonUtil().callInterfaceMethod(userReq, "user/userManage/v/updateUserStatus", RequestMethod.POST, req);
        //错误编码
        String code = CommonUtil.getJSONObject(perInformation, CommonConstant.JSON_KEY_CODE).toString();
        map.put("code", code);
        return map;
    }
    
    /**
     * 跳往用户详情页面
     * @param response
     * @return
     */
    @RequestMapping(value = "/userInfoDetail.do", method = RequestMethod.GET)
    @ResponseBody
    public Object userInfoDetail(FindUserListReq userReq, HttpServletRequest req, HttpServletResponse response,String userId)
    {
        ModelAndView  mv = new ModelAndView("pages/easy/user/perInformationDetails");
        mv.addObject("id", userId);
        return mv;
    }
     /**
      * 获取用户信息
      * @param req
      * @param request
      * @param response
      * @return
      */
    @RequestMapping(value = "/userDetailsAjax.do")
    @ResponseBody
    @RequiresPermissions("YHGL_YHXX_GRXX_CK")
    public Object userDetailsAjax(NotPageUserIdReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //个人信息
        String perInformationDetails =
            new CommonUtil().callInterfaceMethod(req,
                "user/userManage/v/findUserDetail",
                RequestMethod.POST,
                request); 
        return CommonUtil.getJSONObject(perInformationDetails, null);
    }
    
    /**
     * 获取用户发起的项目信息
     * @param req
     * @param request
     * @param response
     * @return
     */
   @RequestMapping(value = "/findInitiateProList.do")
   @ResponseBody
   public Object findInitiateProList(FindProListByUserIdReq req, HttpServletRequest request,
       HttpServletResponse response)
   {
       
       Map<String, Object> modelMap = new HashMap<String, Object>(); 
       String findInitiateProList =
           new CommonUtil().callInterfaceMethod(req,
               "user/userManage/v/findInitiateProList",
               RequestMethod.POST,
               request); 
       
       modelMap.put("initiate", CommonUtil.getJSONObject(findInitiateProList, null));
       return modelMap; 
   }
   
   /**
    * 获取用户的支持订单信息
    * @param req
    * @param request
    * @param response
    * @return
    */
  @RequestMapping(value = "/findSupportProList.do")
  @ResponseBody
  public Object findSupportProList(FindPaymentListReq req, HttpServletRequest request,
      HttpServletResponse response)
  {
      
      Map<String, Object> modelMap = new HashMap<String, Object>(); 
      String findSupportProList =
          new CommonUtil().callInterfaceMethod(req,
              "finance/paymentManage/v/findPaymentList",
              RequestMethod.POST,
              request); 
      modelMap.put("support", CommonUtil.getJSONObject(findSupportProList, null));
      return modelMap; 
  }
}
