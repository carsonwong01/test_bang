package com.dimeng.entity.ext.bus;

import java.io.Serializable;

public class ProjectAttachmentResp implements Serializable
{
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 5299579957643103520L;
    
    /**
     * 附件ID
     */
    private String fileId;
    
    /**
     * 附件名称
     */
    private String name;
    
    /**
     * 附件地址
     */
    private String addr;
    
    /**
     * 附件别名
     */
    private String alias;
    
    /**
     * 附件类型
     */
    private String type;
    
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
