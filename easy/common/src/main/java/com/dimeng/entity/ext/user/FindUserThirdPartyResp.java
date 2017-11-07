package com.dimeng.entity.ext.user;

import java.io.Serializable;

/**
 * 第三方账户信息resp
 * @author  song
 * @version  [版本号, 2016年10月14日]
 */
public class FindUserThirdPartyResp  implements Serializable
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 1563767116251844634L;
    
    private String id;
    
    private String headUrl;
    
    private String nickName;
    
    private String opendId;

    public String getHeadUrl()
    {
        return headUrl;
    }

    public void setHeadUrl(String headUrl)
    {
        this.headUrl = headUrl;
    }

    public String getNickName()
    {
        return nickName;
    }

    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }

    public String getOpendId()
    {
        return opendId;
    }

    public void setOpendId(String opendId)
    {
        this.opendId = opendId;
    }

    public static long getSerialversionuid()
    {
        return serialVersionUID;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }
    
}
