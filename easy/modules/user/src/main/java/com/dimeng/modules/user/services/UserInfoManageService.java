package com.dimeng.modules.user.services;

import com.dimeng.entity.ext.user.ThirdPartyUserResp;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.domain.BaseReq;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.model.expand.InsertHospitalReq;
import com.dimeng.model.user.*;

/**
 * 用户管理service
 * @author  song
 * @version  [版本号, 2016年9月28日]
 */
public interface UserInfoManageService
{
    /**
     * 修改医院的推荐状态
     */
    public BaseDataResp updateHosRecStatus(HospitalBasicReq req)
            throws Exception;
    /**
     * 修改医院信息时先获取已有的信息
     */
    public BaseDataResp findHosUserInfo(HospitalBasicReq req)
            throws Exception;
    /**
     * 修改插入的医院信息
     */
    public BaseDataResp updateHosInfo(InsertHospitalReq req)
            throws Exception;
    /**
     * 插入医院信息
     * InsertHospitalReq
     */
    public BaseDataResp insertHospitalInfo(InsertHospitalReq req )
            throws Exception;

    /**
     * 后台--医院用户详情
     * @param req
     * @return
     */
    public BaseDataResp findHosUserDetails(HospitalBasicReq req);
    /**
     * 后台--医院用户管理列表
     * @param req
     * @return
     */
    public BaseDataResp findHospitalUser(FindUserListReq req);

    /**
     * 后台-用户管理列表
     * @param req
     * @return
     */
    public BaseDataResp findUserList(FindUserListReq req);
    
    /**
     * 后台-用户修改
     * @param req
     * @return
     */
    public BaseDataResp updateUserInfo(FindUserListReq req)
        throws ServicesException;
    
    /**
     * 后台-用户查看个人信息详情
     * @param req
     * @return
     */
    public BaseDataResp findUserInfo(NotPageUserIdReq req);
    
    /**
     * PC端个人中心首页信息查询
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findUserHomeInfo(FindByUserIdReq req);
    
    /**
    * 个人设置-查询基本信息
    * <功能详细描述>
    * @param req
    * @return
    */
    public BaseDataResp findAccInfo(NotPageUserIdReq req);
    
    /**
     * 实名认证-认证
     * <功能详细描述>
     * @param req
     * @return
     * @throws ServicesException
     * @throws Throwable 
     */
    public BaseDataResp updateAuthentication(AuthenticationReq req)
        throws ServicesException, Throwable;
    
    /**
     * 实名认证-查询
     * <功能详细描述>
     * @return
     */
    public BaseDataResp findAuthentication(AuthenticationReq req);
    
    /**
     * 实名认证-检查身份证是否存在
     * <功能详细描述>
     * @return
     */
    public BaseDataResp isExsitIdCard(IsExsitIdCardReq req);
    
    /**
     *微信-app-查询用户绑定的第三方账户
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findThirdPartyList(FindThirdPartyReq req);
    
    /**
     *微信-app-解绑第三方账户
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp commonThirdParty(FindThirdPartyReq req)
        throws ServicesException;
    
    /**
     *通过opendId查询用户信息
     * <功能详细描述>
     * @param req
     * @return
     */
    public BaseDataResp findUserByOpendId(FindUserByOpendIdReq req)
        throws Exception;
    
    /**
     * 前台-我的钱包-账户金额
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findAccCenter(BaseReq req)
        throws Exception;
    
    /**
     * 前台-我的钱包-查询验证冻结金额项目
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findFreezePro(FindFreezeProReq req)
        throws Exception;
    
    /**
     * 前台-我的钱包-查询账户交易记录
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findAccMoneyList(FindAccMoneyListReq req)
        throws Exception;
    
    /**
     * 前台-交易明细
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findTradeList(FindTradeListReq req)
        throws Exception;
    
    /**
     * 绑定第三方信息
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp insertUserThirdParty(ThirdPartyUserResp thirdPartyUser)
            throws Exception;
    
    /**
     * 根据用户id查询是否已经关联了公众号用户id
     * @param thirdPartyUser
     * @return
     * @throws Exception
     */
    public BaseDataResp findUserOpendId(FindUserByOpendIdReq findUserByOpendIdReq)
            throws Exception;
        
}
