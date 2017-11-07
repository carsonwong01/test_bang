<form action="" id="goForm" method="post">
	<input type="hidden" id="projectId" name="projectId"/>
</form>
<div class="user-myWallet">
	<div class="personal-con clearfix infoHead">
		<h3>我的账户</h3>
		<div class="moneyinfo pt5 clearfix">
			<div class="fl">
				<span class="til">可用金额</span>
				<p>
					<span>￥</span>${myWalletInfo.availableAmount }
				</p>
			</div>
			<div class="fl">
				<span class="til">冻结金额</span>
				<p>
					<span>￥</span>${myWalletInfo.frozenAmount }
				</p>
			</div>
			<c:if
				test="${myWalletInfo.frozenAmount!=null && myWalletInfo.frozenAmount !='' && myWalletInfo.frozenAmount!='0.00'}">
				<a href="javascript:void(0);"
					onclick="userCenterController.ajaxTempleGet('<%=basePath%>user/findFreezePro.do?freezeAmount=${myWalletInfo.frozenAmount }',$('#main_right'),0,'wdqb')"
					class="fr btn-public btn-w70 btn-blue">验证</a>
			</c:if>
		</div>
		<p class="pt20">温馨提示：提现请到微信端或APP端进行提现操作</p>
	</div>
	<div class="personal-con clearfix mt20">
		<h2 class="user-public-h2">
			<i class="hot-til-icon btn-blue"></i>账户记录
		</h2>
		<ul class="user-tab-til clearfix">
			<li id="one0" onclick="myWalletController.setTab('one',0,3)"
				class="hover">全部</li>
			<li id="one1" onclick="myWalletController.setTab('one',1,3)">收入</li>
			<li id="one2" onclick="myWalletController.setTab('one',2,3)">支出</li>
			<p class="animate_p">
				<span class="xmjt-arrow"></span>
			</p>
		</ul>
		<form id="dataForm" action="">
			<input type="hidden" id="direction" name="direction" value="" />
		</form>
		<ul id="con_one_1">

		</ul>
		<!--分页-->
		<div class="paging" id="pagingAccMoneyData"></div>
		<!--分页  --END-->
	</div>
</div>
<script src="<%=basePath%>easy/js/user/fundsManagement/myWallet.js"></script>