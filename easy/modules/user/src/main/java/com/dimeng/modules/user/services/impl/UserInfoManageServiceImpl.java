package com.dimeng.modules.user.services.impl;

import com.dimeng.abilitys.annotation.SystemOperationLog;
import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.expand.FindAllHospitalResp;
import com.dimeng.entity.ext.expand.FindFoundationResp;
import com.dimeng.entity.ext.expand.FindProvinceAndCityResp;
import com.dimeng.entity.ext.user.*;
import com.dimeng.entity.table.foundation.DeleteFoundationReq;
import com.dimeng.entity.table.foundation.FoundationInfo;
import com.dimeng.entity.table.hospital.THospitalBasic;
import com.dimeng.entity.table.user.*;
import com.dimeng.enums.BusinessOperationTypeEnum;
import com.dimeng.enums.IdCardStatusEnum;
import com.dimeng.enums.ThirdTypeEnum;
import com.dimeng.enums.variable.SystemVariable;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.domain.BaseReq;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.framework.utils.DimengBeanUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.expand.FindFoundationReq;
import com.dimeng.model.expand.FindProvinceAndCityReq;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.model.expand.InsertHospitalReq;
import com.dimeng.model.user.*;
import com.dimeng.modules.user.services.UserInfoManageService;
import com.dimeng.service.INciicService;
import com.dimeng.utils.*;
import net.sf.ehcache.Element;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 用户管理service
 * @author  song
 * @version  [版本号, 2016年9月28日]
 */
@Service
public class UserInfoManageServiceImpl extends BaseServiceImpl implements UserInfoManageService
{
    @Autowired
    private INciicService iNciicService;

