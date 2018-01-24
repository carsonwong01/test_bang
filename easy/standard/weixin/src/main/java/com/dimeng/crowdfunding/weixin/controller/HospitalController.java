package com.dimeng.crowdfunding.weixin.controller;

import com.dimeng.crowdfunding.weixin.util.FileUtil;
import com.dimeng.crowdfunding.weixin.util.HttpBase;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/hospital")
public class HospitalController {
    public String inferce = "/hospital"; // 映射地址

    public String app_inferce = FileUtil.getValueProperties("app_inferce"); //接口地址

    public String version = FileUtil.getValueProperties("app_version"); //版本

    public String serverAddress = app_inferce + inferce ; //完整地址
    /**
     * 医院列表
     */
    @ResponseBody
    @RequestMapping(value = "/hospital/v/findAllHospital")
    public String hospstalList(HttpServletRequest request, HttpServletResponse response)
            throws Exception{
        String url = new String(serverAddress + "/hospital/v/findAllHospital");
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("reqPageNum", request.getParameter("reqPageNum"));////页数
        map.put("maxResults", request.getParameter("maxResults"));//每页显示几条
        map.put("opSource", "2");//微信标识

        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
                HttpBase.POSTMETHOD,Authorization);
        return httpBase.getRespondata();
    }
    /*
     * 医院详情
     */
    @ResponseBody
    @RequestMapping(value = "/hospital/v/hospitalDetails")
    public String hospstalDetails(HttpServletRequest request, HttpServletResponse response)
            throws Exception{
        String url = new String(serverAddress + "/hospital/v/hospitalDetails");
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("hospitalId", request.getParameter("hospitalId"));//医院ID
        map.put("opSource", "2");//微信标识

        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
                HttpBase.POSTMETHOD,Authorization);
        return httpBase.getRespondata();
    }
}
