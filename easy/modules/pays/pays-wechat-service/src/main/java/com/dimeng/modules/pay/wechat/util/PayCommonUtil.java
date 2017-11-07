package com.dimeng.modules.pay.wechat.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.xml.sax.SAXException;

import com.dimeng.enums.variable.WeChatVaribles;
import com.dimeng.utils.SystemCache;
import com.sun.mail.util.TraceInputStream;
 
public class PayCommonUtil {
    protected static final Logger logs = Logger.getLogger(PayCommonUtil.class);
	//随机字符串生成
	public static String getRandomString(int length) { //length表示生成字符串的长度    
	       String base = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";       
	       Random random = new Random();       
	       StringBuffer sb = new StringBuffer();       
	       for (int i = 0; i < length; i++) {       
	           int number = random.nextInt(base.length());       
	           sb.append(base.charAt(number));       
	       }       
	       return sb.toString();       
	    }  
	 
	//请求xml组装  
    public static String getRequestXml(SortedMap<String,String> parameters){  
          StringBuffer sb = new StringBuffer();  
          sb.append("<xml>");  
          Set es = parameters.entrySet();  
          Iterator it = es.iterator();  
          while(it.hasNext()) {  
              Map.Entry entry = (Map.Entry)it.next();  
              String key = (String)entry.getKey();  
              String value = (String)entry.getValue();  
          if(!key.contains("sign")){
                  sb.append("<"+key+">"+value+"</"+key+">"); 
          }
          }  
          sb.append("<sign>"+parameters.get("sign")+"</sign>"); 
          sb.append("</xml>");  
          return sb.toString();  
      }  
    //生成签名  
    public static String createSign(String characterEncoding,Map<String, String> map){  
          StringBuffer sb = new StringBuffer();  
          Set es = map.entrySet();  
          Iterator it = es.iterator();  
          while(it.hasNext()) {  
              Map.Entry entry = (Map.Entry)it.next();  
              String k = (String)entry.getKey();  
              Object v = entry.getValue();  
              if(null != v && !"".equals(v)  
                      && !"sign".equals(k) && !"key".equals(k)) {  
                  sb.append(k + "=" + v + "&");  
              }  
          }  
          sb.append("key=" +  SystemCache.getProperty(WeChatVaribles.WECHAT_API_KEY));  
          System.out.println(sb.toString());
          String sign = MD5Util.MD5Encode(sb.toString(), characterEncoding).toUpperCase();  
          return sign;  
      }  
	  //请求方法
	  public static String httpsRequest(String requestUrl, String requestMethod, String outputStr) {
	        try {
	           
	            URL url = new URL(requestUrl);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	          
	            conn.setDoOutput(true);
	            conn.setDoInput(true);
	            conn.setUseCaches(false);
	            // 设置请求方式（GET/POST）
	            conn.setRequestMethod(requestMethod);
	            conn.setRequestProperty("content-type", "application/x-www-form-urlencoded");
	            // 当outputStr不为null时向输出流写数据
	            if (null != outputStr) {
	                OutputStream outputStream = conn.getOutputStream();
	                // 注意编码格式
	                outputStream.write(outputStr.getBytes("UTF-8"));
	                outputStream.close();
	            }
	            // 从输入流读取返回内容
	            InputStream inputStream = conn.getInputStream();
	            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
	            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
	            String str = null;
	            StringBuffer buffer = new StringBuffer();
	            while ((str = bufferedReader.readLine()) != null) {
	                buffer.append(str);
	            }
	            // 释放资源
	            bufferedReader.close();
	            inputStreamReader.close();
	            inputStream.close();
	            inputStream = null;
	            conn.disconnect();
	            return buffer.toString();
	        } catch (ConnectException ce) {
	            System.out.println("连接超时：{}"+ ce);
	        } catch (Exception e) {
	        	System.out.println("https请求异常：{}"+ e);
	        }
	        return null;
	    }
//	   
	  //xml解析
	  public static Map doXMLParse(String strxml) throws JDOMException, IOException {
	        strxml = strxml.replaceFirst("encoding=\".*\"", "encoding=\"UTF-8\"");

	        if(null == strxml || "".equals(strxml)) {
	            return null;
	        }
	        
	        Map m = new HashMap();
	        
	        InputStream in = new ByteArrayInputStream(strxml.getBytes("UTF-8"));
	        SAXBuilder builder = new SAXBuilder();
	        Document doc = builder.build(in);
	        Element root = doc.getRootElement();
	        List list = root.getChildren();
	        Iterator it = list.iterator();
	        while(it.hasNext()) {
	            Element e = (Element) it.next();
	            String k = e.getName();
	            String v = "";
	            List children = e.getChildren();
	            if(children.isEmpty()) {
	                v = e.getTextNormalize();
	            } else {
	                v = getChildrenText(children);
	            }
	            
	            m.put(k, v);
	        }
	        
	        //关闭流
	        in.close();
	        
	        return m;
	    }
	  //xml解析
      public static SortedMap doXMLParseToSortMap(String strxml) throws JDOMException, IOException {
            strxml = strxml.replaceFirst("encoding=\".*\"", "encoding=\"UTF-8\"");

            if(null == strxml || "".equals(strxml)) {
                return null;
            }
            
            SortedMap<String , String> m = new TreeMap<String, String>();
            
            InputStream in = new ByteArrayInputStream(strxml.getBytes("UTF-8"));
            SAXBuilder builder = new SAXBuilder();
            Document doc = builder.build(in);
            Element root = doc.getRootElement();
            List list = root.getChildren();
            Iterator it = list.iterator();
            while(it.hasNext()) {
                Element e = (Element) it.next();
                String k = e.getName();
                String v = "";
                List children = e.getChildren();
                if(children.isEmpty()) {
                    v = e.getTextNormalize();
                } else {
                    v = getChildrenText(children);
                }
                
                m.put(k, v);
            }
            
            //关闭流
            in.close();
            
            return m;
        }
	  public static String getChildrenText(List children) {
	        StringBuffer sb = new StringBuffer();
	        if(!children.isEmpty()) {
	            Iterator it = children.iterator();
	            while(it.hasNext()) {
	                Element e = (Element) it.next();
	                String name = e.getName();
	                String value = e.getTextNormalize();
	                List list = e.getChildren();
	                sb.append("<" + name + ">");
	                if(!list.isEmpty()) {
	                    sb.append(getChildrenText(list));
	                }
	                sb.append(value);
	                sb.append("</" + name + ">");
	            }
	        }
	        
	        return sb.toString();
	    }
 
		  
		

