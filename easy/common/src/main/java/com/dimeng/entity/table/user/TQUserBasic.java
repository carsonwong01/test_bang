package com.dimeng.entity.table.user;

import java.util.Date;

public class TQUserBasic
{
    private String userId;
    
    private String nickName;
    
    private String realName;
    
    private String idcardStatus;
    
    private Date idCardAuditTime;
    
    private String idCard;
    
    private String idCard2;
    
    private String imageUrl;
    
    private String imageId;
    
    private String sex;
    
    private Integer platformCardBind;
    
    public String getUserId()
    {
        return userId;
    }
    
    public void setUserId(String userId)
    {
        this.userId = userId == null ? null : userId.trim();
    }
    
    public String getNickName()
    {
        return nickName;
    }
    
    public void setNickName(String nickName)
    {
        this.nickName = nickName == null ? null : nickName.trim();
    }
    
    public String getRealName()
    {
        return realName;
    }
    
    public void setRealName(String realName)
    {
        this.realName = realName == null ? null : realName.trim();
    }
    
    public String getIdcardStatus()
    {
        return idcardStatus;
    }
    
    public void setIdcardStatus(String idcardStatus)
    {
        this.idcardStatus = idcardStatus == null ? null : idcardStatus.trim();
    }
    
    public String getIdCard()
    {
        return idCard;
    }
    
    public void setIdCard(String idCard)
    {
        this.idCard = idCard == null ? null : idCard.trim();
    }
    
    public String getIdCard2()
    {
        return idCard2;
    }
    
    public void setIdCard2(String idCard2)
    {
        this.idCard2 = idCard2 == null ? null : idCard2.trim();
    }
    
    public String getImageUrl()
    {
        return imageUrl;
    }
    
    public void setImageUrl(String imageUrl)
    {
        this.imageUrl = imageUrl == null ? null : imageUrl.trim();
    }
    
    public String getImageId()
    {
        return imageId;
    }
    
    public void setImageId(String imageId)
    {
        this.imageId = imageId == null ? null : imageId.trim();
    }
    
    public String getSex()
    {
        return sex;
    }
    
    public void setSex(String sex)
    {
        this.sex = sex == null ? null : sex.trim();
    }
    
    public Integer getPlatformCardBind()
    {
        return platformCardBind;
    }
    
    public void setPlatformCardBind(Integer platformCardBind)
    {
        this.platformCardBind = platformCardBind;
    }
     
    public Date getIdCardAuditTime()
    {
        return idCardAuditTime;
    }

    public void setIdCardAuditTime(Date idCardAuditTime)
    {
        this.idCardAuditTime = idCardAuditTime;
    }
}