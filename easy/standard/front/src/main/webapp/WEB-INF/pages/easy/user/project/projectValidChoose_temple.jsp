<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2 class="user-public-h2"><i class="hot-til-icon btn-blue"></i>项目验证</h2>
<div class="u-relation-con clearfix public-minheight">
	<form id="form" method="post">
		<input type="hidden" name="projectId" value="${projectId}">
		<input type="hidden" name="projectType" value="${projectType}">
		<input type="hidden" id="validationType" name="validationType">
		<c:if test="${projectType eq '1'}"><h3>收款人与受助人关系</h3></c:if>
		<div class="u-relation-list">
			<ul class="clearfix">
				<c:if test="${projectType eq '1'}">
					<%--
					<li class="relation-last"><a href="javascript:;" data-type="2"><p class="f16 gray6"> 父母/亲兄弟姐妹/子女</p><p class="gray9">直系亲属，需提供户口本证明</p></a></li>
					<li><a href="javascript:;" data-type="3"><p class="f16 gray6">夫妻</p><p class="gray9">夫妻关系，需提供结婚证明</p></a></li>
					--%>
					<li><a href="javascript:;" data-type="1"><p class="f16 gray6">受助人（患者）本人</p><p class="gray9">患者本人发起</p></a></li>
					<li class="relation-last"><a href="javascript:;" data-type="4"><p class="f16 gray6">组织机构</p><p class="gray9">以组织机构名义发</p></a></li>
				</c:if>
				<c:if test="${projectType eq '2' || projectType eq '3' || projectType eq '4' || projectType eq '5' || projectType eq '7'}">
					<li><a href="javascript:;" data-type="1"><p class="f16 gray6">个人名义发起</p><p class="gray9">需上传个人手持身份证照片</p></a></li>
					<li class="relation-last"><a href="javascript:;" data-type="4"><p class="f16 gray6">组织机构名义发起</p><p class="gray9">需上传组织机构资质证明</p></a></li>
				</c:if>
				<c:if test="${projectType eq '6'}">
					<li><a href="javascript:;" data-type="1"><p class="f16 gray6">个人名义发起</p><p class="gray9">需上传个人手持身份证照片</p></a></li>
					<li class="relation-last"><a href="javascript:;" data-type="4"><p class="f16 gray6">个体工商/企业名义发起</p><p class="gray9">需上传营业执照</p></a></li>
				</c:if>
			</ul>
		</div>
	</form>
</div>
<script>
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		//选择验证类型
		window.onload = function(){
            $("#validationType").val($(this).attr("data-type"));
            $("#form").attr("action",basePath+"user/project/projectValidationStart.do").submit();
		}
		/*
		$(".u-relation-list ul a").click(function(){
			$("#validationType").val($(this).attr("data-type"));
			$("#form").attr("action",basePath+"user/project/projectValidationStart.do").submit();
		});
		*/
	}
});
</script>