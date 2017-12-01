<script language="javascript" src="<%=basePath %>easy/js/home/iShare.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/qrcode.min.js"></script>
<div class="wrap">
	<form id="form" method="post">
		<input type="hidden" name="projectId" value="${data.data.singleResult.id}">
		<input type="hidden" name="projectType" value="${data.data.singleResult.type}">
		<div class="login-box clearfix">
			<div class="login-form clearfix">
				<div class="login-form-top clearfix tc">
					<img src="<%=basePath %>/easy/images/yes.png" alt="">
					<h3 class="mt50 f26">恭喜，您的项目创建成功！</h3>
					<p class="color999 mt15 f18">太棒了！赶快分享给好友为你支持和传播吧~~</p>
					<div class="mt50 pt10 mb20">
						<p class="tc mb40">
						<a id="projectDetailBtn" class="btn-public btn-hollow">查看项目</a>
					</p>
					<p class="tc mb40">
						<a id="projectValidationBtn" class="btn-public btn-hollow">项目验证</a>
					</p>
					</div>
				</div>
				<div class="login-form-bottom pt50">
					<div class="login-other-til"><h3>分享给好友</h3></div>
					<div class="iShare login-way2 pt30"></div>
				</div>
			</div>
		</div>
	</form>
</div>
<script>
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		$("#projectDetailBtn").click(function(){
			window.location.href = basePath+"project/projectDetails.do?projectId="+$("input[name=projectId]").val();
		});
		$("#projectValidationBtn").click(function(){
			$("#form").attr("action",basePath+"user/project/projectValidationStart.do").submit();
		});
		
		// 分享引入配置
		(new iShare({container:'.iShare',config:{
			title: $("title").html(),
			description: "${data.data.singleResult.title}-${data.data.singleResult.projectIntro}",
			image: "${platformAddr}${data.data.singleResult.coverImgUrl}",
			url: basePath+"project/projectDetails.do?projectId=" + $("input[name=projectId]").val(),
			isAbroad: false,
			isTitle: true,
			initialized: true,
			WXoptions:{
				url: "${wxServiceAddr}/?#index/index/projectDetails/" + $("input[name=projectId]").val(),
				evenType: 'click',
				isTitleVisibility: true,
				title: '',
				isTipVisibility: true,
				tip: '',
				qrcodeW: 220,
				qrcodeH: 220,
				qrcodeBgc: '#fff',
				qrcodeFgc: '#000',
				bgcolor: '#fff'
			}
		}}));
	}
});
</script>