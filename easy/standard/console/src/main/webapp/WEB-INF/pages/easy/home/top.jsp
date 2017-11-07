<!--top-->
<%@page import="com.dimeng.constants.SystemConstant"%>
<%@page import="com.dimeng.entity.table.site.TSiteInfo"%>
<% 
 TSiteInfo siteInfo=(TSiteInfo)SystemCache.getCache(SystemConstant.CacheKey.SITE_INFO);
%>
<div class="main-head clearfix"><div class="left-v5-box pl30 clearfix"><%=siteInfo.getSiteName() %>系统后台
<span class="time-containe ml40 f14"><em class="ml15"><fmt:formatDate value="<%=new Date() %>" pattern="yyyy-MM-dd E"/></em></span></div>

<div class="main-head-fr ww80 tr">
<ul class="mr100">
<li><i class="icon-i w30 h30 ml10 va-middle user-icon"></i><span class="span-txt">欢迎您，</span><span class="f18">${currUser.userName }</span></li>
<li><a href="javascript:void(0);" id="updata_password_id"  ><i class="icon-i w30 h30 ml10 va-middle xiugaimima-icon"></i>修改密码</a></li>
<li><a id="logout" href="javascript:void(0);"><i class="icon-i w30 h30 ml10 va-middle exit-icon"></i>安全退出</a></li>
</ul>
</div>
</div>

<div class="main-nav">
<div class="logo-containe">
<div class="logo"><img src="<%=siteInfo.getBackHomeLoginId()%>" /></div>
</div>
<div class="top-nav">

  <!--众筹系统-->
  <ul class="clearfix menu_li">
    <li><a href="javascript:void(0);" class="main-nav-a" data-title="index" data-url="home.do"><i class="icon-i h30 w30 nav-home-icon"></i>首页</a></li>
    <li><a href="javascript:void(0);" class="main-nav-a " data-title="user"><i class="icon-i h30 w30 nav-yhgl-icon"></i>用户管理</a></li>
    <li><a href="javascript:void(0);" class="main-nav-a" data-title="business"><i class="icon-i h30 w30 nav-ywgl-icon"></i>业务管理</a></li>
    <li><a href="javascript:void(0);" class="main-nav-a" data-title="finance"><i class="icon-i h30 w30 nav-cwgl-icon"></i>财务管理</a></li>
    <li><a href="javascript:void(0);" class="main-nav-a" data-title="statistics"><i class="icon-i h30 w30 nav-tjgl-icon"></i>统计管理</a></li>
    <li><a href="javascript:void(0);" class="main-nav-a" data-title="site"><i class="icon-i h30 w30 nav-xcgl-icon"></i>站点管理</a></li>
    <li><a href="javascript:void(0);" class="main-nav-a" data-title="operate"><i class="icon-i h30 w30 nav-yygl-icon"></i>运营管理</a></li>
    <li><a href="javascript:void(0);" class="main-nav-a" data-title="system"><i class="icon-i h30 w30 nav-xtgl-icon"></i>系统管理</a></li>
  </ul>
  
 </div>
</div>
<!-- 修改密码显示模板 -->
<script id="updatePasswordTemple" type="text/x-jquery-tmpl" >
    <div class="p30">
      <ul class="gray6">
      <from id="updatePasswordForm">
        <li class="mb10">
          <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">&nbsp;</em>&nbsp;</span>
            <div class="pr pl320 tl">&nbsp;
            <span class="ml5" id="oldPasswordMsg">&nbsp;</span></div></div>
        </li>
        <li class="mb10">
          <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>原密码</span>
            <div class="pr pl320 tl"><input type="password" id="oldPassword" name="oldPassword" validate="q" class="text border w300 pl5 pa left0 top0">
            <span class="ml5" id="oldPasswordMsg"></span></div></div>
        </li>
        <li class="mb10">
          <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>新密码</span>
            <div class="pr pl320 tl"><input type="password" id="newPassword" reg="/[A-Za-z0-9]{4,16}/" warning="密码格式不正确!" maxlength="16" name="newPassword" validate="q" class="text border w300 pl5 pa left0 top0">
            <span class="ml5" id="newPasswordMsg"></span></div></div>
        </li>
        <li class="mb10">
          <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>确认密码</span>
            <div class="pr pl320 tl"><input type="password" id="reNewPassword" name="reNewPassword" validate="q" class="text border w300 pl5 pa left0 top0" >
            <span class="ml5" id="reNewPasswordMsg"></span></div></div>
        </li>
      </form>
      </ul>
    </div>
</script>
<script type="text/javascript" src="<%=basePath%>js/easy/home/updatePassword.js"></script>