    /**
     * 查询基金会详细信息--包括项目和其它信息
     */
    public BaseDataResp findFoundationInfo(NotPageFoundationIdReq req)
            throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        event.setStatement("000");
        event.setObj(req);
        FindFoundationResp result = (FindFoundationResp)baseDao.findOneByCustom(event);
        if (result == null)
        {
            resp.setCode(IDiMengResultCode.Commons.ERROR_PARAMETER);
            return resp;
        }
        //如果需要将基金会的支付账户信息加密显示，则可以参考以下代码
//        if (StringUtils.isNoneBlank(result.getIdCard()))
//        {
//            result.setIdCard(Base64Decoder.decode(result.getIdCard()));
//        }
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, result);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    /**
     * 修改基金会前先查询基金会信息
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findFoundationDetails(FindFoundationReq req)
            throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        event.setStatement("findFoundationDetails");
        event.setObj(req);
        FindFoundationResp result = (FindFoundationResp)baseDao.findOneByCustom(event);
        if (result == null)
        {
            resp.setCode(IDiMengResultCode.Commons.ERROR_PARAMETER);
            return resp;
        }
        //如果需要将基金会的支付账户信息加密显示，则可以参考以下代码
//        if (StringUtils.isNoneBlank(result.getIdCard()))
//        {
//            result.setIdCard(Base64Decoder.decode(result.getIdCard()));
//        }
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, result);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }


    /**
     * 修改医院的推荐状态
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateHosRecStatus(HospitalBasicReq req)
            throws Exception{
        BaseDataResp resp = new BaseDataResp();
        THospitalBasic tHospitalBasic = new THospitalBasic();
        tHospitalBasic.setUserId(req.getUserId());
        tHospitalBasic.setRecommendStatus(req.getRecommendStatus());
        if (baseDao.update(tHospitalBasic) != 1)
        {
            logs.info("数据更新出错");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    /**
     * 修改医院信息前获取医院现有的信息
     * @param req
     * @return
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findHosUserInfo(HospitalBasicReq req) throws Exception{
        QueryEvent<HospitalBasicReq> event = new QueryEvent<HospitalBasicReq>();
        event.setStatement("findHospitalInfo");
        event.setObj(req);
        FindAllHospitalResp findAllHospitalResp = (FindAllHospitalResp) baseDao.findOneByCustom(event);
        Map<String, Object> data = new HashMap<String, Object>();
        data.put(CommonConstant.JSON_KEY_SINGLE_RESULT, findAllHospitalResp);

        BaseDataResp resp = new BaseDataResp();
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    /**
     * 插入医院信息前先获取省--下拉选
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp provinceList(FindProvinceAndCityReq req)
            throws Exception{
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FindProvinceAndCityReq> event = new QueryEvent<FindProvinceAndCityReq>();

        event.setObj(req);
        event.setStatement("findProvince");
        List<FindProvinceAndCityResp> findProvince = baseDao.findAllIsPageByCustom(event);
        data.put(CommonConstant.JSON_KEY_LIST, findProvince);

        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    /**
     * 根据省获取市
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp cityList(FindProvinceAndCityReq req)
            throws Exception{
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FindProvinceAndCityReq> event = new QueryEvent<FindProvinceAndCityReq>();

        event.setObj(req);
        event.setStatement("findCity");
        List<FindProvinceAndCityResp> findCity = baseDao.findAllIsPageByCustom(event);
        data.put(CommonConstant.JSON_KEY_LIST, findCity);

        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }



    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findHosUserDetails(HospitalBasicReq req){
        BaseDataResp resp = new BaseDataResp();
        Map<String,Object> data = new HashMap<String,Object>();
        QueryEvent<HospitalBasicReq> event = new QueryEvent<HospitalBasicReq>();

        event.setStatement("findHosUserDetails");
        event.setObj(req);

        HospitalBasicReq result = (HospitalBasicReq) baseDao.findOneByCustom(event);
        if (result == null)
        {
            resp.setCode(IDiMengResultCode.Commons.ERROR_PARAMETER);
            return resp;
        }
        data.put(CommonConstant.JSON_KEY_PAGERESULT,result);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }


    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findHospitalUser(FindUserListReq req)
    {
        BaseDataResp resp = new BaseDataResp();
        if (req != null && StringUtils.isNoneBlank(req.getIdCard()))
        {
            req.setIdCard(Base64Encoder.encode(req.getIdCard()));
        }
        Map<String, Object> data = new HashMap<String, Object>();
        List<UserManageResp> userList = new ArrayList<>();
        QueryEvent<FindUserListReq> event = new QueryEvent<FindUserListReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        event.setObj(req);
        event.setStatement("findHospitalUser");
        List<UserManageResp> list = baseDao.findAllIsPageByCustom(event);
        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, list));
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Map<String, String> enumsValue = new HashMap<String, String>();
            //导出的一些状态码
            enumsValue.put("status", "com.dimeng.enums.UserStatusEnum");
            enumsValue.put("source", "com.dimeng.enums.UserSourceEnum");
            req.setEnumsValue(enumsValue);
            ExportUtil.export(req, list);
        }
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }


    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findUserList(FindUserListReq req)
    {
        BaseDataResp resp = new BaseDataResp();
        if (req != null && StringUtils.isNoneBlank(req.getIdCard()))
        {
            req.setIdCard(Base64Encoder.encode(req.getIdCard()));
        }
        Map<String, Object> data = new HashMap<String, Object>();
        List<UserManageResp> userList = new ArrayList<>();
        QueryEvent<FindUserListReq> event = new QueryEvent<FindUserListReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        event.setObj(req);
        event.setStatement("findUserInfoList");
        List<UserManageResp> list = baseDao.findAllIsPageByCustom(event);
        //解密身份证号
        if (list != null && list.size() != 0)
        {
            for (UserManageResp user : list)
            {
                if (user.getIdCard() != null)
                {
                    user.setIdCard(Base64Decoder.decode(user.getIdCard()));
                }
                userList.add(user);
            }
        }
        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, list));
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Map<String, String> enumsValue = new HashMap<String, String>();
            //导出的一些状态码
            enumsValue.put("status", "com.dimeng.enums.UserStatusEnum");
            enumsValue.put("source", "com.dimeng.enums.UserSourceEnum");
            req.setEnumsValue(enumsValue);
            ExportUtil.export(req, list);
        }
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateUserInfo(FindUserListReq req)
        throws ServicesException
    {
        BaseDataResp resp = new BaseDataResp();
        TUser user = new TUser();
        user.setUserId(req.getUserId());
        user.setUserStatus(req.getStatus());
        if (baseDao.update(user) != 1)
        {
            logs.info("数据更新出错");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        //更新在线用户的状态 -
        updateFrontLoginCache(req);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    public void updateFrontLoginCache(FindUserListReq req)
    {
        List<Object> list = loginCache.getKeys();
        if (list != null)
        {
            for (Object object : list)
            {
                Object user = loginCache.get(object).getObjectValue();
                if (user instanceof FrontUserInfo)
                {
                    FrontUserInfo userInfo = (FrontUserInfo)user;
                    if (userInfo.getUserId().equals(req.getUserId()))
                    {
                        if ("2".equals(req.getStatus()))
                        {
                            loginCache.remove(object);
                        }
                        else
                        {
                            userInfo.setUserStatus(req.getStatus());
                            loginCache.put(new Element(object, userInfo));
                        }
                    }
                }
            }
        }
    }
    
    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    public BaseDataResp findUserInfo(NotPageUserIdReq req)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        event.setStatement("findUserDetail");
        event.setObj(req);
        UserInfoQscDetailResp result = (UserInfoQscDetailResp)baseDao.findOneByCustom(event);
        if (result == null)
        {
            resp.setCode(IDiMengResultCode.Commons.ERROR_PARAMETER);
            return resp;
        }
        if (StringUtils.isNoneBlank(result.getIdCard()))
        {
            result.setIdCard(Base64Decoder.decode(result.getIdCard()));
        }
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, result);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findUserHomeInfo(FindByUserIdReq req)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        event.setStatement("findUserHomeInfo");
        event.setObj(req);
        FrontUserAccHomeResp result = (FrontUserAccHomeResp)baseDao.findOneByCustom(event);
        
        if (result == null)
        {
            resp.setCode(IDiMengResultCode.Commons.ERROR_PARAMETER);
            return resp;
        }
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, result);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp findThirdPartyList(FindThirdPartyReq req)
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent event = new QueryEvent();
        req.setType("5");
        event.setObj(req);
        event.setStatement("findThirdPartyList");
        List<FindUserThirdPartyResp> wxlist = baseDao.findAllIsPageByCustom(event);
        req.setType("3");
        List<FindUserThirdPartyResp> wblist = baseDao.findAllIsPageByCustom(event);
        req.setType("4");
        List<FindUserThirdPartyResp> qqlist = baseDao.findAllIsPageByCustom(event);
        data.put("qqList", qqlist);
        data.put("wxList", wxlist);
        data.put("wbList", wblist);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findAccInfo(NotPageUserIdReq req)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        BaseDataResp resp = new BaseDataResp();
        
        QueryEvent<NotPageUserIdReq> event = new QueryEvent<NotPageUserIdReq>();
        event.setStatement("findAccInfo");
        event.setObj(req);
        FindAccInfoResp result = (FindAccInfoResp)baseDao.findOneByCustom(event);
        
        if (result == null)
        {
            resp.setCode(IDiMengResultCode.Commons.ERROR_PARAMETER);
            return resp;
        }
        /*  String userName = result.getUserName();
          result.setUserName(userName.substring(0, 3) + "****" + userName.substring(7));*/
        // String mobile = result.getPhoneNumber();
        // result.setPhoneNumber(mobile.substring(0, 3) + "****" + mobile.substring(7));
        result.setTradePwdStatus(StringUtils.isNotBlank(result.getTradePwdStatus()) ? "1" : "2");
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, result);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateAuthentication(AuthenticationReq req)
        throws Throwable
    {
        BaseDataResp resp = new BaseDataResp();
        //查询该用户是否已经存在或已经进行实名认证
        TQUserBasic tqUserBasic = new TQUserBasic();
        tqUserBasic.setUserId(req.getUserId());
        tqUserBasic = (TQUserBasic)baseDao.findById(tqUserBasic);
        if (tqUserBasic == null)
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
        }
        if (IdCardStatusEnum.YRZ.dataBaseVal.equals(tqUserBasic.getIdcardStatus()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.USER_HAS_ID_CARD);
        }
        //判断身份证是否存在
        IsExsitIdCardReq exsitIdCardReq = new IsExsitIdCardReq();
        exsitIdCardReq.setIdCardNmber(req.getIdNumber());
        if (isExsitIdCard(exsitIdCardReq).getCode().equals(IDiMengResultCode.UserManager.ERROR_IDCARD_EXIST))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_IDCARD_EXIST);
        }
        //身份证解密
        String idCard = Base64Decoder.decode(req.getIdNumber());
        //更新认证信息
        tqUserBasic = new TQUserBasic();
        //是否开启调用第三方
        if (Boolean.parseBoolean(SystemCache.getProperty(SystemVariable.IS_NCIIC)))
        {
            //调用第三方  根据返回结果码  更新用户基本信息表
            FindIdCardUniqueCpReq personCertreq = new FindIdCardUniqueCpReq();
            personCertreq.setIdCard(idCard);
            personCertreq.setRealName(req.getRealName());
            personCertreq.setUserType(DigitalAndStringConstant.StringConstant.ONE);
            resp = iNciicService.nciic(personCertreq);
            
            if (IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
            {
                tqUserBasic.setIdcardStatus(IdCardStatusEnum.YRZ.dataBaseVal);
            }
            else
            {
                //实名认证不通过
                throw new ServicesException(IDiMengResultCode.UserManager.ERROR_INFO_NCIIC_FAILL);
            }
        }
        else
        {
            tqUserBasic.setIdcardStatus(IdCardStatusEnum.YRZ.dataBaseVal);
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        }
        
        //获取性别
        tqUserBasic.setSex(analyzeIdCard(idCard));
        tqUserBasic.setUserId(req.getUserId());
        tqUserBasic.setIdCard2(idCard.substring(0, 3) + "*** *** ***" + idCard.substring(idCard.length() - 2));
        tqUserBasic.setIdCard(req.getIdNumber());
        
        tqUserBasic.setIdCardAuditTime(DateUtil.getNow());
        tqUserBasic.setRealName(req.getRealName());
        
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(tqUserBasic))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        return resp;
    }
    
    /**
     * 根据身份证号解析性别
     * <功能详细描述>
     * @param idCard
     * @return
     */
    private String analyzeIdCard(String idCard)
    {
        int sex = Integer.valueOf(idCard.substring(16, 17));
        if (sex % 2 == 0)
        {
            //女
            sex = 2;
        }
        else
        {
            //男
            sex = 1;
        }
        return String.valueOf(sex);
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findAuthentication(AuthenticationReq req)
    {
        BaseDataResp resp = new BaseDataResp();
        
        QueryEvent<AuthenticationReq> event = new QueryEvent<AuthenticationReq>();
        event.setObj(req);
        event.setStatement("findAuthentication");
        FindAuthenticationResp authenticationResp = (FindAuthenticationResp)baseDao.findOneByCustom(event);
        if (authenticationResp != null
            && DigitalAndStringConstant.StringConstant.ONE.equals(authenticationResp.getAuditStatus()))
        {
            String realNameSub = authenticationResp.getRealName().substring(1);
            String replaceChar = "";
            for (int i = 0; i < realNameSub.length(); i++)
            {
                replaceChar += "*";
            }
            authenticationResp.setRealName(authenticationResp.getRealName().substring(0, 1) + replaceChar);
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, authenticationResp);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        resp.setData(map);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp isExsitIdCard(IsExsitIdCardReq req)
    {
        BaseDataResp resp = new BaseDataResp();
        IsExsitIdCardReq authReq = new IsExsitIdCardReq();
        authReq.setIdCardNmber(req.getIdCardNmber());
        //判断身份证是否存在
        QueryEvent<IsExsitIdCardReq> event = new QueryEvent<IsExsitIdCardReq>();
        event.setObj(authReq);
        event.setStatement("isExsitIdCard");
        int count = (int)baseDao.count(event);
        if (count >= 1)
        {
            resp.setCode(IDiMengResultCode.UserManager.ERROR_IDCARD_EXIST);
        }
        else
        {
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        }
        return resp;
    }
    
    @Override
    public BaseDataResp commonThirdParty(FindThirdPartyReq req)
        throws ServicesException
    { 
        if ((int)baseDao.executeSQL("delete", "deleteTuserThirdInfo", req) < DigitalAndStringConstant.DigitalConstant.ZERO)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_DETELE);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findAccCenter(BaseReq req)
        throws Exception
    {
        QueryEvent<BaseReq> event = new QueryEvent<BaseReq>();
        event.setObj(req);
        event.setStatement("findUserAccountAmount");
        TUserCapitalAccount capitalAccount = (TUserCapitalAccount)baseDao.findOneByCustom(event);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(CommonConstant.JSON_KEY_SINGLE_RESULT, capitalAccount);
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        resp.setData(map);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @Override
    public BaseDataResp findFreezePro(FindFreezeProReq req)
        throws Exception
    {
        QueryEvent<BaseReq> event = new QueryEvent<BaseReq>();
        Map<String, Object> data = new HashMap<String, Object>();
        event.setObj(req);
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(true);
        event.setStatement("findFreezeProjectList");
        BaseDataResp resp = new BaseDataResp();
        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, baseDao.findAllIsPageByCustom(event)));
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @Override
    public BaseDataResp findAccMoneyList(FindAccMoneyListReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FindAccMoneyListReq> event = new QueryEvent<FindAccMoneyListReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(true);
        event.setStatement("findAccMoneyList");
        event.setObj(req);
        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, baseDao.findAllIsPageByCustom(event)));
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @Override
    public BaseDataResp findTradeList(FindTradeListReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FindTradeListReq> event = new QueryEvent<FindTradeListReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(true);
        event.setStatement("findTradeList");
        event.setObj(req);
        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, baseDao.findAllIsPageByCustom(event)));
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findUserByOpendId(FindUserByOpendIdReq req)
        throws ServicesException
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent<FindUserByOpendIdReq> event = new QueryEvent<FindUserByOpendIdReq>();
        if ((ThirdTypeEnum.WX.dataBaseVal.equals(req.getType()) || ThirdTypeEnum.GZHYH.dataBaseVal.equals(req.getType()))
            && StringUtils.isNotBlank(req.getUnionId()))
        {
        	/**
        	 * 1、公众号用户和微信扫码用户opendId是不一样的，同一个用户有两个opendId,可他们的unionId是一样（相当于微信用户的唯一标识）
        	 * 2、先查询unionId能不能找到用户
        	 * 2.1如果没有找到，再根据opendId查询用户-----如果找到了，就直接返回这个用户信息---如果没有找到就说明我们库确实没有该用户
        	 * 2.2如果找到了，再根据用户的userId和授权登录类型去找用户的opendId
        	 * 2.2.1如果没有找到，就说明unionId是存在的，可是我们库却没有该授权类型的第三方授权信息（也就说，可能用户网站扫码登录过，可是现在是从微信登录-此处就是为了实现只要
        	 * 用户在一端登录过，在其他端也可直接登录，不需要进行第二次授权绑定）
        	 * 2.2.2如果找到了，就说明用户存在，直接返回用户信息
        	 */
            req.setUnionId(Base64Encoder.encode(req.getUnionId()).replaceAll("\r|\n", ""));
            event.setObj(req);
            event.setStatement("findUserByUnionId");
            List<TUser>  listUser = baseDao.findAllIsPageByCustom(event);
            //TUser userResp = (TUser)baseDao.findOneByCustom(event);
            if (listUser == null || listUser.size() == 0)
            {
                req.setOpendId(Base64Encoder.encode(req.getOpendId()).replaceAll("\r|\n", ""));
                event.setObj(req);
                event.setStatement("findUserByOpendId");
                TUser findUserResp = (TUser)baseDao.findOneByCustom(event);
                if (findUserResp == null)
                {
                    resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
                    return resp;
                }
                resp.setCode(IDiMengResultCode.Commons.SUCCESS);
                resp.setData(findUserResp);
                return resp;
            }
            //根据unionId查询到了用户 记录，1条或者两条记录，但是用户的userId都是一样的
            FindUserByOpendIdReq openReq = new FindUserByOpendIdReq();
            openReq.setUserId(listUser.get(0).getUserId());
            openReq.setType(req.getType());
            event.setObj(openReq);
            event.setStatement("findUserOpendId");
            UserOpenidResp openidResp = (UserOpenidResp)baseDao.findOneByCustom(event);
            //把查询到的用户id和手机号打回
            resp.setData(listUser.get(0));
            if (openidResp == null)
            {
                //该类型的用户不存在-可是unionId存在
                resp.setCode(IDiMengResultCode.UserManager.USER_UNION_ID_STATUS);
                return resp;
            }
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            return resp;
        }
        else
        {
            req.setOpendId(Base64Encoder.encode(req.getOpendId()).replaceAll("\r|\n", ""));
            event.setObj(req);
            event.setStatement("findUserByOpendId");
            TUser userResp = (TUser)baseDao.findOneByCustom(event);
            if (userResp == null)
            {
                resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
                return resp;
            }
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            resp.setData(userResp);
            return resp;
        }
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertUserThirdParty(ThirdPartyUserResp insertReq)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        TUserThirdParty tirdparty = new TUserThirdParty();
        tirdparty.setId(UUIDGenerate.generateShortUuid());
        tirdparty.setUserId(insertReq.getUserId());
        tirdparty.setAuthorizeTime(DateUtil.getNow());
        if (StringUtil.notEmpty(insertReq.getTokenExpireIn()))
        {
            Calendar c = new GregorianCalendar();
            Date date = DateUtil.getNow();
            c.setTime(date);
            c.add(Calendar.SECOND, Integer.parseInt(insertReq.getTokenExpireIn()));
            date = c.getTime();
            tirdparty.setFailTime(date);
        }
        tirdparty.setHeadImg(insertReq.getHeadImgUrl());
        tirdparty.setNickName(insertReq.getNickName());
        tirdparty.setOpenId(Base64Encoder.encode(insertReq.getOpenid()).replaceAll("\r|\n", ""));
        tirdparty.setToken(Base64Encoder.encode(insertReq.getToken()).replaceAll("\r|\n", ""));
        tirdparty.setType(insertReq.getAuthorizeType());
        if ((ThirdTypeEnum.GZHYH.dataBaseVal.equals(insertReq.getAuthorizeType()) | ThirdTypeEnum.WX.dataBaseVal.equals(insertReq.getAuthorizeType()))
            && StringUtils.isNotBlank(insertReq.getUnionId()))
        {
            tirdparty.setUnionId(Base64Encoder.encode(insertReq.getUnionId()).replaceAll("\r|\n", ""));
        }
        
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(tirdparty))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findUserOpendId(FindUserByOpendIdReq findUserByOpendIdReq)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        QueryEvent<FindUserByOpendIdReq> event = new QueryEvent<FindUserByOpendIdReq>();
        event.setObj(findUserByOpendIdReq);
        event.setStatement("findUserOpendId");
        UserOpenidResp openidResp = (UserOpenidResp)baseDao.findOneByCustom(event);
        if (openidResp != null)
        {
            resp.setCode(IDiMengResultCode.UserManager.USER_IS_BOUND);
            return resp;
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    /**
     * console --insert插入医院信息
     * InsertHospitalReq
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp insertHospitalInfo(InsertHospitalReq insertReq)
            throws Exception{
        QueryEvent event = new QueryEvent();
        event.setStatement("findHosUserUnique");
        event.setObj(insertReq);
        List<TUser> list = baseDao.findAllIsPageByCustom(event);
        BaseDataResp resp = new BaseDataResp();
        if (null != list && list.size() > 0)
        {
            resp.setCode("000001");
        }else{
            //1.1 、新增医院信息表t_hospital_basic
            THospitalBasic tHospitalBasic =  new THospitalBasic();
            tHospitalBasic.setUserId(UUIDGenerate.generateShortUuid());
            tHospitalBasic.setHospitalId(tHospitalBasic.getUserId());
            tHospitalBasic.setHospitalName(insertReq.getHospitalName());
            tHospitalBasic.setHospitalGrade(insertReq.getHospitalGrade());
            tHospitalBasic.setHospitalType(insertReq.getHospitalType());
            tHospitalBasic.setProvince(insertReq.getProvince());
            tHospitalBasic.setCity(insertReq.getCity());
            tHospitalBasic.setCounty(insertReq.getCounty());
            tHospitalBasic.setAddr(insertReq.getAddr());
            tHospitalBasic.setLogoUrl(insertReq.getLogoUrl());
            tHospitalBasic.setLogoId(insertReq.getLogoId());
            tHospitalBasic.setHospitalAbstract(insertReq.getHospitalAbstract());
            tHospitalBasic.setContent(insertReq.getContent());
            tHospitalBasic.setOrganizationAptitudeUrl(insertReq.getOrganizationAptitudeUrl());
            tHospitalBasic.setOrganizationAptitudeId(insertReq.getOrganizationAptitudeId());
            tHospitalBasic.setHospitalUrl(insertReq.getHospitalUrl());
            tHospitalBasic.setLinkName(insertReq.getLinkName());
            tHospitalBasic.setMobilePhone(insertReq.getMobilePhone());
            tHospitalBasic.setOfficeTel(insertReq.getOfficeTel());
            tHospitalBasic.setHospitalMail(insertReq.getHospitalMail());
            tHospitalBasic.setPublishStatus(insertReq.getPublishStatus());
            tHospitalBasic.setRecommendStatus(insertReq.getRecommendStatus());
    //      baseDao.insert(tHospitalBasic);
            if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(tHospitalBasic))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
            //2、新增用户总表
            TUser tuser = new TUser();
            tuser.setUserId(tHospitalBasic.getUserId());
            tuser.setUserName(tHospitalBasic.getMobilePhone());
            tuser.setHospitalName(tHospitalBasic.getHospitalName());
            tuser.setHospitalId(tuser.getUserId());
            tuser.setUserType("1");
            tuser.setSource("1");
            tuser.setSourceType(CommonConstant.FOUR);
            tuser.setMobile(tHospitalBasic.getMobilePhone());
            tuser.setEmail(tHospitalBasic.getHospitalMail());
            tuser.setDateLastLogin(DateUtil.getNow());
    //      baseDao.insert(tuser);
            if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(tuser))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
            //3、新增用户基本信息表 -登录授权方式，如果不是sj则说明是第三方授权登录的
            TQUserBasic userBase = new TQUserBasic();
            userBase.setUserId(tuser.getUserId());
            userBase.setNickName(tHospitalBasic.getHospitalName());
            if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(userBase))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }

            //4、新增用户资金信息表
            TUserCapitalAccount acc = new TUserCapitalAccount();
            acc.setUserId(tuser.getUserId());
            acc.setDateUpdate(DateUtil.getNow());
            if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(acc))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
            //5、新增用户免打扰设置信息
            TUserNotify userNotify = new TUserNotify();
            userNotify.setUserId(tuser.getUserId());
            if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(userNotify))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        }
        return resp;

    }

    /**
     * 修改插入的医院信息----??????
     */
    @SuppressWarnings("unchecked")
    public BaseDataResp updateHosInfo(InsertHospitalReq updateReq)
            throws Exception{
        BaseDataResp resp = new BaseDataResp();
        //1、修改医院基本信息表中的内容
        THospitalBasic tHospitalBasic = new THospitalBasic();

        tHospitalBasic.setUserId(updateReq.getUserId());
        tHospitalBasic.setHospitalId(updateReq.getUserId());
        tHospitalBasic.setHospitalName(updateReq.getHospitalName());
        tHospitalBasic.setHospitalGrade(updateReq.getHospitalGrade());
        tHospitalBasic.setHospitalType(updateReq.getHospitalType());
        tHospitalBasic.setProvince(updateReq.getProvince());
        tHospitalBasic.setCity(updateReq.getCity());
        tHospitalBasic.setCounty(updateReq.getCounty());
        tHospitalBasic.setAddr(updateReq.getAddr());
        tHospitalBasic.setLogoId(updateReq.getLogoId());
        tHospitalBasic.setLogoUrl(updateReq.getLogoUrl());//？？？？？
        tHospitalBasic.setHospitalAbstract(updateReq.getHospitalAbstract());
        tHospitalBasic.setContent(updateReq.getContent());
        tHospitalBasic.setOrganizationAptitudeId(updateReq.getOrganizationAptitudeId());
        tHospitalBasic.setOrganizationAptitudeUrl(updateReq.getOrganizationAptitudeUrl());
        tHospitalBasic.setHospitalUrl(updateReq.getHospitalUrl());
        tHospitalBasic.setLinkName(updateReq.getLinkName());
        tHospitalBasic.setMobilePhone(updateReq.getMobilePhone());
        tHospitalBasic.setOfficeTel(updateReq.getOfficeTel());
        tHospitalBasic.setHospitalMail(updateReq.getHospitalMail());
        tHospitalBasic.setPublishStatus(updateReq.getPublishStatus());
        tHospitalBasic.setRecommendStatus(updateReq.getRecommendStatus());
//        baseDao.update(tHospitalBasic);
        if (baseDao.update(tHospitalBasic) != 1)
        {
            logs.info("数据更新出错");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }

//        //2、修改用户表中对应医院的电话号码和用户名、医院名等
        TUser user = new TUser();
        user.setUserId(tHospitalBasic.getHospitalId());          //有没有必要？
        user.setUserName(tHospitalBasic.getMobilePhone());
        user.setMobile(tHospitalBasic.getMobilePhone());
        user.setHospitalName(tHospitalBasic.getHospitalName());
        user.setEmail(tHospitalBasic.getHospitalMail());
//        baseDao.update(user);
        if (baseDao.update(user) != 1)
        {
            logs.info("数据更新出错");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    /**
     * 插入基金会信息
     */
    @SuppressWarnings("unchecked")
    public BaseDataResp insertFoundationInfo(FindFoundationReq insertReq)
            throws Exception{
        QueryEvent event = new QueryEvent();
        event.setStatement("findFoundationUnique");
        event.setObj(insertReq);
        List<FoundationInfo> list = baseDao.findAllIsPageByCustom(event);
        BaseDataResp resp = new BaseDataResp();
        if (null != list && list.size() > 0)
        {
            resp.setCode("000001");
        }else{
            //1、插入到foundation_info表汇总
            FoundationInfo foundation = new FoundationInfo();

//            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String now = dateFormat.format(new Date());

            foundation.setFoundationId(UUIDGenerate.generateShortUuid());
            foundation.setFoundationName(insertReq.getFoundationName());
            foundation.setFoundationUrl(insertReq.getFoundationUrl());
            foundation.setRegistrationInstitution(insertReq.getRegistrationInstitution());
            foundation.setSocialCreditCode(insertReq.getSocialCreditCode());
            foundation.setCertificateUrl(insertReq.getCertificateUrl());
            foundation.setCertificateId(insertReq.getCertificateId());
            foundation.setDonationsQualificationUrl(insertReq.getDonationsQualificationUrl());
            foundation.setDonationsUrlId(insertReq.getDonationsUrlId());
            foundation.setAddress(insertReq.getAddress());
            foundation.setOfficeTel(insertReq.getOfficeTel());
            foundation.setMail(insertReq.getMail());
            foundation.setLogoUrl(insertReq.getLogoUrl());
            foundation.setLogoId(insertReq.getLogoId());
            foundation.setCreateTime(now);
            foundation.setContent(insertReq.getContent());
            foundation.setRemainProperty(insertReq.getRemainProperty());
            foundation.setBankInfo(insertReq.getBankInfo());
            foundation.setInvoiceType(insertReq.getInvoiceType());
            foundation.setAccountInfo(insertReq.getAccountInfo());
            foundation.setLinkMobile(insertReq.getLinkMobile());
            foundation.setLinkName(insertReq.getLinkName());
            //baseDao.insert(foundation);
            if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(foundation))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        }
        return resp;
    }
    /**
     * 修改提交基金会信息
     */
    @SuppressWarnings("unchecked")
    public BaseDataResp updateFoundationInfo(FindFoundationReq updateReq)
            throws Exception{
        BaseDataResp resp = new BaseDataResp();
        //1、插入到foundation_info表汇总
        FoundationInfo foundation = new FoundationInfo();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now = dateFormat.format(new Date());
        foundation.setFoundationId(updateReq.getFoundationId());
        foundation.setFoundationName(updateReq.getFoundationName());
        foundation.setFoundationUrl(updateReq.getFoundationUrl());
        foundation.setRegistrationInstitution(updateReq.getRegistrationInstitution());
        foundation.setSocialCreditCode(updateReq.getSocialCreditCode());
        foundation.setCertificateUrl(updateReq.getCertificateUrl());
        foundation.setCertificateId(updateReq.getCertificateId());
        foundation.setDonationsQualificationUrl(updateReq.getDonationsQualificationUrl());
        foundation.setDonationsUrlId(updateReq.getDonationsUrlId());
        foundation.setAddress(updateReq.getAddress());
        foundation.setOfficeTel(updateReq.getOfficeTel());
        foundation.setMail(updateReq.getMail());
        foundation.setLogoUrl(updateReq.getLogoUrl());
        foundation.setLogoId(updateReq.getLogoId());
        foundation.setCreateTime(now);
        foundation.setContent(updateReq.getContent());
        foundation.setRemainProperty(updateReq.getRemainProperty());
        foundation.setBankInfo(updateReq.getBankInfo());
        foundation.setInvoiceType(updateReq.getInvoiceType());
        foundation.setAccountInfo(updateReq.getAccountInfo());
        foundation.setLinkMobile(updateReq.getLinkMobile());
        foundation.setLinkName(updateReq.getLinkName());
//        baseDao.update(user);
        if (baseDao.update(foundation) != 1)
        {
            logs.info("数据更新出错");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    /**
     * 删除基金会信息--console
     */
    @SystemOperationLog(
            businessOperationTypeEnum = BusinessOperationTypeEnum.CUSTMGRDELETE
    )
    public BaseDataResp deleteFoundation(DeleteFoundationReq req)
            throws Exception{
        if (1 != this.baseDao.delete(DimengBeanUtil.copyProperties(FoundationInfo.class, req))) {
            this.logs.error("###删除数据错误###");
            throw new ServicesException("100002");
        } else {
            BaseDataResp resp = new BaseDataResp();
            resp.setCode("000000");
            return resp;
        }
    }


}
