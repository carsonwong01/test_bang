package com.dimeng.modules.bus.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.model.bus.ChangeProjectStatusReq;
import com.dimeng.model.bus.GetProjectReasonReq;
import com.dimeng.model.bus.InformReq;
import com.dimeng.model.bus.UpdateProjectShieldStatusReq;

/**
 * 项目业务操作
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年10月8日]
 */
public interface IBusinessManageService
{
    /**
     * 前后台公用-操作项目状态
     * 取消项目，删除项目
     * @param req
     * @return
     * @throws ServicesException 
     * @throws Exception 
     */
    public BaseDataResp updateProjectStatus(ChangeProjectStatusReq req)
        throws ServicesException, Exception;
    
    /**
     * 查询项目失败、删除原因
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException 
     */
    public BaseDataResp getOperateReason(GetProjectReasonReq req)
        throws ServicesException;
    
    /**
     * 举报
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException
     */
    public BaseDataResp commonInform(InformReq req)
        throws ServicesException;
    
    /**
     * 改变项目屏蔽状态
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException
     */
    public BaseDataResp commonUpdateProjectShieldStatus(UpdateProjectShieldStatusReq req)
        throws ServicesException;
    
}
