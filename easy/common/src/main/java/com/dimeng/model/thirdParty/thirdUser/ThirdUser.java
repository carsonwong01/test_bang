package com.dimeng.model.thirdParty.thirdUser;

import java.sql.Timestamp;

import com.dimeng.entity.table.user.TUser; 

/**
 * 
 * 查询本地与第三方关联的用户信息 
 * @author  song
 * @version  [版本号, 2016年9月18日]
 */
public class ThirdUser extends TUser
{
    private static final long serialVersionUID = -8661769881937926648L;
     
    /**
     * 第三方用户唯一码
     */
    public String openId;
    
    /**
     * 是否授权
     */
    public boolean isAuthorize;
    
    /**
     * 最后登录时间
     */
    public Timestamp loginDate;
    
    /**
     * 是否qq授权
     */
    public String qqTen = "N";
    
    /**
     * 第三方登录授权码
     */
    public String token;
    
    /**
     * 授权码授权时间
     */
    public Long tokenTime;
    
    /**
     * 是否微信授权
     */
    public String wxAuth;
    
    /**
     * 账户状态
     */
    public boolean status;
}