package com.dimeng.front.controller.easy.common;

import com.dimeng.util.CheckPcOrMobileUtil;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 检查是移动端还是PC端
 */
public class CheckPcOrMobile extends HandlerInterceptorAdapter {

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
                                Object handler, Exception ex) throws Exception{
        super.afterCompletion(request,response,handler,ex);
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception{
        super.postHandle(request, response, handler, modelAndView);
    }

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        boolean judgeIsMobile = CheckPcOrMobileUtil.JudgeIsMoblie(request);
        if(judgeIsMobile == true){
            response.sendRedirect("/weixin/#index/index/index");
        }else{
            return true;
        }
        return true;
    }
}
