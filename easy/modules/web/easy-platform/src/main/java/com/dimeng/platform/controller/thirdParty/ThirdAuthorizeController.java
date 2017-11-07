package com.dimeng.platform.controller.thirdParty;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.Cache;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.user.ThirdPartyUserResp;
import com.dimeng.entity.table.user.TUser;
import com.dimeng.enums.ThirdTypeEnum;
import com.dimeng.enums.variable.EasySystemVariable;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.utils.FrameworkConfigurer;
import com.dimeng.model.home.FrontLoginCheckReq;
import com.dimeng.model.home.ThirdTypeReq;
import com.dimeng.model.thirdParty.loginHelp.QqLoginHelper;
import com.dimeng.model.thirdParty.loginHelp.WbLoginHelper;
import com.dimeng.model.thirdParty.loginHelp.WxLoginHelper;
import com.dimeng.model.thirdParty.thirdUser.ThirdPartyUser;
import com.dimeng.model.user.FindUserByOpendIdReq;
import com.dimeng.modules.home.services.FrontIndexService;
import com.dimeng.modules.user.services.UserInfoManageService;
import com.dimeng.utils.Base64Encoder;
import com.dimeng.utils.CommonUtil;
import com.dimeng.utils.SystemCache;
import com.dimeng.utils.UUIDGenerate;

/**]
 * 第三方授权管理
 * @author  song
 * @version  [版本号, 2016年10月27日]
 */
@Controller
@RequestMapping(value = "thirdAuthorize")
public class ThirdAuthorizeController extends BaseController
{
    
    @Resource
    UserInfoManageService userManageService;
    
    @Resource
    FrontIndexService frontIndexService;
    
    /**
     * 注释内容
     */
     @Resource(name = "loginCache")
     private Cache loginCache;
    
