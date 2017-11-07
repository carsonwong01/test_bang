package com.dimeng.model.pay;

import java.util.Map;

/**
 * 
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年3月17日]
 */
public class PostModel
{
    private String actionUrl;

    private Map<String,String> params;

    public String getActionUrl()
    {
        return actionUrl;
    }

    public void setActionUrl(String actionUrl)
    {
        this.actionUrl = actionUrl;
    }

    public Map<String, String> getParams()
    {
        return params;
    }

    public void setParams(Map<String, String> params)
    {
        this.params = params;
    }
}
