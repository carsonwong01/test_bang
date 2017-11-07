package com.dimeng.util;

import java.io.UnsupportedEncodingException;

import org.apache.commons.lang3.CharUtils;

import com.dimeng.framework.utils.StringUtil;

public class UTF8Utils
{
    
    public static void main(String[] args)
        throws UnsupportedEncodingException
    {
        byte[] bytes = new byte[] {(byte)0x08, (byte)0xF7};
        String s = new String(bytes, "UTF-8") + "自◊样子";
        System.out.println(s);
        System.out.println("removeFourChar2:" + UTF8Utils.removeFourChar2(s));
        System.out.println("removeFourChar:" + UTF8Utils.removeFourChar(s));
    }
    
    public static String removeFourChar(String content)
        throws UnsupportedEncodingException
    {
        byte[] bs = content.getBytes("UTF-8");
        byte[] result = new byte[bs.length];
        int len = 0;
        for (int i = 0; i < bs.length; i++)
        {
            if ((bs[i] & 0xF8) == 0xF0)
            {
                i += 3;
            }
            else
            {
                result[len] = bs[i];
                len++;
            }
        }
        content = new String(result, "UTF-8");
        String strResult = content.trim();
        if (StringUtil.isEmpty(strResult))
        {
            strResult = "_";
        }
        return strResult;
        
    }
    
    public static String removeFourChar2(String content)
        throws UnsupportedEncodingException
    {
        StringBuilder sbResult = new StringBuilder();
        byte[] t1 = content.getBytes("UTF-8");
        byte[] ba;
        for (int i = 0; i < t1.length; i++)
        {
            byte tt = t1[i];
            ba = null;
            if (CharUtils.isAscii((char)tt))
            {
                ba = new byte[1];
                ba[0] = tt;
            }
            else if ((tt & 0xE0) == 0xC0)
            {
                ba = new byte[2];
                ba[0] = tt;
                ba[1] = t1[i + 1];
                i += 1;
            }
            else if ((tt & 0xF0) == 0xE0)
            {
                ba = new byte[3];
                ba[0] = tt;
                ba[1] = t1[i + 1];
                ba[2] = t1[i + 2];
                i += 2;
            }
            else if ((tt & 0xF8) == 0xF0)
            {
                i += 3;
            }
            if (ba != null)
            {
                sbResult.append(new String(ba, "UTF-8"));
            }
        }
        if (sbResult.length() == 0)
        {
            sbResult.append("_");
        }
        return sbResult.toString();
    }
    
}