/*
 * 文 件 名:  WxShareController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  wenguanhai
 * 修改时间:  2016年12月2日
 */
package com.dimeng.platform.controller.thirdParty;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.Element;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.utils.FrameworkConfigurer;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.thirdParty.loginHelp.HttpUtil;
import com.dimeng.modules.pay.wechat.util.Sha1Util;
import com.dimeng.utils.SystemCache;

/**
 * 微信分享
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年12月2日]
 */
@Controller
@RequestMapping(value = "share")
public class WxShareController extends BaseController
{
    
    private final static String CONTEXT_KEY_TOKEN = "qsc_weixin_token";
    
    private final static String CONTEXT_KEY_JSTICKET = "qsc_weixin_js_ticket";
    
    private final static String CONTEXT_WEIXIN = "qsc_weixin_cache";
    
    /**
     * 微信app获取token地址
     */
    private final static String WX_APP_ACCESS_TOKEN_URL =
        (String)FrameworkConfigurer.getProperties("wx_app_access_token_url");
    
    /**
     * 微信app获取ticket地址
     */
    private final static String WX_JSAPI_TICKET_URL = (String)FrameworkConfigurer.getProperties("wx_jsapi_ticket_url");
    
    /**
     * 获取微信jsTicket分享信息
     * @param request
     * @param response
     */
    @RequestMapping(value = "/{v}/wx/getJsTicketInfo", method = RequestMethod.GET, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object getJsTicket(HttpServletRequest request, HttpServletResponse response)
    {
        BaseDataResp resp = new BaseDataResp();
        String url = request.getParameter("url");
        logs.info("url:" + url);
        //url必传
        if (StringUtil.isEmpty(url))
        {
            resp.setCode(IDiMengResultCode.Trust.ERROR_PARAM);
            return resp;
        }
        
        final int urlHash = url.hashCode();
        final JSONObject tokenInfo =
            getToken(urlHash,
                request,
                SystemCache.getProperty(EasySystemVariable.WXGZH_APPID),
                SystemCache.getProperty(EasySystemVariable.WXGZH_SECRET));
        JSONObject jsticketInfo =
            getJsTicket(tokenInfo, urlHash, SystemCache.getProperty(EasySystemVariable.WXGZH_APPID), request);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        resp.setData(jsticketInfo);
        logs.info("jsticketInfo:" + jsticketInfo.toJSONString());
        return resp;
    }
    
    /**
     * 获取access_token
     * 
     * @param urlHash 请求URLcash值
     * @param request 请求消息
     * @param appId 微信公众号appId
     * @param secret 微信公众号
     * @return access_token
     */
    private JSONObject getToken(final int urlHash, final HttpServletRequest request, final String appId,
        final String secret)
    {
        JSONObject tokenInfo = this.getCache(CONTEXT_KEY_TOKEN + urlHash);
        if (tokenInfo == null || tokenInfo.getLongValue("expiresTime") < new Date().getTime())
        {
            String res = HttpUtil.httpClientGet(WX_APP_ACCESS_TOKEN_URL + "&appid=" + appId + "&secret=" + secret + "");
            tokenInfo = JSON.parseObject(res);
            long _curentTime = new Date().getTime();
            long expiresIn = tokenInfo.getLongValue("expires_in");
            tokenInfo.put("expiresTime", (_curentTime + expiresIn * 1000));
            this.syncCache(CONTEXT_KEY_TOKEN + urlHash, tokenInfo);
            tokenInfo.put("timestamp", _curentTime);
        }
        return tokenInfo;
    }
    
    /**
     * 获取JS的鉴权信息
     * 
     * @param tokenInfo access_token
     * @param urlHash 请求URLcash值
     * @param appId 微信公众号appId
     * @param request 请求消息
     * @return JS的鉴权信息
     */
    private JSONObject getJsTicket(final JSONObject tokenInfo, final int urlHash, final String appId,
        final HttpServletRequest request)
    {
        JSONObject ticketInfo = getCache(CONTEXT_KEY_JSTICKET + urlHash);
        String token = tokenInfo.getString("access_token");
        long _curentTime = new Date().getTime();
        if (ticketInfo == null || ticketInfo.getLongValue("expiresTime") < new Date().getTime())
        {
            String res = HttpUtil.httpClientGet(WX_JSAPI_TICKET_URL + token);
            ticketInfo = JSON.parseObject(res);
            long expiresIn = ticketInfo.getLongValue("expires_in");
            ticketInfo.put("expiresTime", (_curentTime + expiresIn * 1000));
            ticketInfo.put("url", request.getParameter("url").split("#")[0]);
            ticketInfo.put("appId", appId);
            syncCache(CONTEXT_KEY_JSTICKET + urlHash, ticketInfo);
        }
        //时间戳和签名每次请求都改变
        ticketInfo.put("timestamp", _curentTime / 1000);
        ticketInfo.put("noncestr", Sha1Util.getNonceStr());
        buildJsSignature(ticketInfo);
        return ticketInfo;
    }
    
    /**
     * 生成鉴权消息中的加密串
     * 
     * @param ticketInfo
     */
    private void buildJsSignature(JSONObject ticketInfo)
    {
        StringBuffer encryptBase = new StringBuffer();
        encryptBase.append("jsapi_ticket=" + ticketInfo.getString("ticket"));
        encryptBase.append("&noncestr=" + ticketInfo.getString("noncestr"));
        encryptBase.append("&timestamp=" + ticketInfo.getString("timestamp"));
        encryptBase.append("&url=" + ticketInfo.getString("url"));
        String encryptResult = Sha1Util.getSha1(encryptBase.toString());
        ticketInfo.put("signature", encryptResult);
    }
    
    /**
     * 缓存数据
     * 
     * @param type
     * @param ins
     * @param request
     */
    @SuppressWarnings("unchecked")
    private void syncCache(final String type, final JSONObject ins)
    {
        Element cache = systemCache.get(CONTEXT_WEIXIN);
        Map<String, JSONObject> map = null;
        if (cache == null)
        {
            map = new HashMap<String, JSONObject>();
            cache = new Element(CONTEXT_WEIXIN, map);
        }
        else
        {
            map = (Map<String, JSONObject>)cache.getValue();
        }
        map.put(type, ins);
        systemCache.put(cache);
    }
    
    /**
     * 获取缓存数据
     * 
     * @param type
     * @param request
     * @return
     */
    @SuppressWarnings("unchecked")
    private JSONObject getCache(final String type)
    {
        Element cache = systemCache.get(CONTEXT_WEIXIN);
        if (cache == null)
        {
            return null;
        }
        Map<String, JSONObject> map = (Map<String, JSONObject>)cache.getValue();
        if (map == null)
        {
            return null;
        }
        return map.get(type);
    }
}
