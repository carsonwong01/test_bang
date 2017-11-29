<li><i></i><span><ul class='ul-o'  id="helpCenterId">
</ul></span></li>

<input type="hidden" id="typeFooter" value="4" />
<script id="helpCenterTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}
		<li><i></i><a href="<%=basePath %>frontHome/helpCenter.do" target="_blank"><span>{{= data.title}}</span></a></li>
	{{/each}}
</script>
<!--常见问题--内容-->
<script language="javascript"
        src="<%=basePath%>easy/js/helpCenter/helpCenter.js"></script>