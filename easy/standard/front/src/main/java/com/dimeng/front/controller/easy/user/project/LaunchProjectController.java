/*
 * 文 件 名:  LaunchProjectController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月19日
 */
package com.dimeng.front.controller.easy.user.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dimeng.abilitys.annotation.SystemFrontLog;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.expand.FindAllTProjectLabelTypeResp;
import com.dimeng.entity.ext.expand.FindAllTSiteImageTemplateResp;
import com.dimeng.entity.ext.expand.FindAllTextInstructResp;
import com.dimeng.entity.ext.site.SiteProtocolModelResp;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.enums.ProjectTypeEnum;
import com.dimeng.enums.ProjectValidationTypeEnum;
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.enums.variable.SystemVariable;
import com.dimeng.enums.variable.TrustVariables;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.model.bus.InsertDreamProjectReq;
import com.dimeng.model.bus.InsertReturnProjectReq;
import com.dimeng.model.bus.InsertWelfareProjectReq;
import com.dimeng.model.bus.ProjectDetailsReq;
import com.dimeng.model.bus.ProjectValidationReq;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.LoginCache;
import com.dimeng.utils.SystemCache;

/**
 * 发起项目
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月19日]
 */
@Controller
@RequestMapping(value = "user/project")
public class LaunchProjectController extends BaseController
{