		public static String byteToStr(byte[] byteArray) {
			String strDigest = "";
			for (int i = 0; i < byteArray.length; i++) {
				strDigest += byteToHexStr(byteArray[i]);
			}
			return strDigest;
		}


	 


		/** * 将字节转换为十六进制字符串 * * @param btyes * @return */
		public static String byteToHexStr(byte bytes) {
			char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
					'B', 'C', 'D', 'E', 'F' };
			char[] tempArr = new char[2];
			tempArr[0] = Digit[(bytes >>> 4) & 0X0F];
			tempArr[1] = Digit[bytes & 0X0F];
			String s = new String(tempArr);
			return s;
		}
		   /**
	     * 检验API返回的数据里面的签名是否合法，避免数据在传输的过程中被第三方篡改
	     * @param map API返回的XML数据字符串
	     * @return API签名是否合法
	     * @throws ParserConfigurationException
	     * @throws IOException
	     * @throws SAXException
	     * @throws JDOMException 
	     */
	    public static boolean checkIsSignValidFromResponseString(SortedMap<String, String> map) throws ParserConfigurationException, IOException, SAXException, JDOMException {
	     
	        logs.info(map.toString());

	        String signFromAPIResponse = map.get("sign").toString();
	        if(signFromAPIResponse=="" || signFromAPIResponse == null){
	            logs.info("API返回的数据签名数据不存在，有可能被第三方篡改!!!");
	            return false;
	        }
	        logs.info("服务器回包里面的签名是:" + signFromAPIResponse);
	        //清掉返回数据对象里面的Sign数据（不能把这个数据也加进去进行签名），然后用签名算法进行签名
	        map.put("sign","");
	        //将API返回的数据根据用签名算法进行计算新的签名，用来跟API返回的签名进行比较
//	        String signForAPIResponse = createSign("UTF-8",map);
	        String sign = RequestHandler. createSign(map);
	        if(!sign.equals(signFromAPIResponse)){
	            //签名验不过，表示这个API返回的数据有可能已经被篡改了
	            logs.info("API返回的数据签名验证不通过，有可能被第三方篡改!!!");
	            return false;
	        }
	        logs.info("恭喜，API返回的数据签名验证通过!!!");
	        return true;
	    }

		 
		 
}