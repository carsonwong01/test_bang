package com.dimeng.modules.home.services.impl;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.constants.SystemConstant;
import com.dimeng.entity.ext.expand.FindAllHospitalResp;
import com.dimeng.entity.ext.expand.FindAllTSiteImageTemplateResp;
import com.dimeng.entity.ext.expand.FindPartnerResp;
import com.dimeng.entity.ext.home.front.FindRecommendListResp;
import com.dimeng.entity.ext.home.front.HomeAdvertiseResp;
import com.dimeng.entity.ext.home.front.HomeNoticeListResp;
import com.dimeng.entity.ext.home.front.HomeTotalResp;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.entity.ext.user.UserOpenidResp;
import com.dimeng.entity.table.user.*;
import com.dimeng.enums.ThirdTypeEnum;
import com.dimeng.framework.abilitys.encryptors.RSAEncryptor;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.framework.utils.DateUtil;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.expand.CooPartnerReq;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.model.home.FrontIndexReq;
import com.dimeng.model.home.FrontLoginCheckReq;
import com.dimeng.model.home.FrontRegisterReq;
import com.dimeng.model.user.FindUserByOpendIdReq;
import com.dimeng.modules.home.services.FrontIndexService;
import com.dimeng.utils.SpringBeanUtil;
import com.dimeng.utils.SystemCache;
import com.dimeng.utils.UUIDGenerate;
import net.sf.ehcache.Element;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.InvocationTargetException;
import java.util.*;


/**
 * 前台首页service实现类-注册、登录
 * @author  song
 * @version  [版本号, 2016年10月12日]
 */
@Service
public class FrontIndexServiceImpl extends BaseServiceImpl implements FrontIndexService
{

    @Autowired
    SpringBeanUtil springBeanUtil;

    private BaseDataResp resp = new BaseDataResp();

