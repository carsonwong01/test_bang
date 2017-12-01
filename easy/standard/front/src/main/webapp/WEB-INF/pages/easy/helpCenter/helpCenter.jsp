<div class="help-centerPage helpAndNewsPage">
	<div class="layout">
		<div class="locationBox">
			所在位置：<a href="<%=basePath%>home/index.do">首页</a><span>&gt;</span>常见问题<span>&gt;</span><span
				id="helpTitle"></span>
		</div>
	</div>
	<div class="layout clearfix minHeiBox">
		<%@include file="/WEB-INF/pages/easy/helpCenter/leftMain.jsp"%>
		<form id="dataForm">
			<input type="hidden" name="type" id="munuType" value="1" /> <input
				type="hidden" id="typeFooter" value="${4}" /><%-- value="${type}"设置点击后默认出现的问题选项--%>
			<div class="rightBox fr">
				<div class="cont"  id="helpCenterId">
					
					
				</div>
				<!--分页-->
				<div class="paging" id="paging"></div>
				<!--分页  --END-->
			</div>
		</form>
	</div>
</div>

<script id="helpCenterTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}
		<dl class="list {{if i==0 }} active {{/if}}">
			<dt class="til">
				<i class="ico"></i> <span class="title">{{= data.title}}</span> <a
					class="Btn-til-zxs"><span class="highlight up">展开</span><span
					class="highlight down">收起</span><b></b></a>
			</dt>
			<dd class="offleft">
				<p class="width-full">
						{{html data.content}}
				</p>
			</dd>
		</dl>
	{{/each}}
</script>

<!--主体内容-->
<script language="javascript"
	src="<%=basePath%>easy/js/helpCenter/helpCenter.js"></script>
<script type="text/javascript"  src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script>
	nav_slider('.help-centerPage .rightBox dt.til', 'active');
</script>
<!-- end -->


