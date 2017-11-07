<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--主体内容-->
<div class="help-centerPage newsInfoPage helpAndNewsPage">
<div class="layout">
		<div class="locationBox">
			所在位置：<a href="<%=basePath%>home/index.do">首页</a><span>&gt;</span><span
				id="helpTitle"></span>
		</div>
	</div>
	<div class="layout clearfix minHeiBox">
		<input type="hidden" name="investmentInfoType" id="investmentInfoType"
			value="2" />
		<!--主体内容-->
		<div class="leftBox fl">
			<ul id="sidemenu">

				<li><a
					href="<%=basePath%>frontHome/newsInfos.do?investmentInfoType=2"><b
						class="btn-blue"></b><span class="spbox"><i class="i1"></i>新闻资讯</span></a></li>
				<li><a
					href="<%=basePath%>frontHome/newsInfos.do?investmentInfoType=1"><b
						class="btn-blue"></b><span class="spbox"><i class="i2"></i>平台公告</span></a></li>

			</ul>
		</div>


		<div class="rightBox fr">
			<div class="cont">
				<h2 class="h2til">${content.infoTitle}</h2>
				<input type="hidden" id="infoType"
					value="${content.investmentInfoType}">
				<p class="authorBox">
					<i class="i1"></i><span class="author">${content.sourceFrom}</span><i
						class="i2"></i><span>${content.dateCreate}</span><i class="i3"></i><span>${content.viewCount}</span>
				</p>
				<div class="article width-full">${content.infoContent}</div>
			</div>
		</div>
	</div>
</div>

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
	$("#helpTitle").html(newTitle);
</script>