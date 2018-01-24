define([ 'text!userTemplate/password/updateWithdrawP.html',
		'commonTool/validator'], function(updateWithdrawP,Validator) {
	var updateWithdrawPView = DMJS.DMJSView.extend({
		id : 'updateWithdrawPView',
		name : 'updateWithdrawPView',
		tagName : 'div',
		className : "updateWithdrawPView",
		events : {
			'tap #sure_password':'sure_password'
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(updateWithdrawP, self)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		
		sure_password:function(){
			var self=this;
			if(!Validator.check($("#"+self.id))){
				return false;
			}
			var parms=$("#"+self.id).getFormValue();
			if(parms.newPasswordF == parms.newPasswordS){
				self.controller.userModel.updateTradePwd({
					'data':{
						newTradePassword:parms.newPasswordS
					},
					'cancelLightbox':true,
		        	"noCache":true,
					"success":function(response){
						DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),"修改提现密码成功",function(){
							DMJS.router.navigate("user/password/passManager", true);
						});
						 
					}
				});
			}else{
				 DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),'两次密码输入不一致，请重试！'); 
			}
		}
	});
		
	return updateWithdrawPView;
});
