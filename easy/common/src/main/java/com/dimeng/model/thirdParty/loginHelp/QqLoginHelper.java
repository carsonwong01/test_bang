package com.dimeng.model.thirdParty.loginHelp;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.framework.utils.FrameworkConfigurer;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.thirdParty.thirdUser.ThirdPartyUser;
import com.dimeng.util.UTF8Utils;

/**
 * QQ授权登录帮助类
 * @author  song
 * @version  [版本号, 2016年10月18日]
 */
public class QqLoginHelper
{
    /**
     * 获取QQ用户Token
     * <功能详细描述>
     * @param url
     * @param code
     * @param host
     * @return
     * @throws Exception
     */
    public static final Map<String, String> getQqToken(String type, String appid, String appkey, String redirectURI,
        String code)
        throws Exception
    {
        String url = (String)FrameworkConfigurer.getProperties("qq_accessTokenURL");
        /*if(type == "pc"){
            //redirect_uri  PC回调地址
            url = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&redirect_uri=XXXXXXXX";
        }else{  
            //wap移动端   redirect_uri  移动端回调地址
            url = "https://graph.z.qq.com/moc2/token?grant_type=authorization_code&redirect_uri=XXXXXXXX";
        }*/
        redirectURI = URLEncoder.encode(redirectURI, "utf-8");
        url =
            url + "?grant_type=authorization_code&client_id=" + appid + "&client_secret=" + appkey + "&code=" + code
                + "&redirect_uri=" + redirectURI;
        Map<String, String> map = new HashMap<String, String>();
        String tokenRes = HttpUtil.httpClientGet(url);
        if (tokenRes.indexOf("error") == -1)
        {
            String[] info = tokenRes.split("&");
            for (String str : info)
            {
                map.put(str.split("=")[0], str.split("=")[1]);
            }
            return map;
        }
        else
        {
            return null;
        }
    }
    
    /**
     * 刷新用户的token信息
     * 返回最新token
     * <功能详细描述>
     */
    public static final Map<String, String> refreshToken(String type, String appid, String appkey, String refreshToken)
    {
        String url;
        if (type.equals("pc"))
        {
            url = "https://graph.qq.com/oauth2.0/token?grant_type=refresh_token";
        }
        else
        {
            url = "https://graph.z.qq.com/moc2/token?grant_type=refresh_token";
        }
        url = url + "&client_id=" + appid + "&client_secret=" + appkey + "&refresh_token=" + refreshToken;
        
        Map<String, String> map = new HashMap<String, String>();
        String tokenRes = HttpUtil.httpClientGet(url);
        JSONObject json = JSONObject.parseObject(tokenRes, JSONObject.class);
        if ((int)json.get("ret") == 0)
        {
            map.put("access_token", json.get("access_token").toString());
            map.put("refresh_token", json.get("refresh_token").toString());
        }
        else
        {
            throw new IllegalArgumentException("THIRDPARTY.LOGIN.NOTOKEN");
        }
        return map;
    }
    
    /**
     * 获取用户openID
     * <功能详细描述>
     */
    public static final Map<String, String> getOpenID(String type, String accessToken)
    {
        String url = (String)FrameworkConfigurer.getProperties("qq_getOpenIDURL");
        /*if(type.equals("pc")){
            url = url.trim()+"?access_token="+accessToken;
        }else{
            url = "https://graph.z.qq.com/moc2/me?access_token="+accessToken;
        } */
        url = url.trim() + "?access_token=" + accessToken;
        Map<String, String> map = new HashMap<String, String>();
        String tokenRes = HttpUtil.httpClientGet(url);
        if (tokenRes == null)
        {
            return null;
        }
        tokenRes = tokenRes.split("\\(")[1].split("\\)")[0].trim();
        JSONObject json = JSON.parseObject(tokenRes);
        if (!json.containsKey("error_code"))
        {
            map.put("openId", json.get("openid").toString());
        }
        else
        {
            return null;
        }
        return map;
    }
    
    /**
    * 获取QQ登录的用户信息
    * <功能详细描述>
    * @param token
    * @param openid
    * @return
    * @throws Exception
    */
    public static ThirdPartyUser getQqUserinfo(String openid, String appid, String token)
        throws Exception
    {
        ThirdPartyUser user = new ThirdPartyUser();
        String url = (String)FrameworkConfigurer.getProperties("qq_getUserInfoURL");
        url = url + "?oauth_consumer_key=" + appid + "&access_token=" + token + "&openid=" + openid;
        String res = HttpUtil.httpClientGet(url);
        JSONObject json = JSON.parseObject(res);
        if (!json.containsKey("error_code"))
        {
            user.openid = openid;
            user.nickName = UTF8Utils.removeFourChar(json.getString("nickname"));
            String img = json.getString("figureurl_qq_2");
            if (!StringUtil.isEmpty(img))
            {
                user.headImgUrl = img;
            }
            String sex = json.getString("gender");
            //普通用户性别，1为男性，2为女性
            if ("男".equals(sex))
            {
                user.gender = "1";
            }
            else
            {
                user.gender = "2";
            }
        }
        else
        {
            return null;
        }
        return user;
    }
}
