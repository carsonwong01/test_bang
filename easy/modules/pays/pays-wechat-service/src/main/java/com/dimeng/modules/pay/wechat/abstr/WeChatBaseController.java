package com.dimeng.modules.pay.wechat.abstr;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.dimeng.framework.controller.BaseController;
import com.dimeng.modules.pay.wechat.util.BuildFormUtil;
import com.dimeng.modules.pay.wechat.util.Method;

public class WeChatBaseController extends BaseController
{
    
    protected String charSet = "utf-8";
    
    protected final String jsonDataString = "jsonDataString";
    
    protected final String SUCCESS = "SUCCESS";
    
    protected static final Logger logs = Logger.getLogger(WeChatBaseController.class);
    
    /**
     * 数据流输出结果
     * @param response
     * @param jsonDataResp
     * @throws Exception
     */
    protected void writerPrint(HttpServletResponse response, String jsonDataResp)
        throws Exception
    {
        PrintWriter writer = null;
        try
        {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            writer = new PrintWriter(response.getOutputStream());
            writer.print(jsonDataResp);
        }
        catch (Exception e)
        {
            logs.error(e);
        }
        finally
        {
            writer.flush();
            writer.close();
        }
    }
    
    public String notifyTag = "SUCCESS";
    
    protected void writerPrint(HttpServletResponse response, String jsonDataResp, String formUrl, String method)
        throws Exception
    {
        response.setContentType("text/html");
        response.setCharacterEncoding(charSet);
        PrintWriter writer = null;
        if (method.equals(Method.POST.name()))
        {
            Map<String, String> formParam = new HashMap<String, String>();
            formParam.put(jsonDataString, jsonDataResp);
            String jsonDataForm = BuildFormUtil.createForm(formParam, formUrl);
            logs.info(String.format("向平台传回参数:%s", jsonDataForm));
            try
            {
                writer = new PrintWriter(response.getOutputStream());
                writer.print(jsonDataForm);
            }
            catch (Exception e)
            {
                logs.error(e);
            }
            finally
            {
                writer.flush();
                writer.close();
            }
        }
        else
        {
            jsonDataResp = URLEncoder.encode(jsonDataResp, charSet);
            String buildUrl = formUrl.concat("?jsonDataString=").concat(jsonDataResp);
            logs.info(String.format("GET 传回参数:%s", buildUrl));
            response.setContentType("text/html");
            response.sendRedirect(buildUrl);
        }
    }
}
