/*
 * 文 件 名:  InsertFilesReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月30日
 */
package com.dimeng.model.bus;

import org.hibernate.validator.constraints.NotBlank;

import com.dimeng.framework.domain.BaseReq;

/**
 * 项目图片附件删除请求实体
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月30日]
 */
public class DeleteProjectAttachmentReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 3585673397779055544L;
    
    /**
     * 文件id
     */
    @NotBlank
    private String fileId;
    
    public DeleteProjectAttachmentReq()
    {
        super();
    }
    
    public DeleteProjectAttachmentReq(String fileId)
    {
        super();
        this.fileId = fileId;
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
    
}
