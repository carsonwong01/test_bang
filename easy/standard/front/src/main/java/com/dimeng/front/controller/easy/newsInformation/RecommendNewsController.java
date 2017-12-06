package com.dimeng.front.controller.easy.newsInformation;

import com.dimeng.model.expand.RecomNewsReq;
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
@RequestMapping("frontHome")
public class RecommendNewsController {
    /**
     * Test
     */
    @RequestMapping(value = "/recommendNewsInfos.do")
    public Object recomNews(HttpServletRequest request,
                       HttpServletResponse response, RecomNewsReq req){
        ModelAndView mv = new ModelAndView("easy/newsInformation/recommendNewsInfos.page");
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/recommendNewsInfosAjax.do")
    public Object findRecomNews(RecomNewsReq req, HttpServletRequest request, HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        req.setOpSource("1");
        req.setMaxResults(5);
        String data =
                new CommonUtil().callInterfaceMethod(req, "frontHome/v/recomNewsList", RequestMethod.POST, request);
        map.put("recomNews",CommonUtil.getJSONObject(data, null));
        map.put("req", req);
        return map;
    }




}
