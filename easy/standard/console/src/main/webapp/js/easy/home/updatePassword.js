/**
 * 找回密码控制器
 */
var UpdatePasswordController=DM.Controller.sub({
	//初始化
	init:function(){
		this.showPasswordClick();
		this.logOutClick();
	},
	//找回密码点击事件
	showPasswordClick:function(){
		var _self=this;
		$("#updata_password_id").click(function(){
			_self.showPasswordDialog();
		});
	},
	logOutClick:function(){
		var _self=this;
		$("#logout").click(function(){
			_self.setCookie("login",null);
			window.location.href = basePath + "logout.do";
		});
	},
	checkRePassword:function(){
	/*	var data=this.getModel();
		if(data.reNewPassword != data.newPassword){
			dmCheck.tip($("#reNewPassword"),"密码不一致");
			return false;
		}
	 */
		var str=/^[^/ ]*$/;
		if(($("#newPassword").val()==null||$("#newPassword").val()=="")&($("#reNewPassword").val()==null||$("#reNewPassword").val()=="")){
			return true;
		}else{
			//判断密码是否一致
			 if($("#newPassword").val()==null||$("#newPassword").val()==""){
				 tip($("#newPassword"),"请输入登录密码");
				 return false;
		  	  }
			 if($("#reNewPassword").val()==null||$("#reNewPassword").val()==""){
				 tip($("#reNewPassword"),"请输入确认密码");
				 return false;
		  	  }
			  if($("#newPassword").val()!=$("#reNewPassword").val()){
					 tip($("#reNewPassword"),"两次密码不一致");
					 return false;
			  }
			if(!str.test($("#newPassword").val())){
				 tip($("#reNewPassword"),"密码不能包含空格！");
				 return false;
			}else{
				return true;
			} 
		return true;
		}
	},
	//显示找回密码弹框
	showPasswordDialog:function(){
		var _self=this;
		//获取显示内容
		var html=this.getContent();
		Dialog.showDialog({
			title:"修改密码",
			msg:html,
		    dialogWidth:"600px",//弹出层默认宽度
	        dialogHeight:"200px",//弹出层默认高度
			buttons:{
				"提交":function(){
					if(dmCheck.check("#updatePasswordForm")&&_self.checkRePassword()){
					   //提交
					   _self.submit();
					}
				},
				"取消":function(){
					Dialog.close("dialog");
				}
			}
		});
		dmCheck.init("#updatePasswordForm");
	},
	//获取显示内容
	getContent:function(){
       return $("#updatePasswordTemple").tmpl().html();		
	},
	//提交
	submit:function(){
		//获取参数
		var data=this.getModel();
		DM.ajax({
			url:"updatePassword.do",
			data:data,
			success:function(data){
				if(data.code=="000000"){
					Dialog.close("dialog");
					Dialog.confirm({
						msg:"修改密码成功",
						picClass:"success",
						showCancel:false,
						callBack:function(){
	            			window.location.href = basePath + "logout.do";
						} });
				}else{
					if(data.code == "200007"){
						Dialog.show("原密码不正确！","error");
					}else{
						Dialog.show(data.description,"error");
					}
					
				}
			}
		});
	},
	//获取参数
	getModel:function(){
		var model={};
		model.oldPassword=DM.md5($("#oldPassword").val());
		model.newPassword=DM.md5($("#newPassword").val());
		model.reNewPassword=DM.md5($("#reNewPassword").val());
		return model;
	},
	setCookie:function(name,value)
	{
		//不设定时间
	    document.cookie = name + "="+ escape (value);
	}
});
//实例化控制器
var updatePasswordController=new UpdatePasswordController();
DM.Page.ready({
	"初始化":function(){
		updatePasswordController.setCookie("login","true");
	}
});