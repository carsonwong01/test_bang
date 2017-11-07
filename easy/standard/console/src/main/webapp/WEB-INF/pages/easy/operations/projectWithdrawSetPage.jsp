<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!--平台提现设置-->
<form id="chargeForm" action="<%=basePath%>operations/updateProjectWithdrawSet.do" method="post">
	<input name="id" type="hidden" value="">
	<div class="border">
		<div class="title-container">
			<i class="icon-i w30 h30 va-middle title-left-icon"></i>平台提现设置
		</div>
		<div class="tab-content-container p20"> 
  
		<!--信息-->
		<div class="tab-item" style="display: block;">
			<ul class="gray6 pt20">
				<li class="mb20">
					<div class="pr mh30 pl140">
						<span class="display-ib w120 lh30 tr mr5 pa left0 top0">
							<em class="red pr5">*</em>提现手续费率
						</span>
						<span class="lh30 pr tl clearfix">
							<input type="text" class="border w150 pl5 pr5 h34 lh34" validate="q|rate" name="withdrawRate" id="withdrawRate" value="${result.data.withdrawRate}">%
						</span>
					</div>
				</li>
				<li class="mb20">
					<div class="pr mh30 pl140">
						<span class="display-ib w120 lh30 tr mr5 pa left0 top0">
							<em class="red pr5">*</em>最小提现金额
						</span>
						<span class="lh30 pr tl clearfix">
							<input type="text" class="border w41 pl5 pr5 h34 lh34 withdrawMoney" validate="q|amount|nZero" name="minWithdrawAmt" id="minWithdrawAmt" value="${result.data.minWithdraw}">元
						</span>
					</div>
				</li>
				<li class="mb20">
					<div class="pr mh30 pl140">
						<span class="display-ib w120 lh30 tr mr5 pa left0 top0">
							<em class="red pr5">*</em>最大提现金额
						</span>
						<span class="lh30 pr tl clearfix">
							<input type="text"	class="border w41 pl5 pr5 h34 lh34 withdrawMoney" validate="q|amount|nZero" name="maxWithdrawAmt" id="maxWithdrawAmt" value="${result.data.maxWithdraw}">元
						</span>
					</div>
				</li>
				<li class="mb20">
					<div class="pr mh30 pl140">
						<span class="display-ib w120 lh30 tr mr5 pa left0 top0">
							<em class="red pr5">*</em>提现最高手续费
						</span>
						<span class="lh30 pr tl clearfix">
							<input type="text"	class="border w41 pl5 pr5 h34 lh34 withdrawFee" validate="q|amount" name="maxPoundage" id="maxPoundage" value="${result.data.withdrawHighest}">元
						</span>
					</div>
				</li>
			</ul>
			
			<div class="tl pl120 f16 pb20">
<%-- 			<shiro:hasPermission name="YYGL_JBSZ_SFSZ_XG"> --%>
				<a href="javascript:void(0);" id="subBtn" class="btn-blue2 btn white radius-6 pl20 pr20 ml20 mr20">提交</a>
<%-- 			</shiro:hasPermission> --%>
			</div>
		</div>
	</div>
</form>
<script>
	//控制器
	var ProChargeController = DM.Controller.sub({
		init:function() {
			dmCheck.init("#chargeForm");
		},
		//提现金额最大最小(限制)
		checkWithDrawMoney:function(){
			$(".withdrawMoney").live("blur",function(){
				var name = $(this).attr("name");
				if(name=="minWithdrawAmt"){
					var max = $("input[name=maxWithdrawAmt]").val();
					if(parseFloat($(this).val())>parseFloat(max)){
						tip($(this),"此项的值不能大于最大值");
						return;
					}
				}
				if(name=="maxWithdrawAmt"){
					var min = $("input[name=minWithdrawAmt]").val();
					if(parseFloat($(this).val())<parseFloat(min)){
						tip($(this),"此项的值不能小于最小值");
						return;
					}
				}
			});
		},
		//保存，提交form
		saveCharge : function() {
			$("#subBtn").click(function() {
	
				//最小提现，最大提现金额判断begin
				var minWithdraw = $("input[name=minWithdrawAmt]").val();
				var maxWithdraw = $("input[name=maxWithdrawAmt]").val();
				if(parseFloat(maxWithdraw)<parseFloat(minWithdraw)){
					tip($("#maxWithdrawAmt"),"此项的值不能小于最小值!");
					return;
				}
				if(parseFloat(minWithdraw)>parseFloat(maxWithdraw)){
					tip($("#minWithdrawAmt"),"此项的值不能大于最大值!");
					return;
				}
				//最小提现，最大提现金额判断end
				
				if(dmCheck.check("#chargeForm")) {
					DM.ajax({
						url : "operations/updateProjectWithdrawSet.do",
						data : $("#chargeForm").serialize(),
						success : function(data) {
							if (data.code == '000000') {
								Dialog.show("修改成功！","success");
								myfn.AjaxFn("operations/projectWithdrawSetPage.do?"+new Date(),$(".viewFramework-content"));
							}
						},
						error : function(data) {
							Dialog.show("修改失败！","error");
							myfn.AjaxFn("operations/projectWithdrawSetPage.do",$(".viewFramework-content"));
						}
					});
				}
			});
		},
	});
	//实例化控制器
	var chargeController = new ProChargeController();
	//页面加载时调用
	DM.Page.ready({
		"加载数据" : function() {
			chargeController.saveCharge();
			chargeController.checkWithDrawMoney();
		}
	});
</script>