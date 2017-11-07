/*
 * 文 件 名:  IProjectBasicService1.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月9日
 */
package com.dimeng.modules.bus.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.bus.FindCollectionListReq;
import com.dimeng.model.bus.FindProjectBaseReq;
import com.dimeng.model.bus.InsertDreamProjectReq;
import com.dimeng.model.bus.InsertProjectDynamicReq;
import com.dimeng.model.bus.InsertReturnProjectReq;
import com.dimeng.model.bus.InsertWelfareProjectReq;
import com.dimeng.model.bus.ProjectBasicReq;
import com.dimeng.model.bus.UpdateDreamProjectReq;
import com.dimeng.model.bus.UpdateReturnProjectReq;
import com.dimeng.model.bus.UpdateWelfareProjectReq;
import com.dimeng.model.common.IdReq;

/**
 * 项目基础业务接口
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月9日]
 */
public interface IProjectBasicService
{
    
    /**
     * 发起公益项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp insertWelfareProject(InsertWelfareProjectReq req)
        throws Exception;
    
    /**
     * 修改公益项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp updateWelfareProject(UpdateWelfareProjectReq req)
        throws Exception;
    
    /**
     * 发起回报项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp insertReturnProject(InsertReturnProjectReq req)
        throws Exception;
    
    /**
     * 修改回报项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp updateReturnProject(UpdateReturnProjectReq req)
        throws Exception;
    
    /**
     * 发起梦想项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp insertDreamProject(InsertDreamProjectReq req)
        throws Exception;
    
    /**
     * 修改梦想项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp updateDreamProject(UpdateDreamProjectReq req)
        throws Exception;
    
    /**
     * 提前结束项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp commonFinish(ProjectBasicReq req)
        throws Exception;
    
    /**
     * 我发起的项目列表
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findMyInitProjectList(FindProjectBaseReq req)
        throws Exception;
    
    /**
     * 我关注的项目列表
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findCollectionList(FindCollectionListReq req)
        throws Exception;
    
    /**
     * 关注项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp insertCollection(IdReq req)
        throws Exception;
    
    /**
     * 取消关注项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp deleteCollection(IdReq req)
        throws Exception;
    
    /**
     * 更新项目动态
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp insertDynamic(InsertProjectDynamicReq req)
        throws Exception;
    
    /**
     * 查询项目动态
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findProjectStatus(IdReq req)
        throws Exception;
    
    /**
     * 查询项目标题
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findProjectTitle(IdReq req)
        throws Exception;
    
    /**
     * 查询项目存在基本信息,判断该项目是否属于当前用户适用
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findExsitProjectInfo(IdReq req)
        throws Exception;
}
