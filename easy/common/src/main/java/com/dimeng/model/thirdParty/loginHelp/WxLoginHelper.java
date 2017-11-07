package com.dimeng.model.thirdParty.loginHelp;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.framework.utils.FrameworkConfigurer;
import com.dimeng.model.thirdParty.thirdUser.ThirdPartyUser;
import com.dimeng.util.UTF8Utils;

/**
 * <第三方微信登录帮助类> 
 * @author  song
 * @version  [版本号, 2016年10月18日]
 */
public class WxLoginHelper
{
    /**
    * 获取微信用户登录用户的Token和用户openId
    * <功能详细描述>
    * @param url
    * @param code
    * @param host
    * @return
    * @throws Exception
    */
    public static final Map<String, String> getWxTokenAndOpenid(String appid, String secret, String code)
        throws Exception
    {
        String url = (String)FrameworkConfigurer.getProperties("wx_accessTokenURL");
        url = url + "?appid=" + appid + "&secret=" + secret + "&code=" + code + "&grant_type=authorization_code";
        Map<String, String> map = new HashMap<String, String>();
        // 获取令牌
        String tokenRes = HttpUtil.httpClientGet(url);
        JSONObject json = JSON.parseObject(tokenRes);
        if (!json.containsKey("errcode"))
        {
            map.put("access_token", json.get("access_token").toString());
            map.put("expires_in", json.get("expires_in").toString());
            map.put("refresh_token", json.get("refresh_token").toString());
            map.put("openid", json.get("openid").toString());
            if (json.containsKey("unionid"))
            {
                map.put("unionid", json.get("unionid").toString());
            }
            else
            {
                map.put("unionid", null);
            }
            
        }
        else
        {
            return null;
        }
        return map;
    }
    
    /**
    * 获取微信登录的用户信息
    * <功能详细描述>
    * @param token
    * @param openid
    * @return
    * @throws Exception
    */
    public static ThirdPartyUser getWxUserinfo(String token, String openid)
        throws Exception
    {
        ThirdPartyUser user = new ThirdPartyUser();
        String url = (String)FrameworkConfigurer.getProperties("wx_getUserInfoURL");
        url = url + "?access_token=" + token + "&openid=" + openid + "&lang=zh_CN";
        String res = HttpUtil.httpClientGet(url);
        JSONObject json = JSON.parseObject(res);
        if (!json.containsKey("errcode"))
        {
            user.openid = json.getString("openid");
            user.nickName = UTF8Utils.removeFourChar(json.getString("nickname"));
            user.headImgUrl = json.getString("headimgurl");
            user.gender = json.getString("sex");
        }
        else
        {
            return null;
        }
        return user;
    }
}
