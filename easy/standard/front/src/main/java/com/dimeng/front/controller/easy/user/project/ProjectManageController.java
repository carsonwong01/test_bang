/*
 * 文 件 名:  ProjectManageController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月23日
 */
package com.dimeng.front.controller.easy.user.project;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemFrontLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.bus.FindProAuthenStatuResp;
import com.dimeng.entity.ext.bus.FindProjectValidationResp;
import com.dimeng.entity.ext.bus.ProjectDetailsResp;
import com.dimeng.entity.ext.expand.FindAllTProjectLabelTypeResp;
import com.dimeng.entity.ext.expand.FindAllTSiteImageTemplateResp;
import com.dimeng.entity.ext.site.SiteProtocolModelResp;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.enums.AuditStatusEnum;
import com.dimeng.enums.ProjectTypeEnum;
import com.dimeng.enums.ProjectValidationTypeEnum;
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.bus.ChangeProjectStatusReq;
import com.dimeng.model.bus.DeleteProjectAttachmentReq;
import com.dimeng.model.bus.FindAuthenRecordReq;
import com.dimeng.model.bus.FindProjectBaseReq;
import com.dimeng.model.bus.FindProjectValidationReq;
import com.dimeng.model.bus.FindSupportListReq;
import com.dimeng.model.bus.GetProjectReasonReq;
import com.dimeng.model.bus.InsertAttachmentReq;
import com.dimeng.model.bus.InsertProjectDynamicReq;
import com.dimeng.model.bus.ProjectBasicReq;
import com.dimeng.model.bus.ProjectDetailsReq;
import com.dimeng.model.bus.UpdateDreamProjectReq;
import com.dimeng.model.bus.UpdateOrderSupportReq;
import com.dimeng.model.bus.UpdateReturnProjectReq;
import com.dimeng.model.bus.UpdateWelfareProjectReq;
import com.dimeng.model.common.IdPageReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.expand.DeleteSystemFilesReq;
import com.dimeng.model.finance.SupportDetailReq;
import com.dimeng.util.FilesUtil;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.FilesHandleUtil;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.SystemCache;

/**
 * 项目管理
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月23日]
 */
@Controller
@RequestMapping(value = "user/project")
public class ProjectManageController extends BaseController
{
    
