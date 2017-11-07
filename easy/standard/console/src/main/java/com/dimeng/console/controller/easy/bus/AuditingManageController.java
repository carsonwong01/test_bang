package com.dimeng.console.controller.easy.bus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemConsoleLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.model.bus.CommonVerificateAuditReq;
import com.dimeng.model.bus.DeleteCommentReq;
import com.dimeng.model.bus.DeleteDynamicsReq;
import com.dimeng.model.bus.FindCommentListReq;
import com.dimeng.model.bus.FindDynamicsListReq;
import com.dimeng.model.bus.FindInformantDetailListReq;
import com.dimeng.model.bus.FindInformantListReq;
import com.dimeng.model.bus.FindProjectAuditListReq;
import com.dimeng.model.bus.ProjectValidationReq;
import com.dimeng.model.common.IdPageReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;

/**
 * 
 * 审核管理
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月29日]
 */
@Controller
@RequestMapping(value = "bus/auditingManage")
public class AuditingManageController extends BaseController
{
    /**
     * 后台-业务管理-审核管理-项目验证审核-列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "projectAuditList.do")
    public Object projectAuditList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/auditingManage/projectAuditList");
        return mv;
    }
    
    /**
     * 后台-业务管理-审核管理-项目验证审核-列表数据
     *  <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "projectAuditListAjax.do")
    @RequiresPermissions("YWGL_SHGL_XMYZSH_MU")
    public Object projectAuditListAjax(FindProjectAuditListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/findProjectAuditList",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    /**
     * 后台-业务管理-审核管理-项目验证审核-导出列表数据
     *  <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequestMapping(value = "projectAuditListExport.do")
    @RequiresPermissions("YWGL_SHGL_XMYZSH_DC")
    public void projectAuditListExport(FindProjectAuditListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "bus/auditingManage/v/findProjectAuditList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 后台-业务管理-审核管理-项目动态-列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findDynamicsList.do")
    public Object findDynamicsList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/auditingManage/findDynamicsList");
        return mv;
    }
    
    /**
     * 后台-业务管理-审核管理-项目动态-列表数据
     *  <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findDynamicsListAjax.do")
    @RequiresPermissions("YWGL_SHGL_XMDTGL_MU")
    public Object findDynamicsListAjax(FindDynamicsListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/findDynamicsList",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    /**
     *后台-业务管理-审核管理-项目动态管理-详情
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findDynamicsDetails.do")
    public Object findDynamicsDetails(@ModelAttribute("projectId")
    String projectId, @ModelAttribute("projectNo")
    String projectNo, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/auditingManage/findDynamicsDetails");
        
        return mv;
    }
    
    /**
     *后台-业务管理-审核管理-项目动态管理-详情
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findDynamicsDetailsAjax.do")
    @RequiresPermissions("YWGL_SHGL_XMDTGL_DTXQ")
    public Object findDynamicsDetailsAjax(IdPageReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/findDynamicsDetails",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    @ResponseBody
    @RequestMapping(value = "deleteDynamicsAjax.do")
    @RequiresPermissions("YWGL_SHGL_XMDTGL_SC")
    public Object deleteDynamicsAjax(DeleteDynamicsReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/deleteDynamics",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    /**
     * 后台-业务管理-审核管理-评论管理-列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findCommentList.do")
    public Object findCommentList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/auditingManage/findCommentList");
        return mv;
    }
    
    /**
     * 后台-业务管理-审核管理-评论管理-列表数据
     *  <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findCommentListAjax.do")
    @RequiresPermissions("YWGL_SHGL_PLGL_MU")
    public Object findCommentListAjax(FindCommentListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/findCommentList",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    /**
     * 后台-业务管理-审核管理-评论管理-删除记录
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws ServicesException
     */
    @SystemConsoleLog(desc = "删除项目评论", modul = "业务管理", isRetrunVal = false)
    @RequestMapping(value = "deleteCommentAjax", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    @RequiresPermissions("YWGL_SHGL_PLGL_SC")
    public Object deleteCommentAjax(DeleteCommentReq req, HttpServletRequest request, HttpServletResponse response)
        throws ServicesException
    {
        String result =
            new CommonUtil().callInterfaceMethod(req, "bus/auditingManage/v/deleteComment", RequestMethod.POST, request);
        return JSONObject.parse(result);
    }
    
    /**
     * 查询评论详情列表
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findCommentDetailListAjax.do")
    @RequiresPermissions("YWGL_SHGL_PLGL_CK")
    public Object findCommentDetailListAjax(IdReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/findCommentDetailList",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    /**
     * 审核管理-查询举报列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findInformantList.do")
    public Object findInformantList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/auditingManage/findInformantList");
        return mv;
    }
    
    /**
     * 审核管理-查询举报列表-数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findInformantListAjax.do")
    @RequiresPermissions("YWGL_SHGL_JBGL_MU")
    public Object findInformantListAjax(FindInformantListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/findInformantList",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    /**
     * 审核管理-查询举报列表-数据-导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequestMapping(value = "findInformantListExport.do")
    @RequiresPermissions("YWGL_SHGL_JBGL_DC")
    public void findInformantListExport(FindInformantListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "bus/auditingManage/v/findInformantList", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 审核管理-查询举报详情列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "findInformantDetailList.do")
    public Object findInformantDetailList(@ModelAttribute("projectId")
    String projectId, @ModelAttribute("totalCount")
    String totalCount, @ModelAttribute("currentCount")
    String currentCount, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/auditingManage/findInformantDetailList");
        return mv;
    }
    
    /**
     * 审核管理-查询举报详情列表-数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findInformantDetailListAjax.do")
    @RequiresPermissions("YWGL_SHGL_JBGL_JBXQ")
    public Object findInformantDetailListAjax(FindInformantDetailListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/findInformantDetailList",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    /**
     * 审核管理-查询举报详情列表-数据-导出
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequestMapping(value = "findInformantDetailListExport.do")
    @RequiresPermissions("YWGL_SHGL_JBGL_DC")
    public void findInformantDetailListExport(FindInformantDetailListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req,
            "bus/auditingManage/v/findInformantDetailList",
            RequestMethod.POST,
            request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 审核管理-查询举报内容
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findInformantContentAjax.do")
    public Object findInformantContentAjax(IdReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/findInformantContent",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    /**
     * 后台-业务管理-审核管理-项目验证审核-验证详情
     * <功能详细描述>
     * @param validationId
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "proAuthenticatedDetail.do")
    @RequiresPermissions("YWGL_SHGL_XMYZSH_YZXQ")
    public Object proAuthenticatedDetail(@ModelAttribute("validationId")
    String validationId, @ModelAttribute("to")
    String to, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/auditingManage/proAuthenticatedDetail");
        //查询验证详情信息
        ProjectValidationReq req = new ProjectValidationReq();
        req.setValidationId(validationId);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/validate/v/proAuthenticatedDetail",
                RequestMethod.POST,
                request);
        JSONObject jsonObject = JSONObject.parseObject(data);
        JSONObject proDetail =
            jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).getJSONObject(CommonConstant.JSON_KEY_SINGLE_RESULT);
        if (proDetail != null)
        {
            proDetail.put("receiveCardImageIds",
                jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("receiveCardImageIds"));
            proDetail.put("useProveImgIds", jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA)
                .get("useProveImgIds"));
            proDetail.put("projectProveImgIds",
                jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("projectProveImgIds"));
            proDetail.put("recipientCardImageIds",
                jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("recipientCardImageIds"));
            proDetail.put("accountBookImgIds",
                jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("accountBookImgIds"));
            proDetail.put("proveImgIds", jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("proveImgIds"));
            proDetail.put("useProveImgIds", jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA)
                .get("useProveImgIds"));
            proDetail.put("projectProveImgIds",
                jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("projectProveImgIds"));
        }
        mv.addObject("validationDetail", proDetail);
        return mv;
    }
    
    /**
     * 后台-业务管理-审核管理-项目验证审核-验证详情-审核记录列表
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "authenticatedRecordAjax.do")
    public Object authenticatedRecordAjax(IdReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/authenticatedRecord",
                RequestMethod.POST,
                request);
        return JSON.parse(data);
    }
    
    /**
     * 后台-业务管理-审核管理-项目验证审核-验证详情-审核操作
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemConsoleLog(desc = "项目验证审核操作", modul = "业务管理", isRetrunVal = false)
    @ResponseBody
    @RequestMapping(value = "commonVerificateAuditAjax.do")
    @RequiresPermissions("YWGL_SHGL_XMYZSH_YZSH")
    public Object commonVerificateAuditAjax(CommonVerificateAuditReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/commonVerificateAudit",
                RequestMethod.POST,
                request);
        return JSON.parse(data);
    }
}
