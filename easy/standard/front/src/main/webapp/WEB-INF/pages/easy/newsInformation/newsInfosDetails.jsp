<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--主体内容-->
<div class="help-centerPage newsInfoPage helpAndNewsPage">
<div class="layout">
	<div class="locationBox">
		所在位置：<a href="<%=basePath%>home/index.do">首页</a><span>&gt;</span>
		<a href="<%=basePath%>frontHome/newsInfos.do?investmentInfoType=${content.investmentInfoType}" id="newsHelpTitle"></a>
		<span>&gt;</span>详情
	</div>
</div>

<body>
<div class='center'>
	<div class='cent-nav'>
		<div class='fl clik'>
			<div class='bato'>
				<h1>${content.infoTitle}</h1>
				<p>来源：<span>${content.sourceFrom}</span><span>${content.dateCreate}</span>点击量<span>${content.viewCount}</span></p>
			</div>
			<div class='text-p'>
				<p>${content.infoContent}</p>
			</div>
			<%--<p class='fr pagp'><a href="">上一篇</a><i></i><a href="">下一篇</a></p><div class='clear'></div>--%>
		</div>
		<div class='fr ft-na'>
			<div class='xim-qi'>
				<p><i class='i-po'></i> <span>推荐救助</span></p>
				<li><i></i><span><ul class='ul-o'  id="projectListD">

				</ul></span></li>
			</div>
			<%--推荐资讯--%>
			<%@include file="/WEB-INF/pages/easy/newsInformation/recommendNewsInfos.jsp" %>
			<div class='xim-qi'>
				<p><i></i> <a href="<%=basePath %>frontHome/helpCenter.do"><span>常见问题</span></a></p>
				<li><i></i><span><ul class='ul-o'  id="helpCenterId">
				</ul></span></li>
				<%--<%@include file="/WEB-INF/pages/easy/helpCenter/commonQuestion.jsp"%>--%>
			</div>
		</div>
		<div class='clear'></div>
	</div>
</div>
<input type="hidden" id="typeFooter" value="4" />
<script id="helpCenterTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}
		<li><i></i><a href="<%=basePath %>frontHome/helpCenter.do" target="_blank"><span>{{= data.title}}</span></a></li>
	{{/each}}
</script>
<!--常见问题--内容-->
<script language="javascript"
		src="<%=basePath%>easy/js/helpCenter/helpCenter.js"></script>
<script id="projectListTemp" type="text/x-jquery-tmpl">
    {{each(i,data) pageResult.list}}
    	<li><i></i><a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}"><span>{{= data.projectName}}</span></a></li>
    {{/each}}
</script>
<script type="text/javascript" src="<%=basePath %>easy/js/project/projectList.js"></script>
<script type="text/javascript"
		src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script language="javascript"
		src="<%=basePath%>easy/js/newsInformation/newsInformation.js"></script>
<script id="newsInfosTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}
		 <li><span class="fr gray9">{{= data.dateCreate}}</span><a href="<%=basePath%>frontHome/newsInfosDetails.do?id={{= data.id}}"><i class="ico"></i>{{= data.infoTitle}}</a></li>
	{{/each}}
</script>

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/vue.js"></script>

<script type="text/javascript"
	src="<%=basePath%>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript">
	var infoType = $("#infoType").val();
	$("#sidemenu li").each(function(index, item) {
		if (infoType == 2 && index == 0) {
			$(this).children().addClass("active");
		} else if (infoType == 1 && index == 1) {
			$(this).children().addClass("active");
		} else {
			$(this).children().removeClass("active")
		}
	});
	
	var newTitle = "新闻资讯";
	if (infoType == 1) {
		newTitle = "平台公告";
	} else {

	}
	$("#newsHelpTitle").html(newTitle);
</script>