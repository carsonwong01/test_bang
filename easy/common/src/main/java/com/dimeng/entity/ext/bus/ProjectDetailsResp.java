package com.dimeng.entity.ext.bus;

import java.util.List;

import com.dimeng.entity.table.project.TProjectAttachment;
import com.dimeng.framework.domain.BaseResp;

/**
 * 项目详情
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月29日]
 */
public class ProjectDetailsResp extends BaseResp
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 3383591105599557064L;
    
    /**
     * 项目id
     */
    private String id;
    
    /**
     * 项目标题
     */
    private String title;
    
    /**
     * 项目发起人用户名
     */
    private String initiator;
    
    /**
     * 发起人昵称 
     */
    private String initiatorNickName;
    
    /**
     * 项目发起人头像URL
     */
    private String initiatorImgUrl;
    
    /**
     * 封面图片URL
     */
    private String coverImgUrl;
    
    /**
     * 支持人次
     */
    private String supportTimes;
    
    /**
     * 剩余时间
     */
    private String remainingDay;
    
    /**
     * 发起时间
     */
    private String dateCreate;
    
    /**
     * 项目状态
     */
    private String projectStatus;
    
    /**
     * 项目标签
     */
    private String label;
    
    /**
     * 项目标签列表
     */
    private List<String> labels;
    
    /**
     * 项目类型（1：公益项目2：回报项目3：梦想项目）
     */
    private String type;
    
    /**
     * 目标金额
     */
    private String facTarget;
    
    /**
     * 已筹金额
     */
    private String supportAmt;
    
    /**
     * 项目内容
     */
    private String content;
    
    /**
     * 项目图片集合
     */
    private List<TProjectAttachment> imgs;
    
    /**
     * 运费说明
     */
    private String freight;
    
    /**
     * 发货时间
     */
    private String postTimeText;
    
    /**
     * 二维码图片URL
     */
    private String qrcodeImg;
    
    /**
     * 验证类型：
     * 1:本人验证\r\n         
     * 2:亲属验证\r\n    
     * 3:夫妻验证\r\n           
     * 4:组织验证(企业验证)
     */
    private String validationType;
    
    /**
     * 验证状态：1:审核待审核 2:审核不通过 3:审核通过
     */
    private String validationStatus;
    
    /**
     * 筹资期限
     */
    private String timeLimit;
    
    /**
     * 是否提供收货地址，1-是，2-否
     */
    private String isNeddAddr;
    
    /**
     * 项目简介
     */
    private String projectIntro;
    
    /**
     * 梦想目标
     */
    private List<FindProjectReturnListResp> dreamTargets;
    
    /**
     * 动态数量
     */
    private String dynamicCount;
    
    /**
     * 是否已关注，0否，1是
     */
    private String isFocus;
    
    /**
     * 项目封面图片id
     */
    private String coverImageId;
    
    /**
     * 项目屏蔽状态，1-屏蔽，2未屏蔽
     */
    private String shieldStatus;
    
    public String getId()
    {
        return id;
    }
    
    public void setId(String id)
    {
        this.id = id;
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
    
    public String getInitiatorImgUrl()
    {
        return initiatorImgUrl;
    }
    
    public void setInitiatorImgUrl(String initiatorImgUrl)
    {
        this.initiatorImgUrl = initiatorImgUrl;
    }
    
    public String getCoverImgUrl()
    {
        return coverImgUrl;
    }
    
    public void setCoverImgUrl(String coverImgUrl)
    {
        this.coverImgUrl = coverImgUrl;
    }
    
    public String getSupportTimes()
    {
        return supportTimes;
    }
    
    public void setSupportTimes(String supportTimes)
    {
        this.supportTimes = supportTimes;
    }
    
    public String getRemainingDay()
    {
        return remainingDay;
    }
    
    public void setRemainingDay(String remainingDay)
    {
        this.remainingDay = remainingDay;
    }
    
    public String getDateCreate()
    {
        return dateCreate;
    }
    
    public void setDateCreate(String dateCreate)
    {
        this.dateCreate = dateCreate;
    }
    
    public String getProjectStatus()
    {
        return projectStatus;
    }
    
    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }
    
    public String getLabel()
    {
        return label;
    }
    
    public void setLabel(String label)
    {
        this.label = label;
    }
    
    public String getType()
    {
        return type;
    }
    
    public void setType(String type)
    {
        this.type = type;
    }
    
    public String getFacTarget()
    {
        return facTarget;
    }
    
    public void setFacTarget(String facTarget)
    {
        this.facTarget = facTarget;
    }
    
    public String getSupportAmt()
    {
        return supportAmt;
    }
    
    public void setSupportAmt(String supportAmt)
    {
        this.supportAmt = supportAmt;
    }
    
    public String getContent()
    {
        return content;
    }
    
    public void setContent(String content)
    {
        this.content = content;
    }
    
    public List<TProjectAttachment> getImgs()
    {
        return imgs;
    }
    
    public void setImgs(List<TProjectAttachment> imgs)
    {
        this.imgs = imgs;
    }
    
    public String getFreight()
    {
        return freight;
    }
    
    public void setFreight(String freight)
    {
        this.freight = freight;
    }
    
    public String getPostTimeText()
    {
        return postTimeText;
    }
    
    public void setPostTimeText(String postTimeText)
    {
        this.postTimeText = postTimeText;
    }
    
    public String getQrcodeImg()
    {
        return qrcodeImg;
    }
    
    public void setQrcodeImg(String qrcodeImg)
    {
        this.qrcodeImg = qrcodeImg;
    }
    
    public String getValidationType()
    {
        return validationType;
    }
    
    public void setValidationType(String validationType)
    {
        this.validationType = validationType;
    }
    
    public String getValidationStatus()
    {
        return validationStatus;
    }
    
    public void setValidationStatus(String validationStatus)
    {
        this.validationStatus = validationStatus;
    }
    
    public String getInitiatorNickName()
    {
        return initiatorNickName;
    }
    
    public void setInitiatorNickName(String initiatorNickName)
    {
        this.initiatorNickName = initiatorNickName;
    }
    
    public String getTimeLimit()
    {
        return timeLimit;
    }
    
    public void setTimeLimit(String timeLimit)
    {
        this.timeLimit = timeLimit;
    }
    
    public String getIsNeddAddr()
    {
        return isNeddAddr;
    }
    
    public void setIsNeddAddr(String isNeddAddr)
    {
        this.isNeddAddr = isNeddAddr;
    }
    
    public String getProjectIntro()
    {
        return projectIntro;
    }
    
    public void setProjectIntro(String projectIntro)
    {
        this.projectIntro = projectIntro;
    }
    
    public List<FindProjectReturnListResp> getDreamTargets()
    {
        return dreamTargets;
    }
    
    public void setDreamTargets(List<FindProjectReturnListResp> dreamTargets)
    {
        this.dreamTargets = dreamTargets;
    }
    
    public List<String> getLabels()
    {
        return labels;
    }
    
    public void setLabels(List<String> labels)
    {
        this.labels = labels;
    }
    
    public String getDynamicCount()
    {
        return dynamicCount;
    }
    
    public void setDynamicCount(String dynamicCount)
    {
        this.dynamicCount = dynamicCount;
    }
    
    public String getIsFocus()
    {
        return isFocus;
    }
    
    public void setIsFocus(String isFocus)
    {
        this.isFocus = isFocus;
    }
    
    public String getCoverImageId()
    {
        return coverImageId;
    }
    
    public void setCoverImageId(String coverImageId)
    {
        this.coverImageId = coverImageId;
    }

    public String getShieldStatus()
    {
        return shieldStatus;
    }

    public void setShieldStatus(String shieldStatus)
    {
        this.shieldStatus = shieldStatus;
    }
    
}
