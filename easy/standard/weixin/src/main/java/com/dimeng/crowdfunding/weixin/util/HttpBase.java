package com.dimeng.crowdfunding.weixin.util;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletInputStream;
import javax.servlet.http.Part;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Consts;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.NoHttpResponseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.AbstractHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.protocol.HTTP;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.springframework.web.multipart.MultipartFile;

/*
 * 文件名：  HttBase.java 2015-3-3
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描述：    (Initialize)
 * 作者：    huanggang
 * 时间：    2015-3-3

 */

/**
* <p>Title: (Initialize)</p>
* <p>Description: (Initialize)</p>
* @author  huanggang
*/
@SuppressWarnings("deprecation")
public class HttpBase
{
    /**
     * 日志对象
     */
    private static final Log logger = LogFactory.getLog(HttpBase.class);
    

    
    /**
     * http请求
     */
    private HttpUriRequest httpUriRequest;
    
    /**
     * get方法
     */
    private HttpGet httpGet;
    
    /**
     * post方法
     */
    private HttpPost httpPost;
    
    /**
     * get方法
     */
    private HttpPut httpPut;
    
    /**
     * post方法
     */
    private HttpDelete httpDelete;
    
    /**
     *  urlencode form表单参数实体
     */
    private UrlEncodedFormEntity uefEntity;
    
    /**
     * json字符串参数
     */
    private Map<String,Object> reqdata;
    
    /**
     * 请求头
     */
    private Header[] headers;
    
    /**
     * 键值对
     */
    private List<NameValuePair> nameValuePairs;
    
    /**
     * http回应
     */
    private HttpResponse response;
    
    /**
     * http 实体
     */
    private HttpEntity entity;
    
    /**
     * 接口返回值
     */
    private String respondata;
    
    public final static String POSTMETHOD = "post";
    
    public final static String GETMETHOD = "get";
    
    public final static String PUTMETHOD = "put";
    
    public final static String DELETEMETHOD = "delete";
    
    public void setNameValuePairs(List<NameValuePair> nameValuePairs)
    {
        this.nameValuePairs = nameValuePairs;
    }
    
    /**
     * 返回响应数据
     * @return  响应数据
     */
    public String getRespondata()
    {
        return respondata;
    }
    
    /**
     * 设置要发送到json数据，如果需要发送json数据的话
     * @param jsondata json数据
     */
    public void setReqData(Map<String,Object> reqdata)
    {
        this.reqdata = reqdata;
    }
    
    /**
     * 设置http请求头，如果需要设置的话
     * @param headers 请求头
     */
    public void setHeaders(Header[] headers)
    {
        this.headers = headers;
    }
    
