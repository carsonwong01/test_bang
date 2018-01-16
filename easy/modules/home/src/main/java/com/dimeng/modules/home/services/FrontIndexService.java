package com.dimeng.modules.home.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.model.home.FrontIndexReq;
import com.dimeng.model.home.FrontLoginCheckReq;
import com.dimeng.model.home.FrontRegisterReq;

/**
 * 前台首页service接口
 * @author  song
 * @version  [版本号, 2016年10月12日]
 */
public interface FrontIndexService
{

    /**
     * 查询数据库中的未删除的所有项目
     */
    public BaseDataResp findAllProList(FrontIndexReq req)
            throws Exception;

    /**
     * front-查询众筹中的所有项目
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findAllProject(FrontIndexReq req)
            throws Exception;

    /**
     * 查询首页-累计-公告-图片列表
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp frontTotalInfo(FrontIndexReq req) 
        throws Exception;
    
    /**
     * 查询首页项目列表
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findRecommendList(FrontIndexReq req)
        throws Exception;
    
    /**
     * 查询PC首页项目3个
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findRecommend()
        throws Exception;
    /**
     * 首页医院列表
     */
    public BaseDataResp findHomeHosList()
        throws Exception;
    /**
     * 首页合作伙伴
     */
    public BaseDataResp findPartnerList()
        throws Exception;

    /**
     * 前台用户登录检验
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp commonLoginCheck(FrontLoginCheckReq req) 
        throws Exception;
    
    /**
     * 用户注册
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp insertFrontUserInfo(FrontRegisterReq req) 
        throws Exception; 
    
}
