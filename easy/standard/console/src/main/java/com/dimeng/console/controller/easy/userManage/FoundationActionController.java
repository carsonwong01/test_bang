package com.dimeng.console.controller.easy.userManage;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemConsoleLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.entity.ext.user.ConsoleUserInfo;
import com.dimeng.entity.table.foundation.DeleteFoundationReq;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.expand.FindFoundationReq;
import com.dimeng.model.user.NotPageFoundationIdReq;
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
import java.util.Map;

@Controller
@RequestMapping("userManage")
public class FoundationActionController extends BaseController{





    /**
     * 获取基金会info--后台--基金会详情
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping(value = "/updateFoundationInfo.do")
    public Object findFoundationInfo(HttpServletRequest request,
                                  HttpServletResponse response,FindFoundationReq req){
        ModelAndView mv = new ModelAndView("pages/easy/user/updateFoundation");
        String data = new CommonUtil().callInterfaceMethod(req,
                "foundation/v/foundationDetails",RequestMethod.POST,request);
        JSONObject object = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        mv.addObject("updateFoundationInfo",object);
        return mv;
    }

    /**
     * 修改医院信息
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/updateFoundationInfoAjax.do")
    public Object updateHospitalInfo(@RequestParam(value = "certificateFile",required = false) MultipartFile certificateFile,
                                     @RequestParam(value = "donationsFile",required = false) MultipartFile donationsFile,
                                     @RequestParam(value = "logoFile",required = false) MultipartFile logoFile,
                                     HttpServletRequest request, HttpServletResponse response,FindFoundationReq req){
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        ConsoleUserInfo user = LoginCache.getConsoleUserInfo();
        if (logoFile != null && !logoFile.isEmpty()) {
            if (!StringUtil.isEmpty(req.getLogoId())) {
                new FilesHandleUtil();
                FilesHandleUtil.deleteFile(req.getLogoId());
            }

            new FilesHandleUtil();
            Map<String, String> map = FilesHandleUtil.saveFile(logoFile, (String)null);
            req.setLogoId((String)map.get("batchNumber"));
            req.setLogoUrl((String)map.get("url"));
        }
        if (certificateFile != null && !certificateFile.isEmpty()) {
            if (!StringUtil.isEmpty(req.getCertificateId())) {
                new FilesHandleUtil();
                FilesHandleUtil.deleteFile(req.getCertificateId());
            }

            new FilesHandleUtil();
            Map<String, String> map = FilesHandleUtil.saveFile(certificateFile, (String)null);
            req.setCertificateId((String)map.get("batchNumber"));
            req.setCertificateUrl((String)map.get("url"));
        }
        if (donationsFile != null && !donationsFile.isEmpty()) {
            if (!StringUtil.isEmpty(req.getDonationUrlId())) {
                new FilesHandleUtil();
                FilesHandleUtil.deleteFile(req.getDonationUrlId());
            }

            new FilesHandleUtil();
            Map<String, String> map = FilesHandleUtil.saveFile(donationsFile, (String)null);
            req.setDonationUrlId((String)map.get("batchNumber"));
            req.setDonationsQualificationUrl((String)map.get("url"));
        }
        String foundationInfo =
                new CommonUtil().callInterfaceMethod(req, "user/userManage/v/updateFoundation", RequestMethod.POST, request);
        JSONObject json = JSONObject.parseObject(foundationInfo);
        return json;
    }

    /**
     * 删除基金会
     */
    @SystemConsoleLog(
            desc = "删除基金会",modul = "用户管理")
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping(value = "/delFoundationInfo.do")
    public Object delFoundation(HttpServletRequest request, HttpServletResponse response,
                                DeleteFoundationReq req){
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        String data = (new CommonUtil()).callInterfaceMethod(req, "user/userManage/v/deleteFoundation", RequestMethod.DELETE, request);
        JSONObject json = JSONObject.parseObject(data);
        return json;
    }


