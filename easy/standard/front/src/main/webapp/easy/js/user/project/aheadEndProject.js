dmCheck.init("#dataForm");
var ToDeleteProjectController = DM.Controller.sub({
	init:function(){
		// 删除项目
		$("#aheadEndProject").click(function(){
			if(dmCheck.check("#dataForm")){
				DM.ajax({
					url:basePath+"user/project/aheadEndProjectAjax.do",
					type:"post",
					data: {"projectId":$("#projectId").val(),"finishReason":$("#finishReason").val()},
					success: function(data){
						if(data.code == '000000'){
						    if (data.data.singleResult == '1') {
						        $("#successContent").html("项目的筹资金额将会转入到您账户的可用金额中，转入后您可进行提现申请。");
						    }else{
						        $("#successContent").html("项目的筹资金额将会转入到您账户的冻结金额中。");
						    }
							$("#successDialog").show();
						}else if(data.code == '400063') {
						    $("#errorMsgDialog").show();
						    $("#errorMsgDialogBtn,#errorMsgDialog a.out").click(function(){
						        $("#errorMsgDialog").hide();
						    });
						}else{
		             		Dialog.show(data.description,"error");
		             	}
					},
					error:function(data){
						Dialog.confirm("你当前的会话已失效，请重新登录。",{
							picClass:"error",
							showCancel:false,
							callBack:function(){
								window.location.href=basePath+"home/login.do";
							}
						});
					 }
				});
			}
		});
		//关闭
		$(".out").click(function(){
			$("#successDialog").hide();
		})
		//查看项目
		$("#goProject").click(function(){
			projectManageController.goProjectDetails($("#projectId").val());
		})
		//我的账户
		$("#goMyAccount").click(function(){
			window.location.href=basePath+"user/userCenter.do?to=wdqb";
		})
	}
});

var toDeleteProjectController =new  ToDeleteProjectController();

DM.ready({
	"初始化" : function() {
		projectManageController.initCalculate($("#finishReason"));
	}
});
