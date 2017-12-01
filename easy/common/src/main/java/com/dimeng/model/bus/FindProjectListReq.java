package com.dimeng.model.bus;

import com.dimeng.model.expand.FindExportExcelParamsReq;

/**
 * 查询项目列表
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月28日]
 */
public class FindProjectListReq extends FindExportExcelParamsReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 3149427647902854354L;
    
    /**
     * 项目编号
     */
    private String projectNo;
    
    /**
     * 项目标题
     */
    private String title;
    
    /**
     * 发起人
     */
    private String initiator;
    
    /**
     * 发起人昵称
     */
    private String initiatorNickName;
    
    /**
     * 项目类型
     */
    private String type;
    
    /**
     * 项目状态
     */
    private String projectStatus;
    
    /**
     * 众筹开始时间起
     */
    private String beginTimeStart;
    
    /**
     * 众筹开始时间止
     */
    private String beginTimeEnd;
    
    /**
     * 众筹成功时间起
     */
    private String successTimeStart;
    
    /**
     * 众筹成功时间止
     */
    private String successTimeEnd;
    
    /**
     * 众筹失败时间起
     */
    private String failTimeStart;
    
    /**
     * 众筹失败时间止
     */
    private String failTimeEnd;
    
    /**
     * 项目删除时间起
     */
    private String delTimeStart;
    
    /**
     * 项目删除时间止
     */
    private String delTimeEnd;

    /**
     * 项目所属医院名称
     */
    private String hospitalName;

    /**
     * 项目所属医院ID
     */
    private String hospitalId;

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public String getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(String hospitalId) {
        this.hospitalId = hospitalId;
    }

    public String getProjectNo()
    {
        return projectNo;
    }

    public void setProjectNo(String projectNo)
    {
        this.projectNo = projectNo;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getInitiator()
    {
        return initiator;
    }

    public void setInitiator(String initiator)
    {
        this.initiator = initiator;
    }

    public String getInitiatorNickName()
    {
        return initiatorNickName;
    }

    public void setInitiatorNickName(String initiatorNickName)
    {
        this.initiatorNickName = initiatorNickName;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getProjectStatus()
    {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }

    public String getBeginTimeStart()
    {
        return beginTimeStart;
    }

    public void setBeginTimeStart(String beginTimeStart)
    {
        this.beginTimeStart = beginTimeStart;
    }

    public String getBeginTimeEnd()
    {
        return beginTimeEnd;
    }

    public void setBeginTimeEnd(String beginTimeEnd)
    {
        this.beginTimeEnd = beginTimeEnd;
    }

    public String getSuccessTimeStart()
    {
        return successTimeStart;
    }

    public void setSuccessTimeStart(String successTimeStart)
    {
        this.successTimeStart = successTimeStart;
    }

    public String getSuccessTimeEnd()
    {
        return successTimeEnd;
    }

    public void setSuccessTimeEnd(String successTimeEnd)
    {
        this.successTimeEnd = successTimeEnd;
    }

    public String getFailTimeStart()
    {
        return failTimeStart;
    }

    public void setFailTimeStart(String failTimeStart)
    {
        this.failTimeStart = failTimeStart;
    }

    public String getFailTimeEnd()
    {
        return failTimeEnd;
    }

    public void setFailTimeEnd(String failTimeEnd)
    {
        this.failTimeEnd = failTimeEnd;
    }

    public String getDelTimeStart()
    {
        return delTimeStart;
    }

    public void setDelTimeStart(String delTimeStart)
    {
        this.delTimeStart = delTimeStart;
    }

    public String getDelTimeEnd()
    {
        return delTimeEnd;
    }

    public void setDelTimeEnd(String delTimeEnd)
    {
        this.delTimeEnd = delTimeEnd;
    }

    public static long getSerialversionuid()
    {
        return serialVersionUID;
    }
    
    
}
