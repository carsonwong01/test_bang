/*
 * 文 件 名:  ProjectBasicSetController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月28日
 */
package com.dimeng.console.controller.easy.expand;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemConsoleLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.entity.ext.user.ConsoleUserInfo;
import com.dimeng.entity.table.project.TProjectLabelType;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.expand.FindProjectBasicSetReq;
import com.dimeng.model.expand.ImgModelReq;
import com.dimeng.model.expand.ProjectLabelReq;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.FilesHandleUtil;
import com.dimeng.utils.LoginCache;

/**
 * 运营管理基本设置controller
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月28日]
 */
@RequestMapping("operations")
@Controller
public class ProjectBasicSetController extends BaseController
{
    
    /**
     * 项目标签列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/projectLabelSetPage.do")
    public ModelAndView projectWithdrawSetPage(HttpServletRequest request, HttpServletResponse response)
    {
        return new ModelAndView("pages/easy/operations/projectLabelSetPage");
    }
    
    /**
     * 项目标签列表Ajax
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping("/projectLabelSetAjax.do")
    public Object projectLabelSetAjax(FindProjectBasicSetReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String json =
            new CommonUtil().callInterfaceMethod(req,
                "operation/basicInfoSet/v/findLabelList",
                RequestMethod.POST,
                request);
        return JSON.parseObject(json);
    }
    
    /**
     * 跳转项目标签修改页面
     * <功能详细描述>
     * @param request
     * @param response
     * @param proType
     * @return
     */
    @RequestMapping("/updateProjectLabelSetPage.do")
    public ModelAndView updateProjectLabelSetPage(HttpServletRequest request, HttpServletResponse response,
        String proType)
    {
        ModelAndView mv = new ModelAndView("pages/easy/operations/projectLabelSetPageAdd");
        //查询项目标签list
        TProjectLabelType req = new TProjectLabelType();
        req.setProjectType(proType);
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "operation/basicInfoSet/v/findLabels",
                RequestMethod.POST,
                request);
        mv.addObject("list", CommonUtil.getJSONObject(result, CommonConstant.JSON_KEY_LIST));
        mv.addObject("proType", proType);
        return mv;
    }
    
    /**
     * 新增项目标签
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemConsoleLog(desc = "新增项目标签", modul = "运营管理")
    @ResponseBody
    @RequestMapping(value = "insertProjectLabel.do")
    public Object insertProjectLabel(ProjectLabelReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "operation/basicInfoSet/v/insertLabel",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    /**
     * 删除项目标签
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemConsoleLog(desc = "删除项目标签", modul = "运营管理")
    @ResponseBody
    @RequestMapping(value = "deleteProjectLabel.do")
    public Object deleteProjectLabel(ProjectLabelReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "operation/basicInfoSet/v/deleteLabel",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    /**
     * 图片模板列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/imgModelsPage.do")
    public ModelAndView imgModelsPage(HttpServletRequest request, HttpServletResponse response)
    {
        return new ModelAndView("pages/easy/operations/projectImgModelList");
    }
    
    /**
     * 图片模板列表Ajax
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping("/imgModelsPageAjax.do")
    public Object imgModelsPageAjax(HttpServletRequest request, HttpServletResponse response)
    {
        String json =
            new CommonUtil().callInterfaceMethod(null,
                "operation/basicInfoSet/v/findImgModel",
                RequestMethod.POST,
                request);
        return JSON.parseObject(json);
    }
    
    /**
     * 跳转图片模板修改页面
     * <功能详细描述>
     * @param request
     * @param response
     * @param templateId
     * @param imageTypeName
     * @return
     */
    @RequestMapping("/imgModelsPageEdit.do")
    public ModelAndView imgModelsPageEdit(HttpServletRequest request, HttpServletResponse response, String templateId,
        String imageId, String imageType, String imageUrl)
    {
        ModelAndView mv = new ModelAndView("pages/easy/operations/projectImgModelEdit");
        mv.addObject("templateId", templateId);
        mv.addObject("imageType", imageType);
        mv.addObject("imageId", imageId);
        mv.addObject("imageUrl", imageUrl);
        return mv;
    }
    
    /**
     * 修改图片模板
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     * @throws IOException 
     */
    @SystemConsoleLog(desc = "修改图片模板", modul = "运营管理")
    @SuppressWarnings("static-access")
    @ResponseBody
    @RequestMapping(value = "/updateImgModel.do", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
    public void updateImgModel(@RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
        ImgModelReq req, HttpServletRequest request, HttpServletResponse response)
        throws IOException
    {
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        ConsoleUserInfo user = LoginCache.getConsoleUserInfo();
        //图片模板图片
        if (imageFile != null && !imageFile.isEmpty())
        {
            //删除文件
            if (!StringUtil.isEmpty(req.getImageId())
                && !(DigitalAndStringConstant.StringConstant.ONE.equals(req.getTemplateId()) || DigitalAndStringConstant.StringConstant.TWO.equals(req.getTemplateId())))
            {
                new FilesHandleUtil().deleteFile(req.getImageId());
            }
            //上传文件
            Map<String, String> map = new FilesHandleUtil().saveFile(imageFile, user.getUserId());
            req.setImageId(map.get("batchNumber"));//图片id
            req.setImageUrl(map.get("url"));//图片url        
            req.setUserId(user.getUserId());
        }
        //更新信息
        String json =
            new CommonUtil().callInterfaceMethod(req,
                "operation/basicInfoSet/v/commonImgModel",
                RequestMethod.POST,
                request);
        JSONObject object = JSONObject.parseObject(json);
        PrintWriter out = response.getWriter();
        out.print(object);
        out.flush();
        out.close();
    }
    
}
