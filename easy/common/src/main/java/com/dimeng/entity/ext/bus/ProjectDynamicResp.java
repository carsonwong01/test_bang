package com.dimeng.entity.ext.bus;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * 查询项目动态
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月30日]
 */
public class ProjectDynamicResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -7236729352282758279L;
    
    /**
     * 动态ID
     */
    private String id;
    
    /**
     * 动态内容
     */
    private String content;
    
    /**
     * 发布动态人昵称
     */
    private String nickName;
    
    /**
     *  发布动态人头像
     */
    private String headPic;
    
    /**
     * 动态图片URL
     */
    private List<ProjectAttachmentResp> imgsUrl;
    
    /**
     * 动态发布时间
     */
    private String dateCreate;
    
    /**
     * 项目标题
     */
    private String projectName;
    
    /**
     * 封面图片
     */
    private String coverImgUrl;
    
    /**
     * 动态类型
     */
    private String dynamicType;
    
    /**
     * 支持金额
     */
    private String supportAmount;
    
    /**
     * 订单编号
     */
    private String orderNo;
    
    /**
     * 目标金额
     */
    private String targetAmount;
    
    /**
     * 项目id
     */
    private String projectId;
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
    }
    
    public String getContent()
    {
        return content;
    }
    
    public void setContent(String content)
    {
        this.content = content;
    }
    
    public List<ProjectAttachmentResp> getImgsUrl()
    {
        return imgsUrl;
    }
    
    public void setImgsUrl(List<ProjectAttachmentResp> imgsUrl)
    {
        this.imgsUrl = imgsUrl;
    }
    
    public String getDateCreate()
    {
        return dateCreate;
    }
    
    public void setDateCreate(String dateCreate)
    {
        this.dateCreate = dateCreate;
    }
    
    public String getNickName()
    {
        return nickName;
    }
    
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
    public String getHeadPic()
    {
        return headPic;
    }
    
    public void setHeadPic(String headPic)
    {
        this.headPic = headPic;
    }
    
    /**
     * @return 返回 projectName
     */
    public String getProjectName()
    {
        return projectName;
    }
    
    /**
     * @param 对projectName进行赋值
     */
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
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
     * @return 返回 dynamicType
     */
    public String getDynamicType()
    {
        return dynamicType;
    }
    
    /**
     * @param 对dynamicType进行赋值
     */
    public void setDynamicType(String dynamicType)
    {
        this.dynamicType = dynamicType;
    }
    
    /**
     * @return 返回 supportAmount
     */
    public String getSupportAmount()
    {
        return supportAmount;
    }
    
    /**
     * @param 对supportAmount进行赋值
     */
    public void setSupportAmount(String supportAmount)
    {
        this.supportAmount = supportAmount;
    }
    
    /**
     * @return 返回 orderNo
     */
    public String getOrderNo()
    {
        return orderNo;
    }
    
    /**
     * @param 对orderNo进行赋值
     */
    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo;
    }
    
    /**
     * @return 返回 targetAmount
     */
    public String getTargetAmount()
    {
        return targetAmount;
    }
    
    /**
     * @param 对targetAmount进行赋值
     */
    public void setTargetAmount(String targetAmount)
    {
        this.targetAmount = targetAmount;
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
    
}
