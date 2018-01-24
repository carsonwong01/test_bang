define([ 'text!userTemplate/personal/login.html',
		'commonTool/validator'], function(loginTemplate,Validator) {
	var loginView = DMJS.DMJSView.extend({
		id : 'loginviewContent',
		name : 'loginviewContent',
		tagName : 'div',
		className : "loginviewContent",
		events : {
			'input #phone':'toTapVerify',
		},
		data:{
			singleResult:"",
			clickTag:0,
			empower:"3",//3微博    4qq  5微信公众号
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			
			self.controller.commonModel.clauseList({
				"data":{'id':1},
                'cancelLightbox':false,
    			"noCache":true,
    			"success":function(response){
    				self.data.protocolTitle=response.data.list[0].protocolTitle;//协议名
    				DMJS.userInfo=undefined;
    				DMJS.CommonTools.delCookies();
    				DMJS.loginBackUrl = window.listHash.toString();
    				if(window.listHash.length == 1 && window.listHash[0].indexOf("login/code=")!="-1"){
    					DMJS.loginBackUrl = "";
    				}
    				if(window.localStorage && DMJS.isLogout!=true){//防止刷新window对象被清空
    					if(DMJS.loginBackUrl){
    						localStorage.setItem("loginBackUrl", DMJS.loginBackUrl);
    					}
    				}
    				if(self.code){//有授权返回的code则请求
    					self.controller.commonModel.gzhCallback({
    						"data":{code:self.code},
    		                "noCache": true,
    		                "success": function(response) { 
    		                	var data=response.data;
    							DMJS.userInfo = data;
    							var userInfo = JSON.stringify(DMJS.userInfo);
    							userInfo = encodeURI(userInfo); 
    							document.cookie="userInfo="+userInfo; 
    							//window.listHash.length>0 ? window.listHash.splice(0,window.listHash.length) : null;
    							var list=window.listHash;
    							DMJS.CommonTools.replaceCoBack("user/personal/userCenter");
    							self.comeToUrl();
    		                },
    		                 'error':function(response){
    		                 	if(response.code=="2000076"||response.code=="200010"){
    		                 		if(response.code!="200010"){
    		                 			_.extend(self.data,response.data);
    		                 			self.data.empower = "5";
    		                 		}
    		                 		self.$el.html(_.template(loginTemplate, self.data)); // 将tpl中的内容写入到
    			    				self.loadScroller();
    		                 	}else{
    		                 		DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code),function(){
    		                 			DMJS.router.navigate("user/personal/qqlogin", true);
    		                 		});
    		                 	}
    		                 	
    		                 }
    		            });
    				}else{
    					if(DMJS.CommonTools.isWeiXin() && DMJS.isLogout!=true){//是微信则自动授权且不是退出登录
    						self.wxEmpower();
    					}else{
    						self.$el.html(_.template(loginTemplate, self.data)); // 将tpl中的内容写入到
    						self.loadScroller();
    					}
    				}
    			}
			});
			
			return this;
		},
		
		
		
		comeToUrl:function(){//即将跳转路由
			var urls = localStorage.getItem("loginBackUrl"),returnUrl="user/personal/userCenter";
			if(urls){
				var urls = urls.split(",");
				for(var i=urls.length-1;i>-1;i--){
					if(urls[i].indexOf("login")=="-1"&&urls[i]!=""){//路由中没有登录的最后一个
						returnUrl = urls[i];
						i = -1;
					}
				}
			}
			setTimeout(function(){//情况本地缓存
				localStorage.removeItem("loginBackUrl");
			}, 1000);
			DMJS.router.navigate(returnUrl, true);
		},
		qqrender : function() {//qq授权
			var self = this;
			self.controller.commonModel.clauseList({
				"data":{'id':1},
                'cancelLightbox':false,
    			"noCache":true,
    			"success":function(response){
    				self.data.protocolTitle=response.data.list[0].protocolTitle;//协议名
					DMJS.userInfo=undefined;
					DMJS.CommonTools.delCookies();
					DMJS.loginBackUrl = window.listHash.toString();
					if(window.listHash.length == 1 && window.listHash[0].indexOf("login")!="-1"){
						DMJS.loginBackUrl = "";
					}
					if(window.localStorage && DMJS.isLogout!=true){//防止刷新window对象被清空
						if(DMJS.loginBackUrl){
							localStorage.setItem("loginBackUrl", DMJS.loginBackUrl);
						}
					}
					if(self.code){//有授权返回的code则请求
						self.controller.commonModel.qqCallback({
							"data":{code:self.code},
							"noCache": true,
							"success": function(response) { 
								var data=response.data;
								DMJS.userInfo = data;
								var userInfo = JSON.stringify(DMJS.userInfo);
								userInfo = encodeURI(userInfo); 
								document.cookie="userInfo="+userInfo; 
								//window.listHash.length>0 ? window.listHash.splice(0,window.listHash.length) : null;
								DMJS.CommonTools.replaceCoBack("user/personal/userCenter");
								self.comeToUrl();
							},
							'error':function(response){
								if(response.code=="2000076"||response.code=="200010"){
									if(response.code!="200010"){
										_.extend(self.data,response.data);
			                 			self.data.empower = "4";
			                 		}
									self.$el.html(_.template(loginTemplate, self.data)); // 将tpl中的内容写入到
									self.loadScroller();
								}else{
			                 		DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code),function(){
			                 			DMJS.router.navigate("user/personal/login", true);
			                 		});
			                 	}
							}
						});
					}else{
						this.$el.html(_.template(loginTemplate, self.data)); // 将tpl中的内容写入到
						self.loadScroller();
					}
    			}
			});
			return this;
		},
		wbrender : function() {//微博授权
			var self = this;
			self.controller.commonModel.clauseList({
				"data":{'id':1},
                'cancelLightbox':false,
    			"noCache":true,
    			"success":function(response){
    				self.data.protocolTitle=response.data.list[0].protocolTitle;//协议名
    				DMJS.userInfo=undefined;
    				DMJS.CommonTools.delCookies();
    				DMJS.loginBackUrl = window.listHash.toString();
    				if(window.listHash.length == 1 && window.listHash[0].indexOf("login")!="-1"){
    					DMJS.loginBackUrl = "";
    				}
    				if(window.localStorage && DMJS.isLogout!=true){//防止刷新window对象被清空
    					if(DMJS.loginBackUrl){
    						localStorage.setItem("loginBackUrl", DMJS.loginBackUrl);
    					}
    				}
    				if(self.code){//有授权返回的code则请求
    					self.controller.commonModel.wbCallback({
    						"data":{code:self.code},
    						"noCache": true,
    						"success": function(response) { 
    							var data=response.data;
    							DMJS.userInfo = data;
    							var userInfo = JSON.stringify(DMJS.userInfo);
    							userInfo = encodeURI(userInfo); 
    							document.cookie="userInfo="+userInfo; 
    							//window.listHash.length>0 ? window.listHash.splice(0,window.listHash.length) : null;
    							var list=window.listHash;
    							DMJS.CommonTools.replaceCoBack("user/personal/userCenter");
    							self.comeToUrl();
    						},
    						'error':function(response){
    							if(response.code=="2000076"||response.code=="200010"){
    								if(response.code!="200010"){
    									_.extend(self.data,response.data);
    		                 			self.data.empower = "3";
    		                 		}
    								self.$el.html(_.template(loginTemplate, self.data)); // 将tpl中的内容写入到
    								self.loadScroller();
    							}else{
    		                 		DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code),function(){
    		                 			DMJS.router.navigate("user/personal/login", true);
    		                 		});
    		                 	}
    						}
    					});
    				}else{
    					this.$el.html(_.template(loginTemplate, self.data)); // 将tpl中的内容写入到
    					self.loadScroller();
    				}
    			}
			});
			
			return this;
		},
		empower:function(type){//授权登录
			var self = this;
			switch (type){
			case 'wx':
				self.wxEmpower();
				break;
			case 'qq':
				self.qqEmpower();
				break;
			case 'wb':
				self.wbEmpower();
				break;
			}
		},
		wxEmpower:function(){//微信授权登录
			var self = this;
			self.controller.commonModel.findCache({
	        	'data':{
	        		key:"WECHATPAY.WECHAT_APP_ID",
	        	},
	        	'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					var callUrl = encodeURIComponent(window.location.origin+window.location.pathname+"#user/personal/login");
					window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid="+
					response.data+"&redirect_uri="
						+callUrl+"&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
				}
				
	        });
		},
		qqEmpower:function(){//qq授权登录
			var self = this;
			self.controller.commonModel.findCache({
	        	'data':{
	        		key:"QQ_APPID",
	        	},
	        	'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					var callUrl = encodeURIComponent(window.location.origin+window.location.pathname+"?#user/personal/qqlogin");
					window.location.href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id="+
					response.data+"&redirect_uri="+
					callUrl+"&scope=9024ca9109dc1ebec99f2993f25edfa4";
				}
				
	        });
		},
		wbEmpower:function(){//微博授权登录
			var self = this;
			self.controller.commonModel.findCache({
	        	'data':{
	        		key:"WB_APPID",
	        	},
	        	'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					var callUrl = encodeURIComponent(window.location.origin+window.location.pathname+"?#user/personal/wblogin");
					window.location.href="https://api.weibo.com/oauth2/authorize?client_id="+
						response.data+"&response_type=code&redirect_uri="+callUrl;
				}

	        });
		},
		doLogin : function() {
			var self = this;
			if(!Validator.check($("#"+self.id))){return false}
			var params = _.extend(self.$el.getFormValue(), self.data);
			var _caller_ = function() {
				if(self.data.singleResult){//绑定登录
					params['openid'] = self.data.singleResult.openid;//第三方用户唯一标识
					params['token'] = self.data.singleResult.token;//第三方授权码
					params['tokenExpireIn'] = self.data.singleResult.tokenExpireIn;//授权有效期限
					params['headImgUrl'] = self.data.singleResult.headImgUrl;//用户头像（读取第三方头像）
					params['nickname'] = self.data.singleResult.nickName;//用户昵称（读取第三方昵称）
					params['sex'] = self.data.singleResult.gender;//性别（读取第三方性别）
					params['thirdType'] = self.data.empower;//登录授权方式 5微信公众号绑定登录
					params['unionId'] = self.data.singleResult.unionId;//
					
					self.controller.commonModel.frontRegisterUser({
						"data" : params,'cancelLightbox':true,
						"success" : function(response) {
							var data=response.data;
							DMJS.userInfo = data;
							var userInfo = JSON.stringify(DMJS.userInfo);
							userInfo = encodeURI(userInfo); 
							document.cookie="userInfo="+userInfo; 
							//window.listHash.length>0 ? window.listHash.splice(0,window.listHash.length) : null;
							var list=window.listHash;
							DMJS.CommonTools.replaceCoBack("user/personal/userCenter");
							self.comeToUrl();
						},
						'error':function(response){
							if(response.code=="2000100"||response.code=="2000095"){
								 DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code),function(){
									 self.data.singleResult = "";//重置参数让其登录绑定
									 DMJS.router.navigate("user/personal/login", true);
								 });
							}else{
								 DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code));
							}
						}
					});
				}else{
					self.controller.userModel.loginCheck({
						"data" : params,'cancelLightbox':true,
						"success" : function(response) {
							var data=response.data;
							DMJS.userInfo = data;
							var userInfo = JSON.stringify(DMJS.userInfo);
							userInfo = encodeURI(userInfo); 
							document.cookie="userInfo="+userInfo; 
							//window.listHash.length>0 ? window.listHash.splice(0,window.listHash.length) : null;
							var list=window.listHash;
							DMJS.CommonTools.replaceCoBack("user/personal/userCenter");
							self.comeToUrl();
						},
					});
				}
			};
			_caller_();
		},
		"turnRememberRido": function(e) {
			if ($("input[type='checkbox']").is(":checked")) {
				$("input[type='checkbox']").removeAttr("checked");
			} else {
				$("input[type='checkbox']").attr("checked", true);
			}
		},
		toTapVerify : function(e){
			var $dom=$(e.target).val();
        	if($dom.length>0){
        		$("#yzm").removeClass("c-gray6").attr({action:"action:getMobileCode"});
        	}else{
        		$("#yzm").addClass("c-gray6").removeAttr("action");
        	}
		},
		getMobileCode: function(e) {
			var self = this;
			
			if(self.data.clickTag > 0){
        		return;
        	}
        	self.data.clickTag++;
        	setTimeout(function () { self.data.clickTag = 0 }, 3000);
        	
			if(!Validator.check($("#phone"))){return false}
			var timee=document.getElementById('yzm_count');
			var yzm=document.getElementById('yzm');
			var yzm_info=document.getElementById('yzm_info');
			
			self.controller.commonModel.verifyCode({
				'data': {verifyMethod: $("#phone").children().val(),type:"1"},
				'cancelLightbox': false,
				"noCache": true,
				"success": function(response) {
					yzm.style.display="none";
					yzm_info.style.display="block";
					self.reckTime(timee,yzm,yzm_info);
					DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "验证码已发送,请查收！");
				},
			});
		},
		reckTime :function(obj,yzm,yzm_info){
			var times=60;
			var sid=setInterval(function(){
					times=times-1;
					obj.innerHTML=times;
					if(times==0){
						clearInterval(sid);
						yzm.style.display="block";
						yzm_info.style.display="none";
						obj.innerHTML=60;
					}
					console.log(times);
				},1000);
			window.threadId=sid;
		},
		agreement:function(){
			var self = this;
			self.noDestroy=true;
			DMJS.router.navigate("other/Message/agreement/1", true);
		},
		destroy:function(){
			var self=this;
			self.destroyChilds();
            // 解除事件绑定
            self.undelegateEvents();
//          if (self.scroller) {
//              self.scroller.destroy();
//              self.scroller = undefined;
//          }
            // 移除DOM元素
            self.$el.remove();
		}
	});
		
	

	return loginView;
});
