package com.dimeng.front.controller.easy.hospital;

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
public class FrontHospitalListController extends BaseController
{
    /**
     * 前台 -医院列表
     */
    @RequestMapping(value = "/hospitalList.do")
    public Object findAllHospital(HttpServletRequest request, HttpServletResponse response)throws Exception{
        ModelAndView mv = new ModelAndView("easy/hospital/hospitalList.page");
        return mv;
    }


    @ResponseBody
    @RequestMapping(value = "/hospitalListAjax.do")
    public Object hospitalListAjax(HttpServletRequest request,
                                  HttpServletResponse response,HospitalBasicReq req){
        Map<String, Object> map = new HashMap<String, Object>();
        req.setOpSource("1");
        req.setMaxResults(10);
        String data =
                new CommonUtil().callInterfaceMethod(req, "hospital/v/findAllHospital", RequestMethod.POST, request);
        map.put("hospitalList",CommonUtil.getJSONObject(data, null));
        map.put("req", req);
        return map;
    }

//    /**
//     * 前台 -医院详情
//     */
//    @RequestMapping(value = "/hospitalDetails.do")
//    public Object hospitalDetails(HttpServletRequest request,
//                                  HttpServletResponse response,HospitalBasicReq req){
//        ModelAndView mv = new ModelAndView("easy/hospital/hospitalDetails.page");
//        String data = new CommonUtil().callInterfaceMethod(req,
//                "hospital/v/hospitalDetails",RequestMethod.POST,request);
//        JSONObject object = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
//        mv.addObject("hospitalDetails",object);
//        return mv;
//    }



//    @RequestMapping(value = "/hospitalDetails.do")
//    public Object findHospitalDetails(HttpServletRequest request, HttpServletResponse response)throws Exception{
//        ModelAndView mv = new ModelAndView("easy/hospital/hospitalDetails.page");
//        return mv;
//    }


}







