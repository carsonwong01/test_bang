package com.dimeng.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.dimeng.enums.SerialNumberTypeEnum;
import com.dimeng.framework.utils.StringUtil;

/**
 * 众筹编号生成工具类
 * <功能详细描述>
 * 
 * @author  ouxin
 * @version  [版本号, 2016年2月24日]
 */
public class SerialNumberUtil
{
    
    /**
     * 项目前缀
     */
    public static final String XM_SN_PREFIX = "XM";
    
    /**
     * 调账前缀
     */
    public static final String TZ_SN_PREFIX = "TZ";
    
    /**
     * 五位随机数
     */
    public static final int FIVE_SN_NUMBER = 10000;
    
    /**
     * 六位随机数
     */
    public static final int SIX_SN_NUMBER = 100000;
    
    /**
     * 八位随机数
     */
    public static final int EIGHT_SN_NUMBER = 10000000;
    
    /** 
     * 生成编号
     * <功能详细描述>
     * @param type
     * @return
     */
    public synchronized static String buildSn(String type)
    {
        String sn = null;
        //项目编号
        if (SerialNumberTypeEnum.XM.getDataBaseVal().equals(type))
        {
            sn = getSn(null, FIVE_SN_NUMBER);
        }
        //订单编号
        else if (SerialNumberTypeEnum.DD.getDataBaseVal().equals(type))
        {
            sn = getSn(null, EIGHT_SN_NUMBER);
        }
        //调账编号
        else if (SerialNumberTypeEnum.TZ.getDataBaseVal().equals(type))
        {
            sn = getSn(TZ_SN_PREFIX, SIX_SN_NUMBER);
        //退款编号    
        }else if(SerialNumberTypeEnum.TK.getDataBaseVal().equals(type))
        {
            sn = getSn(null, SIX_SN_NUMBER);
        }
        return sn;
    }
    
    public static String getSn(final String prefix, final int snNumber)
    {
        StringBuffer sb = new StringBuffer();
        if (StringUtil.notEmpty(prefix))
        {
            sb.append(prefix);
        }
        sb.append(getDatePrefix()).append(getRandomNum(snNumber));
        return sb.toString();
    }
    
    /** 
     * 获取指定位数随机数
     * <功能详细描述>
     * @param count
     * @return
     */
    public static String getRandomNum(final int count)
    {
        return String.valueOf((int)((Math.random() * 9 + 1) * count));
    }
    
    /** 
     * 获取年月日(yyMMdd)
     * <功能详细描述>
     * @return
     */
    public static String getDatePrefix()
    {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
        return sdf.format(date);
    }
}
