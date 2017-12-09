<ul  id="helpCenterId">
</ul>

<input type="hidden" id="typeFooter" value="4" />
<script id="helpCenterTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}
		<li><a href="<%=basePath %>frontHome/helpCenter.do" target="_blank"><i></i>{{= data.title}}</a></li>
	{{/each}}
</script>
<!--常见问题--内容-->
<script language="javascript"
        src="<%=basePath%>easy/js/helpCenter/helpCenter.js"></script>