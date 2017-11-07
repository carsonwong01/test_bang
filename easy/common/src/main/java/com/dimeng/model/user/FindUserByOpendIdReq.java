package com.dimeng.model.user;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 通过opendID查询用户信息
 * <一句话功能简述> 
 * @author  song
 * @version  [版本号, 2016年10月18日]
 */
public class FindUserByOpendIdReq extends BaseReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 9166854632719873002L;
    
    /**
     * opendId第三方用户唯一标识
     */
    @NotBlank
    private String opendId;
    
    /**
     * 类型 2 微信\r\n         3  微博\r\n         4  qq'  5 公众号用户,
     */
    @NotBlank
    private String type;
    
    /**
     * 微信用户和公众号的唯一标识，打通了两种类型
     */
    private String unionId;
    
    private String userId;
    
    public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOpendId()
    {
        return opendId;
    }

    public void setOpendId(String opendId)
    {
        this.opendId = opendId;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
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
