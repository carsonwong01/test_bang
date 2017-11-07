<form action="" id="goForm" method="post">
	<input type="hidden" id="projectId" name="projectId"/>
</form>
<div class="user-myWallet user-validate">
	<div class="personal-con clearfix">
		<h2 class="user-public-h2">
			<i class="hot-til-icon btn-blue"></i>验证冻结项目
		</h2>
		<div class="pt20 public-minheight">
			<input type="hidden" id="freezeAmount" value="${freezeAmount }" />
			<ul>
				<li id="dataLi"></li>
			</ul>
			<!--分页-->
			<div class="paging" id="pagingFreezeProData"></div>
			<!--分页  --END-->
		</div>
	</div>
</div>
<script src="<%=basePath%>easy/js/user/fundsManagement/findFreezePro.js"></script>