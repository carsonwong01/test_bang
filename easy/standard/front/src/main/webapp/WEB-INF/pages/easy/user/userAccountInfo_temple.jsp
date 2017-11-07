<form action="" id="goForm" method="post">
	<input type="hidden" id="projectId" name="projectId"/>
</form>
<div class="personal-con clearfix">
	<div class="personal-top-info clearfix pb20 pb20">
		<ul>
			<li class="user-con-left"><div
					class="personal-top-left clearfix">
					<div class="portrait-pic">
						<c:choose>
							<c:when
								test="${accountInfo.imageUrl!=null && accountInfo.imageUrl !=''}">
								<img src="${accountInfo.imageUrl}">
							</c:when>
							<c:otherwise>
								<img src="../images/temp/portrait.jpg">
							</c:otherwise>
						</c:choose>
					</div>
					<p class="pt20" style="white-space: nowrap;overflow: hidden;text-overflow:ellipsis;">
						<span class="gray3 f18" id="goodText"></span><span class=" f16" title="${accountInfo.nickName }" >${accountInfo.nickName }！</span>
					</p>
					<div class="user-certifica pt20">
						<ul class="clearfix">
							<c:if test="${accountInfo.isOpenTradePwd=='true' }">
								<li><c:choose>
										<c:when test="${ accountInfo.userStatus=='1'}">
											<a title="已设置提现密码" href="javascript:void(0)"
												class="u-public-icon u-mima-icon cur"></a>
										</c:when>
										<c:otherwise>
											<a title="未设置提现密码" href="javascript:void(0)"
												class="u-public-icon u-mima-icon"></a>
										</c:otherwise>
									</c:choose></li>
							</c:if>
							<li><c:choose>
									<c:when test="${ accountInfo.idcardStatus=='1'}">
										<a title="已实名认证" href="javascript:void(0);"
											onclick="userCenterController.ajaxTempleGet('<%=basePath%>user/security/findAuthentication.do',$('#main_right'),0,'smrz')"
											class="u-public-icon u-renzheng-icon cur"></a>
									</c:when>
									<c:otherwise>
										<a title="未实名认证" href="javascript:void(0);"
											onclick="userCenterController.ajaxTempleGet('<%=basePath%>user/security/findAuthentication.do',$('#main_right'),0,'smrz')"
											class="u-public-icon u-renzheng-icon"></a>
									</c:otherwise>
								</c:choose></li>
						</ul>
					</div>
				</div></li>
			<li>
			<li class="user-con-right"><div
					class="personal-top-right clearfix">
					<div class="balance-top clearfix pt20">
						<ul>
							<li><div class="balance-height">
									<div class="balance-left">
										<i class="balance-u-icon balance-u-icon-01"></i>
										<p>可用金额</p>
										<p class="highlight2 f16 bold">￥${accountInfo.availableAmount }</p>
									</div>
								</div></li>
							<li><div class="balance-height">
									<div class="balance-left">
										<i class="balance-u-icon balance-u-icon-02"></i>
										<p>冻结金额</p>
										<p class="highlight2 f16 bold">￥${accountInfo.frozenAmount }</p>
									</div>
								</div> <c:if
									test="${accountInfo.frozenAmount!=null && accountInfo.frozenAmount !='' && accountInfo.frozenAmount!='0.00'}">
									<p class="pt20">
										冻结金额解冻需要验证，马上去<a href="javascript:void(0);"
											onclick="userCenterController.ajaxTempleGet('<%=basePath %>user/findFreezePro.do?freezeAmount=${accountInfo.frozenAmount }',$('#main_right'),0,'grsy')"
											class="highlight">验证</a>
									</p>
								</c:if></li>

						</ul>
					</div>

				</div></li>
		</ul>


	</div>
	<div class="personal-bottom-data">
		<ul class="clearfix">
			<li>
				<p class="gray3">支持次数</p>
				<p class="personal-bor">
					<span class="f20 gray3">${accountInfo.supportTimes }</span>次
				</p>
			</li>
			<li>
				<p>支持金额</p>
				<p class="personal-bor">
					<span class="f20 gray3">${accountInfo.supportAmt }</span>元
				</p>
			</li>
			<li>
				<p>成功项目</p>
				<p class="personal-bor">
					<span class="f20 gray3">${accountInfo.crowdfundingSuccess }</span>个
				</p>
			</li>
			<li>
				<p>筹资总额</p>
				<p>
					<span class="f20">${accountInfo.crowdfundingAmt }</span>元
				</p>
			</li>
		</ul>
	</div>
</div>
<div class="personal-con clearfix mt20">
	<h2 class="user-public-h2 noborder">
		<a href="<%=basePath%>project/projectList.do" target="_blank"
			class="fr f20">&gt;</a><i class="hot-til-icon btn-blue"></i>热门推荐
	</h2>
	<div class="u-recommend-con">
		<ul id="recommendProject">

		</ul>
	</div>
</div>
<script type="text/javascript"
	src="<%=basePath%>js/common/jquery.tmpl.min.js"></script>
<script id="recommendProjectTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) recommendList}}
		{{if i==0}}
			<li class="item-tuijian t-first">
		{{else i==2}}
			<li class="item-tuijian noborder">
		{{else}}
			<li class="item-tuijian">
		{{/if}}
			<span class="item-tuijian-left">
			<a href="javascript:void(0)" onclick="userCenterController.goProjectDetails('{{= data.projectId}}')"><img
					src="{{= data.projectImg}}"/></a></span>
			<div class="item-tuijian-til">
				<a href="javascript:void(0)" onclick="userCenterController.goProjectDetails('{{= data.projectId}}')">{{= data.projectName}}</a>
			</div>
			<p class="tuijian-describe">{{= data.projectIntro}}</p>
		    <div class="tuijian-info pt5">
			<ul>
				<li>筹集金额：{{= data.raiseTotal}}元</li>
				<li>筹集进度：{{= parseInt(data.rate*100)}}%</li>
				<li>剩余时间：
{{if parseInt(data.timeLeft)>0}}{{= data.timeLeft}}天{{else parseInt(data.timeLeft)==0}}即将结束{{else}}已结束{{/if}}
				</li>
			</ul>
		</div></li>
	{{/each}}
</script>
<!--右侧-->
<script src="<%=basePath%>easy/js/user/userAccountInfo.js"></script>