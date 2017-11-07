package com.dimeng.front.controller.easy.common;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.site.SiteProtocolModelResp;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.utils.FrameworkConfigurer;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.home.front.FindLoginNameUniqueReq;
import com.dimeng.model.home.front.FindSendCountReq;
import com.dimeng.model.message.InsertSystemVerifyCodeReq;
import com.dimeng.model.site.protoclModel.FindProtocolModelReq;
import com.dimeng.model.user.FindRegPicCodeReq;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.SystemCache;
import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.util.Config;

@Controller
@RequestMapping("common")
public class CommonController extends BaseController
{
    
    private final Properties props;
    
    private Producer kaptchaProducer;
    
    public CommonController()
    {
        this.props = new Properties();
        
        this.kaptchaProducer = null;
    }
    
    /**
     * 校验图片验证码
     * <功能详细描述>
     * @author   song
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/regPicCodeCheck.do")
    public Object regPicCodeCheck(FindRegPicCodeReq req, HttpServletRequest request, HttpServletResponse response)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        /*  if (Boolean.parseBoolean(SystemCache.getProperty(SystemVariable.VERIFICATION_CODE_IS_OPEN)))
          {*/
        //校验验证码正确性
        String correctCode = (String)request.getSession().getAttribute("KAPTCHA");
        if (StringUtils.isNotBlank(correctCode) && correctCode.equalsIgnoreCase(req.getRegPicCode())
            && req.getRegPicCode().length() == 4)
        {
            map.put("status", true);
            map.put("desc", "验证码正确");
            return map;
        }
        else
        {
            map.put("status", false);
            map.put("desc", "验证码错误");
            return map;
        }
        /* }
        else
        {
        map.put("status", true);
        map.put("desc", "验证码正确");
        return map;
        }*/
    }
    
    /**
     * 校验用户名是否存在
     * <功能详细描述>
     * @param findLoginNameUniqueReq
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/isUserNameExist.do")
    @ResponseBody
    public Map<String, Object> isUserNameExist(FindLoginNameUniqueReq findLoginNameUniqueReq,
        HttpServletRequest request, HttpServletResponse response)
    {
        String sysValue = (String)FrameworkConfigurer.getProperties("crowdfunding_system");
        findLoginNameUniqueReq.setSysType(sysValue);
        Map<String, Object> modelMap = new HashMap<String, Object>();
        //调用接口方法
        String listJson =
            new CommonUtil().callInterfaceMethod(findLoginNameUniqueReq,
                "home/frontRegister/v/userNameUnique",
                RequestMethod.GET,
                request);
        //返回操作码
        modelMap.put(CommonConstant.JSON_KEY_CODE, CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_CODE)
            .toString());
        //返回操作码描述
        modelMap.put(CommonConstant.JSON_KEY_DESCRIPTION,
            CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_DESCRIPTION).toString());
        return modelMap;
    }
    
    /**
     * 发送短信验证码
     * <功能详细描述>
     * @param verifyMethod
     * @param type
     * @param request
     * @return
     */
    @RequestMapping(value = "/sendSmsVerificationCode.do")
    @ResponseBody
    public Map<String, Object> sendSmsVerificationCode(String verifyMethod, String type, HttpServletRequest request)
    {
        //存储请求获取数据
        Map<String, Object> modelMap = new HashMap<String, Object>();
        //新建接口参数对象
        InsertSystemVerifyCodeReq insertSystemVerifyCodeReq = new InsertSystemVerifyCodeReq();
        //发送方式
        insertSystemVerifyCodeReq.setType(type);
        //验证时的手机号或email
        insertSystemVerifyCodeReq.setVerifyMethod(verifyMethod);
        //获取当前的ip地址
        //获取当前登录人IP
        String ip = CommonUtil.getIpAddr(request);
        insertSystemVerifyCodeReq.setIpAddress(ip);
        //调用发送短信接口方法
        String resultJson =
            new CommonUtil().callInterfaceMethod(insertSystemVerifyCodeReq,
                "common/message/v/verifyCode",
                RequestMethod.POST,
                request);
        //操作码
        String code = CommonUtil.getJSONObject(resultJson, CommonConstant.JSON_KEY_CODE).toString();
        //操作码描述
        String description = CommonUtil.getJSONObject(resultJson, CommonConstant.JSON_KEY_DESCRIPTION).toString();
        modelMap.put(CommonConstant.JSON_KEY_CODE, code);
        modelMap.put(CommonConstant.JSON_KEY_DESCRIPTION, description);
        return modelMap;
    }
    
    /**
     * ajax请求发送验证码的次数
     * <功能详细描述>
     * @param registerReq
     * @return
     */
    @RequestMapping(value = "/ckeckSendCount.do")
    @ResponseBody
    public Map<String, Object> ckeckSendCount(FindSendCountReq findReq, HttpServletRequest request)
    {
        //存储请求获取数据
        Map<String, Object> modelMap = new HashMap<String, Object>();
        //获取IP
        findReq.setLoginIp(CommonUtil.getIpAddr(request));
        //调用发送短信接口方法
        String resultJson =
            new CommonUtil().callInterfaceMethod(findReq, "home/frontLogin/v/sendCount", RequestMethod.GET, request);
        //操作码
        String code = CommonUtil.getJSONObject(resultJson, CommonConstant.JSON_KEY_CODE).toString();
        //操作码描述
        String description = CommonUtil.getJSONObject(resultJson, CommonConstant.JSON_KEY_DESCRIPTION).toString();
        modelMap.put(CommonConstant.JSON_KEY_CODE, code);
        modelMap.put(CommonConstant.JSON_KEY_DESCRIPTION, description);
        return modelMap;
    }
    
    /**
     * 校验验证码
     * <功能详细描述>
     * @author  chuzhisheng
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/checkVerificationCode.do")
    @ResponseBody
    public Map<String, Object> checkVerificationCode(InsertSystemVerifyCodeReq insertSystemVerifyCodeReq,
        HttpServletRequest request, HttpServletResponse response)
    {
        
        Map<String, Object> modelMap = new HashMap<String, Object>();
        //调用接口方法
        String listJson =
            new CommonUtil().callInterfaceMethod(insertSystemVerifyCodeReq,
                "common/message/v/commonVerifyCode",
                request);
        //返回操作码
        modelMap.put(CommonConstant.JSON_KEY_CODE, CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_CODE)
            .toString());
        //返回操作码描述
        modelMap.put(CommonConstant.JSON_KEY_DESCRIPTION,
            CommonUtil.getJSONObject(listJson, CommonConstant.JSON_KEY_DESCRIPTION).toString());
        return modelMap;
    }
    
    /**
     * ajax验证码
     * <功能详细描述>
     * @param registerReq
     * @return
     */
    @RequestMapping(value = "/captcha.do")
    @ResponseBody
    public void captcha(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        if (this.kaptchaProducer == null)
        {
            init();
        }
        
        response.setDateHeader("Expires", 0L);
        
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        
        response.setHeader("Pragma", "no-cache");
        
        response.setContentType("image/jpeg");
        
        String capText = StringUtil.genRandomString(4);
        while ((capText.indexOf(48) > -1) || (capText.indexOf(79) > -1) || (capText.indexOf(108) > -1)
            || (capText.indexOf(49) > -1) || (capText.indexOf(73) > -1) || (capText.indexOf(111) > -1))
        {
            capText = StringUtil.genRandomString(4);
        }
        
        request.getSession().setAttribute("KAPTCHA", capText);
        
        BufferedImage buffImg = this.kaptchaProducer.createImage(capText);
        try
        {
            ImageOutputStream out = ImageIO.createImageOutputStream(response.getOutputStream());
            
            ImageIO.write(buffImg, "jpeg", out);
            out.flush();
            out.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /**
     * 查询协议内容
     * <功能详细描述>
     * @author  huxingwei
     * @param protocolReq
     * @param request
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "showAgreement.do")
    public ModelAndView showAgreement(FindProtocolModelReq protocolReq, HttpServletRequest request)
    {
        ModelAndView mv = new ModelAndView("include/common/agreement.base");
        //查询协议
        List<SiteProtocolModelResp> list =
            (List<SiteProtocolModelResp>)SystemCache.getCache(SystemConstant.CacheKey.PROTOCOL_MODEL_LIST);
        if (!StringUtil.isEmpty(protocolReq.getId()) && Integer.parseInt(protocolReq.getId()) <= 3)
        {
            mv.addObject("agreement", list.get(Integer.parseInt(protocolReq.getId()) - 1));
        }
        return mv;
    }
    
    public void init()
    {
        ImageIO.setUseCache(false);
        //this.props.put("kaptcha.border", "no");
        this.props.put("kaptcha.textproducer.font.color", "black");
        this.props.put("kaptcha.textproducer.char.space", "4");
        this.props.put("kaptcha.background.clear.from", "192,192,192");
        this.props.put("kaptcha.background.clear.to", "192,192,192");
        Config config = new Config(this.props);
        this.kaptchaProducer = config.getProducerImpl();
    }
}
