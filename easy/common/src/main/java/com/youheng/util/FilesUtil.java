/*
 * 文 件 名:  FilesUtil.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月8日
 */
package com.dimeng.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSON;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.utils.FileUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.bus.DeleteProjectAttachmentReq;
import com.dimeng.model.bus.InsertFilesReq;
import com.dimeng.model.bus.InsertProjectAttachmentReq;
import com.dimeng.model.bus.InsertProjectAttachmentsReq;
import com.dimeng.model.expand.InsertSystemFilesReq;
import com.dimeng.utils.ApplicationContextUtil;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.UUIDGenerate;

/**
 * 项目图片附件上传、删除
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月8日]
 */
public class FilesUtil
{
    
    /**
     * 保存文件
     * <功能详细描述>
     * @param file 文件
     * @param createId 创建人ID
     * @param type 图片类型：1项目图片;2验证医疗证明;3户口本照片;4资金用途证明;5项目相关证明材料;6项目动态;7举报项目
     * @return
     */
    public static BaseDataResp saveFile(MultipartFile file, String createId, String type)
    {
        BaseDataResp result = null;
        MultipartFile[] files = {file};
        result = saveFiles(files, createId, type);
        return result;
    }
    
    /**
     * 保存多文件
     * <功能详细描述>
     * @param files 多文件
     * @param createId 创建人ID
     * @param type 图片类型：1项目图片;2验证医疗证明;3户口本照片;4资金用途证明;5项目相关证明材料;6项目动态;7举报项目;8其他图片(注：类型1-7的数据是保存在表t_project_attachment，类型8的数据是保存在表t_system_files)
     * @return
     */
    public static BaseDataResp saveFiles(MultipartFile[] files, String createId, String type)
    {
        BaseDataResp resp = null;
        List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
        String[] allowFile =
            {"jpg", "png", "jpeg", "bmp", "doc", "xls", "xlsx", "docx", "txt", "pdf", "csv", "ppt", "pptx", "apk",
                "ipa", "avi", "mp4", "3gp", "AVI", "MP4", "3gp"};
        String fileName = "", oldName = "";
        try
        {
            for (MultipartFile multipartFile : files)
            {
                CommonsMultipartFile file = (CommonsMultipartFile)multipartFile;
                Map<String, String> resultMap = new HashMap<String, String>();
                String id = System.currentTimeMillis() + "";
                if (file != null)
                {
                    fileName = file.getFileItem().getName();
                    oldName = file.getFileItem().getName();
                    resultMap.put("oldName", fileName);
                    if (StringUtil.isEmpty(fileName))
                    {
                        resultMap.put("status", "errorType");
                        resultMap.put("message", "file name is null");
                        resultMap.put("url", "error");
                        resultMap.put("size", "0");
                        resultList.add(resultMap);
                        continue;
                    }
                    //检测文件是否合法
                    boolean pass = false;
                    String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);
                    for (int j = 0; j < allowFile.length; j++)
                    {
                        if (allowFile[j].equalsIgnoreCase(fileExt))
                        {
                            pass = true;
                        }
                    }
                    if (!pass)
                    {
                        resultMap.put("status", "errorType");
                        resultMap.put("message", "file type error");
                        resultMap.put("url", "error");
                        resultMap.put("size", "0");
                        resultList.add(resultMap);
                        continue;
                    }
                    fileName = id + fileName.substring(fileName.lastIndexOf("."));
                    String savePath = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
                    String url = FileUtil.saveFile(file.getInputStream(), savePath, fileName);
                    resultMap.put("status", "ok");
                    resultMap.put("message", "ok");
                    resultMap.put("url", url);
                    resultMap.put("size", file.getSize() + "");
                    resultMap.put("newFileName", fileName);
                    resultMap.put("fileExt", fileExt);//图片后缀
                    resultMap.put("oldName", oldName);//原始图片名称
                    resultList.add(resultMap);
                }
            }
            if (DigitalAndStringConstant.StringConstant.ZERO.equals(type))
            {
                resp = insertFile(resultList, createId);
            }
            else
            {
                resp = insertUploadFile(resultList, createId, type);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return resp;
    }
    
    /**
     * 保存多张项目图片附件到附件表
     * <功能详细描述>
     * @param list
     * @param userId 用户ID
     * @param type 图片类型：1项目图片;2验证医疗证明;3户口本照片;4资金用途证明;5项目相关证明材料;6项目动态;7举报项目
     */
    public static BaseDataResp insertUploadFile(List<Map<String, String>> list, String userId, String type)
    {
        if (list.size() < 1)
            return null;
        List<InsertProjectAttachmentReq> insertFilesReqList = new ArrayList<InsertProjectAttachmentReq>();
        String id = null;
        String name = null;
        int length = 0;
        for (Map<String, String> map : list)
        {
            if (!"ok".equals(map.get("status")))
                continue;
            id = UUIDGenerate.generateShortUuid();
            name = map.get("oldName");
            length = name.length();
            if (length > 50)
            {
                name =
                    new StringBuffer(name.substring(0, 42)).append("...").append(name.substring(length - 4)).toString();
            }
            InsertProjectAttachmentReq insertFilesReq =
                new InsertProjectAttachmentReq(id, name, map.get("url"), userId, new Date(), "1", map.get("fileExt"),
                    map.get("newFileName"), map.get("size"), type);
            insertFilesReqList.add(insertFilesReq);
            map.put("batchNumber", id);
        }
        InsertProjectAttachmentsReq req = new InsertProjectAttachmentsReq();
        req.setAttachmentsReqs(insertFilesReqList);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/attachment/v/insertFiles",
                RequestMethod.POST,
                ApplicationContextUtil.newInstan().getRequest());
        BaseDataResp resp = JSON.parseObject(data, BaseDataResp.class);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp.setData(list);
        }
        return resp;
        
    }
    
    /**
     * 保存文件到系统附件表
     * <功能详细描述>
     * @param list
     * @param userId 用户ID
     */
    public static BaseDataResp insertFile(List<Map<String, String>> list, String userId)
    {
        if (list.size() < 1)
            return null;
        List<InsertSystemFilesReq> fileReq = new ArrayList<InsertSystemFilesReq>();
        for (Map<String, String> map : list)
        {
            if (!"ok".equals(map.get("status")))
                continue;
            String id = UUIDGenerate.generateShortUuid();
            InsertSystemFilesReq insertSysUploadFileReq =
                new InsertSystemFilesReq(id, map.get("oldName"), map.get("url"), userId, new Date(), 1,
                    map.get("fileExt"), map.get("newFileName"), map.get("size"));
            fileReq.add(insertSysUploadFileReq);
            map.put("batchNumber", id);
        }
        InsertFilesReq req = new InsertFilesReq();
        req.setFiles(fileReq);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/attachment/v/insertSystemFiles",
                RequestMethod.POST,
                ApplicationContextUtil.newInstan().getRequest());
        BaseDataResp resp = JSON.parseObject(data, BaseDataResp.class);
        if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            resp.setData(list);
        }
        return resp;
    }
    
    /**
     * 删除文件
     * <功能详细描述>
     * @param fileId 文件ID
     */
    public static BaseDataResp deleteFile(String fileId)
    {
        DeleteProjectAttachmentReq deleteFilesReq = new DeleteProjectAttachmentReq(fileId);
        String data =
            new CommonUtil().callInterfaceMethod(deleteFilesReq,
                "project/attachment/v/deleteFile",
                RequestMethod.POST,
                ApplicationContextUtil.newInstan().getRequest());
        BaseDataResp resp = JSON.parseObject(data, BaseDataResp.class);
        return resp;
    }
    
}
