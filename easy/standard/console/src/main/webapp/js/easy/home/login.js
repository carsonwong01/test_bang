/**
 * 登录控制器
 */
var initPassWord;
var LoginController=DM.Controller.sub({
	  init:function(){
		  dmCheck.init("#loginForm");   
		  this.monitorKeydown();//enter按键监控
		  this.loginSubmitClick();//登录时间监控
		  $("#loginSubmit").focusin(function(){
			  $(this).blur();
		  });
		  
		  $("#txUserId").change(function(){
			  $("#txUserIdMsg").html("");
		  });
		  
		  $("#consoleLoginCodeBtn").click(function(){
			  //校验admin用户是否存在
				if(dmCheck.checkOne($("#txUserId")) && loginController.checkUser("txUserId")){
					if(codeStatus == "true"){
						if(!dmCheck.checkOne($("#txCode")) || !loginController.regPicCodeCheck("#txCode")){
							return;
						}
					}
					if(msgCodeStatus == "true"){
						loginController.sendCode({id:"consoleLoginCodeBtn",phoneId:"adminPhone",type:"64",isBindClick:true});
					}
				}
			});
	  },
	  loginSubmitClick:function(){
		  var _self=this;
		  $("#loginSubmit").click(function(){
			  _self.login();//登录
		  });
	  },
	  //enter按键监控
	  monitorKeydown:function(){
		  var _self=this;
		   if($(".top-container").length>0){
			  window.top.location.href=basePath+"loginPage.do";
		     }
			document.onkeydown=function(event){
		    var e = event || window.event || arguments.callee.caller.arguments[0];          
		     if(e && e.keyCode==13){ // enter 
		    	 _self.login();//登录
		     }
		    };  
	  },

	  sendCode:function(obj){
			// 64后台短信登录验证码
			refreshid=DM.Util.sendCode(obj);
	  },
	  checkUser:function(obj){
			//校验用户名是否存在并返回手机号
			var userName=$("#"+obj).val();
			var flag=false;
			DM.ajax({
				type:"POST",
				url:basePath + "checkAdminUserIsExists.do",
				data:{"adminUser":userName},
				async:false, 
				success:function(msg){
					if(msg.code != '000000'){
						$("#txUserIdMsg").html(msg.description);
					}else{
						//用户是否被锁定，锁定了不能获取验证码 
						if(msg.data.userStatus == '2'){
							$("#txUserIdMsg").html("用户被锁定");
						}else{
							//把手机号赋值到
							$("#adminPhone").val(msg.data.phone);
							flag=true;
						} 
					}
				}
			});
			return flag;
		},
		regPicCodeCheck:function(obj){
			//图片验证码校验
			var code=$(obj).val(); 
			var flag=false;
			DM.ajax({
				type:"POST",
				url:basePath+"consoleRegPicCodeCheck.do",
				data:{"regPicCode":code},
				async : false, 
				success:function(msg){
					$(obj+"Msg").text("");
					$(obj+"Msg").attr("style","");
					if(msg.status == true){
						flag=true;
					}else{
						$(obj+"Msg").html("<p style='color:#f66'>图片验证码错误或已过期</p>");
						changeCaptcha('captchaId');
					}
				}
			});
			return flag;
		},
		checkCode:function(verifyMethod,type,verifyCode){
			//校验手机号验证码
			var flag=false;
			DM.ajax({
				type:"POST",
				url:basePath+"consoleCheckLoginCode.do",
				data:{"verifyMethod":$("#"+verifyMethod).val(),"type":type,"verifyCode":$("#"+verifyCode).val()},
				async : false, 
				success:function(msg){
					if(msg.code == '000000'){
						flag=true;
					}else{
						flag=msg;
					}
				}
			});
			return flag;
		},
	  //登录提交
	  login:function(){
		  var _self=this;
		  if(!dmCheck.check("#loginForm")){
				return false;
			}
		  initPassWord =$("#passwordId").val();
		 var passWrodMd5Base64= new Base64().encode(DM.md5($("#passwordId").val()));

		 //如果开了短信验证码，就先验证验证码，然后验证短信，否则直接验证是否开的验证码
		  if(msgCodeStatus == "true"){
		  		if(codeStatus == "true"){
				 $("#errorMsg").text("");
					if(!loginController.regPicCodeCheck("#txCode")){
						return;
					}
				}
		  		
		  	var ms = loginController.checkCode("adminPhone","64","consoleLoginCode");
			  if(ms == false){
				  $("#passwordId").val(initPassWord) ;
				  $("#errorMsg").html("<span style='color:#f66'>短信验证码错误或已过期</span>");
				  return;
			  }else if(ms != false && ms != true){
				  $("#passwordId").val(initPassWord) ;
				  $("#errorMsg").html("<span style='color:#f66'>"+ms.description+"</span>");
				  return;
			  }
		  }else{
			  if(codeStatus == "true"){
				 $("#errorMsg").text("");
					if(!dmCheck.checkOne($("#txCode")) || !loginController.regPicCodeCheck("#txCode")){
						return;
					}
				}
		  }
		  
		 $("#passwordId").val(passWrodMd5Base64) ;
		  DM.ajax({
			  formId:"loginForm",
			  serialize:true,
			  dataType: "json",
			  url:"login.do",
			  success:function(data){
				  _self.loginCallBack(data);
			  },
			  error:function(data){
			     Dialog.show("系统异常，请联系管理员！","error");
		      }
		  });
	  },
	  //登录回调
	  loginCallBack:function (data){
		  if(data.code=='000000'){
			  window.location.href="index.do";
		  }else{
			  if(data.code=="200002"){
				  $("#txUserId").val("");
				  $("#passwordId").val("");
				  $("#txCode").val("");
			  }else if(data.code=="200004"){
				 $("#passwordId").val(initPassWord);
				  $("#txCode").val("");
			  }
			  changeCaptcha('captchaId');
			  $("#errorMsg").html(data.description);
		  }
	  },
	  loginInit:function(){
		  $("#l_name,#l_password,#l_vcode").click(function(){
				$(this).parent().find("input").focus();
			});
	  }
});
/**
 * 实例化控制器
 */
var loginController=new LoginController();
DM.Page.ready({
	"初始化":function(){
		loginController.loginInit();
	}
});