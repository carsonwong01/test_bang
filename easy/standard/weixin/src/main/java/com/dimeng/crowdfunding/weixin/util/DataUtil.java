package com.dimeng.crowdfunding.weixin.util;

import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DataUtil {

	public static String getParams(HttpServletRequest request, String param)
			throws UnsupportedEncodingException {
		if (!StringUtils.isBlank(request.getParameter(param))) {
			String result = request.getParameter(param);
			 Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
		        Matcher m = p.matcher(result);
		    if(m.find()){
			return URLEncoder.encode(result,"UTF-8");
		    }else{
		    	return result;
		    }
			

		} else {
			return null;
		}
	}
}
