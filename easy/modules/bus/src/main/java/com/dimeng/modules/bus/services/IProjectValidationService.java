/*
 * 文 件 名:  IProjectValidationService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月12日
 */
package com.dimeng.modules.bus.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.bus.FindProjectValidationReq;
import com.dimeng.model.bus.ProjectValidationReq;
import com.dimeng.model.common.IdReq;

/**
 * 项目验证接口
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月12日]
 */
public interface IProjectValidationService
{
    
    /**
     * 项目验证
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp commonProAuthenticated(ProjectValidationReq req)
        throws Exception;
    
    /**
     * 项目验证详情
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findProAuthenticated(FindProjectValidationReq req)
        throws Exception;
    
    /**
     * 查看项目验证状态
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findProAuthenStatu(IdReq req)
        throws Exception;
    
}