    /**
     * 查询用户状态是否为拉黑
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/findUserStatus.do")
    public String findUserStatus(HttpServletRequest request, HttpServletResponse response)
    {
        FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
        if (userInfo != null && DigitalAndStringConstant.StringConstant.THREE.equals(userInfo.getUserStatus()))
        {
            return IDiMengResultCode.CpProjectManage.USER_IS_BLACK;
        }
        return IDiMengResultCode.Commons.SUCCESS;
    }
    
    /**
     * 进入发起项目类型选择页面
     * <功能详细描述>
     * @param request
     * @param response
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/projectChoose.do")
    public ModelAndView projectChoose(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("easy/user/project/projectChoose.page");
        //发起须知
        List<FindAllTextInstructResp> textList =
            (List<FindAllTextInstructResp>)SystemCache.getCache(SystemConstant.CacheKey.TEXT_INSTRUCT_LIST);
        if (textList != null)
        {
            for (FindAllTextInstructResp findTextInstructResp : textList)
            {
                if (DigitalAndStringConstant.StringConstant.ONE.equals(findTextInstructResp.getTextId()))
                {
                    mv.addObject("textInstruct", findTextInstructResp);
                    break;
                }
            }
        }
        return mv;
    }
    
    /**
     * 进入新增发起项目页面
     * <功能详细描述>
     * @param projectType
     * @param request
     * @param response
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/projectStart.do")
    public ModelAndView projectStart(String projectType, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = null;
        //获取项目标签
        List<FindAllTProjectLabelTypeResp> labels =
            (List<FindAllTProjectLabelTypeResp>)SystemCache.getCache(SystemConstant.CacheKey.PROJECT_LABEL_LIST);
        //获取筹款说明
        List<FindAllTextInstructResp> textInstructResps =
            (List<FindAllTextInstructResp>)SystemCache.getCache(SystemConstant.CacheKey.TEXT_INSTRUCT_LIST);
        //获取发起项目最低金额
        String projectAmountMin = (String)SystemCache.getCache(EasySystemVariable.PROJECT_AMOUNT_MIN.getKey());
        //获取协议模板
        List<SiteProtocolModelResp> protocolModelList =
            (List<SiteProtocolModelResp>)SystemCache.getCache(SystemConstant.CacheKey.PROTOCOL_MODEL_LIST);
        String textInstruct1 = null;
        String textInstruct2 = null;
        String textInstruct3 = null;
        if (textInstructResps != null)
        {
            textInstruct1 = textInstructResps.get(2).getTextContext();
            textInstruct2 = textInstructResps.get(3).getTextContext();
            textInstruct3 = textInstructResps.get(4).getTextContext();
        }
        switch (projectType)
        {
            case "1":
                //个人求助：大病救助
                mv = new ModelAndView("easy/user/project/projectStart/insertDiseaseReliefProject.page");
                mv.addObject("textInstruct", textInstruct1);
                break;
            case "2":
                //个人求助：灾难救助
                mv = new ModelAndView("easy/user/project/projectStart/insertDisasterReliefProject.page");
                mv.addObject("textInstruct", textInstruct1);
                break;
            case "3":
                //个人求助：动物保护
                mv = new ModelAndView("easy/user/project/projectStart/insertAnimalProtectProject.page");
                mv.addObject("textInstruct", textInstruct1);
                break;
            case "4":
                //个人求助：扶贫助学
                mv = new ModelAndView("easy/user/project/projectStart/insertPovertyReliefProject.page");
                mv.addObject("textInstruct", textInstruct1);
                break;
            case "5":
                //个人求助：其他
                mv = new ModelAndView("easy/user/project/projectStart/insertOtherReliefProject.page");
                mv.addObject("textInstruct", textInstruct1);
                break;
            case "6":
                //产品急销
                mv = new ModelAndView("easy/user/project/projectStart/insertReturnProject.page");
                mv.addObject("textInstruct", textInstruct2);
                mv.addObject("labels", labels);
                String returnCountMax = (String)SystemCache.getCache(EasySystemVariable.RETURN_COUNT_MAX.getKey());
                mv.addObject("returnCountMax", returnCountMax);
                break;
            case "7":
                //实现梦想
                mv = new ModelAndView("easy/user/project/projectStart/insertDreamProject.page");
                mv.addObject("textInstruct", textInstruct3);
                mv.addObject("labels", labels);
                String targetCountMax = (String)SystemCache.getCache(EasySystemVariable.TARGET_COUNT.getKey());
                mv.addObject("targetCountMax", targetCountMax);
                break;
            default:
                break;
        }
        mv.addObject("projectType", projectType);
        mv.addObject("projectAmountMin", projectAmountMin);
        mv.addObject("protocolModel", protocolModelList.get(1).getProtocolTitle());
        return mv;
        
    }
    
    /**
     * 发起个人求助(大病救助、灾难救助、动物保护、扶贫助学、其他救助)
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "发起个人求助(大病救助、灾难救助、动物保护、扶贫助学、其他救助)", modul = "项目模块")
    @ResponseBody
    @RequestMapping(value = "/initWelfareProject.do")
    public Object initWelfareProject(InsertWelfareProjectReq req, HttpServletRequest request,
        HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/initWelfareProject",
                RequestMethod.POST,
                request);
        return JSON.parseObject(data);
    }
    
    /**
     * 发起产品急销
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "发起产品急销", modul = "项目模块")
    @ResponseBody
    @RequestMapping(value = "/initReturnProject.do")
    public Object initReturnProject(InsertReturnProjectReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/operate/v/initReturnProject",
                RequestMethod.POST,
                request);
        return JSON.parseObject(data);
    }
    
    /**
     * 发起实现梦想
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "发起实现梦想", modul = "项目模块")
    @ResponseBody
    @RequestMapping(value = "/initDreamProject.do")
    public Object initDreamProject(InsertDreamProjectReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/operate/v/initDreamProject", RequestMethod.POST, request);
        return JSON.parseObject(data);
    }
    
    /**
     * 跳转发起项目成功页面
     * <功能详细描述>
     * @param projectId
     * @param projectType
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/projectSuccess.do")
    public Object projectSuccess(String projectId, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("pages/easy/user/project/projectSuccess.header");
        ProjectDetailsReq req = new ProjectDetailsReq();
        req.setProjectId(projectId);
        String data =
            new CommonUtil().callInterfaceMethod(req, "project/query/v/projectDetails", RequestMethod.POST, request);
        mv.addObject("data", JSON.parse(data));
        mv.addObject("platformAddr", SystemCache.getProperty(SystemVariable.PLATFORM_ADDR));
        mv.addObject("wxServiceAddr", SystemCache.getProperty(TrustVariables.WX_SERVICE_ADDR));
        return mv;
    }
    
    /**
     * 跳转项目验证类型选择页面
     * <功能详细描述>
     * @param projectId
     * @param projectType
     * @param request
     * @param response
     * @return
     */
/*
    @RequestMapping(value = "/projectValidChoose.do")
    public Object projectValidChoose(String projectId, String projectType,HttpServletRequest request,
    HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("easy/user/project/projectValidChoose.page");
        mv.addObject("projectId", projectId);
        mv.addObject("projectType", projectType);
        return mv;
    }
*/
    /**
     * 跳转新增项目验证页面
     * <功能详细描述>
     * @param projectId
     * @param projectValidationType
     * @param request
     * @param response
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/projectValidationStart.do")
    public Object projectValidationStart(String projectId, String projectType, String validationType,
        HttpServletRequest request, HttpServletResponse response)
    {
        validationType = ProjectValidationTypeEnum.ZZYZ.getDataBaseVal();
        //所有项目（组织验证/企业验证）
        ModelAndView mv = new ModelAndView("easy/user/project/projectValid/validation_group.page");
        /*
        //大病救助
        if (ProjectValidationTypeEnum.BRYZ.getDataBaseVal().equals(validationType))
        {
            //所有项目（本人验证）
            mv = new ModelAndView("easy/user/project/projectValid/validation_myself.page");
            
        }
        else if (ProjectValidationTypeEnum.QSYZ.getDataBaseVal().equals(validationType))
        {
            //大病救助（亲属验证）
            if (ProjectTypeEnum.DBJZ.getDataBaseVal().equals(projectType))
            {
                mv = new ModelAndView("easy/user/project/projectValid/validation_relatives.page");
            }
        }
        else if (ProjectValidationTypeEnum.FQYZ.getDataBaseVal().equals(validationType))
        {
            //大病救助（夫妻验证）
            if (ProjectTypeEnum.DBJZ.getDataBaseVal().equals(projectType))
            {
                mv = new ModelAndView("easy/user/project/projectValid/validation_couple.page");
            }
        }
        else if (ProjectValidationTypeEnum.ZZYZ.getDataBaseVal().equals(validationType))
        {
            //所有项目（组织验证/企业验证）
            mv = new ModelAndView("easy/user/project/projectValid/validation_group.page");
        }
        */
        //图片模板（身份证示例图片、医疗证明示例图片）
        List<FindAllTSiteImageTemplateResp> imgList =
            (List<FindAllTSiteImageTemplateResp>)SystemCache.getCache(SystemConstant.CacheKey.IMAGE_MODEL_LIST);
        mv.addObject("cardImgDefault", imgList.get(2).getImageUrl());
        mv.addObject("proveImgDefault", imgList.get(3).getImageUrl());
        mv.addObject("weddingImgDefault", imgList.get(4).getImageUrl());
        mv.addObject("projectId", projectId);
        mv.addObject("projectType", projectType);
        mv.addObject("validationType", validationType);
        return mv;
    }
    
    /**
     * 提交项目验证
     * <功能详细描述>
     * @param req
     * @param request
     * @param response
     * @return
     */
    @SystemFrontLog(desc = "提交项目验证", modul = "项目模块")
    @ResponseBody
    @RequestMapping(value = "/proAuthenticated.do")
    public Object proAuthenticated(ProjectValidationReq req, HttpServletRequest request, HttpServletResponse response)
    {
        String data =
            new CommonUtil().callInterfaceMethod(req,
                "project/validate/v/proAuthenticated",
                RequestMethod.POST,
                request);
        return JSON.parseObject(data);
    }
    
}