    /**
     * 发送http请求
     * @param url 请求地址
     * @param typemethod 请求类型post、get
     * @return 200：成功、-1：失败
     */
    public int send(String url, String typemethod,String auto)
    {
    	
        logger.info("url=" + url + ",typemethod=" + typemethod);
        int state = -1;
        try
        {
        	@SuppressWarnings("deprecation")
			HttpClient httpClient = new DefaultHttpClient();
            initsend(url, typemethod, auto,httpClient);
            HttpProtocolParams.setUseExpectContinue(httpClient.getParams(), false);

            HttpRequestRetryHandler retryHandler = new HttpRequestRetryHandler() {

                public boolean retryRequest(IOException exception, int executionCount,
                        HttpContext context) {
                    // retry a max of 5 times
                    if(executionCount >= 5){
                        return false;
                    }
                    if(exception instanceof NoHttpResponseException){
                        return true;
                    } else if (exception instanceof ClientProtocolException){
                        return true;
                    } 
                    return false;
                }


            };
            ((AbstractHttpClient) httpClient).setHttpRequestRetryHandler(retryHandler);
            response = httpClient.execute(httpUriRequest);
            state = response.getStatusLine().getStatusCode();
            if (state == HttpStatus.SC_OK)
            {
                entity = response.getEntity();
                respondata = new String(EntityUtils.toByteArray(entity), "utf-8");
                //                respondata = EntityUtils.toString(entity);
            }
            logger.info("state=" + state + ",reasonPhrase=" + response.getStatusLine().getReasonPhrase()
                + ",respondata=" + respondata);
        }
        catch (Exception e)
        {
            logger.error("HttpBase.send", e);
        }
        
        return state;
    }
    
    
    
//  public int sendImg(String url1, String typemethod,String auto,ServletInputStream imgStream)
//  {
//	  int res = 0;
//		String BOUNDARY = UUID.randomUUID().toString(); // 边界标识 随机生成
//		String CONTENT_TYPE = "multipart/form-data"; // 内容类型
//		try
//		{
//			URL url = new URL(url1);
//			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
//			conn.setDoInput(true); // 允许输入流
//			conn.setDoOutput(true); // 允许输出流
//			conn.setUseCaches(false); // 不允许使用缓存
//			conn.setRequestMethod("POST"); // 请求方式
//			conn.setRequestProperty("Charset", "utf-8"); // 设置编码
//			conn.setRequestProperty("Connection", "close");
//			System.setProperty("http.keepAlive", "false");
//			conn.setRequestProperty("Content-Type", CONTENT_TYPE + ";boundary=" + BOUNDARY);
//		    conn.setRequestProperty("Authorization", auto);
//		    
//			addRequestBody(imgStream, "1231", BOUNDARY, conn);
//			/** 获取响应码 200=成功 当响应成功，获取响应的流 */
//			res = conn.getResponseCode();
//			if (res == 200)
//			{
////				doAfterUploadSuccess(conn);
//			}
//		}
//		catch (MalformedURLException e)
//		{
//		}
//		catch (IOException e)
//		{
//		}
//		
//      return 0;
//  }
//    
  private void addRequestBody(InputStream imgStream, final String fileName, String boundary, HttpURLConnection conn)
	{
		String PREFIX = "--";
		String LINE_END = "\r\n";
		try
		{
			/**当文件不为空时执行上传 */
			DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
			
			StringBuffer sb = new StringBuffer();
			sb.append(PREFIX);
			sb.append(boundary);
			sb.append(LINE_END);
			/**
			 * 这里重点注意： name里面的值为服务器端需要key 只有这个key 才可以得到对应的文件
			 * filename是文件的名字，包含后缀名
			 */
//			sb.append("Content-Disposition: form-data; name=\"file\";fileName=\"" + fileName + "\"" + LINE_END);
			sb.append("Content-Disposition: form-data; name=\"uploadFile\";fileName=\"" + fileName + "\"" + LINE_END);
			sb.append("Content-Type: image/jpeg; charset=utf-8" + LINE_END);
			sb.append("TYPE = \"APP\"" + LINE_END);
			sb.append(LINE_END);
			dos.write(sb.toString().getBytes());
			byte[] bytes = new byte[1024];
			int len = 0;
			while ((len = imgStream.read(bytes)) != -1)
			{
				dos.write(bytes, 0, len);
			}
			imgStream.close();
			dos.write(LINE_END.getBytes());
			byte[] end_data = (PREFIX + boundary + PREFIX + LINE_END).getBytes();
			dos.write(end_data);
			dos.flush();
		}
		catch (IOException e)
		{
		}
	}
    
    public int sendImg(String url, String typemethod,String auto,List<MultipartFile> files)
    {
    	logger.info("url=" + url + ",typemethod=" + typemethod);
        int state = -1;
        try
        {
        	@SuppressWarnings("deprecation")
			HttpClient httpClient = new DefaultHttpClient();
            httpPost = new HttpPost(url);
            
            MultipartEntityBuilder builder = MultipartEntityBuilder.create();
            builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
            builder.setCharset(Consts.UTF_8);
            for (MultipartFile file : files) {
            	builder.addBinaryBody("uploadFile",file.getBytes(),ContentType.DEFAULT_BINARY, file.getOriginalFilename());
			}
            if(reqdata!=null){
            	for (String key : reqdata.keySet()) {
            		builder.addTextBody(key, reqdata.get(key).toString());
            	}
            }
            HttpEntity entity = builder.build();
            
            
            httpPost.setEntity(entity);
            
            httpUriRequest = httpPost;
            httpUriRequest.addHeader("Authorization", auto);
            response = httpClient.execute(httpUriRequest);
            state = response.getStatusLine().getStatusCode();
            if (state == HttpStatus.SC_OK)
            {
                entity = response.getEntity();
                respondata = new String(EntityUtils.toByteArray(entity), "utf-8");
            }
            logger.info("state=" + state + ",reasonPhrase=" + response.getStatusLine().getReasonPhrase()
                + ",respondata=" + respondata);
        }
        catch (Exception e)
        {
            logger.error("HttpBase.send", e);
        }
        return state;
    }
    
    
    
    
    
    
    
