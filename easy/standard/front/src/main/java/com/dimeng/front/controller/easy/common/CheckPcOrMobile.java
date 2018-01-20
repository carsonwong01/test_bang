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







//    public String execute(){
//        HttpServletRequest request =
//                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
//        boolean isMobile = JudgeIsMobile(request);
//        if(isMobile){
//            return "mobile";
//        }
//        return "pc";
//    }
//
//    public boolean JudgeIsMobile(HttpServletRequest request){
//        boolean isMoble = false;
//        String[] mobileAgents = { "iphone", "android", "phone", "mobile",
//                "wap", "netfront", "java", "opera mobi", "opera mini", "ucweb",
//                "windows ce", "symbian", "series", "webos", "sony",
//                "blackberry", "dopod", "nokia", "samsung", "palmsource", "xda",
//                "pieplus", "meizu", "midp", "cldc", "motorola", "foma",
//                "docomo", "up.browser", "up.link", "blazer", "helio", "hosin",
//                "huawei", "novarra", "coolpad", "webos", "techfaith",
//                "palmsource", "alcatel", "amoi", "ktouch", "nexian",
//                "ericsson", "philips", "sagem", "wellcom", "bunjalloo", "maui",
//                "smartphone", "iemobile", "spice", "bird", "zte-", "longcos",
//                "pantech", "gionee", "portalmmm", "jig browser", "hiptop",
//                "benq", "haier", "^lct", "320x320", "240x320", "176x220",
//                "w3c ", "acs-", "alav", "alca", "amoi", "audi", "avan", "benq",
//                "bird", "blac", "blaz", "brew", "cell", "cldc", "cmd-", "dang",
//                "doco", "eric", "hipt", "inno", "ipaq", "java", "jigs", "kddi",
//                "keji", "leno", "lg-c", "lg-d", "lg-g", "lge-", "maui", "maxo",
//                "midp", "mits", "mmef", "mobi", "mot-", "moto", "mwbp", "nec-",
//                "newt", "noki", "oper", "palm", "pana", "pant", "phil", "play",
//                "port", "prox", "qwap", "sage", "sams", "sany", "sch-", "sec-",
//                "send", "seri", "sgh-", "shar", "sie-", "siem", "smal", "smar",
//                "sony", "sph-", "symb", "t-mo", "teli", "tim-", /*"tosh",*/ "tsm-",
//                "upg1", "upsi", "vk-v", "voda", "wap-", "wapa", "wapi", "wapp",
//                "wapr", "webc", "winw", "winw", "xda", "xda-",
//                "Googlebot-Mobile" };
//        if(request.getHeader("User-Agent") != null){
//            for(String mobileAgent : mobileAgents){
//                if(request.getHeader("User-Agent").toLowerCase()
//                        .indexOf(mobileAgent) >=0){
//                    isMoble = true;
//                    break;
//                }
//            }
//        }
//        return isMoble;
//    }
}
