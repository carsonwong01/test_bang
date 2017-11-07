package com.dimeng.model.thirdParty.thirdUser;

/** 
 * 
 * 第三方授权用户实体类
 * @author  song
 * @version  [版本号, 2016年9月18日]
 */
public class ThirdPartyUser
{
    /**
     * 普通用户昵称
     */
    public String nickName;
    
    /**
     * 用户头像地址
     */
    public String headImgUrl;
    
    /**
     * 用户性别
     */
    public String gender;
    
    /**
     * 用户认证token
     */
    public String token;
    
    /**
     * 用户标识
     */
    public String openid;
    
    /**
     * wx网站运用和公众号的关联id，同一个用户的unionid 是相同
     */
    public String unionid;
}