    /**
     * 图片上传(系统附件表)
     * <功能详细描述>
     * @param file
     * @param request
     * @param response
     * @throws IOException
     */
    @SuppressWarnings("static-access")
    @ResponseBody
    @RequestMapping(value = "/uploadFile.do", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
    public Object uploadFile(@RequestParam(value = "file", required = false) MultipartFile file,
        HttpServletRequest request, HttpServletResponse response)
        throws IOException
    {
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        if (userInfo == null)
        {
            return null;
        }
        //上传图片(系统附件表)
        List<Map<String, String>> resultList = new ArrayList<Map<String, String>>(0);
        Map<String, String> map = new FilesHandleUtil().saveFile(file, userInfo.getUserId());
        resultList.add(map);
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        resp.setData(resultList);
        String data = JSON.toJSONString(resp);
        return data;
    }
    
    /**
     * 删除图片(系统附件表)
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @throws IOException
     */
    @SuppressWarnings("static-access")
    @RequestMapping(value = "/deleteFile.do")
    public void uploadFile(DeleteSystemFilesReq req, HttpServletRequest request, HttpServletResponse response)
        throws IOException
    {
        //删除图片(系统附件表)
        new FilesHandleUtil().deleteFile(req.getFileId());
    }
    
    /**
     * 图片上传(多张图片附件表)
     * <功能详细描述>
     * @param file
     * @param req
     * @param request
     * @param response
     * @throws IOException
     */
    @SuppressWarnings("static-access")
    @ResponseBody
    @RequestMapping(value = "/uploadAttachment.do", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
    public Object uploadAttachment(@RequestParam(value = "file", required = false) MultipartFile file,
        InsertAttachmentReq req, HttpServletRequest request, HttpServletResponse response)
        throws IOException
    {
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        if (userInfo == null)
        {
            return null;
        }
        //上传图片(多张图片附件表)
        BaseDataResp resp = new FilesUtil().saveFile(file, userInfo.getUserId(), req.getFileType());
        String data = JSON.toJSONString(resp);
        return data;
    }
    
    /**
     * 删除图片(多张图片附件表)
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @throws IOException
     */
    @SuppressWarnings("static-access")
    @RequestMapping(value = "/deleteAttachment.do")
    public void deleteAttachment(DeleteProjectAttachmentReq req, HttpServletRequest request,
        HttpServletResponse response)
        throws IOException
    {
        //删除图片(多张图片附件表)
        new FilesUtil().deleteFile(req.getFileId());
    }
    
    /**
     * 订单详情
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "order/orderDetail.do")
    public Object orderDetail(SupportDetailReq req, @ModelAttribute("from") String from, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/paymentManage/v/supportDetail",
                RequestMethod.POST,
                request);
        JSONObject orderDetail = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        Integer projectType = Integer.parseInt(orderDetail.getString("projectType"));
        ModelAndView mv = null;
        //个人求助
        if (ProjectTypeEnum.DBJZ.getDbvalue().equals(projectType)
            || ProjectTypeEnum.ZNJZ.getDbvalue().equals(projectType)
            || ProjectTypeEnum.DWBH.getDbvalue().equals(projectType)
            || ProjectTypeEnum.FPZX.getDbvalue().equals(projectType)
            || ProjectTypeEnum.QTJZ.getDbvalue().equals(projectType))
        {
            mv = new ModelAndView("easy/user/project/orderDetail/publicWelfareProjOrderDetail.page");
        }
        else if (ProjectTypeEnum.HBXM.getDbvalue().equals(projectType))//产品急销
        {
            mv = new ModelAndView("easy/user/project/orderDetail/returnProjOrderDetail.page");
        }
        else if (ProjectTypeEnum.MXXM.getDbvalue().equals(projectType))//实现梦想
        {
            mv = new ModelAndView("easy/user/project/orderDetail/dreamProjOrderDetail.page");
        }
        
        mv.addObject("orderDetail", orderDetail);
        return mv;
    }
    
    /**
     * 项目管理页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/projectManage.do")
    public Object projectManage(@ModelAttribute("projectId") String projectId,
        @ModelAttribute("projectType") Integer projectType, @ModelAttribute("to") String to,
        HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("easy/user/project/projectManage.page");
        IdPageReq req = new IdPageReq();
        req.setId(projectId);
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/findProjectStatus",
                RequestMethod.POST,
                request);
        mv.addObject("projectStatus", CommonUtil.getJSONObject(result, CommonConstant.JSON_KEY_SINGLE_RESULT));
        return mv.addObject("dateLastLogin", LoginCache.getFrontUserInfo().getDateLastLogin());
    }
    
    /**
     * 项目支持订单列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/projectOrderList.do")
    public Object projectSupportList(@ModelAttribute("projectId") String projectId,
        @ModelAttribute("projectType") Integer projectType, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = null;
        if (ProjectTypeEnum.DBJZ.getDbvalue().equals(projectType)
            || ProjectTypeEnum.ZNJZ.getDbvalue().equals(projectType)
            || ProjectTypeEnum.DWBH.getDbvalue().equals(projectType)
            || ProjectTypeEnum.FPZX.getDbvalue().equals(projectType)
            || ProjectTypeEnum.QTJZ.getDbvalue().equals(projectType))
        {
            mv = new ModelAndView("easy/user/project/myLaunch/publicWelfareProjOrderList_temple");
        }
        else if (ProjectTypeEnum.HBXM.getDbvalue().equals(projectType))
        {
            mv = new ModelAndView("easy/user/project/myLaunch/returnProjOrderList_temple");
            IdPageReq req = new IdPageReq();
            req.setId(projectId);
            String result =
                new CommonUtil().callInterfaceMethod(req, "project/query/v/returnAmtList", RequestMethod.POST, request);
            mv.addObject("returnAmtList", JSONObject.parseObject(result).getJSONObject("data").get("list"));
        }
        else if (ProjectTypeEnum.MXXM.getDbvalue().equals(projectType))
        {
            mv = new ModelAndView("easy/user/project/myLaunch/dreamProjOrderList_temple");
        }
        
        return mv;
    }
    
    /**
     * 项目支持订单列表ajax 查询
     * <功能详细描述>
     * @param request
     * @param response 
     * @return
     */
    @RequestMapping(value = "/projectOrderListAjax.do")
    public Object projectSupportListAjax(FindSupportListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        //获取我发起的项目列表
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/order/v/supportList", RequestMethod.POST, request);
        JSONObject object = JSONObject.parseObject(data);
        return object;
    }
    
    /**
     * 发起项目列表页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "myInitProjectList.do")
    public Object launchProjectList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("easy/user/project/myInitProjectList_temple");
        return mv;
    }
    
    /**
     * 发起项目列表ajax 查询
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "myInitProjectListAjax.do")
    public Object myInitProjectListAjax(FindProjectBaseReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/myInitProjectList",
                RequestMethod.POST,
                request);
        JSONObject object = JSONObject.parseObject(data);
        return object;
    }
    
    /**
     * 确认收货
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "前台用户确认收货", modul = "个人中心")
    @RequestMapping(value = "user/commonConfirmReceiptAjax.do")
    public Object commonConfirmReceiptAjax(IdReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/order/v/user/confirmReceipt",
                RequestMethod.POST,
                request);
        JSONObject object = JSONObject.parseObject(data);
        return object;
    }
    
    /**
     * 确认发货
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "前台用户确认发货", modul = "个人中心")
    @RequestMapping(value = "user/commonConfirmPostAjax.do")
    public Object commonConfirmPostAjax(UpdateOrderSupportReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data = new CommonUtil().callInterfaceMethod(req, "project/order/v/post", RequestMethod.POST, request);
        JSONObject object = JSONObject.parseObject(data);
        return object;
    }
    
    /**
     * 查看项目失败、删除原因
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "operateReasonAjax.do")
    public Object operateReasonAjax(GetProjectReasonReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/operate/v/operateReason", RequestMethod.POST, request);
        JSONObject object = JSONObject.parseObject(data);
        return object;
    }
    
    /**
     * 跳转编辑项目页面
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/updateProjectPage.do")
    public Object updateProjectPage(ProjectDetailsReq req, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = null;
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/projectDetails", RequestMethod.POST, request);
        JSONObject object = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        ProjectDetailsResp projectDetail = object.toJavaObject(ProjectDetailsResp.class);
        String projectType = projectDetail.getType();
        if (Integer.parseInt(projectDetail.getSupportTimes()) > 0)
        {
            //有订单
            switch (projectType)
            {
                case "1":
                case "2":
                case "3":
                case "4":
                case "5":
                    mv = new ModelAndView("easy/user/project/projectEdit/editWelfareProjectHave_temple");
                    break;
                case "6":
                    mv = new ModelAndView("easy/user/project/projectEdit/editReturnProjectHave_temple");
                    break;
                case "7":
                    mv = new ModelAndView("easy/user/project/projectEdit/editDreamProjectHave_temple");
                    break;
                default:
                    break;
            }
        }
        else
        {
            //无订单
            switch (projectType)
            {
                case "1":
                case "2":
                case "3":
                case "4":
                case "5":
                    mv = new ModelAndView("easy/user/project/projectEdit/editWelfareProjectNot_temple");
                    break;
                case "6":
                    mv = new ModelAndView("easy/user/project/projectEdit/editReturnProjectNot_temple");
                    break;
                case "7":
                    mv = new ModelAndView("easy/user/project/projectEdit/editDreamProjectNot_temple");
                    break;
                default:
                    break;
            }
            //获取协议模板
            List<SiteProtocolModelResp> protocolModelList =
                (List<SiteProtocolModelResp>)SystemCache.getCache(SystemConstant.CacheKey.PROTOCOL_MODEL_LIST);
            mv.addObject("protocolModel", protocolModelList.get(1).getProtocolTitle());
        }
        if (ProjectTypeEnum.HBXM.getDataBaseVal().equals(projectType)
            || ProjectTypeEnum.MXXM.getDataBaseVal().equals(projectType))
        {
            //获取项目标签
            List<FindAllTProjectLabelTypeResp> labels =
                (List<FindAllTProjectLabelTypeResp>)SystemCache.getCache(SystemConstant.CacheKey.PROJECT_LABEL_LIST);
            mv.addObject("labels", labels);
            //产品急销回报数量上限
            String returnCountMax = (String)SystemCache.getCache(EasySystemVariable.RETURN_COUNT_MAX.getKey());
            mv.addObject("returnCountMax", returnCountMax);
            //实现梦想梦想目标上限
            String targetCountMax = (String)SystemCache.getCache(EasySystemVariable.TARGET_COUNT.getKey());
            mv.addObject("targetCountMax", targetCountMax);
        }
        //获取发起项目最低金额
        String projectAmountMin = (String)SystemCache.getCache(EasySystemVariable.PROJECT_AMOUNT_MIN.getKey());
        mv.addObject("projectAmountMin", projectAmountMin);
        mv.addObject("projectDetail", projectDetail);
        return mv;
    }
    
    /**
     * 修改个人求助(大病救助、灾难救助、动物保护、扶贫助学、其他救助)
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "修改个人求助(大病救助、灾难救助、动物保护、扶贫助学、其他救助)", modul = "项目管理")
    @ResponseBody
    @RequestMapping(value = "/updateWelfareProject.do")
    public Object updateWelfareProject(UpdateWelfareProjectReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/modifyWelfareProject",
                RequestMethod.POST,
                request);
        return JSON.parseObject(data);
    }
    
    /**
     * 修改产品急销
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "修改产品急销", modul = "项目管理")
    @ResponseBody
    @RequestMapping(value = "/updateReturnProject.do")
    public Object updateReturnProject(UpdateReturnProjectReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/modifyReturnProject",
                RequestMethod.POST,
                request);
        return JSON.parseObject(data);
    }
    
    /**
     * 修改实现梦想
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "修改实现梦想", modul = "项目管理")
    @ResponseBody
    @RequestMapping(value = "/updateDreamProject.do")
    public Object updateDreamProject(UpdateDreamProjectReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/modifyDreamProject",
                RequestMethod.POST,
                request);
        return JSON.parseObject(data);
    }
    
    /**
     * 删除项目页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "delete.do")
    public Object deleteProject(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("easy/user/project/toDeleteProject_temple");
        return mv;
    }
    
    /**
     * 删除项目请求
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "deleteAjax.do")
    @SystemFrontLog(desc = "前台用户删除项目", modul = "项目管理")
    public Object deleteProjectAjax(ChangeProjectStatusReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/operate/v/delete", RequestMethod.POST, request);
        JSONObject object = JSONObject.parseObject(data);
        return object;
    }
    
    /**
     * 提前结束项目页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "aheadEndProject.do")
    public Object aheadEndProject(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("easy/user/project/aheadEndProject_temple");
        return mv;
    }
    
    /**
     * 提前结束项目请求
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "前台用户提前结束项目", modul = "项目管理")
    @RequestMapping(value = "aheadEndProjectAjax.do")
    public Object aheadEndProjectAjax(ProjectBasicReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/operate/v/finish", RequestMethod.POST, request);
        JSONObject object = JSONObject.parseObject(data);
        return object;
    }
    
    /**
     * 更新项目动态页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "addDynamic.do")
    public Object addDynamic(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("easy/user/project/addDynamic_temple");
        return mv;
    }
    
    /**
     * 更新项目动态请求
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "前台用户更新项目动态", modul = "项目管理")
    @RequestMapping(value = "addDynamicAjax.do")
    public Object addDynamicAjax(InsertProjectDynamicReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/operate/v/addDynamic", RequestMethod.POST, request);
        JSONObject object = JSONObject.parseObject(data);
        return object;
    }
    
    /**
     * 跳转项目验证页面
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/projectValidPage.do")
    public Object projectValidPage(String projectId, String projectType, HttpServletRequest request,
        HttpServletResponse response)
    {
        //查询项目验证状态
        IdReq req = new IdReq();
        req.setId(projectId);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/validate/v/isProAuthenticated",
                RequestMethod.POST,
                request);
        JSONObject object = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        FindProAuthenStatuResp statusResp = object.toJavaObject(FindProAuthenStatuResp.class);
        
        ModelAndView mv = null;
        if (AuditStatusEnum.DSH.getDataBaseVal().equals(statusResp.getStatus())
            || AuditStatusEnum.SHBTG.getDataBaseVal().equals(statusResp.getStatus())
            || AuditStatusEnum.SHTG.getDataBaseVal().equals(statusResp.getStatus()))
        {
            //已进行项目验证
            mv = new ModelAndView("easy/user/project/projectValid/validationRecords_temple");
            mv.addObject("validationId", statusResp.getValidationId());
        }
        else
        {
            //未进行项目验证
            mv = new ModelAndView("easy/user/project/projectValidChoose_temple");
            mv.addObject("projectId", projectId);
            mv.addObject("projectType", projectType);
        }
        return mv;
    }
    
    /**
     * 项目验证记录Ajax
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/projectValidRecordAjax.do")
    public Object projectValidRecord(FindAuthenRecordReq req, String projectType, HttpServletRequest request,
        HttpServletResponse response)
    {
        //查询项目验证记录
        req.setIsFront("1");
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/authenticatedRecord",
                RequestMethod.POST,
                request);
        return JSON.parse(data);
    }
    
    /**
     * 跳转项目验证编辑页面
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/editProjectValidPage.do")
    public Object editProjectValidPage(String id, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = null;
        
        //查询项目验证信息
        FindProjectValidationReq req = new FindProjectValidationReq();
        req.setValidationId(id);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/validate/v/proAuthenticatedDetail",
                RequestMethod.POST,
                request);
        JSONObject dataObject = (JSONObject)CommonUtil.getJSONObject(data, null);
        JSONObject singleObject = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        Map<String, Object> dataMap = dataObject.toJavaObject(Map.class);
        FindProjectValidationResp validResp = singleObject.toJavaObject(FindProjectValidationResp.class);
        String validationType = validResp.getValidationType();
        String projectType = validResp.getProjectType();
        
        //大病救助
        if (ProjectValidationTypeEnum.BRYZ.getDataBaseVal().equals(validationType))
        {
            //所有项目（本人验证）
            mv = new ModelAndView("easy/user/project/projectValid/editValidation_myself.page");
            
        }
        else if (ProjectValidationTypeEnum.QSYZ.getDataBaseVal().equals(validationType))
        {
            //大病救助（亲属验证）
            if (ProjectTypeEnum.DBJZ.getDataBaseVal().equals(projectType))
            {
                mv = new ModelAndView("easy/user/project/projectValid/editValidation_relatives.page");
            }
        }
        else if (ProjectValidationTypeEnum.FQYZ.getDataBaseVal().equals(validationType))
        {
            //大病救助（夫妻验证）
            if (ProjectTypeEnum.DBJZ.getDataBaseVal().equals(projectType))
            {
                mv = new ModelAndView("easy/user/project/projectValid/editValidation_couple.page");
            }
        }
        else if (ProjectValidationTypeEnum.ZZYZ.getDataBaseVal().equals(validationType))
        {
            //所有项目（组织验证/企业验证）
            mv = new ModelAndView("easy/user/project/projectValid/editValidation_group.page");
        }
        
        //项目验证信息
        mv.addObject("dataMap", dataMap);
        //图片模板（身份证示例图片、医疗证明示例图片）
        List<FindAllTSiteImageTemplateResp> imgList =
            (List<FindAllTSiteImageTemplateResp>)SystemCache.getCache(SystemConstant.CacheKey.IMAGE_MODEL_LIST);
        mv.addObject("cardImgDefault", imgList.get(2).getImageUrl());
        mv.addObject("proveImgDefault", imgList.get(3).getImageUrl());
        mv.addObject("weddingImgDefault", imgList.get(4).getImageUrl());
        return mv;
    }
    
    /**
     * 项目管理页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/hasPermissionAjax.do")
    @ResponseBody
    public Object hasPermissionAjax(@ModelAttribute("projectId") String projectId, HttpServletRequest request,
        HttpServletResponse response)
    {
        
        IdPageReq req = new IdPageReq();
        req.setId(projectId);
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/findExsitProjectInfo",
                RequestMethod.POST,
                request);
        return JSON.parse(result);
    }
}
