<!-- 头部菜单栏  菜单索引   begin -->
<input type="hidden" id="head_menus_index" value="H_XWZX" />
<!-- 头部菜单栏  菜单索引   end -->

<!--主体内容-->
<div class="help-centerPage newsInfoPage helpAndNewsPage">
	<input id="infoType" type="hidden" value="${infoType}">
	<div class="layout">
		<div class="locationBox">
			所在位置：<a href="<%=basePath%>home/index.do">首页</a><span>&gt;</span><span
				id="helpTitle"></span>
		</div>
	</div>
	<form id="dataForm">
		<input type="hidden" name="investmentInfoType"
			id="manuInvestmentInfoType" value="2" />
		<div class="layout clearfix minHeiBox">
			<%@include
				file="/WEB-INF/pages/easy/newsInformation/leftMainNewsInformation.jsp"%>
			<div class="rightBox fr">
				<div class="cont">
					<ul  class="f-news_list clearfix" id="newsInfosId">

					</ul>
					<!--分页-->
					<div class="paging" id="pagingNews"></div>
					<!--分页  --END-->
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript"
	src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<!-- end -->
<script id="newsInfosTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}
		 <li><span class="fr gray9">{{= data.dateCreate}}</span><a href="<%=basePath%>frontHome/newsInfosDetails.do?id={{= data.id}}"><i class="ico"></i>{{= data.infoTitle}}</a></li>
	{{/each}}
</script>
