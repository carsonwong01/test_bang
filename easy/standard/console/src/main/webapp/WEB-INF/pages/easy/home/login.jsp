<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.dimeng.enums.variable.TextVariable"%>
<%@page import="com.dimeng.utils.SystemCache"%>
<%@page import="com.dimeng.entity.table.site.TSiteInfo"%>
<%@page import="com.dimeng.constants.SystemConstant"%>
<% 
 TSiteInfo siteInfo=(TSiteInfo)SystemCache.getCache(SystemConstant.CacheKey.SITE_INFO);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
<script>
var basePath=footerPath="<%=basePath %>";
var platformPath = "<%=platformPath %>";
</script>
<link rel="icon" href="<%=basePath %>images/favicon.ico" type="image/x-icon" />
<meta property="wb:webmaster" content="8c7ecf46baa8c3af" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<%=basePath %>js/common/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/jquery.form.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/core/jquery.spine.js"></script>
<script type="text/javascript" src="<%=basePath %>js/core/jquery.spine.framework.js"></script>
<script type="text/javascript" src="<%=basePath %>js/framework/DM.js"></script>
<script type="text/javascript" src="<%=basePath %>js/framework/DM.Util.js"></script>
<script type="text/javascript" src="<%=basePath %>js/components/dialog/Dialog.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/md5.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/validation.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/common.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/index.css"/>
<title><%=siteInfo.getSiteName() %>系统后台登录</title>
</head>
<body class="login-body">
<!--top-->
<div class="login-top-container">
  <div class="w1002 pr">
    <div class="login-logo pt40"><a><img style="width: 240px;height: 60px;" src="<%=siteInfo.getBackHomePageId()%>" /></a></div>
    <div class="pa right0 top-60 login-title-color"><span class="f30 display-ib h40 lh40 va-middle"><%=siteInfo.getSiteName() %>系统后台</span></div>
  </div>
</div>
<!--登录内容-->
<div class="login-content-container">
  <div class="login-c-imac"><img src="images/login_imac.png" /></div>
  <div class="login-form-container">
    <form action="<%=basePath%>login.do" method="post" id="loginForm">
     <input type="hidden" id="adminPhone" value=""/>
      <div class="form-box">
        <ul class="pl20">
          <li class="mb30">
            <span class="title display-ib white w90 f20 va-middle">用户名：</span>
              <div class="info display-ib radius-4 overflow-h va-middle">
               <i class="icon-i w30 h30 m5 mt10 va-middle login-user-icon"></i>
                <input id="txUserId" type="text" value="" name="userName" validate="q"  class="text w180 pl10 gray6 border-l-s pr" maxlength="20"/>
                <i class="icon-i w30 h36 mt5 va-middle " id="l_name"></i>
              </div>
              <p class="ml100 red pr20" id="txUserIdMsg"></p>
          </li>
          <li class="mb30">
           <span class="title display-ib white w90 f20 va-middle">密　码：</span>
              <div class="info display-ib radius-4 overflow-h va-middle">
              <i class="icon-i w30 h30 m5 mt10  va-middle login-password-icon"></i>
                <input id="passwordId" name="password" type="password" value="" validate="q" class="text w180 pl10 gray6 border-l-s pr"  maxlength="20"/>
                 <i class="icon-i w30 h36 mt5 va-middle " id="l_password"></i>
              </div>
            </li>
          <li class="mb10" id="item_captcha" ${ !codeStatus?'style="display:none"':'' } >
            <span class="title display-ib white w90 f20 va-middle">验证码：</span>
              <div class="info display-ib radius-4 overflow-h va-middle info-code">
               <i class="icon-i w30 h30 m5 mt10 va-middle login-code-icon" id="l_vcode"></i>
                <input id="txCode" type="text" value="" name="code" class="text w100 pl10 gray6 border-l-s" maxlength="4" ${ codeStatus?'validate="q" ':'' }/>
              </div>
               <span  onclick="changeCaptcha('captchaId')" class="display-ib va-middle ml10">
				  <img src="<%=basePath%>captcha" id="captchaId" class="yzm" width="86" height="48" style="cursor: pointer;" />
			   </span>
			   <p class="ml100 red pr20" id="txCodeMsg"></p>
          </li>
           
            <li class="mb20 w450" ${ !msgCodeStatus?'style="display:none"':'' }>
				<span class="title display-ib white w90 f20 va-middle lh20">短　信<br/>验证码：</span>
				<div class="info display-ib radius-4 overflow-h va-middle info-code">
					<i class="icon-i w30 h30 m5 mt10 va-middle login-code-icon" id="l_vcode"></i>
					<input type="text" class="text w100 pl10 gray6 border-l-s" ${ msgCodeStatus?'validate="q|leng" ':'' } leng="6" name="consoleLoginCode" id="consoleLoginCode" maxlength="6" info="q:短信验证码不能空"/>
				</div>
				<input type="button" class="btn04" style="padding:0 8px;min-width:70px;font-size:15px;height: 40px;line-height: 40px;" id="consoleLoginCodeBtn" value="获取验证码" />
				<p class="prompt" id="consoleLoginCodeMsg"></p>
			</li>
          
          
          <li class="mb10">
            <p class="ml100 red pr20" id="errorMsg"></p>
          </li>
          <li>
            <div class="pl90">
              <input type="button" id="loginSubmit" class="submit-btn display-ib radius-6" value="登 录"/>
            </div>
          </li>
        </ul>
      </div> 
    </form>
  </div>
</div>
<!--登录内容 结束--> 
<!--foot-->
<div class="login-foot-container">
  <p class="pt30"><%=siteInfo.getCompanyName()%>©<%=siteInfo.getCopyright()%>|备案号:<%=siteInfo.getRecordation()%></p>
</div>
<script type="text/javascript">
var codeStatus = "${codeStatus}";
var msgCodeStatus = "${msgCodeStatus}";
</script>
<script type="text/javascript" src="<%=basePath%>js/common/base64.js"></script>
<script type="text/javascript" src="<%=basePath%>js/easy/home/login.js"></script>
</body>
</html>