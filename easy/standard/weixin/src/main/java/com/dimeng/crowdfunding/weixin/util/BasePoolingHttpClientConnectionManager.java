/*
 * 文 件 名:  BasePoolingHttpClientConnectionManager.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huanggang
 * 修改时间:  2015年3月4日
 */
package com.dimeng.crowdfunding.weixin.util;

import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;

import javax.net.ssl.SSLContext;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/**
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  huanggang
 * @version  [版本号, 2015年3月4日]
 */
@SuppressWarnings("deprecation")
public class BasePoolingHttpClientConnectionManager
{
    public static HttpClientConnectionManager cm = null;
    static
    {
        RegistryBuilder<ConnectionSocketFactory> registryBuilder = RegistryBuilder.<ConnectionSocketFactory> create();
        ConnectionSocketFactory plainSF = new PlainConnectionSocketFactory();
        registryBuilder.register("http", plainSF);
        //指定信任密钥存储对象和连接套接字工厂  
        try
        {
            SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy()
            {
                //信任所有
                @Override
                public boolean isTrusted(X509Certificate[] chain, String authType)
                    throws CertificateException
                {
                    return true;
                }
            }).build();
            SSLConnectionSocketFactory sslsf =
                new SSLConnectionSocketFactory(sslContext, SSLConnectionSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
            registryBuilder.register("https", sslsf);
        }
        catch (KeyStoreException e)
        {
            throw new RuntimeException(e);
        }
        catch (KeyManagementException e)
        {
            throw new RuntimeException(e);
        }
        catch (NoSuchAlgorithmException e)
        {
            throw new RuntimeException(e);
            
        }
        Registry<ConnectionSocketFactory> registry = registryBuilder.build();
        
        cm = new PoolingHttpClientConnectionManager(registry);
    }
    
    public static HttpClientConnectionManager getCm()
    {
        return cm;
    }
}
