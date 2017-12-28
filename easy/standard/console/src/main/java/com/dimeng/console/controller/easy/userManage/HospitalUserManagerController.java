package com.dimeng.console.controller.easy.userManage;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemConsoleLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.entity.ext.user.ConsoleUserInfo;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.model.expand.InsertHospitalReq;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.FilesHandleUtil;
import com.dimeng.utils.LoginCache;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
    public Object addHospitalUserAjax(@RequestParam(value = "logoFile",required = false) MultipartFile logoFile,
                              HttpServletRequest request, HttpServletResponse response,InsertHospitalReq req){
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        ConsoleUserInfo user = LoginCache.getConsoleUserInfo();
        if (logoFile != null && !logoFile.isEmpty()) {
            if (!StringUtil.isEmpty(req.getLogoId())) {
                new FilesHandleUtil();
                FilesHandleUtil.deleteFile(req.getLogoId());
            }

            new FilesHandleUtil();
            Map<String, String> map = FilesHandleUtil.saveFile(logoFile, user.getUserId());
            req.setLogoId((String)map.get("batchNumber"));
            req.setLogoUrl((String)map.get("url"));
            req.setUserId(user.getUserId());
        }
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
    @RequestMapping("/updateHospitalInfoAjax.do")
    public Object updateHospitalInfo(InsertHospitalReq req,HttpServletRequest request, HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        String hospitalInfo =
                new CommonUtil().callInterfaceMethod(req, "user/userManage/v/updateHosInfo", RequestMethod.POST, request);
        //错误编码
        String code = CommonUtil.getJSONObject(hospitalInfo, CommonConstant.JSON_KEY_CODE).toString();
        map.put("code", code);
        return map;
    }
    /**
     * 获取医院info--后台--医院详情
     */
    @RequestMapping(value = "/updateHosUserInfo.do")
    public Object findHosUserInfo(HttpServletRequest request,
                                  HttpServletResponse response,HospitalBasicReq req){
        ModelAndView mv = new ModelAndView("pages/easy/user/updateHosUser");
        String data = new CommonUtil().callInterfaceMethod(req,
                "user/userManage/v/findHosUserInfo",RequestMethod.POST,request);
        JSONObject object = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        mv.addObject("updateHosUserInfo",object);
        return mv;
    }

    /**
     * 修改医院用户的推荐状态
     */
    @RequestMapping(value = "/updateHosRecStatus.do")
    public Object updateHosRecStatus(HttpServletRequest request,HttpServletResponse response,
                                HospitalBasicReq req){
        Map<String, Object> map = new HashMap<String, Object>();
        String data = new CommonUtil().callInterfaceMethod(req,"user/userManage/v/updateHosRecStatus",
                                RequestMethod.POST,request);
        String code = CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_CODE).toString();
        map.put("code", code);
        return map;
    }
}
