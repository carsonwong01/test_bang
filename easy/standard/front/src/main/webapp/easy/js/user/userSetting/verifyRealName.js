//使命认证控制器
var RealNameAuthentController=DM.Controller.sub({
	init:function(){
		//表单非空初始化
		dmCheck.init("#realNameForm");
		
		//校验身份证号
		$("#idNumber").blur(function(){
			if(dmCheck.checkOne($("#idNumber"))){
				realNameAuthentController.checkIdCard('idNumber');
			}
		});
	},
	checkIdCard:function(id){
		//校验身份证是否存在
		var flag=true;
		DM.ajax({
			type:"POST",
			url:basePath+"user/security/idCardUnique.do",
			data:{"idCardNmber":$("#"+id).val()},
			async : false, 
			success:function(msg){
				if(msg.code=='200009'){
					$("#"+id+"Msg").html("<p style='color:#f66'>身份证已存在</p>");
					flag=false;					
				}
			}
		});
		return flag;
	},
	//提交事件
	authentSubmitClick:function(){
		var _self=this;
		$("#authentSubmit").click(function(){
			if(dmCheck.check("#realNameForm")){
			  _self.submit();//提交认证
			}
		});
	},
	//提交
	submit:function(){
		if(dmCheck.check("#realNameForm") && realNameAuthentController.checkIdCard('idCard')){
			var base64 = new Base64();
			$("#idNumber1").val(base64.encode($("#idNumber").val()));
			DM.ajax({
				url:"user/security/authentication.do",
				data:$("#realNameForm").serialize(),
				success:function(data){
					if(data.code=="000000"){
						userCenterController.ajaxTempleGet(basePath+"user/security/findAuthentication.do",$("#main_right"),0,'smrz');
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
	}	
});
var realNameAuthentController=new RealNameAuthentController();
DM.ready({
	"认证初始化":function(){
		realNameAuthentController.authentSubmitClick();
	}
});