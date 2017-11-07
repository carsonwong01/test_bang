package com.dimeng.entity.ext.user;

import com.dimeng.framework.domain.BaseResp;

public class ThirdPartyUserResp  extends BaseResp
{ 

    /**
	 * 
	 */
	private static final long serialVersionUID = 3386371459933224123L;

	/**
	 * 用户id
	 */
	private String userId;
	
	/**
     * 第三方登录授权类型-1手机 2微信 3 微博 4 QQ 5 公众号
     */
    
    private String authorizeType;
    
    /**
     * 普通用户昵称
     */
    private String nickName;
    
    /**
     * 用户头像地址
     */
    private String headImgUrl;
    
    /**
     * 用户性别
     */
    private String gender;
    
    /**
     * 用户认证token
     */
    private String token;
    
    /**
     * token到期时间
     */
    private String tokenExpireIn;
    /**
     * 用户标识
     */
    private String openid;
    
    private String unionId;

    public String getNickName()
    {
        return nickName;
    }

    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }

    public String getHeadImgUrl()
    {
        return headImgUrl;
    }

    public void setHeadImgUrl(String headImgUrl)
    {
        this.headImgUrl = headImgUrl;
    }

    public String getGender()
    {
        return gender;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getToken()
    {
        return token;
    }

    public void setToken(String token)
    {
        this.token = token;
    }

    public String getOpenid()
    {
        return openid;
    }

    public void setOpenid(String openid)
    {
        this.openid = openid;
    }

    public String getAuthorizeType()
    {
        return authorizeType;
    }

    public void setAuthorizeType(String authorizeType)
    {
        this.authorizeType = authorizeType;
    }

    public String getTokenExpireIn()
    {
        return tokenExpireIn;
    }
    
    public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setTokenExpireIn(String tokenExpireIn)
    {
        this.tokenExpireIn = tokenExpireIn;
    }

    public String getUnionId()
    {
        return unionId;
    }

    public void setUnionId(String unionId)
    {
        this.unionId = unionId;
    }

}
