/*
 * 文 件 名:  AppDataController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月25日
 */
package com.dimeng.platform.controller.home;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.bus.InsertAttachmentReq;
import com.dimeng.util.FilesUtil;
import com.dimeng.utils.FilesHandleUtil;
import com.dimeng.utils.LoginCache;

/**
 * 为APP提供数据控制器
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月25日]
 */
@Controller
@RequestMapping(value = "home/appData")
public class AppDataController extends BaseController
{
    
    /**
     * 上传系统附件
     * <功能详细描述>
     * @param uploadFile
     * @param type
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @SuppressWarnings("static-access")
    @RequestMapping(value = "/{v}/uploadFile", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object commonUploadFile(@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
        HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        //上传文件
        FrontUserInfo user = LoginCache.getFrontUserInfo();
        if (user == null)
        {
            return null;
        }
        Map<String, String> map = new FilesHandleUtil().saveFile(uploadFile, user.getUserId());
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        resp.setData(map);
        return resp;
    }
    
    /**
     * 上传项目附件
     * <功能详细描述>
     * @param uploadFile
     * @param req
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @SuppressWarnings("static-access")
    @RequestMapping(value = "/{v}/uploadAttachment", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object commonUploadAttachment(
        @RequestParam(value = "uploadFile", required = false) MultipartFile[] uploadFile, InsertAttachmentReq req,
        HttpServletRequest request, HttpServletResponse response)
        throws IOException
    {
        //上传文件
        FrontUserInfo user = LoginCache.getFrontUserInfo();
        if (user == null)
        {
            return null;
        }
        BaseDataResp resp = new FilesUtil().saveFiles(uploadFile, user.getUserId(), req.getFileType());
        return resp;
    }
    
}
