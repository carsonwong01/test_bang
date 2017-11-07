<!-- 项目管理主页面 -->
<link rel="stylesheet" type="text/css" href="<%=basePath%>easy/css/user.css" />
<!-- 富文本编辑器的css和js文件begin -->
<link rel="stylesheet" href="<%=basePath%>js/kindeditor-4.1.10/themes/default/default.css" />
<link rel="stylesheet" href="<%=basePath%>js/kindeditor-4.1.10/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=basePath%>js/kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="<%=basePath%>js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=basePath%>js/kindeditor-4.1.10/plugins/code/prettify.js"></script>
<!-- 富文本编辑器的css和js文件end -->
<link rel="stylesheet" href="<%=basePath%>css/lytebox.css" />
<script language="javascript" src="<%=basePath %>js/common/lytebox.js"></script>
<div class="user-bg">
	<div class="user-location-top">
		<div class="wrap">
			<div class="user-location-left fl">
				<span>所在位置：</span><a href="<%=basePath%>">首页</a><span
					class="user-location-arrow">&gt;</span><a
					href="<%=basePath%>user/userCenter.do">个人中心</a><span
					class="user-location-arrow">&gt;</span>项目管理
			</div>
			<div class="user-time-right fr">
				<i class="icon-public denglubiao-icon"></i>上次登录时间：${dateLastLogin }
			</div>
		</div>
	</div>
	<input type="hidden" id="projectId" value="${projectId }" /> <input
		type="hidden" id="projectType" value="${projectType }" />
	<div class="wrap clearfix pt20">
		<div class="user-threepage-l">
			<div class="user-threepage-l-r">
				<div class="u-threepage-menu">
					<input type="hidden" id="curPage" value="${to}" />
					<ul>
						<li id="zcdd"><a href="javascript:void(0)"
							onclick="projectManageController.ajaxTempleGet('<%=basePath%>user/project/projectOrderList.do',$('#main_right'),0,'zcdd')"
							class="ZCDD" name="menu">支持订单<span class="u-threepage-line"></span></a></li>
						<c:if test="${projectStatus=='1' }">
							<li id="bjxm"><a href="javascript:void(0)"
								onclick="projectManageController.ajaxTempleGet('<%=basePath%>user/project/updateProjectPage.do',$('#main_right'),0,'bjxm','${projectType}')"
								class="BJXM" name="menu">编辑项目<span class="u-threepage-line"></span></a></li>
						</c:if>
						<li id="gxdt"><a href="javascript:void(0)"
							onclick="projectManageController.ajaxTempleGet('<%=basePath%>user/project/addDynamic.do',$('#main_right'),0,'gxdt')"
							class="GXDT" name="menu">更新动态<span class="u-threepage-line"></span></a></li>
						<c:if test="${projectStatus=='2'|| projectStatus=='1' }">
						<li  id="xmyz"><a href="javascript:void(0)"
							onclick="projectManageController.ajaxTempleGet('<%=basePath%>user/project/projectValidPage.do',$('#main_right'),0,'xmyz')"
							class="XMYZ" name="menu">项目验证<span class="u-threepage-line"></span></a></li>
						</c:if>
						<c:if test="${projectStatus=='1' }">
							<li id="tqjs"><a href="javascript:void(0)"
								onclick="projectManageController.ajaxTempleGet('<%=basePath%>user/project/aheadEndProject.do',$('#main_right'),0,'tqjs')"
								class="TQJS" name="menu">提前结束<span class="u-threepage-line"></span></a></li>
							<li id="scxm"><a href="javascript:void(0)"
								onclick="projectManageController.ajaxTempleGet('<%=basePath%>user/project/delete.do',$('#main_right'),0,'scxm')"
								class="SCXM" name="menu">删除项目<span class="u-threepage-line"></span></a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<div class="user-threepage-r">
			<div class="user-subject-con" id="main_right"></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>easy/js/user/project/projectManage.js"></script>