package com.dimeng.crowdfunding.weixin.controller;

import com.dimeng.crowdfunding.weixin.util.FileUtil;
import com.dimeng.crowdfunding.weixin.util.HttpBase;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

//@Scope("prototype")
@Controller
@RequestMapping("/user")
public class UserController
{
    
    public String inferce = "/user"; // 映射地址
    
    public String app_inferce = FileUtil.getValueProperties("app_inferce"); // 接口地址
    
    public String version = FileUtil.getValueProperties("app_version"); // 版本
    
    public String serverAddress = app_inferce + inferce; // 完整地址
    
    /*
     * 个人设置
    */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/findAccInfo")
    public String findAccInfo(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/findAccInfo");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     * 获取银行卡列表
    */
    @ResponseBody
    @RequestMapping(value = "/bankCardManage/v/findCardList")
    public String findCardList(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/bankCardManage/v/findCardList");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     * 添加银行卡
    */
    @ResponseBody
    @RequestMapping(value = "/bankCardManage/v/addBankCard")
    public String addBankCard(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/bankCardManage/v/addBankCard");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("cardType", request.getParameter("cardType"));//银行卡类型
    	map.put("cardUserName", request.getParameter("cardUserName"));//银行卡类型
    	map.put("cardNumberEncrypt", request.getParameter("cardNumberEncrypt"));//银行卡号
    	map.put("bankId", request.getParameter("bankId"));//银行卡id
    	map.put("bankRegionId", request.getParameter("bankRegionId"));//地区
    	map.put("branchBank", request.getParameter("branchBank"));//支行名称
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     * 删除银行卡
    */
    @ResponseBody
    @RequestMapping(value = "/bankCardManage/v/deleteBankCard")
    public String deleteBankCard(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/bankCardManage/v/deleteBankCard");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("id", request.getParameter("id"));//银行卡id
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     *我的账户（可用金额）
    */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/findAccCenter")
    public String findAccCenter(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/findAccCenter");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
         map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    
    /*
     *我的账户交易记录
    */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/findAccMoney")
    public String findAccMoney(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/findAccMoney");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("reqPageNum", request.getParameter("reqPageNum"));//页数
        map.put("maxResults", request.getParameter("maxResults"));//每页显示几条
        map.put("direction", request.getParameter("direction"));//状态
         map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     *冻结项目列表
    */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/findFreezePro")
    public String findFreezePro(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/findFreezePro");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
         map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     *更改个人信息
    */
    @ResponseBody
    @RequestMapping(value = "/perCenter/v/updateUserBaseInfo")
    public String updateUserBaseInfo(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/perCenter/v/updateUserBaseInfo");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("imageUrl", request.getParameter("imageUrl"));
    	map.put("imageId", request.getParameter("imageId"));
    	map.put("nickName", request.getParameter("nickName"));//昵称
        map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.PUTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     *修改交易密码
    */
    @ResponseBody
    @RequestMapping(value = "/perCenter/v/updateTradePwd")
    public String updateTradePwd(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/perCenter/v/updateTradePwd");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("newTradePassword", request.getParameter("newTradePassword"));//交易密码
        map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.PUTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     *验证原交易密码
    */
    @ResponseBody
    @RequestMapping(value = "/perCenter/v/checkTradePassword")
    public String checkTradePassword(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/perCenter/v/checkTradePassword");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("tradePassword", request.getParameter("tradePassword"));//原交易密码
        map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.GETMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     *找回密码发送验证码
    */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/getPasswordCode")
    public String getPasswordCode(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/getPasswordCode");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     *查询是否设置交易密码
    */
    @ResponseBody
    @RequestMapping(value = "/perCenter/v/checkSettingTradePwd")
    public String checkSettingTradePwd(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/perCenter/v/checkSettingTradePwd");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
        map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.GETMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     *实名认证
    */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/authentication")
    public String authentication(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/authentication");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("realName", request.getParameter("realName"));//姓名
        map.put("idNumber", request.getParameter("idNumber"));//身份证
        map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     *查询身份证是否唯一
    */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/idCardUnique")
    public String idCardUnique(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/idCardUnique");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("idCardNmber", request.getParameter("idCardNmber"));
        map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     *实名认证成功后信息
    */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/findAuthentication")
    public String findAuthentication(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/findAuthentication");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
        map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }   
    /*
     *交易明细
    */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/findTradeList")
    public String findTradeList(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/findTradeList");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
         
         map.put("reqPageNum", request.getParameter("reqPageNum"));//页数
         map.put("maxResults", request.getParameter("maxResults"));//每页显示几条
         map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     *收货地址获取
    */
    @ResponseBody
    @RequestMapping(value = "/addressManage/v/findAddress")
    public String findAddress(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/addressManage/v/findAddress");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("opSource", "2");
        map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     *修改、新增、删除地址
    */
    @ResponseBody
    @RequestMapping(value = "/addressManage/v/updateAddress")
    public String updateAddress(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/addressManage/v/updateAddress");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
     	
        map.put("operationType", request.getParameter("type"));//操作类型
        map.put("addrId", request.getParameter("id"));//addrId
        map.put("consigneeName", request.getParameter("name"));//姓名
 		map.put("consigneePhone", request.getParameter("phone"));//电话
 		map.put("consigneeCity", request.getParameter("regionId"));//地区id
 		map.put("consigneeAddress", request.getParameter("address"));//详细地址
 		map.put("isDefault", request.getParameter("isDefault"));//详细地址
 		
 		map.put("opSource", "2");//微信标识
 		
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    
    /*
     *获取收货地址详情
    */
    @ResponseBody
    @RequestMapping(value = "/addressManage/v/findAddressDetail")
    public String findAddressDetail(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/addressManage/v/findAddressDetail");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
        
    	map.put("id", request.getParameter("id"));//id
        map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     *查询账户绑定的第三方账号列表
     */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/findThirdPartyList")
    public String findThirdPartyList(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/findThirdPartyList");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     *解绑第三方账号
     */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/unbundling")
    public String unbundling(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/unbundling");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("id", request.getParameter("id"));//id
    	map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
    /*
     *绑定第三方账号
     */
    @ResponseBody
    @RequestMapping(value = "/userManage/v/addThirdUser")
    public String addThirdUser(HttpServletRequest request, HttpServletResponse response)
    		throws Exception
    {
    	String url = new String(serverAddress + "/userManage/v/addThirdUser");
    	
    	HttpBase httpBase = new HttpBase();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("sourceType", request.getParameter("sourceType"));//id
    	map.put("code", request.getParameter("code"));//id
    	map.put("opSource", "2");//微信标识
    	
    	String Authorization = request.getHeader("Authorization");
    	httpBase.setReqData(map);
    	httpBase.send(url.toString().replace("\"", "%22").replace("{", "%7b").replace("}", "%7d"),
    			HttpBase.POSTMETHOD,Authorization);
    	
    	return httpBase.getRespondata();
    	
    }
}
