/*
 * 文 件 名:  IProjectBasicSetService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月28日
 */
package com.dimeng.modules.expand.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.FindProjectBasicSetReq;
import com.dimeng.model.expand.ImgModelReq;
import com.dimeng.model.expand.ProjectLabelReq;

/**
 * 运营管理基本设置Service
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月28日]
 */
public interface IProjectBasicSetService
{
    
    /**
     * 项目标签查询
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findLabelList(FindProjectBasicSetReq req)
        throws Exception;
    
    /**
     * 某项目类型下所有项目标签
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findLabels(ProjectLabelReq req)
        throws Exception;
    
    /**
     * 新增项目标签
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp insertLabel(ProjectLabelReq req)
        throws Exception;
    
    /**
     * 删除项目标签
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp deleteLabel(ProjectLabelReq req)
        throws Exception;
    
    /**
     * 图片模板列表查询
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findImgModel(ImgModelReq req)
        throws Exception;
    
    /**
     * 修改图片模板
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp commonImgModel(ImgModelReq req)
        throws Exception;
    
}
