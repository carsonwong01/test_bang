<%@page import="com.dimeng.enums.variable.TextVariable"%>
<%@page import="com.dimeng.utils.SystemCache"%>
<%@page import="com.dimeng.entity.table.site.TSiteInfo"%>
<%@page import="com.dimeng.constants.SystemConstant"%>
<% 
 TSiteInfo siteInfo=(TSiteInfo)SystemCache.getCache(SystemConstant.CacheKey.SITE_INFO);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/WEB-INF/include/common/commHeader.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=siteInfo.getSiteName() %>系统后台</title>
<script type="text/javascript" src="<%=basePath%>js/common/web.js"></script>
<link rel="icon" href="<%=basePath %>images/favicon.ico" type="image/x-icon" />
</head>
<body>
<!--头部-->
<div class="top-container"></div>
<!--头部 结束--> 

<!--内容-->
<div class="wrap"> 
  <!--左边内容-->
  <div class="left-container"> <a class="left-hide-arrow icon-i"></a>
    <div class="left-subnav-containe"> </div>
  </div>
  
  <!--左边内容 结束--> 
  
  <!--右边内容-->
  <div class="right-container">
    <div class="viewFramework-body">
      <div class="viewFramework-content"> 
        <!--加载内容--> 
        
        <!--加载内容 结束--> 
      </div>
    </div>
  </div>
  <!--右边内容 结束--> 
  
</div>
<!--内容--> 

<!--底部-->
<div class="foot-container">
  <p class="foot-txt"><%=siteInfo.getCompanyName()%>©<%=siteInfo.getCopyright()%>|备案号:<%=siteInfo.getRecordation()%></p>
</div>

<!--弹出框-->
<div class="popup-box hide">
  <div class="popup-box-warp">
    <div class="popup-box-content"></div>
  </div>
</div>
<div class="popup_bg hide"></div>
</body>
</html>
