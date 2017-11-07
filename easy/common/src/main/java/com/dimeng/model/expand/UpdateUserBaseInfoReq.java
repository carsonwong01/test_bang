package com.dimeng.model.expand;

import org.hibernate.validator.constraints.Length;

import com.dimeng.framework.domain.BaseReq;

/**
 * 修改用户基本信息请求实体
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月20日]
 */
public class UpdateUserBaseInfoReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 4493342786010209023L;
    
    /**
     * 昵称
     */
    @Length(max = 50)
    private String nickName;
    
    private String imageId;
    
    private String imageUrl;
    
    public String getNickName()
    {
        return nickName;
    }
    
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
    public String getImageId()
    {
        return imageId;
    }
    
    public void setImageId(String imageId)
    {
        this.imageId = imageId;
    }
    
    public String getImageUrl()
    {
        return imageUrl;
    }
    
    public void setImageUrl(String imageUrl)
    {
        this.imageUrl = imageUrl;
    }
    
}
