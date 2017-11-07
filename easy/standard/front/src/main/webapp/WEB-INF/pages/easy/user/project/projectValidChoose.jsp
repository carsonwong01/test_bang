<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="sicknessRescue sicknessbox">
<form id="form" method="post">
	<input type="hidden" name="projectId" value="${projectId}">
	<input type="hidden" name="projectType" value="${projectType}">
	<input type="hidden" id="validationType" name="validationType">
	<div class="layout">
		<h2>项目验证</h2>
		<ul class="box">
			<c:if test="${projectType eq '1'}">
				<a href="javascript:;" data-type="1"><li class="li1"><span class="til">受助人（患者）本人</span><br><span class="des">患者本人发起</span></li></a>
				<a href="javascript:;" data-type="2"><li class="li2"><span class="til">父母/亲兄弟姐妹/子女</span><br><span class="des">直系亲属，需提供户口本证明</span></li></a>
				<a href="javascript:;" data-type="3"><li class="li3"><span class="til">夫妻</span><br><span class="des">夫妻关系，需提供结婚证明</span></li></a>
				<a href="javascript:;" data-type="4"><li class="li4"><span class="til">组织机构</span><br><span class="des">以组织机构名义发起</span></li></a>
			</c:if>
			<c:if test="${projectType eq '2' || projectType eq '3' || projectType eq '4' || projectType eq '5' || projectType eq '7'}">
				<a href="javascript:;" data-type="1"><li class="li1"><span class="til">个人名义发起</span><br><span class="des">需上传个人手持身份证照片</span></li></a>
				<a href="javascript:;" data-type="4"><li class="li4"><span class="til">组织机构名义发起</span><br><span class="des">需上传组织机构资质证明</span></li></a>
			</c:if>
			<c:if test="${projectType eq '6'}">
				<a href="javascript:;" data-type="1"><li class="li1"><span class="til">个人名义发起</span><br><span class="des">需上传个人手持身份证照片</span></li></a>
				<a href="javascript:;" data-type="4"><li class="li4"><span class="til">个体工商/企业名义发起</span><br><span class="des">需上传营业执照</span></li></a>
			</c:if>
		</ul>
		<p class="tc mb50">
			<a id="projectDetailBtn" class="btn-hollow hvr-float-shadow">稍后验证</a>
		</p>
	</div>
</form>
</div>

<script>
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		//稍后验证按钮
		$("#projectDetailBtn").click(function(){
			$("#form").attr("action",basePath+"user/project/projectSuccess.do").submit();
		});
		//选择验证类型
		$("ul.box a").click(function(){
			$("#validationType").val($(this).attr("data-type"));
			$("#form").attr("action",basePath+"user/project/projectValidationStart.do").submit();
		});
	}
});
</script>