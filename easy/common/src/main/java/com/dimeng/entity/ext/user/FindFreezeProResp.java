/*
 * 文 件 名:  FindFreezeProResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月18日
 */
package com.dimeng.entity.ext.user;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 冻结金额项目响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月18日]
 */
public class FindFreezeProResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -6900677050906753595L;
    
    /**
     * 项目ID
     */
    private String proId;
    
    /**
     * 项目验证ID
     */
    private String validId;
    
    /**
     * 发货状态
     * 1已全部发货
     * 2未全部发货
     */
    private String sendStatus;
    
    /**
     * 验证状态
     * 1已验证
     * 2未验证
     */
    private String validStatus;
    
    /**
     * 项目封面图
     */
    private String proImg;
    
    /**
     * 项目标题
     */
    private String proTitle;
    
    /**
     * 项目创建时间
     */
    private String proCreteTime;
    
    /**
     * 项目冻结金额
     */
    private String proFreezeMoney;
    
    /**
     * 返回年月日
     */
    @SuppressWarnings("unused")
    private String yearMonth;
    
    /**
     * 项目类型
     */
    private String projectType;
    
    /**
     * @return 返回 proId
     */
    public String getProId()
    {
        return proId;
    }
    
    /**
     * @param 对proId进行赋值
     */
    public void setProId(String proId)
    {
        this.proId = proId;
    }
    
    /**
     * @return 返回 validId
     */
    public String getValidId()
    {
        return validId;
    }
    
    /**
     * @param 对validId进行赋值
     */
    public void setValidId(String validId)
    {
        this.validId = validId;
    }
    
    /**
     * @return 返回 sendStatus
     */
    public String getSendStatus()
    {
        return sendStatus;
    }
    
    /**
     * @param 对sendStatus进行赋值
     */
    public void setSendStatus(String sendStatus)
    {
        this.sendStatus = sendStatus;
    }
    
    /**
     * @return 返回 validStatus
     */
    public String getValidStatus()
    {
        return validStatus;
    }
    
    /**
     * @param 对validStatus进行赋值
     */
    public void setValidStatus(String validStatus)
    {
        this.validStatus = validStatus;
    }
    
    /**
     * @return 返回 proImg
     */
    public String getProImg()
    {
        return proImg;
    }
    
    /**
     * @param 对proImg进行赋值
     */
    public void setProImg(String proImg)
    {
        this.proImg = proImg;
    }
    
    /**
     * @return 返回 proTitle
     */
    public String getProTitle()
    {
        return proTitle;
    }
    
    /**
     * @param 对proTitle进行赋值
     */
    public void setProTitle(String proTitle)
    {
        this.proTitle = proTitle;
    }
    
    /**
     * @return 返回 proCreteTime
     */
    public String getProCreteTime()
    {
        return proCreteTime;
    }
    
    /**
     * @param 对proCreteTime进行赋值
     */
    public void setProCreteTime(String proCreteTime)
    {
        this.proCreteTime = proCreteTime;
    }
    
    /**
     * @return 返回 proFreezeMoney
     */
    public String getProFreezeMoney()
    {
        return proFreezeMoney;
    }
    
    /**
     * @param 对proFreezeMoney进行赋值
     */
    public void setProFreezeMoney(String proFreezeMoney)
    {
        this.proFreezeMoney = proFreezeMoney;
    }
    
    public String getYearMonth()
    {
        if (this.proCreteTime != null)
        {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try
            {
                date = sdf.parse(this.proCreteTime);
            }
            catch (ParseException e)
            {
                e.printStackTrace();
            }
            DateFormat df = new SimpleDateFormat("yyyy年MM月");
            return df.format(date);
        }
        return null;
    }
    
    public void setYearMonth(String yearMonth)
    {
        this.yearMonth = yearMonth;
    }

    public String getProjectType()
    {
        return projectType;
    }

    public void setProjectType(String projectType)
    {
        this.projectType = projectType;
    }
}
