package com.dimeng.console.controller.easy.bus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dimeng.abilitys.annotation.SystemConsoleLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.enums.ProjectStatusEnum;
import com.dimeng.enums.ProjectTypeEnum;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.bus.ChangeProjectStatusReq;
import com.dimeng.model.bus.FindProjectListReq;
import com.dimeng.model.bus.GetProjectReasonReq;
import com.dimeng.model.bus.ProjectDetailsReq;
import com.dimeng.model.bus.ProjectValidationReq;
import com.dimeng.model.bus.RecommendProReq;
import com.dimeng.model.bus.UpdateProjectShieldStatusReq;
import com.dimeng.model.common.IdPageReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.model.finance.FindPaymentListReq;
import com.dimeng.utils.Common;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.Download;
import com.dimeng.utils.ExportUtil;

/**
 * 
 * 项目管理
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月29日]
 */
@Controller
@RequestMapping(value = "bus/projectManage")
public class ProjectManageController extends BaseController
{
    /**
     * 后台-业务管理-项目管理-所有项目列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "allProjectList.do")
    public Object allProjectList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/projectManage/allProjectList");
        return mv;
    }
    
    /**
     * 后台-业务管理-项目管理-众筹中项目列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "pendingSubmitList.do")
    public Object pendingSubmitList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/projectManage/pendingSubmitList");
        return mv;
    }
    
    /**
     * 后台-业务管理-项目管理-众筹成功项目列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "pendingAuditingList.do")
    public Object pendingAuditingList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/projectManage/pendingAuditingList");
        return mv;
    }
    
    /**
     * 后台-业务管理-项目管理-众筹失败项目列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "auditingNotPassList.do")
    public Object auditingNotPassList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/projectManage/auditingNotPassList");
        return mv;
    }
    
    /**
     * 后台-业务管理-项目管理-已删除项目列表
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "preheatingList.do")
    public Object preheatingList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/projectManage/preheatingList");
        return mv;
    }
    
    /**
     * 后台-业务管理-项目管理-项目列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getProjectListAjax.do")
    @RequiresPermissions("YWGL_XMGL_SYXM_MU")
    public Object allProjectListAjax(FindProjectListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/projectList", RequestMethod.POST, request);
        return JSON.parse(data);
    }
    
    /**
     * 导出所有项目列表
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequestMapping(value = "projectListExport.do")
    @RequiresPermissions("YWGL_XMGL_SYXM_DC")
    public void projectListExport(FindProjectListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "project/query/v/projectList", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 跳转查看项目信息页面
     * <功能详细描述>
     * @param projectId
     * @param request
     * @param response
     * entry参数来区分是从哪里进来的详情页面
     * extraParameter 额外根据来源附属参数
     * @return
     */
    @RequestMapping(value = "projectDetails.do")
    public Object projectDetails(@ModelAttribute("projectId")
    String projectId, @ModelAttribute("type")
    String type, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/projectManage/local/projectDetails");
        //查询项目标题
        IdReq req = new IdReq();
        req.setId(projectId);
        String result =
            new CommonUtil().callInterfaceMethod(req, "project/operate/v/findProjectTitle", RequestMethod.POST, request);
        mv.addObject("projectTitle", CommonUtil.getJSONObject(result, CommonConstant.JSON_KEY_SINGLE_RESULT));
        return mv;
    }
    
