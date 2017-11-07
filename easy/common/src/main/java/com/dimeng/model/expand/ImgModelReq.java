/*
 * 文 件 名:  ImgModelReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.model.expand;

import com.dimeng.framework.domain.BaseReq;

/**
 * 运营管理图片模板请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
public class ImgModelReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -8818334513978902326L;
    
    /**
     * 图片模板id
     */
    private String templateId;
    
    /**
     * 图片ID
     */
    private String imageId;
    
    /**
     * 图片URL
     */
    private String imageUrl;
    
    /**
     * 操作人id
     */
    private String operatorId;
    
    /**
     * @return 返回 templateId
     */
    public String getTemplateId()
    {
        return templateId;
    }
    
    /**
     * @param 对templateId进行赋值
     */
    public void setTemplateId(String templateId)
    {
        this.templateId = templateId;
    }
    
    /**
     * @return 返回 imageId
     */
    public String getImageId()
    {
        return imageId;
    }
    
    /**
     * @param 对imageId进行赋值
     */
    public void setImageId(String imageId)
    {
        this.imageId = imageId;
    }
    
    /**
     * @return 返回 imageUrl
     */
    public String getImageUrl()
    {
        return imageUrl;
    }
    
    /**
     * @param 对imageUrl进行赋值
     */
    public void setImageUrl(String imageUrl)
    {
        this.imageUrl = imageUrl;
    }
    
    /**
     * @return 返回 operatorId
     */
    public String getOperatorId()
    {
        return operatorId;
    }
    
    /**
     * @param 对operatorId进行赋值
     */
    public void setOperatorId(String operatorId)
    {
        this.operatorId = operatorId;
    }
    
}