    /**
     * 初始化send方法
     * @param url 请求地址
     * @param typemethod 发送类型
     * @param log 日志
     * @throws UnsupportedEncodingException 不支持Encoding编码异常
     * @throws IOException IO异常
     */
    private void initsend(String url, String typemethod,String auto,HttpClient httpClient)
        throws IOException
    {
    	
    	
        //        url = URLEncoder.encode(url, "UTF-8");
        if ("GET".equals(typemethod.toUpperCase(Locale.getDefault())))
        {
        	StringBuilder param = new StringBuilder();
        	param.append(System.currentTimeMillis());
        	for( String key : reqdata.keySet()){
        		param = param.append("&"+key+"="+reqdata.get(key)+"&");
        	}
        	param.deleteCharAt(param.length()-1);
            httpGet = new HttpGet(url+"?"+param);
            httpUriRequest = httpGet;
        }
        else if ("POST".equals(typemethod.toUpperCase(Locale.getDefault())))
        {
        	String data = JSONObject.fromObject(reqdata).toString();
            httpPost = new HttpPost(url);
            if (nameValuePairs != null && nameValuePairs.size() > 0)
            {
                uefEntity = new UrlEncodedFormEntity(nameValuePairs, "utf-8");
                httpPost.setEntity(uefEntity);
            }
            else if (data != null && !"".equals(data))
            {
                StringEntity stringEntity = new StringEntity(data, "utf-8");
                stringEntity.setContentType("application/json;charset=UTF-8");
                httpPost.setEntity(stringEntity);
            }
            httpUriRequest = httpPost;
        } else if ("PUT".equals(typemethod.toUpperCase(Locale.getDefault()))){
        	 httpPut = new HttpPut(url);
        	 String data = JSONObject.fromObject(reqdata).toString();
        	 if (data != null && !"".equals(data))
             {
                 StringEntity stringEntity = new StringEntity(data, "utf-8");
                 stringEntity.setContentType("application/json;charset=UTF-8");
                 httpPut.setEntity(stringEntity);
             }
        	 httpUriRequest = httpPut;
        }else if ("DELETE".equals(typemethod.toUpperCase())){
        	httpDelete = new HttpDelete(url);
        	StringBuilder param = new StringBuilder();
        	param.append(System.currentTimeMillis());
        	for( String key : reqdata.keySet()){
        		param = param.append("&"+key+"="+reqdata.get(key)+"&");
        	}
        	param.deleteCharAt(param.length()-1);
        	httpDelete = new HttpDelete(url+"?"+param);
        	httpUriRequest = httpDelete;
        }
        
        httpClient =  HttpClients.custom().setConnectionManager(BasePoolingHttpClientConnectionManager.getCm()).build();
        //        }
        if (null != headers)
        {
            Header header = null;
            for (int i = 0; i < headers.length; i++)
            {
                header = headers[i];
                httpUriRequest.addHeader(header);
              
            }
            
        }
        if(!StringUtils.isBlank(auto) && !auto.equals("undefined"))
            httpUriRequest.addHeader("Authorization", auto);
    }
    
    /**
     * 将一个 JavaBean 对象转化为一个 List<NameValuePair>,
     * post请求需要调用，get请求不需要调用
     * @param bean
     *            要转化的JavaBean 对象
     * @return 转化出来的 List 对象
     */
    public List<NameValuePair> convertBean(Object bean)
    {
        nameValuePairs = new ArrayList<NameValuePair>(0);
        @SuppressWarnings("rawtypes")
        Class type = bean.getClass();
        Field[] fields = type.getDeclaredFields();
        try
        {
            boolean accessFlag = false;
            Field f = null;
            for (int i = 0; i < fields.length; i++)
            {
                f = fields[i];
                accessFlag = f.isAccessible();
                f.setAccessible(true);
                if (null != f.get(bean))
                {
                    NameValuePair nvp = new BasicNameValuePair(f.getName(), f.get(bean).toString());
                    nameValuePairs.add(nvp);
                }
                f.setAccessible(accessFlag);
            }
        }
        catch (Exception e)
        {
            logger.error(e);
        }
        
        return nameValuePairs;
    }
    
    /**
     * 
     * 方法表述 是否是https请求
     * @param url 请求地址
     * @return boolean 结果
     */
    public boolean isHttps(String url)
    {
        boolean flag = false;
        if (url.indexOf(":") != -1)
        {
            String tag = url.split(":")[0];
            if ("http".equals(tag))
            {
                flag = false;
            }
            else
            {
                flag = true;
            }
        }
        return flag;
    }
}
