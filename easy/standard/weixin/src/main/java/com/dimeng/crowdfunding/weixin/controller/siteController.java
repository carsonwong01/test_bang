package com.dimeng.crowdfunding.weixin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dimeng.crowdfunding.weixin.util.FileUtil;
import com.dimeng.crowdfunding.weixin.util.HttpBase;

//@Scope("prototype")
@Controller
@RequestMapping("/site")
public class siteController
{
    
    public String inferce = "/site"; // 映射地址
    
    public String app_inferce = FileUtil.getValueProperties("app_inferce"); //接口地址
    
    public String version = FileUtil.getValueProperties("app_version"); //版本
    
    public String serverAddress = app_inferce + inferce ; //完整地址
    
    /*
     * 文本说明列表查询
     * @textId
     * 1发起须知
     * 2筹款攻略
     * 3公益项目筹款说明
     * 4回报项目筹款说明
     * 5梦想项目筹款说明
     * 6提现温馨提示
     * 7中华人民共和国民法通则
     * 8中华人民共和国刑法
     */
    @ResponseBody
    @RequestMapping(value = "/textInstruct/v/findTextInstructList")
    public String findTextInstructList(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        
        String url = new String(serverAddress + "/textInstruct/v/findTextInstructList");
        
        HttpBase httpBase = new HttpBase();
        Map<String, Object> map = new HashMap<String, Object>();


        map.put("textId", request.getParameter("textId"));//文本ID
        map.put("opSource", "2");//微信标识
        
        
        String Authorization = request.getHeader("Authorization");
        httpBase.setReqData(map);
        httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
            HttpBase.POSTMETHOD,Authorization);
        
        return httpBase.getRespondata(); 
    }
}