    /**
     * 查看项目信息-项目信息页面
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "projectBasicInfo.do")
    public Object projectBasicInfo(@ModelAttribute("projectId")
    String projectId, @ModelAttribute("type")
    Integer type, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = null;
        if (ProjectTypeEnum.DBJZ.getDbvalue().equals(type) || ProjectTypeEnum.ZNJZ.getDbvalue().equals(type)
            || ProjectTypeEnum.DWBH.getDbvalue().equals(type) || ProjectTypeEnum.FPZX.getDbvalue().equals(type)
            || ProjectTypeEnum.QTJZ.getDbvalue().equals(type))
        {
            mv = new ModelAndView("pages/easy/bus/projectManage/local/publicWelfareProjBasicInfo");
        }
        else if (ProjectTypeEnum.HBXM.getDbvalue().equals(type))
        {
            mv = new ModelAndView("pages/easy/bus/projectManage/local/returnProjBasicInfo");
            
        }
        else if (ProjectTypeEnum.MXXM.getDbvalue().equals(type))
        {
            mv = new ModelAndView("pages/easy/bus/projectManage/local/dreamProjBasicInfo");
        }
        else
        {
        }
        ProjectDetailsReq req = new ProjectDetailsReq();
        req.setProjectId(projectId);
        req.setType(type.toString());
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/projectDetails", RequestMethod.POST, request);
        JSONObject proDetail = (JSONObject)CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        proDetail.put("extension",
            proDetail.getString("coverImgUrl").substring(proDetail.getString("coverImgUrl").lastIndexOf(".") + 1));
        String labels = proDetail.getString("label");
        if (StringUtil.notEmpty(labels))
        {
            StringBuilder stringBuilder = new StringBuilder(labels);
            int startIndex = stringBuilder.indexOf(",");
            int endIndex = stringBuilder.lastIndexOf(",");
            if (endIndex + 1 == stringBuilder.length())
            {
                stringBuilder.deleteCharAt(endIndex);
            }
            if (startIndex == 0)
            {
                stringBuilder.deleteCharAt(startIndex);
            }
            proDetail.put("label", stringBuilder.toString());
        }
        mv.addObject("proDetail", proDetail);
        return mv;
    }
    
    /**
     * 查看项目信息-项目详情页面
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "projectDes.do")
    public Object projectDes(ProjectDetailsReq req, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/projectManage/local/projectDes");
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/projectContent", RequestMethod.POST, request);
        Object object = CommonUtil.getJSONObject(data, CommonConstant.JSON_KEY_SINGLE_RESULT);
        mv.addObject("proContent", object);
        return mv;
    }
    
    /**
     * 查看项目信息-回报详情页面
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "projectReturns.do")
    public Object projectReturns(@ModelAttribute("projectId")
    String projectId, @ModelAttribute("type")
    String type, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/projectManage/local/projectReturns");
        return mv;
    }
    
    /**
     * 回报列表
     * @param req
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "projectReturnsAjax.do")
    @ResponseBody
    public Object projectReturnsAjax(IdPageReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/returnTargetList", RequestMethod.POST, request);
        return JSON.parse(data);
    }
    
    /************推荐项目*********************/
    /**
     * 后台-站点管理-推荐项目管理-项目列表
     * <功能详细描述>
     * @author "song"
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "recommendProList.do")
    public Object recommendProList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/projectManage/recommendProList");
        return mv;
    }
    
    /**
     * 后台-站点管理-推荐项目管理-项目列表导出
     * <功能详细描述>
     * @author "song"
     * @param request
     * @param response
     * @return
     */
    @RequiresPermissions("ZDGL_SYXM_XMTJ_DC")
    @RequestMapping(value = "recomProjectListExport.do")
    public void recomProjectListExport(FindProjectListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "project/query/v/recommendProList", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 后台-站点管理-推荐项目管理-项目列表
     * <功能详细描述>
     * @author "song"
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "getRecommendProListAjax.do")
    @ResponseBody
    @RequiresPermissions("ZDGL_SYXM_XMTJ_MU")
    public Object getRecommendProListAjax(FindProjectListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/recommendProList", RequestMethod.POST, request);
        return JSON.parse(data);
    }
    