    /**
     * 查询数据库中的未删除的所有项目
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findAllProList(FrontIndexReq req)
            throws Exception{
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FrontIndexReq> event = new QueryEvent<FrontIndexReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(12);
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        event.setObj(req);
        event.setStatement("findAllProList");
        List<FindRecommendListResp> list = baseDao.findAllIsPageByCustom(event);

        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, list));

        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }




    /**
     * front-查询众筹中的所有项目
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findAllProject(FrontIndexReq req) throws Exception {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FrontIndexReq> event = new QueryEvent<FrontIndexReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        event.setObj(req);
        event.setStatement("findAllProject");
        List<FindRecommendListResp> list = baseDao.findAllIsPageByCustom(event);

        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, list));

        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp frontTotalInfo(FrontIndexReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> map = new HashMap<String, Object>();

        QueryEvent<FrontIndexReq> event = new QueryEvent<FrontIndexReq>();
        event.setObj(req);
        event.setStatement("findAdvertiseList");
        List<HomeAdvertiseResp> advertiseList = baseDao.findAllIsPageByCustom(event);
        map.put("advertiseList", advertiseList);

        event.setStatement("findNoticelList");
        List<HomeNoticeListResp> noticelList = baseDao.findAllIsPageByCustom(event);
        map.put("noticelList", noticelList);

        event.setStatement("findHomeTotal");
        HomeTotalResp homeTotal = (HomeTotalResp)baseDao.findOneByCustom(event);
        if(homeTotal.getRaiseTotal() == null){
            homeTotal.setRaiseTotal("0");
            homeTotal.setTotalInteger("0");
        }else{
            homeTotal.setTotalInteger(homeTotal.getRaiseTotal().replaceAll(",", ""));
        }
        map.put("statResult", homeTotal);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findRecommendList(FrontIndexReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FrontIndexReq> event = new QueryEvent<FrontIndexReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(!StringUtil.isEmpty(req.getExportPath()) ? false : true);
        event.setObj(req);
        event.setStatement("findRecommendList");
        List<FindRecommendListResp> list = baseDao.findAllIsPageByCustom(event);

        //格式化标签为List
        if (list != null && list.size() > 0)
        {
            List<String> projectTags = null;
            for (FindRecommendListResp findRecommendListResp : list)
            {
                //格式化标签为数组List
                projectTags = new ArrayList<String>();
                String[] label = findRecommendListResp.getProjectTag().split(",");
                for (String string : label)
                {
                    if (StringUtil.notEmpty(string))
                    {
                        projectTags.add(string);
                    }
                }
                findRecommendListResp.setProjectTags(projectTags);
                findRecommendListResp.setProjectTag(null);
            }
        }

        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, list));

        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findHomeHosList()
        throws Exception{
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<HospitalBasicReq> event = new QueryEvent<HospitalBasicReq>();
        event.setStatement("homePageHospital");

        List<FindAllHospitalResp> homeHosList = baseDao.findAllIsPageByCustom(event);
        data.put("homeHosList",homeHosList);

        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findPartnerList()throws Exception{
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<CooPartnerReq> event = new QueryEvent<CooPartnerReq>();
        event.setStatement("findHomePartner");

        List<FindPartnerResp> partnersList = baseDao.findAllIsPageByCustom(event);
        data.put("partnersList",partnersList);

        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public BaseDataResp commonLoginCheck(FrontLoginCheckReq req)
        throws Exception
    {
        FrontUserInfo loginUserResp = new FrontUserInfo();
        BaseDataResp resp = new BaseDataResp();
        QueryEvent event = new QueryEvent();
        event.setObj(req);
        //校验用户名为空
        if (StringUtil.notEmpty(req.getUserName()))
        {
            String userName = req.getUserName();
            if (userName.matches(("1[0-9]{10}")))
            {
                event.setStatement("findLoginUserInfo");
                loginUserResp = (FrontUserInfo)baseDao.findOneByCustom(event);
                if (loginUserResp == null)
                {
                    //没有则进入注册流程
                    FrontRegisterReq regisReq = new FrontRegisterReq();
                    regisReq.setPhoneNumber(req.getUserName());
                    regisReq.setThirdType("1");
                    regisReq.setSource(req.getSource());
                    regisReq.setLastLoginIp(req.getLoginIp());
                    resp = insertFrontUserInfo(regisReq);
                    if(resp.getCode().equals(IDiMengResultCode.Commons.SUCCESS)){
                        resp.setCode(IDiMengResultCode.UserManager.USER_INSERTINFO_OK);
                    }
                    return resp;
                }//判断用户是否锁定  1：正常 2：锁定  3拉黑，拉黑是可以登录的
                else if (CommonConstant.TWO.equals(loginUserResp.getUserStatus()))
                {
                    resp.setCode(IDiMengResultCode.UserManager.USER_LOGIN_LOCK);
                }
                else
                {
                    TUser userInfo = new TUser();
                    userInfo.setUserId(loginUserResp.getUserId());
                    userInfo = (TUser)baseDao.findById(userInfo);
                    //登录成功--更新用户登录信息
                    String phone = userInfo.getMobile();
                    phone= phone.substring(0, 3)+"****"+phone.substring(phone.length()-4, phone.length());
                    loginUserResp.setMobile(phone);
                    loginUserResp.setMobileStatus("1");
                    if(StringUtil.isEmpty(userInfo.getTradePwd())){
                        loginUserResp.setTranPasswordStatus("2");
                    }else{
                        loginUserResp.setTranPasswordStatus("1");
                    }
                    TUser tuser = new TUser();
                    tuser.setUserId(loginUserResp.getUserId());
                    tuser.setDateLastLogin(userInfo.getDateLogin());
                    tuser.setLastLoginIp(req.getLoginIp());
                    //判断是否是第一次登录，为空时是第一次登录
                    if (StringUtil.isEmpty(loginUserResp.getFirstLogin()))
                    {
                        tuser.setDateLastLogin(new Date());
                        loginUserResp.setFirstLogin(CommonConstant.ONE);
                        tuser.setFirstLogin(CommonConstant.ONE);
                    }
                    else
                    {
                        loginUserResp.setFirstLogin(CommonConstant.TWO);
                        tuser.setFirstLogin(CommonConstant.TWO);
                    }
                    tuser.setDateLogin(new Date());
                    if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.update(tuser))
                    {
                        throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
                    }

                    //获取用户的公众号openId
                    FindUserByOpendIdReq openReq = new FindUserByOpendIdReq();
                    openReq.setUserId(loginUserResp.getUserId());
                    openReq.setType(ThirdTypeEnum.GZHYH.dataBaseVal);
                    event.setObj(openReq);
                    event.setStatement("findUserOpendId");
                    UserOpenidResp openidResp = (UserOpenidResp) baseDao.findOneByCustom(event);
                    if(openidResp != null && StringUtils.isNotBlank(openidResp.getOpendId())){
                    	loginUserResp.setGzhyhOpenId(openidResp.getOpendId());
                    }
                    getToken(req.getImei(), loginUserResp, resp);
                }
            }
            else
            {
                resp.setCode(IDiMengResultCode.MessageManage.PHONE_NUMBER_ERROR);
                return resp;
            }
        }
        else
        {
            resp.setCode(IDiMengResultCode.Commons.ERROR_PARAMETER);
        }
        return resp;
    }

    private void getToken(String imei, FrontUserInfo loginUserResp, BaseDataResp resp)
        throws Exception
    {
        String temp = loginUserResp.getUserId() + "&" + (imei == null ? "" : imei);
        loginUserResp.setPassword("");
        long time = System.currentTimeMillis() + DigitalAndStringConstant.DigitalConstant.MILLISECOND_SEVEN_DAY;
        loginUserResp.setToken(Base64.encodeBase64String(RSAEncryptor.encryptByPublicKey((temp + "&" + time).getBytes(),
            publicKey)));
        loginCache.put(new Element(loginUserResp.getToken(), loginUserResp));
        //更新缓存登录统计
        updateUserStat(loginUserResp, temp);
        //shiro登录
        SecurityUtils.getSubject().login(new UsernamePasswordToken(loginUserResp.getToken(), loginUserResp.getToken()));
        resp.setData(loginUserResp);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
    }

    /**
     * 更新缓存登录统计
     * <功能详细描述>
     * @param loginUserResp
     * @param temp
     */
    public void updateUserStat(FrontUserInfo loginUserResp, String temp)
    {
        //登录人数
        int loginCount = 1;
        Object object = systemCache.get("loginCount");
        systemCache.put(new Element("UserId" + loginUserResp.getUserId(), loginUserResp.getUserId()));
        if (object != null)
        {
            loginCount = (int)systemCache.get("loginCount").getObjectValue();
            loginCount++;
        }
        systemCache.put(new Element("loginCount", loginCount));
    }

