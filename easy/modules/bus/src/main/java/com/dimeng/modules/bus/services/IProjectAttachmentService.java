/*
 * 文 件 名:  IProjectAttachmentService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月8日
 */
package com.dimeng.modules.bus.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.bus.DeleteProjectAttachmentReq;
import com.dimeng.model.bus.InsertFilesReq;
import com.dimeng.model.bus.InsertProjectAttachmentReq;
import com.dimeng.model.bus.InsertProjectAttachmentsReq;
import com.dimeng.model.bus.ProjectAttachmentReq;

/**
 * 项目图片附件接口
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月8日]
 */
public interface IProjectAttachmentService
{
    
    /**
     * 保存文件
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp insertFile(InsertProjectAttachmentReq req)
        throws Exception;
    
    /**
     * 保存多文件
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp insertFiles(InsertProjectAttachmentsReq req)
        throws Exception;
    
    /**
     * 删除文件
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp deleteFile(DeleteProjectAttachmentReq req)
        throws Exception;
    
    /**
     * 查询文件
     * <功能详细描述>
     * @param body
     * @return
     * @throws Exception
     */
    public BaseDataResp findFilesList(ProjectAttachmentReq req)
        throws Exception;
    
    /**
     * 更新文件信息
     * <功能详细描述>
     * @param body
     * @return
     * @throws Exception
     */
    public BaseDataResp updateFile(ProjectAttachmentReq req)
        throws Exception;
    
    /**
     * 新增多张系统附件
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp insertSystemFiles(InsertFilesReq req)
        throws Exception;
    
}
