package com.dimeng.modules.bus.services.impl.base;

import java.io.File;
import java.lang.reflect.InvocationTargetException;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.table.project.TProjectInfo;
import com.dimeng.enums.ProjectStatusEnum;
import com.dimeng.enums.SerialNumberTypeEnum;
import com.dimeng.enums.variable.TrustVariables;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.framework.utils.FrameworkConfigurer;
import com.dimeng.util.QRCodeUtil;
import com.dimeng.util.SerialNumberUtil;
import com.dimeng.utils.SystemCache;

/**
 * 基础业务实现
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月9日]
 */
public class BaseCommonService extends UserCapitalCommonService
{
    
    /**
     * 新建项目
     * <功能详细描述>
     * @param projectInfo
     * @return
     * @throws ServicesException
     */
    @SuppressWarnings("unchecked")
    public BaseDataResp insertProject(TProjectInfo projectInfo)
        throws ServicesException
    {
        BaseDataResp resp = new BaseDataResp();
        if (baseDao.insert(projectInfo) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            logs.info("insert TProjectInfo fail");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 更新项目
     * <功能详细描述>
     * @param projectInfo
     * @return
     * @throws ServicesException
     */
    @SuppressWarnings("unchecked")
    public BaseDataResp updateProject(TProjectInfo projectInfo)
        throws ServicesException
    {
        BaseDataResp resp = new BaseDataResp();
        if (baseDao.update(projectInfo) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            logs.info("update TProjectInfo fail");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 删除项目
     * <功能详细描述>
     * @param projectId
     * @return
     * @throws ServicesException
     */
    @SuppressWarnings("unchecked")
    public BaseDataResp deleteProject(String projectId)
        throws ServicesException
    {
        BaseDataResp resp = new BaseDataResp();
        TProjectInfo projectInfo = new TProjectInfo();
        projectInfo.setProjectId(projectId);
        projectInfo.setProjectStatus(String.valueOf(ProjectStatusEnum.YSC.getDbvalue()));
        if (baseDao.update(projectInfo) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            logs.info("delete TProjectInfo fail");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_DETELE);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /**
     * 查询项目
     * <功能详细描述>
     * @param projectId
     * @return
     * @throws ServicesException
     */
    @SuppressWarnings("unchecked")
    public TProjectInfo findProject(String projectId)
        throws ServicesException
    {
        TProjectInfo projectInfo = new TProjectInfo();
        projectInfo.setProjectId(projectId);
        projectInfo = (TProjectInfo)baseDao.findById(projectInfo);
        if (projectInfo == null)
        {
            throw new ServicesException(IDiMengResultCode.Finance.PROJECT_NOT_EXIST);
        }
        return projectInfo;
    }
    
    /**
     * 查询项目
     * <功能详细描述>
     * @param projectId
     * @return
     * @throws ServicesException
     */
    @SuppressWarnings("unchecked")
    public TProjectInfo findProject_FU(String projectId)
        throws ServicesException
    {
        TProjectInfo projectInfo = new TProjectInfo();
        projectInfo.setProjectId(projectId);
        QueryEvent<TProjectInfo> event = new QueryEvent<>();
        event.setObj(projectInfo);
        event.setStatement("findByIdQProjectForUpdate");
        projectInfo = (TProjectInfo)baseDao.findOneByCustom(event);
        if (projectInfo == null)
        {
            throw new ServicesException(IDiMengResultCode.Finance.PROJECT_NOT_EXIST);
        }
        return projectInfo;
    }
    
    /**
     * 获取项目编号
     * <功能详细描述>
     * @return
     * @throws InvocationTargetException 
     * @throws IllegalAccessException 
     * @throws InstantiationException 
     */
    public String getProjectNo(Object req)
        throws Exception
    {
        StringBuffer prefix = new StringBuffer();
        TProjectInfo projectInfo = (TProjectInfo)DimengBeanUtil.copyProperties(TProjectInfo.class, req);
        switch (projectInfo.getProjectType())
        {
            case "6":
                prefix.append("H");
                break;
            
            case "7":
                prefix.append("M");
                break;
            
            default:
                prefix.append("G");
                break;
        }
        prefix.append(SerialNumberUtil.buildSn(SerialNumberTypeEnum.XM.getDataBaseVal()));
        return prefix.toString();
    }
    
    /**
     * 生成二维码图片，返回二维码图片地址
     * <功能详细描述>
     * @param projectId
     * @return
     * @throws Exception
     */
    public String getQRCodeAddr(String projectId)
        throws Exception
    {
        String content =
            (new StringBuilder()).append(SystemCache.getProperty(TrustVariables.WX_SERVICE_ADDR))
                .append("/?#index/index/projectDetails/")
                .append(projectId)
                .toString();
        String destPath =
            (new StringBuilder()).append(FrameworkConfigurer.getProperties("fileStore.home"))
                .append("qrcode")
                .append(File.separator)
                .toString();
        String fileName = new StringBuilder("qrcode_").append(projectId).append(".jpg").toString();
        String addr =
            new StringBuilder(File.separator).append("fileStore")
                .append(File.separator)
                .append("qrcode")
                .append(File.separator)
                .append(fileName)
                .toString();
        //生成不带LOGO二维码图片
        QRCodeUtil.encode(content, destPath, fileName);
        //生成带LOGO二维码图片
        //QRCodeUtil.encode(content, destPath, fileName, "F:\\logo.jpg");
        return addr;
    }
    
}