    /**
     * 点击注册后，校验用户名的唯一
     * @throws ServicesException
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    private BaseDataResp checkUserNameUniqueLast(FrontRegisterReq req) throws ServicesException
    {
        QueryEvent event = new QueryEvent();
        //用户名区分大小写
        event.setStatement("findUserUnique");
        event.setObj(req);
        //查询用户名、手机号、邮箱是否唯一
        List<TUser> list = baseDao.findAllIsPageByCustom(event);
        //大于0，表示用户名或手机号或邮箱已使用
        if (null != list && list.size() > 0)
        {
            //如果已经存在，则返回到控制层直接调用登录流程接口-更新用户的第三方账户信息-可绑定多个--如果要绑定多个放开此处。注：微信是不让绑定多个的
        	TUser tuser = list.get(0);
        	FindUserByOpendIdReq findReq = new FindUserByOpendIdReq();
        	findReq.setUserId(tuser.getUserId());
        	findReq.setType(req.getThirdType());
        	event.setStatement("findUserOpendId");
        	event.setObj(findReq);
        	 UserOpenidResp thirdInfo = (UserOpenidResp)baseDao.findOneByCustom(event);
        	 if(thirdInfo == null){
        		 //没有绑定过，就新增
        		 TUserThirdParty tirdparty = new TUserThirdParty();
                 tirdparty.setId(UUIDGenerate.generateShortUuid());
                 tirdparty.setUserId(tuser.getUserId());
                 tirdparty.setAuthorizeTime(DateUtil.getNow());
                 if (StringUtil.notEmpty(req.getTokenExpireIn()))
                 {
                     Calendar c = new GregorianCalendar();
                     Date date = DateUtil.getNow();
                     c.setTime(date);
                     c.add(Calendar.SECOND,Integer.parseInt(req.getTokenExpireIn()));
                     date=c.getTime();
                     tirdparty.setFailTime(date);
                 }
                 tirdparty.setHeadImg(req.getHeadPortrait());
                 tirdparty.setNickName(req.getNickname());
                 tirdparty.setOpenId(req.getOpenid());
                 tirdparty.setToken(req.getToken());
                 tirdparty.setType(req.getThirdType());
                 if((ThirdTypeEnum.WX.dataBaseVal.equals(req.getThirdType()) ||ThirdTypeEnum.GZHYH.dataBaseVal.equals(req.getThirdType())) && StringUtils.isNotBlank(req.getUnionId())){
                 	tirdparty.setUnionId(req.getUnionId());
                 }
                 if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(tirdparty))
                 {
                     throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
                 }
                 resp.setCode(IDiMengResultCode.UserManager.USER_ERROR_LOGINNAME_EXIST);
        	 }else{
        		 resp.setCode(IDiMengResultCode.UserManager.USER_IS_BOUNDERR);
        	 }
        }
        else
        {
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        }
        return resp;
    }

    /**
     * 用户注册
     */
    @Override
    public BaseDataResp insertFrontUserInfo(FrontRegisterReq req)
        throws Exception
    {
        //校验手机号格式是否正确
        if (!req.getPhoneNumber().trim().matches(("1[0-9]{10}")))
        {
            resp.setCode(IDiMengResultCode.UserManager.USER_NAME_UNSTANDARD);
            return resp;
        }
        //1、校验用户名是否唯一
        resp = checkUserNameUniqueLast(req);
        if(IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode())){
            //不存在-插入数据 ,然后执行登录操作
             resp = insertTable(req);
        }
        return resp;
    }

    /**
     * 校验通过后，执行插入操作
     * @throws IllegalAccessException
     * @throws InvocationTargetException
     */
    @SuppressWarnings({"unchecked"})
    private BaseDataResp insertTable(FrontRegisterReq insertReq)
        throws Exception
    {
        //1、新增用户总表
        TUser tuser = new TUser();
        tuser.setUserId(UUIDGenerate.generateShortUuid());
        tuser.setUserName(insertReq.getPhoneNumber());
        tuser.setSource(insertReq.getSource());
        tuser.setSourceType(CommonConstant.FOUR);
        tuser.setMobile(insertReq.getPhoneNumber());
        tuser.setDateLastLogin(DateUtil.getNow());
        tuser.setLastLoginIp(insertReq.getLastLoginIp());
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(tuser))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        //2、新增用户基本信息表 -登录授权方式，如果不是sj则说明是第三方授权登录的
        TQUserBasic userBase = new TQUserBasic();
        userBase.setUserId(tuser.getUserId());
        userBase.setSex(insertReq.getSex());
        if(ThirdTypeEnum.SJ.dataBaseVal.equals(insertReq.getThirdType())){
            String userName = insertReq.getPhoneNumber();
            String nickName ="用户"+
                userName.substring(0, 3) + "****" + userName.substring(userName.length() - 4, userName.length());
            userBase.setNickName(nickName);
            List<FindAllTSiteImageTemplateResp> imgUrl = (List<FindAllTSiteImageTemplateResp>)SystemCache.getCache(SystemConstant.CacheKey.IMAGE_MODEL_LIST);
            if(imgUrl != null && imgUrl.size()!= 0){
                userBase.setImageUrl(imgUrl.get(0).getImageUrl());
            }
        }else{
            userBase.setNickName(insertReq.getNickname());
            userBase.setImageUrl(insertReq.getHeadPortrait());
        }
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(userBase))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }

        //不是手机号单独注册的，第三方授权登录注册    登录授权方式-1 手机  2 微信 3 微博 4 QQ
        if (!ThirdTypeEnum.SJ.dataBaseVal.equals(insertReq.getThirdType()))
        {
            TUserThirdParty tirdparty = new TUserThirdParty();
            tirdparty.setId(UUIDGenerate.generateShortUuid());
            tirdparty.setUserId(tuser.getUserId());
            tirdparty.setAuthorizeTime(DateUtil.getNow());
            if (StringUtil.notEmpty(insertReq.getTokenExpireIn()))
            {
                Calendar c = new GregorianCalendar();
                Date date = DateUtil.getNow();
                c.setTime(date);
                c.add(Calendar.SECOND,Integer.parseInt(insertReq.getTokenExpireIn()));
                date=c.getTime();
                tirdparty.setFailTime(date);
            }
            tirdparty.setHeadImg(insertReq.getHeadPortrait());
            tirdparty.setNickName(insertReq.getNickname());
            tirdparty.setOpenId(insertReq.getOpenid());
            tirdparty.setToken(insertReq.getToken());
            tirdparty.setType(insertReq.getThirdType());
            if((ThirdTypeEnum.WX.dataBaseVal.equals(insertReq.getThirdType()) ||ThirdTypeEnum.GZHYH.dataBaseVal.equals(insertReq.getThirdType())) && StringUtils.isNotBlank(insertReq.getUnionId())){
            	tirdparty.setUnionId(insertReq.getUnionId());
            }
            if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(tirdparty))
            {
                throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
            }
        }
        //3、新增用户资金信息表
        TUserCapitalAccount acc = new TUserCapitalAccount();
        acc.setUserId(tuser.getUserId());
        acc.setDateUpdate(DateUtil.getNow());
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(acc))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        //4、新增用户免打扰设置信息
        TUserNotify userNotify = new TUserNotify();
        userNotify.setUserId(tuser.getUserId());
        if (DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT != baseDao.insert(userNotify))
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_INSERT);
        }
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findRecommend()
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> map = new HashMap<String, Object>();
        QueryEvent<FrontIndexReq> event = new QueryEvent<FrontIndexReq>();
        event.setStatement("findRecommend");
        List<FindRecommendListResp> recommendList = baseDao.findAllIsPageByCustom(event);
        map.put("recommendList", recommendList);
        resp.setData(map);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

}
