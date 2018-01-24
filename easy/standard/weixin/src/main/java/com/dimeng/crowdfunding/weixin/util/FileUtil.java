package com.dimeng.crowdfunding.weixin.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class FileUtil {

	 
	 public  Properties loadProperty() {  
		Properties properties = new Properties();
		    try {  
		           InputStream is=this.getClass().getResourceAsStream("/config.properties");  
		           properties.load(is);  
		        is.close();  
		    } catch (IOException e) {  
		        e.printStackTrace();  
		    }  
		    return properties;  
		}  

	public static String getValueProperties(String name) {
		 FileUtil util = new FileUtil();
		return util.loadProperty().getProperty(name);
	}
}
