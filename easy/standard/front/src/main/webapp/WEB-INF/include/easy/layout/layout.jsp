<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@page import="com.dimeng.enums.variable.SiteVariable"%>
<%@page import="com.dimeng.entity.table.site.TSiteInfo"%>
<%@page import="com.dimeng.utils.SystemCache"%>
<%@page import="com.dimeng.constants.SystemConstant"%>
<% 
 TSiteInfo siteInfo=(TSiteInfo)SystemCache.getCache(SystemConstant.CacheKey.SITE_INFO);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
 	<script type="text/javascript">
	//底部路径
	var basePath=footerPath="<%=basePath %>";
	var  currUser_id="${currUser.userId}";//当前登录人ID
	var codeStatus = "${codeStatus}";
	</script>
	<meta http-equiv="Pragma" content="no-cache"/>
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit"  />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"  /> 
	<meta name="renderer" content="webkit">
	<meta name="keywords" content="<%=siteInfo.getWebKeyword() %>"  />
	<meta name="description" content="<%=siteInfo.getSiteDescr() %>"  />
	<meta property="wb:webmaster" content="3e7a490b04ffe9d8" />
	<link rel="icon" href="<%=basePath %>easy/images/favicon.ico" type="image/x-icon" />

	<%--<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/index_new.css">--%>
	<%--<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/news.css">--%>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/newsinformation.css">

	<%--<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/project.css">--%>
	<%--<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/project-details.css">--%>


	<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/base.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/common.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/index.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/front.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/user.css" />


	
	<!-- 公用js -->
	<script type="text/javascript" src="<%=basePath %>js/common/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/common/jquery.form.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/core/jquery.spine.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/core/jquery.spine.framework.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/framework/DM.js?v=2015"></script>
	<script type="text/javascript" src="<%=basePath %>js/framework/DM.Util.js"></script>




	<script type="text/javascript" src="<%=basePath %>easy/js/home/Dialog.js"></script>
	<script type="text/javascript" src="<%=basePath %>easy/js/home/common.js"></script>
	<script type="text/javascript" src="<%=basePath %>easy/js/home/front.js"></script>
    <title><%=siteInfo.getHomePageTitle() %></title> 
 </head> 
 <body> 
	 <div> 
	         <div id="layout_header"><tiles:insertAttribute name="header" /></div>
	         <div id="layout_body"><tiles:insertAttribute name="body" /></div> 
	        <div id="layout_footer"><tiles:insertAttribute name="footer" /></div> 
	        <iframe name="hframe" id="hframe" style="display:none"></iframe>
	 </div> 
 <script type="text/javascript" src="<%=basePath %>easy/js/home/index.js"></script>
 <script type="text/javascript">
DM.Event.menuMonitor();//菜单监听
DM.Event.menuCss();
document.onkeydown = function () {
    if (window.event && window.event.keyCode == 13) {
        window.event.returnValue = false;
    }
}
</script>	
</body> 
</html> 

