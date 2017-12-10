package com.dimeng.front.controller.easy.hospital;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.constants.CommonConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.utils.CommonUtil;
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
        ModelAndView mv = new ModelAndView("easy/hospital/hospitalDetails.page");
        Map<String, Object> map = new HashMap<String, Object>();
        String data = new CommonUtil().callInterfaceMethod(req,
                "hospital/v/hospitalDetails",RequestMethod.POST,request);
        JSONObject object = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        mv.addObject("hospitalDetails",object);
        return mv;
    }

    /**
     * 前台--跳往项目列表页面
     */
    @RequestMapping(value = "/hospitalProjectList.do", method = RequestMethod.GET)
    @ResponseBody
    public Object hospitalProjectList(HospitalBasicReq req, HttpServletRequest request,
                                      HttpServletResponse response,String hospitalId){
        ModelAndView mv = new ModelAndView("easy/hospital/hospitalProject.page");
        mv.addObject("hospitalId",hospitalId);
        return mv;
    }

    /**
     * 前台-医院下项目列表信息
     */
    @ResponseBody
    @RequestMapping(value = "/hospitalProjectListAjax.do")
    public Object findHosProjectList(HospitalBasicReq req, HttpServletRequest request, HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        req.setOpSource("1");
        req.setMaxResults(9);
        //查找众筹中的项目，注释后是查找所有项目
        //req.setProjectStatus(ProjectStatusEnum.ZCZ.getDataBaseVal());
        String data =
                new CommonUtil().callInterfaceMethod(req, "hospital/v/findHospitalProject", RequestMethod.POST, request);
        map.put("hospitalProjectList",CommonUtil.getJSONObject(data, null));
        map.put("req", req);
        return map;
    }

    /**
     * 前台-跳往项目进度页面
     */
    @RequestMapping(value = "/hospitalProjectSum.do", method = RequestMethod.GET)
    @ResponseBody
    public Object hospitalProjectSum(HospitalBasicReq req, HttpServletRequest request,
                                     HttpServletResponse response,String hospitalId){
        ModelAndView mv = new ModelAndView("easy/hospital/hospitalProSum.page");
        mv.addObject("hospitalId",hospitalId);
        return mv;
    }

    /**
     * 前台- 医院下项目进度的信息
     */
    @ResponseBody
    @RequestMapping(value = "/hospitalProjectSumAjax.do")
    public Object findHosProjectSum(HospitalBasicReq req, HttpServletRequest request, HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        req.setOpSource("1");
        req.setMaxResults(10);
        String data =
                new CommonUtil().callInterfaceMethod(req, "hospital/v/findHosProjectSum", RequestMethod.POST, request);
        map.put("hosProjectSum",CommonUtil.getJSONObject(data, null));
        map.put("req", req);
        return map;
    }

    /**
     * Test
     */
    @RequestMapping(value = "/test.do")
    public Object test(HttpServletRequest request,
                                  HttpServletResponse response,HospitalBasicReq req){
        ModelAndView mv = new ModelAndView("easy/hospital/perInformation.page");
        return mv;
    }


}







