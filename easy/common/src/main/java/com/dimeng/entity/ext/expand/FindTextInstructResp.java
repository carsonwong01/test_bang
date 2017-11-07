/*
 * 文 件 名:  FindTextInstructResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.entity.ext.expand;

import java.io.Serializable;

/**
 * 文本说明响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
public class FindTextInstructResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 7437464413175149356L;
    
    /**
     * ID
     */
    private String textId;
    
    /**
     * 文本说明
     */
    private String textTitle;
    
    /**
     * 文本内容
     */
    private String textContext;
    
    /**
     * 最后更新人
     */
    private String operatorName;
    
    /**
     *  最后更新时间
     */
    private String dateUpdate;
    
    /**
     * @return 返回 textId
     */
    public String getTextId()
    {
        return textId;
    }
    
    /**
     * @param 对textId进行赋值
     */
    public void setTextId(String textId)
    {
        this.textId = textId;
    }
    
    /**
     * @return 返回 textTitle
     */
    public String getTextTitle()
    {
        return textTitle;
    }
    
    /**
     * @param 对textTitle进行赋值
     */
    public void setTextTitle(String textTitle)
    {
        this.textTitle = textTitle;
    }
    
    /**
     * @return 返回 textContext
     */
    public String getTextContext()
    {
        return textContext;
    }
    
    /**
     * @param 对textContext进行赋值
     */
    public void setTextContext(String textContext)
    {
        this.textContext = textContext;
    }
    
    /**
     * @return 返回 operatorName
     */
    public String getOperatorName()
    {
        return operatorName;
    }
    
    /**
     * @param 对operatorName进行赋值
     */
    public void setOperatorName(String operatorName)
    {
        this.operatorName = operatorName;
    }
    
    /**
     * @return 返回 dateUpdate
     */
    public String getDateUpdate()
    {
        return dateUpdate;
    }
    
    /**
     * @param 对dateUpdate进行赋值
     */
    public void setDateUpdate(String dateUpdate)
    {
        this.dateUpdate = dateUpdate;
    }
    
}
