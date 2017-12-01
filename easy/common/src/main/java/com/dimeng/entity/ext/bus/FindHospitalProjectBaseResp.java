/*
 * 文 件 名:  FindProjectBaseResp.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月11日
 */
package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 前台-我发起的项目列表/我关注的项目-响应参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月11日]
 */
public class FindHospitalProjectBaseResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -927198897089677050L;
    
    /**
     * 项目ID
     */
    private String projectId;
    
    /**
     * 项目标题
     */
    private String title;
    
    /**
     * 项目目标金额
     */
    private String facTarget;
    
    /**
     * 已筹金额
     */
    private String supportAmt;
    
    /**
     * 支持次数
     */
    private String supportTimes;
    
    /**
     * 剩余时间
     */
    private String remainingDay;
    
    /**
     * 项目状态
     * 1众筹中
     * 2众筹成功
     * 3众筹失败
     * 4已删除
     */
    private String projectStatus;
    
    /**
     * 封面图片URL
     */
    private String coverImgUrl;
    
    /**
     * 失败详情
     */
    private String failReason;
    
    /**
     * 关注ID
     */
    private String favoriteId;
    
    /**
     * 项目类型
     */
    private String projectType;
    /**
     * 医院ID
     */
    private String hospitalId;

    /**
     * 医院名称
     */
    private String hospitalName;

    public String getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(String hospitalId) {
        this.hospitalId = hospitalId;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    /**
     * @return 返回 projectId
     */
    public String getProjectId()
    {
        return projectId;
    }
    
    /**
     * @param 对projectId进行赋值
     */
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }
    
    /**
     * @return 返回 title
     */
    public String getTitle()
    {
        return title;
    }
    
    /**
     * @param 对title进行赋值
     */
    public void setTitle(String title)
    {
        this.title = title;
    }
    
    /**
     * @return 返回 facTarget
     */
    public String getFacTarget()
    {
        return facTarget;
    }
    
    /**
     * @param 对facTarget进行赋值
     */
    public void setFacTarget(String facTarget)
    {
        this.facTarget = facTarget;
    }
    
    /**
     * @return 返回 supportAmt
     */
    public String getSupportAmt()
    {
        return supportAmt;
    }
    
    /**
     * @param 对supportAmt进行赋值
     */
    public void setSupportAmt(String supportAmt)
    {
        this.supportAmt = supportAmt;
    }
    
    /**
     * @return 返回 supportTimes
     */
    public String getSupportTimes()
    {
        return supportTimes;
    }
    
    /**
     * @param 对supportTimes进行赋值
     */
    public void setSupportTimes(String supportTimes)
    {
        this.supportTimes = supportTimes;
    }
    
    /**
     * @return 返回 remainingDay
     */
    public String getRemainingDay()
    {
        return remainingDay;
    }
    
    /**
     * @param 对remainingDay进行赋值
     */
    public void setRemainingDay(String remainingDay)
    {
        this.remainingDay = remainingDay;
    }
    
    /**
     * @return 返回 projectStatus
     */
    public String getProjectStatus()
    {
        return projectStatus;
    }
    
    /**
     * @param 对projectStatus进行赋值
     */
    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }
    
    /**
     * @return 返回 coverImgUrl
     */
    public String getCoverImgUrl()
    {
        return coverImgUrl;
    }
    
    /**
     * @param 对coverImgUrl进行赋值
     */
    public void setCoverImgUrl(String coverImgUrl)
    {
        this.coverImgUrl = coverImgUrl;
    }
    
    /**
     * @return 返回 failReason
     */
    public String getFailReason()
    {
        return failReason;
    }
    
    /**
     * @param 对failReason进行赋值
     */
    public void setFailReason(String failReason)
    {
        this.failReason = failReason;
    }
    
    /**
     * @return 返回 favoriteId
     */
    public String getFavoriteId()
    {
        return favoriteId;
    }
    
    /**
     * @param 对favoriteId进行赋值
     */
    public void setFavoriteId(String favoriteId)
    {
        this.favoriteId = favoriteId;
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
