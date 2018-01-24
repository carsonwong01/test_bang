package com.dimeng.crowdfunding.weixin.util;

import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import javax.net.ssl.SSLContext;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/**
 * 
 * <https忽略密钥链接方法>
 * <通过重写X509TrustManager的方法来达到忽略密钥链接https的实现>
 * 如https端口不是默认443端口则需要更改成指定端口
 * 
 * @author  huanggang
 * @version  [版本号, 2014-1-30]

 */
public class WebClientDevWrapper
{
    @SuppressWarnings("deprecation")
    public static CloseableHttpClient createSSLClientDefault()
    {
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
            return HttpClients.custom().setSSLSocketFactory(sslsf).build();
        }
        catch (KeyManagementException e)
        {
            e.printStackTrace();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch (KeyStoreException e)
        {
            e.printStackTrace();
        }
        return HttpClients.createDefault();
    }
}