package com.dimeng.console.controller.easy.userManage;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemConsoleLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.model.expand.InsertHospitalReq;
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

@Controller
@RequestMapping("userManage")
public class HospitalUserManagerController extends BaseController {

    /**
     * 添加医院用户页面
     */
    @RequestMapping("/addHospitalUser.do")
    public Object addHospitalUser(HttpServletRequest request, HttpServletResponse response,
                                  HospitalBasicReq req){
        ModelAndView mv = new ModelAndView("pages/easy/user/addHospitalInfo");
        return mv;
    }
    /**
     * 添加
     */
    @SystemConsoleLog(desc = "新增", modul = "用户管理")//这个地方在JS中可以找到
    @ResponseBody
    @RequestMapping("/addHospitalUserAjax.do")
//    @RequiresPermissions(value = {"YHGL_YHXX_GRXX_SD", "YHGL_YHXX_GRXX_JS","YHGL_YHXX_GRXX_LH","YHGL_YHXX_GRXX_JH"}, logical = Logical.OR)
    public Object addHospitalUserAjax(HttpServletRequest request, HttpServletResponse response,
                                      InsertHospitalReq req){
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        String data =
                new CommonUtil().callInterfaceMethod(req, "user/userManage/v/insertHosUser",
                        RequestMethod.POST, request);
        JSONObject json = JSONObject.parseObject(data);
        return json;
    }
    /**
     * 修改医院信息
     */
    @ResponseBody
    @RequestMapping("/updateHospitalInfo.do")
    public Object updateHospitalInfo(InsertHospitalReq req,HttpServletRequest request, HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        String hospitalInfo =
                new CommonUtil().callInterfaceMethod(req, "user/userManage/v/updateHosInfo", RequestMethod.POST, request);
        //错误编码
        String code = CommonUtil.getJSONObject(hospitalInfo, CommonConstant.JSON_KEY_CODE).toString();
        map.put("code", code);
        return map;
    }

}
