var countdown = 0; //倒计时用
var getPicImg = true;  
var names = new Array("thirdType","nickname","headPortrait","sex","openid","token","tokenExpireIn","unionid");
var LoginController = DM.Controller
		.sub({
			loginFun:function(){
				if(thirdType == 1){
					if(loginController.check())return;
					var userName=$("#name").val();
					var setMobileCode=$("#setMobileCode").val();
					DM.ajax({
						type:"POST",
						url:basePath+"frontHome/confirmLogin.do",
						data:{"userName":userName,"source":"1","loginYzm":setMobileCode},
						async : false, 
						success:function(msg){
							if(msg.code == '000000'){
								window.location.href=basePath+"user/userCenter.do?to=wdzc";
							}else if(msg.code == '200091' || msg.code == '000007'|| msg.code == '000008'  || msg.code == '000010' || msg.code == '000011'){ 
								 $("#sjYzmMsg").html("<i class='icon-public error-icon'></i><span class='va_m'>"+msg.description+"</span>");
							}else{
								 Dialog.show(msg.description); 
							}
						}
					}); 
				}else{
					//第三方登录，绑定手机号
					if(loginController.check())return;
					var phoneNumber=$("#name").val();
					var setMobileCode=$("#setMobileCode").val();
					nickname = encodeURIComponent(nickname);
					var dateIfo = {"phoneNumber":phoneNumber,"source":"1","telCode":setMobileCode,"thirdType":thirdType,"nickname":nickname,"headPortrait":headPortrait,"sex":sex,"openid":openid,"token":token,"tokenExpireIn":tokenExpireIn,"unionId":unionid};
					DM.ajax({
						type:"POST",
						url:basePath+"frontHome/confirmRegister.do",
						data:dateIfo,
						async : false, 
						success:function(msg){
							if(msg.code == '000000'){
								//清空cookie
								for(var i=0;i<names.length;i++){
									loginController.removeCookie(names[i]);
								} 
								window.location.href=basePath+"user/userCenter.do?to=wdzc";
							}else if(msg.code == '2000095'){ 
								 Dialog.show({
										  msg:"该第三方账户已被绑定，请更换其它账户",
										  callBack:function(){
											//清空cookie
											for(var i=0;i<names.length;i++){
												loginController.removeCookie(names[i]);
											}	
											location.reload();
										  }
		                        }); 
							}else if(msg.code == '2000100'){ 
								 Dialog.show({
									  msg:"该手机号已绑定过第三方",
									  callBack:function(){
										//清空cookie
										for(var i=0;i<names.length;i++){
											loginController.removeCookie(names[i]);
										}	
										location.reload();
									  }
	                        }); 
							}else  if(msg.code == '200091' || msg.code == '000007'|| msg.code == '000008'  || msg.code == '000010' || msg.code == '000011'){ 
								 $("#sjYzmMsg").html("<i class='icon-public error-icon'></i><span class='va_m'>"+msg.description+"</span>");
							}else{
								 Dialog.show(msg.description); 
							}
						}
					});  
				}
			},
			init : function() {
				var _self = this;
				if(errMsg){
					 Dialog.show(errMsg,"error");
				}
				
				this.loadInfo();
				//设置手机号获取手机验证码-song
				 $("#getSetMobileCodeBtn").click(function(){
					 if(getPicImg){
						 if(loginController.userNameCheck($("#name"))|| loginController.loginYzmCheck($("#loginYzm"))){
								return false; 
							}
							if(loginController.regPicCodeCheck($("#loginYzm"))){
								loginController.sendCode({id:"getSetMobileCodeBtn",valueId:"name",type:"1",isBindClick:true});
							}
					 } 
				}); 
				 
				 $("#loginBtn").click(function(){
					 _self.loginFun();
				 }); 
				 
				 $("#checkbox_id").click(function(){
					 if($(this).is(':checked')){
						 $("#loginBtn").removeClass("btn-gray").addClass("btn-blue").bind("click",function(){
							 _self.loginFun();
						 }); 
					 }else{
						 $("#loginBtn").removeClass("btn-blue").addClass("btn-gray").unbind("click"); 
					 }
				 });

			},
			loadInfo:function(){
				 var _self = this;
				/**
				 * 如果callback 为true说明是第三方回调回来的 
				 */
				if(callback == "true"){
					_self.editCookie(names[0],thirdType,7200); 
					_self.editCookie(names[1],nickname,7200); 
					_self.editCookie(names[2],headPortrait,7200); 
					_self.editCookie(names[3],sex,7200); 
					_self.editCookie(names[4],openid,7200); 
					_self.editCookie(names[5],token,7200); 
					_self.editCookie(names[6],tokenExpireIn,7200); 
					if(unionid){
						_self.editCookie(names[7],unionid,7200); 
					} 
				} 
				
				//获取cookie的值 
				thirdType = _self.getCookieValue(names[0]);
				if(thirdType == 2 || thirdType == 3 || thirdType == 4){
					 nickname =_self.getCookieValue(names[1]);
					 headPortrait =_self.getCookieValue(names[2]);
					 sex =_self.getCookieValue(names[3]);
					 openid =_self.getCookieValue(names[4]); 
					 token =_self.getCookieValue(names[5]);
					 tokenExpireIn =_self.getCookieValue(names[6]);
					 unionid =_self.getCookieValue(names[7]);
					document.getElementById("sjdl").style.display="none";
					document.getElementById("dsf").style.display=""; 
					$("#headImg").html("<img src="+headPortrait+">");
					$("#nickName").html(nickname);
					this.divSwitch("phone");
					 
				}else{
					document.getElementById("wx_div").style.display=""; 
					thirdType = 1;
				};
				document.getElementById("qt").style.display=""; 
			},
			//发送验证码
			sendCode:function(options){ 
				//1：手机注册登录\r\n2：第三方登录第一次绑定手机\r\n 
				 var _self = this;
			 	var value=$("#"+options["valueId"]).val();
				if(!value){
					return;
				}
				//请求后台发送短信验证码
				DM.ajax({
					type:"POST",
					url:basePath+"common/sendSmsVerificationCode.do",
					data:{"verifyMethod":value,"type":options["type"]},
					async:false,
					success:function(data){
						if(data.code=="000000"){  
							_self.editCookie("secondsremained",60,60); 
							var v = _self.getCookieValue("secondsremained"); 
							if(v>0){
								  _self.settimeInfo("getSetMobileCodeBtn");//开始倒计时
							 } 
						}else{
							 $("#userNameMsg").html("<i class='icon-public error-icon'></i><span class='va_m'>"+data.description+"</span>");
						} 
					} 
				});   
			}, 
			//div切换-微信-手机
			divSwitch:function(type){
				if(type == "phone"){
					var va = $("#loginYzm").val();
					if(va == ""){
						//切换验证码
						var objs = document.getElementById("login_captcha_mobile");
						changeCaptcha(objs);
						//清空验证码
						$(obj).val("");
					}
					document.getElementById("wx_div").style.display="none";
					document.getElementById("phone_div").style.display="";
					document.getElementById("phone_a").style.display="none";
					document.getElementById("wx_a").style.display="";
				}else if(type == "wx"){
					document.getElementById("phone_div").style.display="none";
					document.getElementById("wx_div").style.display="";
					document.getElementById("wx_a").style.display="none";
					document.getElementById("phone_a").style.display="";
				}
			},
			// 绑定登录点击事件
			loginClick : function() {
				this.getAgreement();
				this.focusMonitor();
				// 监控enter按键
				this.enterKeyDown(); 
				var v = this.getCookieValue("secondsremained"); 
				if(v>0){
					// 监控cookie倒计时用
					this.settimeInfo("getSetMobileCodeBtn"); 
					getPicImg = false;
				 }  
			},
			// 监控enter按键
			enterKeyDown : function() {
				$("#name,#loginYzm,#setMobileCode").bind("keydown",
						function(event) {
							var e = event;
							if (e && e.keyCode == 13) {  
								$("#loginBtn").click();
							}
						});
			}, 
			//输入框内容改变事件
			focusMonitor : function() {
				$("#name").bind("focus", function() {
					$("#userNameMsg").html("");
				});
				 $("#loginYzm").bind("focus", function() {
					 $("#loginYzmMsg").html("");
				}); 
				 $("#setMobileCode").bind("focus", function() {
					 $("#sjYzmMsg").html("");
				}); 
			},
			// 用户名校验
			userNameCheck : function() {
				var userName = $("#name").val(); 
				if (!userName) {
					$("#userNameMsg").html('<i class="icon-public error-icon"></i><span class="va_m">请输入正确手机号码</span>');
					return true;
				}
				$("#userNameMsg").html("");
				return false;
			},
			// js验证码格式校验
			loginYzmCheck : function() { 
				var loginYzm = $("#loginYzm").val(); 
				if (!loginYzm) {
					$("#loginYzmMsg").html('<i class="icon-public error-icon"></i><span class="va_m">请输入验证码</span>');
					return true;
				}
				var regu = /^[A-Za-z0-9]+$/;
				if (!loginYzm.match(regu)) {
					$("#loginYzmMsg").html('<i class="icon-public error-icon"></i><span class="va_m">请输入正确的验证码</span>');
					return true;
				}
				$("#loginYzmMsg").html("");
				return false;
			},
			//后台图形验证码校验
			regPicCodeCheck:function(obj){ 
				//图片验证码校验
				var code=$(obj).val(); 
				var flag=false;
				DM.ajax({
					type:"POST",
					url:basePath+"common/regPicCodeCheck.do",
					data:{"regPicCode":code},
					async : false, 
					success:function(msg){ 
						if(msg.status == true){
							flag=true;
						}else{
							$("#loginYzmMsg").html('<i class="icon-public error-icon"></i><span class="va_m">验证码错误或已过期</span>');
							var objs = document.getElementById("login_captcha_mobile");
							changeCaptcha(objs);
							$(obj).val("");
						}
					}
				});
				return flag;
			},
			sjYzmCheck:function(){ 
				var loginYzm = $("#setMobileCode").val(); 
				var regu = /^[A-Za-z0-9]+$/;
				if (!loginYzm.match(regu)) {
					$("#sjYzmMsg").html('<i class="icon-public error-icon"></i><span class="va_m">请输入手机验证码</span>');
					return true;
				}
				$("#sjYzmMsg").html("");
				return false;
			},
			//手机验证码校验
			checkCode:function(verifyMethod,type,verifyCode){
				//手机号验证码
				var flag=false;
				DM.ajax({
					type:"POST",
					url:basePath+"common/checkVerificationCode.do",
					data:{"verifyMethod":$("#"+verifyMethod).val(),"type":type,"verifyCode":$("#"+verifyCode).val()},
					async : false, 
					success:function(msg){
						if(msg.code == '000000'){
							flag=true;
						}else{
							flag = msg;
						}
					}
				});
				return flag;
			},
			//是否同意协议
			agreeCheck:function(){
				var agree=$("#checkbox_id").attr("checked");
				if(!agree){
					$("#checkbox_idMsg").html('<i class="icon-public error-icon"></i><span class="va_m">请阅读并同意协议</span>');
					return  true; 
				}
				$("#checkbox_idMsg").html('');
				return  false; 
			},
			//校验
			check:function(){
				return this.userNameCheck()|this.sjYzmCheck()|this.loginYzmCheck()|this.agreeCheck();
			},
			//获取用户注册协议名称
			getAgreement:function(){
				//注册协议
				var param = {"id" : "1"};
				DM.ajax({
					data:param,
					url:"home/getAgreement.do",
					success:function(data){
						$("#item1_agreement").text(data.data.list[0].protocolTitle);
						$("#item1_agreement").attr("href", basePath+"common/showAgreement.do?id=1").attr("target", "_blank"); 
					}
				});
			},
			//修改cookie的值
			editCookie: function (name,value,expiresHours){ 
				if(name != "secondsremained" && value!= "" && typeof(value) != "undefined"){
					value = new Base64().encode(value);
					value = escape(value);
				}
			  var cookieString=name+"="+escape(value); 
			  if(expiresHours>0){ 
			   var date=new Date(); 
			   date.setTime(date.getTime()+expiresHours*1000); //单位是毫秒
			   cookieString=cookieString+";expires=" + date.toGMTString()+";path=/"; 
			  } 
			   document.cookie=cookieString; 
			},
			//根据名字获取cookie的值
			getCookieValue: function (cookieName){  
				 var strCookie = document.cookie;
				 var arrCookie = strCookie.split("; ");
				 for(var i = 0; i < arrCookie.length; i++){
				        var arr = arrCookie[i].split("=");
				        if(cookieName == arr[0]){
				        	if(cookieName == "secondsremained"){
				        		return arr[1];
				        	}
				        	var cookieValue = unescape(arr[1]);
				        	if(cookieValue!= "" && typeof(cookieValue) != "undefined"){
				        		cookieValue =  unescape(cookieValue);
				        		cookieValue = new Base64().decode(cookieValue);
							}
					    	return cookieValue;
				        }
				   }
				   return ""; 
			},
			//清空本地缓存cookie
			removeCookie : function(name) {
				var _self = this;
				var exp = new Date();
			    exp.setTime(exp.getTime() - 1);
			    var cval = _self.getCookieValue(name);
			    if(cval!=null)
			        document.cookie= name + "="+cval+";expires="+exp.toGMTString()+";path=/";
				window.localStorage.removeItem(name);
			},
			//开始倒计时
			settimeInfo :function (obj) { 
			  var _self = this;
			  countdown=_self.getCookieValue("secondsremained");
			  if (countdown == 0) { 
				  getPicImg = true;
				  $("#getSetMobileCodeBtn").css("font-size","18px"); 
				  $("#getSetMobileCodeBtn").css("color","#1ea8fb!important;"); 
				  $("#getSetMobileCodeBtn").css("cursor","default");
				  $("#getSetMobileCodeBtn").html("获取验证码"); 
				  return;
			  } else {  
				  getPicImg = false;
 			      $("#getSetMobileCodeBtn").css("font-size","18px"); 
				  $("#getSetMobileCodeBtn").css("cursor","default");
				  var info = " <font color='red'>"+countdown + "</font><font color='#666'>秒后重新获取</font>";
			    $("#getSetMobileCodeBtn").html(info); 
			    countdown--;
			    _self.editCookie("secondsremained",countdown,countdown+1);
			  } 
			  setTimeout(function() { _self.settimeInfo(obj); },1000); //每1000毫秒执行一次
			} 
		});
//实例化登录控制器
var loginController = new LoginController();

//页面加载时调用
DM.ready({
	"登录初始化" : function() { 
		loginController.loginClick(); 
	}
});