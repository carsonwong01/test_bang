<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/WEB-INF/include/common/commHeader.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${projectTitle }</title>
<script type="text/javascript" src="<%=basePath%>js/common/web.js"></script>
<link rel="icon" href="<%=basePath %>images/favicon.ico" type="image/x-icon" />
</head>
<body>
<!--业务管理->项目管理->所有项目->--项目详情-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="p20">
<span class="f16">项目标题：${projectTitle }</span>
	<div class="border">
		<div class="tabnav-container pr">
			<ul class="clearfix pr50">
				<li><a href="javascript:void(0);"
					class="link-btn-click click-link"
					data-url="bus/projectManage/projectBasicInfo.do?projectId=${projectId }&type=${type}"
					data-container="part-container" id="projectInfo">项目信息<i
						class="icon-i tab-arrowtop-icon"></i></a></li>
				<li><a href="javascript:void(0);"
					class="link-btn-click click-link"
					data-url="bus/projectManage/projectDes.do?projectId=${projectId }"
					data-container="part-container">项目详情</a></li>
				<c:if test="${type=='6' }">
					<li><a href="javascript:void(0);"
						class="link-btn-click click-link"
						data-url="bus/projectManage/projectReturns.do?projectId=${projectId }&type=${type}"
						data-container="part-container">回报详情</a></li>
				</c:if>
				<li><a href="javascript:void(0);"
					class="link-btn-click click-link"
					data-url="bus/projectManage/proAuthenticatedDetail.do?projectId=${projectId }"
					data-container="part-container">项目验证</a></li>
				<li><a href="javascript:void(0);"
					class="link-btn-click click-link"
					data-url="bus/projectManage/projectDynamicsDetails.do?projectId=${projectId }"
					data-container="part-container">项目动态</a></li>
				<li><a href="javascript:void(0);"
					class="link-btn-click click-link"
					data-url="bus/projectManage/projectSupportRecords.do?projectId=${projectId }&type=${type}"
					data-container="part-container" id="supportRecord">支持记录</a></li>

			</ul>

		</div>

		<div class="part-container"></div>
		<div class="m-auto tc" style="margin-bottom: 15px">
			
					<a class="btn-blue2 btn white radius-6 pl20 pr20 f14 click-link"
						onclick="javascript:window.opener=null;window.close();">关闭</a>
				
		</div>
	</div>
</div>

<script type="text/javascript">
	
		$("#projectInfo").addClass("select-a");
		$(".part-container")
				.load(
						"projectBasicInfo.do?projectId=${projectId }&type=${type}");
	
</script>
</body>
</html>