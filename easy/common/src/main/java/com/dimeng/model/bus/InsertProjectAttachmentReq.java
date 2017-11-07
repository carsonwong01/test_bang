/*
 * 文 件 名:  InsertProjectAttachmentReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月30日
 */
package com.dimeng.model.bus;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 项目图片附件新增请求实体
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月30日]
 */
public class InsertProjectAttachmentReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -2592182650400577698L;
    
    /**
     * 文件id
     */
    @NotBlank
    @Length(max = 25)
    private String fileId;
    
    /**
     * 文件名称
     */
    @NotBlank
    @Length(max = 50)
    private String name;
    
    /**
     * 文件地址
     */
    @NotBlank
    @Length(max = 100)
    private String addr;
    
    /**
     * 创建人ID
     */
    @NotBlank
    @Length(max = 25)
    private String creatorId;
    
    /**
     * 创建时间
     */
    @NotNull
    private Date dateCreate;
    
    /**
     * 状态 0:失效
            1:有效
     */
    @NotNull
    private String status;
    
    /**
     * 扩展名
     */
    @NotBlank
    @Length(max = 10)
    private String extension;
    
    /**
     * 别名
     */
    @Length(max = 30)
    private String alias;
    
    /**
     * 附件大小
     */
    @NotBlank
    @Length(max = 20)
    private String accessorySize;
    
    /**
     * 关联id
     */
    private String associatedId;
    
    /**
     * 类型
     * 1项目图片
     * 2验证医疗证明
     * 3户口本照片
     * 4资金用途证明
     * 5项目相关证明材料
     * 6项目动态
     * 7举报项目
     */
    @NotNull
    private String type;
    
    public InsertProjectAttachmentReq()
    {
        super();
    }
    
    public InsertProjectAttachmentReq(String fileId, String name, String addr, String creatorId, Date dateCreate,
        String status, String extension, String alias, String accessorySize, String type)
    {
        super();
        this.fileId = fileId;
        this.name = name;
        this.addr = addr;
        this.creatorId = creatorId;
        this.dateCreate = dateCreate;
        this.status = status;
        this.extension = extension;
        this.alias = alias;
        this.accessorySize = accessorySize;
        this.type = type;
    }
    
    /**
     * @return 返回 fileId
     */
    public String getFileId()
    {
        return fileId;
    }
    
    /**
     * @param 对fileId进行赋值
     */
    public void setFileId(String fileId)
    {
        this.fileId = fileId;
    }
    
    /**
     * @return 返回 name
     */
    public String getName()
    {
        return name;
    }
    
    /**
     * @param 对name进行赋值
     */
    public void setName(String name)
    {
        this.name = name;
    }
    
    /**
     * @return 返回 addr
     */
    public String getAddr()
    {
        return addr;
    }
    
    /**
     * @param 对addr进行赋值
     */
    public void setAddr(String addr)
    {
        this.addr = addr;
    }
    
    /**
     * @return 返回 creatorId
     */
    public String getCreatorId()
    {
        return creatorId;
    }
    
    /**
     * @param 对creatorId进行赋值
     */
    public void setCreatorId(String creatorId)
    {
        this.creatorId = creatorId;
    }
    
    /**
     * @return 返回 dateCreate
     */
    public Date getDateCreate()
    {
        return dateCreate;
    }
    
    /**
     * @param 对dateCreate进行赋值
     */
    public void setDateCreate(Date dateCreate)
    {
        this.dateCreate = dateCreate;
    }
    
    /**
     * @return 返回 status
     */
    public String getStatus()
    {
        return status;
    }
    
    /**
     * @param 对status进行赋值
     */
    public void setStatus(String status)
    {
        this.status = status;
    }
    
    /**
     * @return 返回 extension
     */
    public String getExtension()
    {
        return extension;
    }
    
    /**
     * @param 对extension进行赋值
     */
    public void setExtension(String extension)
    {
        this.extension = extension;
    }
    
    /**
     * @return 返回 alias
     */
    public String getAlias()
    {
        return alias;
    }
    
    /**
     * @param 对alias进行赋值
     */
    public void setAlias(String alias)
    {
        this.alias = alias;
    }
    
    /**
     * @return 返回 accessorySize
     */
    public String getAccessorySize()
    {
        return accessorySize;
    }
    
    /**
     * @param 对accessorySize进行赋值
     */
    public void setAccessorySize(String accessorySize)
    {
        this.accessorySize = accessorySize;
    }
    
    /**
     * @return 返回 associatedId
     */
    public String getAssociatedId()
    {
        return associatedId;
    }
    
    /**
     * @param 对associatedId进行赋值
     */
    public void setAssociatedId(String associatedId)
    {
        this.associatedId = associatedId;
    }
    
    /**
     * @return 返回 type
     */
    public String getType()
    {
        return type;
    }
    
    /**
     * @param 对type进行赋值
     */
    public void setType(String type)
    {
        this.type = type;
    }
    
}
