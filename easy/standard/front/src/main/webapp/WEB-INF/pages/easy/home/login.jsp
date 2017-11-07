<html xmlns="http://www.w3.org/1999/xhtml" xmlns:wb="http://open.weibo.com/wb"> 
<script src="https://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>
 <script type="text/javascript">
  var 	errMsg = "${errMsg}";
  var 	callback = "${callbackStatus}";
  var	thirdType = "${thirdUser.authorizeType}";
  var	nickname = "${thirdUser.nickName}";
  var	headPortrait = "${thirdUser.headImgUrl}";
  var	sex = "${thirdUser.gender}";
  var	openid = "${thirdUser.openid}";
  var	token = "${thirdUser.token}";
  var	tokenExpireIn = "${thirdUser.tokenExpireIn}";
  var   state = "${state}";
  var   unionid = "${thirdUser.unionId}";
</script>
<%@page import="com.dimeng.entity.table.site.TSiteInfo"%>
<%@page import="com.dimeng.utils.SystemCache"%>
<%@page import="com.dimeng.entity.ext.site.SiteProtocolModelResp" %>
<%@page import="com.dimeng.constants.SystemConstant"%>
<% 
 TSiteInfo siteInfo=(TSiteInfo)SystemCache.getCache(SystemConstant.CacheKey.SITE_INFO); 
List<SiteProtocolModelResp> list = (List<SiteProtocolModelResp>)SystemCache.getCache(SystemConstant.CacheKey.PROTOCOL_MODEL_LIST);
%>
 <body class="wrap-1002">
		<div class="head">
			<div class="layout clearfix"> 
				<a href="<%=basePath%>home/index.do">
					<img alt="<%=siteInfo.getSiteName() %>" src="<%=siteInfo.getFrontLogoId()%>" style="width: 240px;height: 60px;">
				</a>
			</div>
		</div>
 		<div class="wrap">
 			<div class="login-box clearfix">
 				<div class="login-form clearfix">
 				<div id="wx_div" style="display:none; height: 484px" class="login-form-top clearfix tc">
 					<div class="weChat-code mt20" style="margin-top: 44px" id="ewm"></div>
 				</div>
 				
 				<!-- 手机登录切换div -->
 				<div id="phone_div" style="display:none;">
 				
	 				<div id="dsf" style="display: none;" class="login-form-top clearfix tc">
	 					<h2><%=siteInfo.getSiteName() %></h2>
	 					<div class="login-figure-pic" id= "headImg"></div>
						<p class="f18 gray3 pt20" id = "nickName">焉知非福也！</p>
						<br>
	 					<p class="f16">太棒了！只需验证完成手机号即可完成注册了!</p>	
	 				</div>
 				
 				
	 				<div id="sjdl" class="login-form-top clearfix tc">
	 					<h2>手机登录</h2>
	 				</div>
	 				<form>
	 				<div class="login-form-con">
	 					<ul class="focus_input">
	 						<li class="login-item clearfix">
		 						<div class="login-item-l fl"><span class="icon-public lg-phone-icon"></span></div>
		 						<div class="login-item-r fl">
		 							<p id="userNameMsg" class="prompt">
		 								
		 							</p>
		 							<div class="focus">
		 								<input id="name" type="text" class="focus_text text_style" value="" maxlength="11" style='border-left:0px;border-top:0px;border-right:0px;border-bottom:1px '>
		 								<label for="name" style="display: block;">请输入您的手机号</label>
		 							</div>
		 						</div>
	 						</li>
	
	 						<li class="login-item clearfix">
	 							<div class="login-item-l fl"><span class="icon-public lg-mima-icon"></span></div>
	 							<div class="login-item-r fl">
		 							<p class="prompt" id="loginYzmMsg">
		 							</p>
		 							<div class="focus">
			 							<input id="loginYzm" type="text" class="focus_text text_style" value="" maxlength="4" style='border-left:0px;border-top:0px;border-right:0px;border-bottom:1px '>
			 							<label for="loginYzm" style="display: block;">请输入右侧验证码</label>
		 							</div>
	 							</div>
	 							<div class="fr login-item-valida">
	 								<img id="login_captcha_mobile" src="<%=basePath%>captcha" onclick="changeCaptcha(this)" width="126px" height="43px">
	 							</div>
	 						</li>
	
	 						<li class="login-item clearfix">
		 						<div class="login-item-l fl"><span class="icon-public lg-yzm-icon"></span></div>
		 						<div class="login-item-r fl">
			 						<p class="prompt" id="sjYzmMsg">
			 							
			 						</p>
			 						<div class="focus">
			 							<input id="setMobileCode" type="text" class="focus_text text_style" value="" maxlength="6" style='border-left:0px;border-top:0px;border-right:0px;border-bottom:1px '>
			 							<label for=setMobileCode style="display: block;">请输入手机验证码</label>
			 						</div>
		 						</div>
		 						<div class="fr pt30">
		 						 <a href="javascript:void(0)" id="getSetMobileCodeBtn" class="f18 highlight">
		 						  获取验证码 
		 						</a> 
		 						</div>
	 						</li>
	 					</ul>
	 					<div class="login-reading pt30 f16">
		 					<input name="" type="checkbox" id="checkbox_id" checked="checked" value="" class="mr10">
		 					<span>我已阅读并同意
		 						<a id="item1_agreement" href="#" class="highlight"><%=list.get(0).getProtocolTitle()%></a>
							</span> 
							<p class="prompt" id="checkbox_idMsg"></p>
						</div> 
						<div class="clearfix pt30"><a href="javascript:void(0);" id="loginBtn" class="btn-public login-btn-dl btn-block btn-blue">登录</a></div>
	 				</div>
	 				</form>
 				</div>

				<div id="qt" class="login-form-bottom pt40" style="display:none; ">
					<div class="login-other-til"><h3>使用其他登录方式</h3></div>
					<div class="login-way">
						<ul class="clearfix">
							<li id="phone_li">
							<div id="phone_a"  class="other-padd-le"> 
								<a href="javascript:void(0)" onclick="loginController.divSwitch('phone');" class="other-login-icon other-login-shouji"></a>
							</div>
							<div  id="wx_a"  class="other-padd-le" style="display: none;" > 
								<a  href="javascript:void(0)" onclick="loginController.divSwitch('wx');"  class="other-login-icon other-login-weixin"></a>
							</div>
							</li>
							<li><div class="other-padd-cn">
								<a href="<%=basePath%>frontHome/toThirdInfo.do?sourceType=wb"  class="other-login-icon other-login-weibo"></a>
							</div></li>
							<li><div class="other-padd-rg">
							<a href="<%=basePath%>frontHome/toThirdInfo.do?sourceType=qq" class="other-login-icon other-login-qqicon"></a>
							</div></li> 
						</ul>
					</div>
				</div>
 			</div>
 			</div>
 		</div> 
	</body>
	</html>
<script type="text/javascript"> 
	  var obj = new WxLogin({
		    id:"ewm", 
		    appid: "wxe2a3d0c7fa155ac5", 
		    scope: "snsapi_login", 
		    redirect_uri: "http%3a%2f%2fwww.72xs.com%2ffrontHome%2fwxCallback.do",
		    state: "116ec67e09f728cfb78eb1577",
		    style: "black",
		    href: ""
		  });   
</script>
<script type="text/javascript" src="<%=basePath %>js/common/base64.js"></script>
<script src="<%=basePath %>js/common/formValidate.js"></script>
<script src="<%=basePath %>easy/js/home/login.js"></script>
	