    /**
     * 站点管理-推荐项目功能
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemConsoleLog(desc = "推荐项目", modul = "站点管理")
    @ResponseBody
    @RequestMapping(value = "recommendPro.do", method = RequestMethod.POST)
    @RequiresPermissions("ZDGL_SYXM_XMTJ_TJ")
    public Object recommendPro(RecommendProReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/recommendPro", RequestMethod.POST, request);
        return JSONObject.parse(result);
    }
    
    /**
     * 站点管理-推荐项目-修改推荐项目
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemConsoleLog(desc = "修改推荐项目", modul = "站点管理")
    @ResponseBody
    @RequestMapping(value = "updRecommendPro.do", method = RequestMethod.POST)
    public Object updRecommendPro(RecommendProReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/updRecommendPro", RequestMethod.POST, request);
        return JSONObject.parse(result);
    }
    
    /**
     * 站点管理-查看推荐详情
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findrecommendInfo.do")
    @RequiresPermissions("ZDGL_SYXM_XMTJ_TJXQ")
    public Object findrecommendInfo(RecommendProReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/findrecommendInfo", RequestMethod.POST, request);
        return JSONObject.parse(result);
    }
    
    /**
     * 后台-业务管理-项目管理-查看项目-查看-支持记录
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "projectSupportRecords.do")
    public Object projectSupportRecords(@ModelAttribute("projectId")
    String projectId, @ModelAttribute("type")
    Integer type, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = null;
        if (ProjectTypeEnum.DBJZ.getDbvalue().equals(type) || ProjectTypeEnum.ZNJZ.getDbvalue().equals(type)
            || ProjectTypeEnum.DWBH.getDbvalue().equals(type) || ProjectTypeEnum.FPZX.getDbvalue().equals(type)
            || ProjectTypeEnum.QTJZ.getDbvalue().equals(type))
        {
            mv = new ModelAndView("pages/easy/bus/projectManage/local/publicWelfareProjSupportRecords");
        }
        else if (ProjectTypeEnum.HBXM.getDbvalue().equals(type))
        {
            mv = new ModelAndView("pages/easy/bus/projectManage/local/returnProjSupportRecords");
        }
        else if (ProjectTypeEnum.MXXM.getDbvalue().equals(type))
        {
            mv = new ModelAndView("pages/easy/bus/projectManage/local/dreamProjSupportRecords");
        }
        else
        {
        }
        return mv;
    }
    
    /**
     * 后台-业务管理-项目管理-查看项目-查看-项目动态
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "projectDynamicsDetails.do")
    public Object projectDynamicsDetails(@ModelAttribute("projectId")
    String projectId, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/projectDynamics/projectDynamicsDetails");
        
        return mv;
    }
    
    /**
     * 后台-业务管理-项目管理-查看项目-查看-项目动态列表数据
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "projectDynamicsDetailsAjax.do")
    public Object projectDynamicsDetailsAjax(IdPageReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String result =
            new CommonUtil().callInterfaceMethod(req,
                "bus/auditingManage/v/findDynamicsDetails",
                RequestMethod.POST,
                request);
        return JSONObject.parse(result);
    }
    
    /**
     * 后台-业务管理-项目管理-众筹中项目列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "pendingSubmitListAjax.do")
    @RequiresPermissions("YWGL_XMGL_ZCZ_MU")
    public Object pendingSubmitListAjax(FindProjectListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        req.setProjectStatus(ProjectStatusEnum.ZCZ.getDataBaseVal());
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/projectList", RequestMethod.POST, request);
        return JSON.parse(data);
    }
    
    /**
     * 导出后台筹资中项目
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequestMapping(value = "pendingSubmitListExport.do")
    @RequiresPermissions("YWGL_XMGL_ZCZ_DC")
    public void pendingSubmitListExport(FindProjectListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        req.setProjectStatus(ProjectStatusEnum.ZCZ.getDataBaseVal());
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "project/query/v/projectList", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 后台-业务管理-项目管理-众筹成功项目列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "pendingAuditingListAjax.do")
    @RequiresPermissions("YWGL_XMGL_ZCCG_MU")
    public Object pendingAuditingListAjax(FindProjectListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        req.setProjectStatus(ProjectStatusEnum.ZCCG.getDataBaseVal());
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/projectList", RequestMethod.POST, request);
        return JSON.parse(data);
    }
    
    /**
     * 导出后台筹资成功项目
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequestMapping(value = "pendingAuditingListExport.do")
    @RequiresPermissions("YWGL_XMGL_ZCCG_DC")
    public void pendingAuditingListExport(FindProjectListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        req.setProjectStatus(ProjectStatusEnum.ZCCG.getDataBaseVal());
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "project/query/v/projectList", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 后台-业务管理-项目管理-众筹失败项目列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "auditingNotPassListAjax.do")
    @RequiresPermissions("YWGL_XMGL_ZCSB_MU")
    public Object auditingNotPassListAjax(FindProjectListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        req.setProjectStatus(ProjectStatusEnum.ZCSB.getDataBaseVal());
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/projectList", RequestMethod.POST, request);
        return JSON.parse(data);
    }
    
    /**
     * 导出后台筹资失败项目
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequestMapping(value = "auditingNotPassListExport.do")
    @RequiresPermissions("YWGL_XMGL_ZCSB_DC")
    public void auditingNotPassListExport(FindProjectListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        req.setProjectStatus(ProjectStatusEnum.ZCSB.getDataBaseVal());
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "project/query/v/projectList", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 后台-业务管理-项目管理-已删除项目列表数据
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "preheatingListAjax.do")
    @RequiresPermissions("YWGL_XMGL_YSC_MU")
    public Object preheatingListAjax(FindProjectListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        req.setProjectStatus(ProjectStatusEnum.YSC.getDataBaseVal());
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/projectList", RequestMethod.POST, request);
        return JSON.parse(data);
    }
    
    /**
     * 导出后台已删除项目
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @RequestMapping(value = "preheatingListExport.do")
    @RequiresPermissions("YWGL_XMGL_YSC_DC")
    public void preheatingListExport(FindProjectListReq req, HttpServletRequest request, HttpServletResponse response)
    {
        req.setProjectStatus(ProjectStatusEnum.YSC.getDataBaseVal());
        String fileName = req.getFileName();
        String filePath = ExportUtil.filePath;
        String servicePath = Common.UrlEncoder(filePath.concat(fileName), ExportUtil.encode);
        req.setExportTitle(Common.UrlEncoder(req.getExportTitle(), ExportUtil.encode));
        req.setExportPath(servicePath);
        new CommonUtil().callInterfaceMethod(req, "project/query/v/projectList", RequestMethod.POST, request);
        Download.binaryOutput(request, response, fileName, filePath);
    }
    
    /**
     * 删除、取消项目
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @SystemConsoleLog(desc = "删除、取消项目", modul = "业务管理", isRetrunVal = true)
    @ResponseBody
    @RequestMapping(value = "submitChangeStatusAjax.do")
    @RequiresPermissions(value = {"YWGL_XMGL_ZCZ_QX", "YWGL_XMGL_ZCZ_SC"}, logical = Logical.OR)
    public Object submitChangeStatusAjax(ChangeProjectStatusReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/operate/v/updateStatus", RequestMethod.POST, request);
        return JSON.parse(data);
    }
    
    /**
     * 查看失败、取消原因
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     */
    @ResponseBody
    @RequestMapping(value = "operateReasonAjax.do")
    public Object operateReasonAjax(GetProjectReasonReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/operate/v/operateReason", RequestMethod.POST, request);
        return JSON.parse(data);
    }
    
