
var BankListController = DM.Controller.sub({

	delBankCard:function (bankId){//删除银行卡
		Dialog.confirm({
			msg:"是否确定删除此银行卡？",
			sureName:"确定",
			picClass:"tip",
			callBack:function(){
				DM.ajax({
					url:basePath+"user/bankCardManage/deleteBankCard.do",
					type:"post",
					dataType:"json",
					data: {"id":bankId},
					success: function(data){ 
						Dialog.close('dialog');//关闭当前
						if(data.code == '000000'){
							Dialog.show({
								  title:"提示",//需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
								  msg:"删除成功",
								  picClass:"success",//需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
								  showClose:false,
								  callBack:function(){
									  $("li#yhkgl a").click();
							  	  }
                            });
						}else{
		             		Dialog.show(data.description,"error");
		             		$("li#yhkgl a").click();
		             	}
					},
					 error:function(data){
						 Dialog.close('dialog');//关闭当前
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
	}
});


var bankListController =new  BankListController();

DM.ready({
	
	"初始化":function(){
		$(".addBankCard").bind("click",function(){
			var auditStatus = $(this).attr("id");
			if(auditStatus=='1'){
				userCenterController.ajaxTempleGet(basePath+'user/bankCardManage/toAddBankCard.do',$('#main_right'),0,'yhkgl');
			}else{
				 Dialog.close('confrim');//关闭当前
				 Dialog.confirm("<div class=\"tc f16 bold\">添加银行卡需要先进行实名认证！</div>",{
					 	title:"提示",
					 	picClass:"error", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
					 	sureName:"去认证",
					 	cancelName:"取消",
						showCancel:true,
                        callBack:function(){
                        	 Dialog.close('dialog');//关闭当前
							 $("li#smrz a").click();
                        }
					});
			}
		})
	}
});
