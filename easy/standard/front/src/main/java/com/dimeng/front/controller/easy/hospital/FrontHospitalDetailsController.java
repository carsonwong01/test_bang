package com.dimeng.front.controller.easy.hospital;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.constants.CommonConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.utils.CommonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 项目列表
 * <一句话功能简述>
 * <功能详细描述>
 *
 * @author  zhangshuai
 * @version  [版本号, 2016年11月7日]
 */
@Controller
@RequestMapping("hospital")
public class FrontHospitalDetailsController extends BaseController
{
    /**
     * 前台 -医院详情
     */
    @RequestMapping(value = "/hospitalDetails.do")
    public Object hospitalDetails(HttpServletRequest request,
                                  HttpServletResponse response,HospitalBasicReq req){
       // ModelAndView mv = new ModelAndView("easy/hospital/hospitalDetails.page");

        Map<String, Object> map = new HashMap<String, Object>();
        String data = new CommonUtil().callInterfaceMethod(req,
                "hospital/v/hospitalDetails",RequestMethod.POST,request);
        JSONObject object = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        //mv.addObject("hospitalDetails",object);
        //return mv;
        return JSON.parse(data);
    }

    /*
@RequestMapping(value = "/projectDetails.do")
    public Object projectDetails(ProjectDetailsReq req,HttpServletRequest request, HttpServletResponse response)
    {

        ModelAndView mv = new ModelAndView("easy/project/projectDetails.page");
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        if (userInfo != null)
        {
            req.setUserId(userInfo.getUserId());
        }
        String data = new CommonUtil().callInterfaceMethod(req,
          "project/query/v/projectDetails",
          RequestMethod.POST,request);
        JSONObject  object = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        ProjectDetailsResp projectDetail = object.toJavaObject(ProjectDetailsResp.class);
        if("4".equals(projectDetail.getProjectStatus()))
        {
            mv.setViewName("easy/project/projectDetailsNull.page");
            mv.addObject("status","1");
        }else if("1".equals(projectDetail.getShieldStatus())){
            mv.setViewName("easy/project/projectDetailsNull.page");
            mv.addObject("status","2");
        }else{
            mv.addObject("projectDetails",object);
        }
        return mv;
    }



     */







    /**
     * 前台 -医院详情列表
     */
//    @RequestMapping(value = "/hospitalDetails.do")
//    public Object findHospitalDetails(HttpServletRequest request, HttpServletResponse response)throws Exception{
//        ModelAndView mv = new ModelAndView("easy/hospital/hospitalDetails.page");
//        return mv;
//    }


//    @ResponseBody
//    @RequestMapping(value = "/hospitalProjectAjax.do")
//    public Object hospitalProjectAjax(HttpServletRequest request,
//                                   HttpServletResponse response, FindHospitalProjectBaseReq req){
//        Map<String, Object> map = new HashMap<String, Object>();
//        req.setOpSource("1");
//        req.setMaxResults(9);
//        String data =
//                new CommonUtil().callInterfaceMethod(req, "hospital/v/findHospitalProject", RequestMethod.POST, request);
//        map.put("hospitalProject",CommonUtil.getJSONObject(data, null));
//        map.put("req", req);
//        return map;
//    }

}







