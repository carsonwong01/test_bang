
<%@page import="com.dimeng.framework.utils.FrameworkConfigurer"%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/project-details.css">

<!-- 头部菜单栏  菜单索引   begin -->
<input type="hidden" id="head_menus_index" value="H_GYWM"/>
<!-- 头部菜单栏  菜单索引   end -->
<!--主体内容-->
<div class="help-centerPage helpAndNewsPage">	
	<div class="layout">
		<%--<div class="locationBox">所在位置：<a name="h_menu" action="home/index.do">首页</a>--%>
        <%--<span class="arrow">&gt;</span>关于我们<span class="arrow">&gt;</span><span id="spanId"></span></div>--%>
        <!--面包屑-->
            <p	class='nav-po'><a href="<%=basePath%>home/index.do">首页&nbsp;>&nbsp;</a><a href="#">关于我们<span class="arrow">&gt;</span></a><span id="spanId"></span></p>


    </div>
    <div class="layout clearfix minHeiBox">
        <%@include file="/WEB-INF/pages/easy/aboutUs/leftMainAbout.jsp" %>
        
        <div class="r_main fr">
        <input type="hidden" id="types" value="${10 }"/>
        	<div class="hd" id="divTitleId"></div>
        	<div class="aboutus mt30" id="aboutUsId">
            	<!-- <p class="tc"><img src="images/about.jpg"></p> -->
            </div>
      		<div class="paging clearfix pt20" id="paging"></div>
        </div>
    </div>
</div>
<!--主体内容-->
<script type="text/javascript"  src="<%=basePath %>js/common/jquery.tmpl.min.js"></script> 
<script language="javascript" src="<%=basePath %>easy/js/aboutUs/aboutUs.js"></script>
<!--主体内容-->
<script id="aboutUsTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}
	<input type="hidden" name="id" id="id" value="{{= data.id}}">
	   <p class="width-full">{{html data.content}}</p>
	{{/each}}
</script>

 <script>
$(function(){
	$("#HEADER_MENUS>li").removeClass("cur");
	$("#H_GYWM").addClass("cur");
});
</script>

