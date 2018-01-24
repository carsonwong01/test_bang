package com.dimeng.crowdfunding.weixin.util;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.Map;
 
public class MappingJacksonJsonViewExd extends MappingJackson2JsonView {
 
    @Override
    protected Object filterModel(Map<String, Object> model) {
        Map<?, ?> result = (Map<?, ?>) super.filterModel(model);
        ModelAndView mav =  (ModelAndView) (result.size() != 1 ? result : result.values().iterator().next());
        return mav.getModelMap();
    }
 
}