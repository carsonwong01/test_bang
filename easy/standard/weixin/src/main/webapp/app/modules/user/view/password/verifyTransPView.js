define([ 'text!userTemplate/password/verifyTransP.html',
		'commonTool/validator'], function(verifyTransP,Validator) {
	var verifyTransPView = DMJS.DMJSView.extend({
		id : 'verifyTransPView',
		name : 'verifyTransPView',
		tagName : 'div',
		className : "verifyTransPView",
		events : {
			'tap #next_password':'next_password'
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(verifyTransP, self)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		
		next_password:function(){
			var self=this;
			if(!Validator.check($("#"+self.id))){
				return false;
			}
		  self.controller.userModel.checkTradePassword({
					'data':{
						tradePassword:$("#password").val()
					},
					'cancelLightbox':true,
		        	"noCache":true,
					"success":function(response){
						
						DMJS.router.navigate("user/password/updateWithdrawP", true);
						
					}
				});
			
		}
	});
		
	return verifyTransPView;
});
