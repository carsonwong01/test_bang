<!-- 用户中心主页 -->

<div class="user-bg">
	<div class="user-location-top">
		<div class="wrap">
			<div class="user-location-left fl">
				<span>所在位置：</span><a href="<%=basePath%>">首页</a><span
					class="user-location-arrow">&gt;</span><a href="<%=basePath%>user/userCenter.do">个人中心</a><span
					class="user-location-arrow">&gt;</span>账户总览
			</div>
			<div class="user-time-right fr">
				<i class="icon-public denglubiao-icon"></i>上次登录时间：${dateLastLogin }
			</div>
		</div>
	</div>
	<div class="wrap clearfix pt20">
		<!--左侧-->
		<div class="user-l">
			<div class="user-l-r">
				<!--左侧菜单-->
				<div class="sidemenu">
					<div class="main-til" id="wdzc">
						<span class="icon-public user-wdzc-icon"></span><a href="javascript:void(0)" onclick="userCenterController.ajaxTempleGet('<%=basePath %>user/userAccountInfo.do',$('#main_right'),0,'wdzc')">我的众筹</a>
					</div>
					<!-- 当前页面 -->
					<input type="hidden" id="curPage" value="${to }" />
					<ul>
						<li class="group"><span class="item"><i
								class="icon-public user-zjgl-icon"></i>资金管理<em class="unfold"></em></span>
							<ul class="child" style="display: block;">
								<%--<li id="wdqb" name="meun"><a href="javascript:void(0);" onclick="userCenterController.ajaxTempleGet('<%=basePath %>user/myWallet.do',$('#main_right'),0,'wdqb')">我的账户</a></li>--%>
								<li id="jymx" name="meun"><a href="javascript:void(0);" onclick="userCenterController.ajaxTempleGet('<%=basePath %>user/findTradeList.do',$('#main_right'),0,'jymx')">交易明细</a></li>
							</ul></li>
						<li class="group"><span class="item"><i
								class="icon-public user-xmgl-icon"></i>项目管理<em class="unfold"></em></span>
							<ul class="child">
								<li id="wzcd" name="meun"><a href="javascript:void(0);" onclick="userCenterController.ajaxTempleGet('<%=basePath %>user/project/user/supportProjectList.do',$('#main_right'),0,'wzcd')">我支持的</a></li>
								<%--<c:if test="${currUser.userType == 1}">--%>
									<li id="wfqd" name="meun"><a href="javascript:void(0);" onclick="userCenterController.ajaxTempleGet('<%=basePath %>user/project/myInitProjectList.do',$('#main_right'),0,'wfqd')">我发起的</a></li>
								<%--</c:if>--%>
								<li id="wgzd" name="meun"><a href="javascript:void(0);" onclick="userCenterController.ajaxTempleGet('<%=basePath %>user/project/myCollectionList.do',$('#main_right'),0,'wgzd')">我关注的</a></li>
							</ul></li>
						<li class="group"><span class="item"><i
								class="icon-public user-grsz-icon"></i>个人设置<em class="unfold"></em></span>
							<ul class="child">
								<li id="grzl" name="meun"><a href="javascript:void(0);" onclick="userCenterController.ajaxTempleGet('<%=basePath %>user/userInfo.do',$('#main_right'),0,'grzl')">个人资料</a></li>
								<%--<li id="shdz" name="meun"><a href="javascript:void(0);" onclick="userCenterController.ajaxTempleGet('<%=basePath %>user/addressManage/userAddressList.do',$('#main_right'),0,'shdz')">收货地址</a></li>--%>
								<li id="smrz" name="meun"><a href="javascript:void(0);" onclick="userCenterController.ajaxTempleGet('<%=basePath %>user/security/findAuthentication.do',$('#main_right'),0,'smrz')">实名认证</a></li>
								<li id="yhkgl" name="meun"><a href="javascript:void(0);" onclick="userCenterController.ajaxTempleGet('<%=basePath %>user/bankCardManage/findCardList.do',$('#main_right'),0,'yhkgl')">银行卡管理</a></li>
							</ul></li>
					</ul>
				</div>
				<!--左侧菜单-->
			</div>
		</div>
		<!--左侧-->

		<!--右侧-->
		<div class="user-r"  id="main_right">
			
		</div>
		<!--右侧-->
	</div>
</div>
<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"></script>
<script src="<%=basePath%>easy/js/home/user.js"></script>
<script src="<%=basePath%>easy/js/user/userCenter.js"></script>