    /**
     * 后台-业务管理--项目详情-项目验证
     * <功能详细描述>
     * @param validationId
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "proAuthenticatedDetail.do")
    public Object proAuthenticatedDetail(@ModelAttribute("projectId")
    String projectId, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/bus/projectManage/local/proAuthenticatedDetail");
        //查询验证详情信息
        ProjectValidationReq req = new ProjectValidationReq();
        req.setProjectId(projectId);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/validate/v/proAuthenticatedDetail",
                RequestMethod.POST,
                request);
        JSONObject jsonObject = JSONObject.parseObject(data);
        JSONObject dataObject = jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA);
        JSONObject proDetail = null;
        //存在项目认证信息
        if (null != dataObject)
        {
            proDetail = dataObject.getJSONObject(CommonConstant.JSON_KEY_SINGLE_RESULT);
            if (proDetail != null)
            {
                proDetail.put("receiveCardImageIds",
                    jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("receiveCardImageIds"));
                proDetail.put("useProveImgIds",
                    jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("useProveImgIds"));
                proDetail.put("projectProveImgIds",
                    jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("projectProveImgIds"));
                proDetail.put("recipientCardImageIds",
                    jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("recipientCardImageIds"));
                proDetail.put("accountBookImgIds",
                    jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("accountBookImgIds"));
                proDetail.put("proveImgIds", jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("proveImgIds"));
                proDetail.put("useProveImgIds",
                    jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("useProveImgIds"));
                proDetail.put("projectProveImgIds",
                    jsonObject.getJSONObject(CommonConstant.JSON_KEY_DATA).get("projectProveImgIds"));
            }
        }
        else
        {
            //还没有提交验证信息
            proDetail = new JSONObject();
            proDetail.put("auditStatus", "0");
        }
        mv.addObject("validationDetail", proDetail);
        return mv;
    }
    
    /**
     * 后台-业务管理-项目管理-项目列表-项目详情-支持记录
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "projectSupportRecordsAjax.do")
    public Object projectSupportRecordsAjax(FindPaymentListReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "finance/paymentManage/v/findPaymentList",
                RequestMethod.POST,
                request);
        JSONObject searchPaymentRecordsList = (JSONObject)CommonUtil.getJSONObject(data, null);
        return searchPaymentRecordsList;
    }
    
    /**
     * 后台-业务管理-项目管理-项目列表-屏蔽
     * 众筹成功项目列表
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemConsoleLog(desc = "成功项目上/下架", modul = "业务管理", isRetrunVal = true)
    @ResponseBody
    @RequestMapping(value = "updateSucProjectShieldStatusAjax.do")
    @RequiresPermissions(value = {"YWGL_XMGL_ZCCG_QX", "YWGL_XMGL_ZCCG_XJ"}, logical = Logical.OR)
    public Object updateSucProjectShieldStatusAjax(UpdateProjectShieldStatusReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        req.setSource(DigitalAndStringConstant.StringConstant.ONE);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/updateProjectShieldStatus",
                RequestMethod.POST,
                request);
        return JSON.parse(data);
    }
    
    /**
     * 后台-业务管理-项目管理-项目列表-屏蔽
     * 失败项目列表
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemConsoleLog(desc = "失败项目项目上/下架", modul = "业务管理", isRetrunVal = true)
    @ResponseBody
    @RequestMapping(value = "updateFailProjectShieldStatusAjax.do")
    @RequiresPermissions(value = {"YWGL_XMGL_ZCSB_QX", "YWGL_XMGL_ZCSB_XJ"}, logical = Logical.OR)
    public Object updateFailProjectShieldStatusAjax(UpdateProjectShieldStatusReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        req.setSource(DigitalAndStringConstant.StringConstant.TWO);
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/updateProjectShieldStatus",
                RequestMethod.POST,
                request);
        return JSON.parse(data);
    }
}