    /**
     * 插入基金会信息
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/addFoundationInfo.do")
    public ModelAndView addFoundationInfo(HttpServletRequest request, HttpServletResponse response,
                                    FindFoundationReq req, String provinceId){
        ModelAndView mv = new ModelAndView("pages/easy/user/addFoundationInfo");
        return mv;
    }
    /**
     * 添加基金会
     */
    @SuppressWarnings("unchecked")
    @SystemConsoleLog(desc = "新增", modul = "用户管理")//这个地方在JS中可以找到
    @ResponseBody
    @RequestMapping("/addFoundationInfoAjax.do")
    public Object addFoundationInfoAjax(@RequestParam(value = "certificateFile",required = false) MultipartFile certificateFile,
                                        @RequestParam(value = "donationsFile",required = false) MultipartFile donationsFile,
                                        @RequestParam(value = "logoFile",required = false) MultipartFile logoFile,
                                        HttpServletRequest request, HttpServletResponse response,FindFoundationReq req){
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
        if (certificateFile != null && !certificateFile.isEmpty()) {
            if (!StringUtil.isEmpty(req.getCertificateId())) {
                new FilesHandleUtil();
                FilesHandleUtil.deleteFile(req.getCertificateId());
            }

            new FilesHandleUtil();
            Map<String, String> map = FilesHandleUtil.saveFile(certificateFile, user.getUserId());
            req.setCertificateId((String)map.get("batchNumber"));
            req.setCertificateUrl((String)map.get("url"));
            req.setUserId(user.getUserId());
        }
        if (donationsFile != null && !donationsFile.isEmpty()) {
            if (!StringUtil.isEmpty(req.getDonationUrlId())) {
                new FilesHandleUtil();
                FilesHandleUtil.deleteFile(req.getDonationUrlId());
            }

            new FilesHandleUtil();
            Map<String, String> map = FilesHandleUtil.saveFile(donationsFile, user.getUserId());
            req.setDonationUrlId((String)map.get("batchNumber"));
            req.setDonationsQualificationUrl((String)map.get("url"));
            req.setUserId(user.getUserId());
        }
        String data =
                new CommonUtil().callInterfaceMethod(req, "user/userManage/v/insertFoundation",
                        RequestMethod.POST, request);
        JSONObject json = JSONObject.parseObject(data);
        return json;
    }



    /**
     * 后台基金会列表页
     */
    @RequestMapping(value = "/listFoundation.do")
    public ModelAndView findFoundations(FindFoundationReq req, HttpServletRequest request,
                                        HttpServletResponse response){
        ModelAndView mv = new ModelAndView("pages/easy/user/foundations");
        return mv;
    }

    /**
     * ajax 获取用户列表数据 --基金会列表信息
     */
    @RequestMapping(value = "/listFoundationAjax.do")
    @ResponseBody
    public Object findFoundationsAjax(FindFoundationReq req, HttpServletRequest request,
                                          HttpServletResponse response){
        String perInformation =
                new CommonUtil().callInterfaceMethod(req,
                        "foundation/v/foundationList",
                        RequestMethod.POST,request);
        return CommonUtil.getJSONObject(perInformation, null);
    }

    /**
     * 跳往基金会详情页面
     */
    @RequestMapping(value = "/foundationInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public Object userInfoDetail(FindFoundationReq findFoundationReq, HttpServletRequest request,
                                 HttpServletResponse response, String foundationId)
    {
        ModelAndView  mv = new ModelAndView("pages/easy/user/foundationsDetails");
        mv.addObject("foundationId", foundationId);
        return mv;
    }

    /**
     * 查看基金会详细内容
     * @return
     */
    @RequestMapping(value = "/findFoundationDetails.do")
    @ResponseBody
    public Object findFoundationDetails(NotPageFoundationIdReq req, HttpServletRequest request,
                                        HttpServletResponse response){
        //基金会信息
        String foundationDetails =
                new CommonUtil().callInterfaceMethod(req,
                        "foundation/v/findFoundationInfo",
                        RequestMethod.POST,request);
        return CommonUtil.getJSONObject(foundationDetails, null);
    }
}