    /**
     * 去往第三方页授权页面
     * @param request
     * @param response
     */ 
    @RequestMapping(value = "/{v}/goThirdAuthorize", method = RequestMethod.POST, produces = {"application/json",
    "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object goThirdAuthorize(HttpEntity<ThirdTypeReq> httpEntity){
        BaseDataResp resp = new BaseDataResp();
        ThirdTypeReq req = httpEntity.getBody();
        resp.setCode(IDiMengResultCode.Trust.ERROR_PARAM);
        String url = "";
        if(req != null && StringUtils.isNoneBlank(req.getSourceType())){
            // 微博     QQ  此处不区分PC和移动端
            String sourceType =req.getSourceType(); 
            if("qq".equals(sourceType)){
                   String  appid  = SystemCache.getProperty(EasySystemVariable.QQ_APPID);
                   String  secret = SystemCache.getProperty(EasySystemVariable.QQ_SECRET);  
                   String redirect_url = "";
                   if("1".equals(req.getOpSource())){
                   	redirect_url = (String)FrameworkConfigurer.getProperties("qq_redirect_URI");
                   }else if("2".equals(req.getOpSource())){
                   	redirect_url = (String)FrameworkConfigurer.getProperties("qqwap_redirect_URI");
                   }  
                   url = (String)FrameworkConfigurer.getProperties("qq_authorizeURL");
                   url = url + "?response_type=code&client_id="+appid+"&redirect_uri="+redirect_url+"&scope="+secret;
                   resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            }else if("wb".equals(sourceType)){
                    String  appid  = SystemCache.getProperty(EasySystemVariable.WB_APPID);
                    String redirect_url = "";
                    if("1".equals(req.getOpSource())){
                    	redirect_url = (String)FrameworkConfigurer.getProperties("wb_redirect_URI");
                    }else if("2".equals(req.getOpSource())){
                    	redirect_url = (String)FrameworkConfigurer.getProperties("wbwap_redirect_URI");
                    } 
                    url = (String)FrameworkConfigurer.getProperties("wb_authorizeURL");
                    url = url+"?client_id="+appid+"&response_type=code&redirect_uri="+redirect_url+"&response_type=code&forcelogin=false";
                    resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            }else if("wx".equals(sourceType)){
               /**
                * wx端用，PC端直接是扫码形式的授权
                * wx_state标识-防止csrf攻击-
                */
                String wx_state = UUIDGenerate.generateShortUuid();
                String  appid  = SystemCache.getProperty(EasySystemVariable.WXGZH_APPID);
                String redirect_url = "";
                if("1".equals(req.getOpSource())){
                	redirect_url = (String)FrameworkConfigurer.getProperties("wx_redirect_URI");
                }else if("2".equals(req.getOpSource())){
                	redirect_url = (String)FrameworkConfigurer.getProperties("wxwap_redirect_URI");
                } 
                url = (String)FrameworkConfigurer.getProperties("wx_authorizeURL");
                url = url+"?appid="+appid+"&redirect_uri="+redirect_url+"&response_type=code&scope=snsapi_base&state="+wx_state+"#wechat_redirect";
                resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        } 
        }
        resp.setData(url);
        return resp;
    } 
     
    
    /**
     * 第三方回调-wx公众号用户接口
     * <功能详细描述>
     * @param request
     * @param response
     * @param session
     * @return
   * @throws Exception 
     */ 
  @RequestMapping(value = "/{v}/gzhCallback", method = RequestMethod.POST, produces = {"application/json",
  "application/xml"})
  @ResponseBody
  @ResponseStatus(value = HttpStatus.OK)
  public Object gzhCallback(HttpEntity<ThirdTypeReq> httpEntity, HttpServletRequest request, HttpServletResponse response) throws Exception
  {
      BaseDataResp resp = this.validator(httpEntity);
      if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
      {
          return resp;
      }
      String code = httpEntity.getBody().getCode();
      if(StringUtils.isEmpty(code)){
          resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
          resp.setDescription("用户取消了授权");
          return resp; 
      }
      String  appid  = SystemCache.getProperty(EasySystemVariable.WXGZH_APPID);
      String  secret = SystemCache.getProperty(EasySystemVariable.WXGZH_SECRET); 
      Map<String, String>  map = WxLoginHelper.getWxTokenAndOpenid(appid, secret, code);
      if(map == null){
          resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
          resp.setDescription("用户取消了授权");
          return resp; 
      }
      String accessToken = map.get("access_token");
      if (accessToken.equals("")) {
          resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
          resp.setDescription("用户取消了授权");
          return resp;
      }else{
          String openId = map.get("openid"); 
          String tokenExpireIn = map.get("expires_in"); 
          FindUserByOpendIdReq req = new FindUserByOpendIdReq();
          req.setOpendId(openId);
          req.setType(ThirdTypeEnum.GZHYH.dataBaseVal);
          if(StringUtils.isNoneBlank(map.get("unionid"))){
              //如果不为空，就是该用户有关联公众号，unionid为用户唯一标识，打通了公众号和网站运用
              req.setUnionId(map.get("unionid"));
          }
          resp = userManageService.findUserByOpendId(req);
          ThirdPartyUser third = WxLoginHelper.getWxUserinfo(accessToken, openId);
          if(IDiMengResultCode.UserManager.USER_UNION_ID_STATUS.equals(resp.getCode())){
        	  //新增第三方信息，然后走登录流程
        	  TUser user = (TUser)resp.getData();
              ThirdPartyUserResp data = new ThirdPartyUserResp();
              data.setUserId(user.getUserId());
              data.setOpenid(openId);
              data.setNickName(third.nickName);
              data.setGender(third.gender);
              data.setHeadImgUrl(third.headImgUrl);
              data.setToken(accessToken);
              data.setAuthorizeType(ThirdTypeEnum.GZHYH.dataBaseVal); 
              data.setTokenExpireIn(tokenExpireIn);
              data.setUnionId(map.get("unionid"));
              resp = userManageService.insertUserThirdParty(data);
              if(IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode())){
            	  FrontLoginCheckReq loginReq = new FrontLoginCheckReq();
            	  loginReq.setLoginIp(CommonUtil.getIpAddr(request));
                  loginReq.setUserName(user.getUserName());
                  resp = frontIndexService.commonLoginCheck(loginReq);
              } 
              return resp;
          } else if(IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()) && resp.getData() != null){
              FrontLoginCheckReq loginReq = new FrontLoginCheckReq();
              TUser user = (TUser)resp.getData();
              loginReq.setLoginIp(CommonUtil.getIpAddr(request));
              loginReq.setUserName(user.getUserName());
              resp = frontIndexService.commonLoginCheck(loginReq);
          }else{
              ThirdPartyUserResp data = new ThirdPartyUserResp();
              data.setOpenid(Base64Encoder.encode(openId).replaceAll("\r|\n", ""));
              data.setNickName(third.nickName);
              data.setGender(third.gender);
              data.setHeadImgUrl(third.headImgUrl);
              data.setToken(Base64Encoder.encode(accessToken).replaceAll("\r|\n", ""));
              data.setAuthorizeType(ThirdTypeEnum.GZHYH.dataBaseVal); 
              data.setTokenExpireIn(tokenExpireIn);
              if(StringUtils.isNotBlank(map.get("unionid"))){
                  data.setUnionId(Base64Encoder.encode(map.get("unionid")).replaceAll("\r|\n", ""));
              }
              Map<String, Object> dataMap = new HashMap<String, Object>();
              dataMap.put(CommonConstant.JSON_KEY_SINGLE_RESULT, data);
              //用户没有绑定手机-----如果是这个状态码就进入绑定手机页面，需要各自的控制层处理
              resp.setCode(IDiMengResultCode.UserManager.ERROR_NOT_BIND_PHONE);
              resp.setDescription("用户未绑定手机");
              resp.setData(dataMap); 
          }
          return resp; 
      }
  }
     
    /**
       * 第三方回调-wx返回地址
       * <功能详细描述>
       * @param request
       * @param response
       * @param session
       * @return
     * @throws Exception 
       */ 
    @RequestMapping(value = "/{v}/wxCallback", method = RequestMethod.POST, produces = {"application/json",
    "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object wxCallback(HttpEntity<ThirdTypeReq> httpEntity, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        BaseDataResp resp = this.validator(httpEntity);
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        String code = httpEntity.getBody().getCode();
        if(StringUtils.isEmpty(code)){
            resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
            resp.setDescription("用户取消了授权");
            return resp; 
        }
        String  appid  = SystemCache.getProperty(EasySystemVariable.WX_APPID);
        String  secret = SystemCache.getProperty(EasySystemVariable.WX_SECRET); 
        Map<String, String>  map = WxLoginHelper.getWxTokenAndOpenid(appid, secret, code); 
        if(map == null){
            resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
            resp.setDescription("用户取消了授权");
            return resp; 
        }
        String accessToken = map.get("access_token");
        if (accessToken.equals("")) {
            resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
            resp.setDescription("用户取消了授权");
            return resp;
        }else{
            String openId = map.get("openid"); 
            String tokenExpireIn = map.get("expires_in"); 
            FindUserByOpendIdReq req = new FindUserByOpendIdReq();
            req.setOpendId(openId);
            //2 微信  3微博  4 QQ
            req.setType(ThirdTypeEnum.WX.dataBaseVal);
            if(StringUtils.isNoneBlank(map.get("unionid"))){
                //如果不为空，就是该用户有关联公众号，unionid为用户唯一标识，打通了公众号和网站运用
                req.setUnionId(map.get("unionid"));
            }
            resp = userManageService.findUserByOpendId(req);
            ThirdPartyUser third = WxLoginHelper.getWxUserinfo(accessToken, openId);
            if(IDiMengResultCode.UserManager.USER_UNION_ID_STATUS.equals(resp.getCode())){
          	   //新增第三方信息，然后走登录流程
          	   TUser user = (TUser)resp.getData();
                ThirdPartyUserResp data = new ThirdPartyUserResp();
                data.setUserId(user.getUserId());
                data.setOpenid(openId);
                data.setNickName(third.nickName);
                data.setGender(third.gender);
                data.setHeadImgUrl(third.headImgUrl);
                data.setToken(accessToken);
                data.setAuthorizeType(ThirdTypeEnum.WX.dataBaseVal); 
                data.setTokenExpireIn(tokenExpireIn);
                data.setUnionId(map.get("unionid")); 
                resp = userManageService.insertUserThirdParty(data);
                if(IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode())){
              	  FrontLoginCheckReq loginReq = new FrontLoginCheckReq();
              	  loginReq.setLoginIp(CommonUtil.getIpAddr(request));
                    loginReq.setUserName(user.getUserName());
                    resp = frontIndexService.commonLoginCheck(loginReq);
                } 
                return resp;
            } else if(IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()) && resp.getData() != null){
                FrontLoginCheckReq loginReq = new FrontLoginCheckReq();
                TUser user = (TUser)resp.getData();
                loginReq.setLoginIp(CommonUtil.getIpAddr(request));
                loginReq.setUserName(user.getUserName());
                resp = frontIndexService.commonLoginCheck(loginReq);
            }else{ 
                ThirdPartyUserResp data = new ThirdPartyUserResp();
                data.setOpenid(Base64Encoder.encode(openId).replaceAll("\r|\n", ""));
                data.setNickName(third.nickName);
                data.setGender(third.gender);
                data.setHeadImgUrl(third.headImgUrl);
                data.setToken(Base64Encoder.encode(accessToken).replaceAll("\r|\n", ""));
                data.setAuthorizeType(ThirdTypeEnum.WX.dataBaseVal); 
                data.setTokenExpireIn(tokenExpireIn);
                if(StringUtils.isNotBlank(map.get("unionid"))){
                	data.setUnionId(Base64Encoder.encode(map.get("unionid")).replaceAll("\r|\n", ""));
                }
                Map<String, Object> dataMap = new HashMap<String, Object>();
                dataMap.put(CommonConstant.JSON_KEY_SINGLE_RESULT, data);
                //用户没有绑定手机-----如果是这个状态码就进入绑定手机页面，需要各自的控制层处理
                resp.setCode(IDiMengResultCode.UserManager.ERROR_NOT_BIND_PHONE);
                resp.setDescription("用户未绑定手机");
                resp.setData(dataMap);  
            }
            return resp; 
        }
    }
    /**
     * 第三方回调-qq返回地址
     * <功能详细描述>
     * @param request
     * @param response
     * @param session
     * @return
   * @throws Exception 
     */ 
  @RequestMapping(value = "/{v}/qqCallback", method = RequestMethod.POST, produces = {"application/json",
  "application/xml"})
  @ResponseBody
  @ResponseStatus(value = HttpStatus.OK)
  public Object qqCallback(HttpEntity<ThirdTypeReq> httpEntity, HttpServletRequest request, HttpServletResponse response) throws Exception
  {
      BaseDataResp resp = this.validator(httpEntity);
      if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
      {
          return resp;
      }
      ThirdTypeReq req = httpEntity.getBody();
      String  appid  = SystemCache.getProperty(EasySystemVariable.QQ_APPID);
      String  appkey = SystemCache.getProperty(EasySystemVariable.QQ_SECRET); 
      String redirect_url = "";
      if("1".equals(req.getOpSource())){
      	redirect_url = (String)FrameworkConfigurer.getProperties("qq_redirect_URI");
      }else if("2".equals(req.getOpSource())){
      	redirect_url = (String)FrameworkConfigurer.getProperties("qqwap_redirect_URI");
      }  
      
      String code = req.getCode(); 
      Map<String, String> map = QqLoginHelper.getQqToken(req.getDeviceType(), appid, appkey,redirect_url, code);
      if(map == null){
          resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
          resp.setDescription("用户取消了授权");
          return resp; 
      }
      String accessToken = map.get("access_token");
      if (accessToken.equals("")) {
          resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
          resp.setDescription("用户取消了授权");
          return resp;
      }else{
          String tokenExpireIn = String.valueOf(map.get("expires_in"));
          Map<String, String> openMap = QqLoginHelper.getOpenID(req.getDeviceType(), accessToken);;
          if(openMap == null){
              resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
              resp.setDescription("用户取消了授权");
              return resp; 
          }else{
              String openId = openMap.get("openId");
              FindUserByOpendIdReq userReq = new FindUserByOpendIdReq();
              userReq.setOpendId(openId);
              //2 微信  3微博  4 QQ
              userReq.setType(ThirdTypeEnum.QQ.dataBaseVal);
              resp = userManageService.findUserByOpendId(userReq);
              if(IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()) && resp.getData() != null){
                  FrontLoginCheckReq loginReq = new FrontLoginCheckReq();
                  TUser user = (TUser)resp.getData();
                  loginReq.setLoginIp(CommonUtil.getIpAddr(request));
                  loginReq.setUserName(user.getUserName());
                  resp = frontIndexService.commonLoginCheck(loginReq);
              }else{
                  ThirdPartyUser third = QqLoginHelper.getQqUserinfo(openId, appid, accessToken);
                  ThirdPartyUserResp data = new ThirdPartyUserResp();
                  data.setOpenid(Base64Encoder.encode(openId).replaceAll("\r|\n", ""));
                  data.setNickName(third.nickName);
                  data.setGender(third.gender);
                  data.setHeadImgUrl(third.headImgUrl);
                  data.setToken(Base64Encoder.encode(accessToken).replaceAll("\r|\n", ""));
                  data.setAuthorizeType(ThirdTypeEnum.QQ.dataBaseVal); 
                  data.setTokenExpireIn(tokenExpireIn);
                  Map<String, Object> dataMap = new HashMap<String, Object>();
                  dataMap.put(CommonConstant.JSON_KEY_SINGLE_RESULT, data);
                  //用户没有绑定手机-----如果是这个状态码就进入绑定手机页面，需要各自的控制层处理
                  resp.setCode(IDiMengResultCode.UserManager.ERROR_NOT_BIND_PHONE);
                  resp.setDescription("用户未绑定手机");
                  resp.setData(dataMap); 
              }
              return resp;
          }
      } 
  }
  
      /**
       * 第三方回调-wb返回地址
       * <功能详细描述>
       * @param request
       * @param response
       * @param session
       * @return
     * @throws Exception 
       */ 
    @RequestMapping(value = "/{v}/wbCallback", method = RequestMethod.POST, produces = {"application/json",
    "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object wbCallback(HttpEntity<ThirdTypeReq> httpEntity, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        String  code = httpEntity.getBody().getCode(); 
        String  appid  = SystemCache.getProperty(EasySystemVariable.WB_APPID);
        String  secret = SystemCache.getProperty(EasySystemVariable.WB_SECRET); 
        String redirect_url = "";
        if("1".equals(httpEntity.getBody().getOpSource())){
        	redirect_url = (String)FrameworkConfigurer.getProperties("wb_redirect_URI");
        }else if("2".equals(httpEntity.getBody().getOpSource())){
        	redirect_url = (String)FrameworkConfigurer.getProperties("wbwap_redirect_URI");
        }
        Map<String, String> map = WbLoginHelper.getWbToken(appid, secret, redirect_url, code);
         if(map == null){
             resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
             resp.setDescription("用户取消了授权");
             return resp; 
         }
        String accessToken = map.get("access_token");
        String openID =  map.get("uid");;
        String tokenExpireIn = null;
        if (accessToken.equals("")) {
            resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
            resp.setDescription("用户取消了授权");
            return resp;
        }else{
            tokenExpireIn = String.valueOf(map.get("expires_in"));
            ThirdPartyUser third = WbLoginHelper.getWbUserinfo(openID,accessToken);
            if(third == null){
                resp.setCode(IDiMengResultCode.UserManager.ERROR_USER_NOT_EXIST);
                resp.setDescription("用户取消了授权");
                return resp; 
            }else{
                openID = third.openid;
                FindUserByOpendIdReq req = new FindUserByOpendIdReq();
                req.setOpendId(openID);
                //2 微信  3微博  4 QQ
                req.setType(ThirdTypeEnum.WB.dataBaseVal);
                resp = userManageService.findUserByOpendId(req);
                if(IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()) && resp.getData() != null){
                    FrontLoginCheckReq loginReq = new FrontLoginCheckReq();
                    TUser user = (TUser)resp.getData();
                    loginReq.setLoginIp(CommonUtil.getIpAddr(request));
                    loginReq.setUserName(user.getUserName());
                    resp = frontIndexService.commonLoginCheck(loginReq);
                }else{
                    ThirdPartyUserResp data = new ThirdPartyUserResp();
                    data.setOpenid(Base64Encoder.encode(openID).replaceAll("\r|\n", ""));
                    data.setNickName(third.nickName);
                    data.setGender(third.gender);
                    data.setHeadImgUrl(third.headImgUrl);
                    data.setToken(Base64Encoder.encode(accessToken).replaceAll("\r|\n", ""));
                    data.setAuthorizeType(ThirdTypeEnum.WB.dataBaseVal); 
                    data.setTokenExpireIn(tokenExpireIn);
                    Map<String, Object> dataMap = new HashMap<String, Object>();
                    dataMap.put(CommonConstant.JSON_KEY_SINGLE_RESULT, data);
                    //用户没有绑定手机-----如果是这个状态码就进入绑定手机页面，需要各自的控制层处理
                    resp.setCode(IDiMengResultCode.UserManager.ERROR_NOT_BIND_PHONE);
                    resp.setDescription("用户未绑定手机");
                    resp.setData(dataMap); 
                }
                return resp;
            }
        } 
    } 
}
