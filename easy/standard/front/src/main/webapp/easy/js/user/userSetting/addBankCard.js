
dmCheck.init("#dataForm");
var BankListController = DM.Controller.sub({
	init:function(){
		
		//加载省，市，县  联动
		DM.Region.init();
		
		//添加银行卡-提交银行卡信息
		$("#addBankSubmit").click(function(){
			if(dmCheck.check("#dataForm")){
				if($("#cardNumber").val() != $("#cardNumber2").val()){
					dmCheck.tip("#cardNumber2","银行卡号不一致");
					return false;
				}
				var base64 = new Base64();
				$("#cardNumberEncrypt").val(base64.encode($("#cardNumber").val()));
				DM.ajax({
					url:basePath+"user/bankCardManage/addBankCard.do",
					type:"post",
					data: $("#dataForm").serialize(),
					success: function(data){
						if(data.code == '000000'){
							Dialog.show({
								title:"提示信息",//需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
								msg:"操作成功",
								picClass:"success",//需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
								showClose:false,
								callBack:function(){
									 $("li#yhkgl a").click();
								}
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
								window.location.href=basePath+"home/toUserLogin.do";
							}
						});
					 }
				});
			}
		});
	},
	// tab切换
	setTab : function(name, cursel, n) {
		var hover = "hover";
		for (var i = 0; i <= n; i++) {
			var menu = $("#" + name + i);
			if (menu) {
				var con = document.getElementById(name + 
						+ i);
				if (i == cursel) {
					menu.addClass(hover);
				} else {
					menu.removeClass(hover);
				}
				
				if (con) {
					if (cursel == 0) {
						cursel = null;
					}
					$("#direction").val(cursel);
					//改变切换改变的文字
					$("#cardType").val(cursel);
					if(cursel=='1'){
						$("#nameTitle").html("<span class=\"red\">*</span>开户名：");
						$("#personnal").removeClass("hide");
						$("#unit").addClass("hide");
						$("#cardUserName").val($("#personnal").html());
						//避免开户单位验证问题，赋予初始值
						$("#openAccountName").val($("#personnal").html());
					}else{
						$("#nameTitle").html("<span class=\"red\">*</span>开户单位：");
						$("#personnal").addClass("hide");
						$("#unit").removeClass("hide");
						//如果填写开户为单位，那么就将开户单位清空
						if($("#personnal").html()==$("#openAccountName").val())
						{
							$("#openAccountName").val("")
						}
						$("#cardUserName").val($("#openAccountName").val());
					}
				}
			}

		}
		if ($(".item_details_con").length > 0) {
			$("html,body").animate({
				scrollTop : $(".item_details_con").offset().top
			}, 200);
		}
	}
});

var bankListController =new  BankListController();

DM.ready({
	"初始化" : function() {

		userCenterController.tapAnimat();
		
		$("#openAccountName").bind("change",function(){
			$("#cardUserName").val($(this).val());
		})
	}
});
