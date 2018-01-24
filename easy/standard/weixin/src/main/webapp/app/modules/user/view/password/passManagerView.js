define([ 'text!userTemplate/password/passManager.html',
		'commonTool/validator'], function(passManager,Validator) {
	var passManagerView = DMJS.DMJSView.extend({
		id : 'passManagerView',
		name : 'passManagerView',
		tagName : 'div',
		className : "passManagerView",
		events : {
			
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(passManager, self)); // 将tpl中的内容写入到
			self.checkPassword();
			self.loadScroller();
			return this;
		},
		checkPassword:function(){
			var self=this;
			self.controller.userModel.checkSettingTradePwd({
				'cancelLightbox':true,
	        	"noCache":true,
	        	"success":function(response){
	        		
	        	},
	        	"error":function(){
	        		wrapView.FlipPrompt.confirm({
		                title: '请先设置提现密码',
		                content:"<input type='password' maxlength='6' id='setPassword' placeholder='请设置提现密码' class='border-all width100 line-h-25'/>" +
		                		"<br/><br/><input type='password' maxlength='6' id='setPasswordOnce' placeholder='请再次输入提现密码' class='border-all width100 line-h-25'/>",
		                FBntconfirm: "取消",
		                FBntcancel: "确定",
		                FBntCancelColor: "pop_btn_orange",
		                autoCloseBg:'true'
		            }, function() {
		            	DMJS.router.navigate("user/personal/personSet",true);
		            }, function() {
		            	self.setPassword();
		            });
	        	}
			
			});
		},
		
		setPassword:function(){
			var self=this;
			var reg=/^\d{6}$/;
			if(reg.test($('#setPassword').val()) && reg.test($('#setPasswordOnce').val())){
				
				if($('#setPassword').val() == $('#setPasswordOnce').val()){
					self.controller.userModel.updateTradePwd({
						'data':{
							newTradePassword:$('#setPasswordOnce').val()
						},
						'cancelLightbox':true,
			        	"noCache":true,
						"success":function(response){
							DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),'提现密码设置成功！');
						}
					});
				}else{
					 DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),'两次密码输入不一致，请重试！',function(){
						 DMJS.router.navigate("user/personal/personSet",true);
					 }); 
				}
				
			}else{
				DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),'请输入6位数字密码！',function(){
					DMJS.router.navigate("user/personal/personSet",true);
				}); 
			}
			
		}
	});
		
	return passManagerView;
});
