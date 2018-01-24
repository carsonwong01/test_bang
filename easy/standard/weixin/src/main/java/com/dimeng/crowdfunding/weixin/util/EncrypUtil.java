package com.dimeng.crowdfunding.weixin.util;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
/**
 * 加密工具类
 * @author  jiaohongyun
 * @date 2015年6月5日
 */
public class EncrypUtil {
    //	private static SecretKeySpec skeySpec = null;
    //
    //	private static Cipher cipherEncrypt;
    //
    //	private static Cipher cipherDecrypt;
    //
    //	private static IvParameterSpec iv;
    //
    //	/**
    //	 * 加密
    //	 * <功能详细描述>
    //	 * @param sSrc
    //	 * @return
    //	 * @throws Exception
    //	 */
    //	public static String encrypt(String sSrc, String send)
    //	{
    //
    //		init(send);
    //
    //		try
    //		{
    //			return Base64.encodeToString(cipherEncrypt.doFinal(sSrc.getBytes("utf-8")), Base64.NO_WRAP);
    //		}
    //		catch (IllegalBlockSizeException e)
    //		{
    //			e.printStackTrace();
    //		}
    //		catch (BadPaddingException e)
    //		{
    //			e.printStackTrace();
    //		}
    //		catch (UnsupportedEncodingException e)
    //		{
    //			e.printStackTrace();
    //		}
    //		return sSrc;
    //	}
    //
    //	/**
    //	 * 初始化
    //	 * @param send
    //	 */
    //	private static void init(String send)
    //	{
    //		try
    //		{
    //			if (send == null)
    //			{
    //				send = "a12g43b45c7e9g8e";
    //			}
    //			if (skeySpec == null)
    //			{
    //				skeySpec = new SecretKeySpec(send.getBytes("utf-8"), "AES");
    //			}
    //			if (cipherEncrypt == null)
    //			{
    //				cipherEncrypt = Cipher.getInstance("AES/CBC/PKCS5Padding");
    //			}
    //			if (cipherDecrypt == null)
    //			{
    //				cipherDecrypt = Cipher.getInstance("AES/CBC/PKCS5Padding");
    //			}
    //			if (iv == null)
    //			{
    //				iv = new IvParameterSpec("0103021405060878".getBytes("utf-8"));
    //			}
    //			if (cipherEncrypt == null)
    //			{
    //				cipherEncrypt.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
    //			}
    //			if (cipherDecrypt == null)
    //			{
    //				cipherDecrypt.init(Cipher.DECRYPT_MODE, skeySpec, iv);
    //			}
    //
    //		}
    //		catch (UnsupportedEncodingException e1)
    //		{
    //			e1.printStackTrace();
    //		}
    //		catch (NoSuchAlgorithmException e)
    //		{
    //			e.printStackTrace();
    //		}
    //		catch (NoSuchPaddingException e)
    //		{
    //			e.printStackTrace();
    //		}
    //		catch (InvalidKeyException e)
    //		{
    //			e.printStackTrace();
    //		}
    //		catch (InvalidAlgorithmParameterException e)
    //		{
    //			e.printStackTrace();
    //		}
    //	}

    //	/**
    //	 * 解密
    //	 * <功能详细描述>
    //	 * @param sSrc
    //	 * @return
    //	 */
    //	public static String decrypt(String sSrc, String send) throws Exception
    //	{
    //		init(send);
    //		try
    //		{
    //			return new String(cipherDecrypt.doFinal(Base64.decode(sSrc, Base64.NO_WRAP)));
    //		}
    //		catch (Exception ex)
    //		{
    //			return null;
    //		}
    //	}
    String ENCRYP_SEND = "a12g43b45c7e9g8e";
    public static String encrypt(String cleartext, String dataPassword)
    {
        byte[] encryptedData = null;
        try
        {
            IvParameterSpec zeroIv = new IvParameterSpec("0103021405060878".getBytes("utf-8"));
            SecretKeySpec key = new SecretKeySpec(dataPassword.getBytes("utf-8"), "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, key, zeroIv);
            encryptedData = cipher.doFinal(cleartext.getBytes("utf-8"));
        }
        catch (InvalidKeyException e)
        {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch (NoSuchPaddingException e)
        {
            e.printStackTrace();
        }
        catch (InvalidAlgorithmParameterException e)
        {
            e.printStackTrace();
        }
        catch (IllegalBlockSizeException e)
        {
            e.printStackTrace();
        }
        catch (BadPaddingException e)
        {
            e.printStackTrace();
        }

        return Base64.encodeBase64String(encryptedData);
    }

    public static String decrypt(String dataPassword, String encrypted)
    {
        byte[] decryptedData = null;
        String res = null;
        try
        {
            byte[] byteMi = Base64.decodeBase64(encrypted);
            IvParameterSpec zeroIv = new IvParameterSpec("0103021405060878".getBytes("utf-8"));
            SecretKeySpec key = new SecretKeySpec(dataPassword.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, key, zeroIv);
            decryptedData = cipher.doFinal(byteMi);
            res = new String(decryptedData, "utf-8");
        }
        catch (InvalidKeyException e)
        {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch (NoSuchPaddingException e)
        {
            e.printStackTrace();
        }
        catch (InvalidAlgorithmParameterException e)
        {
            e.printStackTrace();
        }
        catch (IllegalBlockSizeException e)
        {
            e.printStackTrace();
        }
        catch (BadPaddingException e)
        {
            e.printStackTrace();
        }

        return res;
    }


}
