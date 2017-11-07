/*
 * 文 件 名:  FindTextInstructReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.model.expand;

import com.dimeng.framework.domain.BaseReq;

/**
 * 文本说明请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
public class TextInstructReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -3048952552033907253L;
    
    /**
     * ID
     */
    private String textId;
    
    /**
     * 文本说明
     */
    private String textTitle;
    
    /**
     * 内容
     */
    private String textContext;
    
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
    
}
