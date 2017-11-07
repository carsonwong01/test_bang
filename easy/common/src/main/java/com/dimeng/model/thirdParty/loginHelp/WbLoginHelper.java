package com.dimeng.model.thirdParty.loginHelp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.framework.utils.FrameworkConfigurer;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.thirdParty.thirdUser.ThirdPartyUser;
import com.dimeng.util.UTF8Utils;

/**
 * 微博第三方登录请求帮助类
 * @author  song
 * @version  [版本号, 2016年10月22日]
 */
public class WbLoginHelper
{
    /**
    * 获取Weibo用户Token
    * <功能详细描述>
    * @param url
    * @param code
    * @param host
    * @return
    * @throws Exception
    */
    public static final Map<String, String> getWbToken(String appid, String appkey, String redirectURI, String code)
        throws Exception
    {
        String url = (String)FrameworkConfigurer.getProperties("wb_accessTokenURL");
        //String redirect_uri = (String)FrameworkConfigurer.getProperties("wb_redirect_URI");  
        Map<String, String> map = new HashMap<String, String>();
        List<NameValuePair> parameters = new ArrayList<NameValuePair>();
        parameters.add(new BasicNameValuePair("client_id", appid));
        parameters.add(new BasicNameValuePair("client_secret", appkey));
        parameters.add(new BasicNameValuePair("grant_type", "authorization_code"));
        parameters.add(new BasicNameValuePair("redirect_uri", redirectURI));
        parameters.add(new BasicNameValuePair("code", code));
        String tokenRes = HttpUtil.httpClientPost(url, parameters);
        JSONObject json = JSON.parseObject(tokenRes);
        if (!json.containsKey("error_code"))
        {
            map.put("access_token", json.get("access_token").toString());
            map.put("uid", json.get("uid").toString());
            map.put("remind_in", json.get("remind_in").toString()); //tonken授权时间
            map.put("expires_in", json.get("expires_in").toString()); //有效期限          授权时间+有效期限=tonken的失效时间
        }
        else
        {
            return null;
        }
        return map;
    }
    
    /**
    * 获取WB登录的用户信息
    * <功能详细描述>
    * @param token
    * @param openid
    * @return
    * @throws Exception
    */
    public static ThirdPartyUser getWbUserinfo(String uid, String token)
        throws Exception
    {
        ThirdPartyUser user = new ThirdPartyUser();
        String url = "https://api.weibo.com/2/users/show.json?uid=" + uid + "&access_token=" + token;
        String res = HttpUtil.httpClientGet(url);
        JSONObject json = JSON.parseObject(res);
        if (!json.containsKey("error_code"))
        {
            user.openid = json.getString("id");
            user.nickName = UTF8Utils.removeFourChar(json.getString("screen_name"));
            String img = json.getString("profile_image_url");
            if (!StringUtil.isEmpty(img))
            {
                user.headImgUrl = img;
            }
            String sex = json.getString("gender");
            //普通用户性别，1为男性，2为女性 3 未知
            if ("m".equals(sex))
            {
                user.gender = "1";
            }
            else if ("f".equals(sex))
            {
                user.gender = "2";
            }
            else
            {
                user.gender = "3";
            }
        }
        else
        {
            return null;
        }
        return user;
    }
}
