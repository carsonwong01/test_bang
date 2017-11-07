/*
 * 文 件 名:  ProjectAttachmentController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月8日
 */
package com.dimeng.platform.controller.bus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.bus.DeleteProjectAttachmentReq;
import com.dimeng.model.bus.InsertFilesReq;
import com.dimeng.model.bus.InsertProjectAttachmentReq;
import com.dimeng.model.bus.InsertProjectAttachmentsReq;
import com.dimeng.model.bus.ProjectAttachmentReq;
import com.dimeng.modules.bus.services.IProjectAttachmentService;

/**
 * 项目图片附件控制器
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月8日]
 */
@RequestMapping("project/attachment")
@Controller
public class ProjectAttachmentController extends BaseController
{
    
    @Autowired
    private IProjectAttachmentService projectAttachmentService;
    
    /**
     * 上传文件
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/insertFile", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object addFiles(HttpEntity<InsertProjectAttachmentReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = validator(httpEntity.getBody());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectAttachmentService.insertFile(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 上传多文件
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/insertFiles", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object insertFiles(HttpEntity<InsertProjectAttachmentsReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = validator(httpEntity.getBody());
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectAttachmentService.insertFiles(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 删除文件
     * <功能详细描述>
     * @param req
     * @return
     */
    @RequestMapping(value = "/{v}/deleteFile", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object delFile(HttpEntity<DeleteProjectAttachmentReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectAttachmentService.deleteFile(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 查询文件
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findFilesList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findFilesList(HttpEntity<ProjectAttachmentReq> httpEntity)
        throws Exception
    {
        return projectAttachmentService.findFilesList(httpEntity.getBody());
    }
    
    /**
     * 更新文件信息
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/updateFile", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object updateFile(HttpEntity<ProjectAttachmentReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = validator(httpEntity);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectAttachmentService.updateFile(httpEntity.getBody());
        }
        return resp;
    }
    
    /**
     * 上传多文件
     * <功能详细描述>
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/{v}/insertSystemFiles", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object insertSystemFiles(HttpEntity<InsertFilesReq> httpEntity)
        throws Exception
    {
        BaseDataResp resp = validator(httpEntity.getBody());
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp = projectAttachmentService.insertSystemFiles(httpEntity.getBody());
        }
        return resp;
    }
    
}
