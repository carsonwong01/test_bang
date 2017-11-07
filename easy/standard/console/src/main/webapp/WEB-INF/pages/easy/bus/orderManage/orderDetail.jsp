<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/WEB-INF/include/common/commHeader.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>股权众筹系统标准版后台</title>
<script type="text/javascript" src="<%=basePath%>js/common/web.js"></script>
<link rel="icon" href="<%=basePath %>images/favicon.ico" type="image/x-icon" />
</head>
<body>
<!--订单详情-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="p20">
	<div class="border">
		<div class="pl20 pr20 pt20">
			<span class="pl20 mt40 f24 fw400">订单详情</span>
			<hr>
		</div>
		<div class="tab-content-container pl20 pr20 ">
			<!--订单信息-->
			<div class="tab-item">
				<!-- 公益订单详情 -->
				<c:if test="${orderDetail.projectType<='5' }">
					<%@include file="/WEB-INF/pages/easy/bus/orderManage/order/publicWelfareOrderDetail.jsp" %>
				</c:if>
				<!-- 回报订单详情 -->
				<c:if test="${orderDetail.projectType=='6' }">
					<%@include file="/WEB-INF/pages/easy/bus/orderManage/order/returnOrderDetail.jsp" %>
				</c:if>
				<!-- 梦想订单详情 -->
				<c:if test="${orderDetail.projectType=='7' }">
					<%@include file="/WEB-INF/pages/easy/bus/orderManage/order/dreamOrderDetail.jsp" %>
				</c:if>
			</div>
			<div class="m-auto p20 tc">
				<a class="btn-blue2 btn white radius-6 pl20 pr20 f14 click-link"
						onclick="javascript:window.opener=null;window.close();">关闭</a>
			
			</div>
		</div>
	</div>
</div>
<script language="javascript" src="<%=basePath%>js/framework/DM.js"></script>
<script>
	DM.Event.formatChar();//保留两位小数  format=2
</script>
</body>
</html>
