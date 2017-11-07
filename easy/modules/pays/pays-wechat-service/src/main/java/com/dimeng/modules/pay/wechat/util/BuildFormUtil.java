package com.dimeng.modules.pay.wechat.util;

import java.util.Map;

import org.apache.log4j.Logger;

/**
 * 
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年8月16日]
 */
public class BuildFormUtil
{
    protected static final Logger logs = Logger.getLogger(BuildFormUtil.class);
    
    /**
     * 根据参数创建提交与发送form表单
     * @param param
     * @param formUrl
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unused")
    public static String createForm(Map<String, String> param, String formUrl)
        throws Exception
    {
        
        if ("".equals(formUrl) || formUrl == null)
            return null;
        
        //因为第三方各个指定的编码格式不一样，所以如果需要其它格式的编码，在此处可扩展
        String encoding = "UTF-8";
        if (param.containsKey("Character_Encoding"))
        {
            encoding = param.get("Character_Encoding");
            param.remove("Character_Encoding");
        }
        
        StringBuilder builder = new StringBuilder();
        StringBuilder outParam = new StringBuilder();
        builder.append("<form action='");
        builder.append(formUrl);
        builder.append("' method=\"post\">");
        for (String key : param.keySet())
        {
            builder.append("<input type=\"hidden\" name=\"" + key + "\" value='");
            builder.append(param.get(key));
            builder.append("' />");
            outParam.append("&");
            outParam.append(key);
            outParam.append("=");
            outParam.append(param.get(key));
        }
        builder.append("</form>");
        builder.append("<script type=\"text/javascript\">");
        builder.append("document.forms[0].submit();");
        builder.append("</script>");
        return builder.toString();
    }
}
