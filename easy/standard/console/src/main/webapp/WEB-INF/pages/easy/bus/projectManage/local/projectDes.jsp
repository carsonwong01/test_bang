<!--业务管理->项目管理->所有项目->项目详情--项目基本信息-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="p20">
	<div>
		<div class="pt20">
				<span class="pt20 mt40 f16">项目详情</span>
				<hr>
			</div>
		<div class="tab-content-container p20">
			<!--项目详情-->
			<div class="tab-item" id="projectDesId">

				<ul class="gray6 pt20">
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0"><em
								class="red pr5"></em>项目详情：</span>
							<div  class="tl lh30 width-full">${proContent }</div>
						</div>
					</li>
					
				</ul>

			</div>
		</div>
	</div>
</div>
<script language="javascript" src="<%=basePath%>js/framework/DM.js"></script>

<script language="javascript"
	src="<%=basePath%>js/easy/bus/projectManage/local/projectDetail.js"></script>

<script>
	DM.Event.formatChar();//保留两位小数  format=2
</script>
