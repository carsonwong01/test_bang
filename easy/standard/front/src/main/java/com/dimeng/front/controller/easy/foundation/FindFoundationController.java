package com.dimeng.front.controller.easy.foundation;

import com.alibaba.fastjson.JSONObject;
import com.dimeng.constants.CommonConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.expand.FindFoundationReq;
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
@RequestMapping("foundation")
public class FindFoundationController extends BaseController {

    /**
     * 查找基金会列表
     */
    @RequestMapping(value = "/foundationList.do")
    public ModelAndView findFoundationList(HttpServletRequest request, HttpServletResponse response)
                throws Exception{
        ModelAndView mv = new ModelAndView("easy/foundation/foundationList.page");
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/foundationListAjax.do")
    public Map findFoundationListAjax(HttpServletRequest request, HttpServletResponse response,
                                    FindFoundationReq req)throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        //PC端
        req.setOpSource("1");
        //每页数量
        req.setMaxResults(10);
        String data = new CommonUtil().callInterfaceMethod(req,"foundation/v/foundationList",
                RequestMethod.POST, request);

        map.put("foundationList",CommonUtil.getJSONObject(data, null));
        map.put("req", req);
        return map;
    }

    /**
     * 查找基金会详细信息
     */
    @RequestMapping(value = "/foundationDetails.do")
    public ModelAndView findFoundationDetails(HttpServletRequest request, HttpServletResponse response,
                                              FindFoundationReq req)throws Exception{
        ModelAndView mv = new ModelAndView("easy/foundation/foundationDetail.page");
        String data = new CommonUtil().callInterfaceMethod(req,
                "foundation/v/foundationDetails",RequestMethod.POST,request);
        JSONObject object = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        mv.addObject("foundationDetails",object);
        return mv;
    }
}
