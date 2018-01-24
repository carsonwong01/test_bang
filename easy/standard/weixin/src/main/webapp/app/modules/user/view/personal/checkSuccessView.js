define([ 'text!userTemplate/personal/checkSuccess.html',
		'commonTool/validator'], function(checkSuccess,Validator) {
	var checkSuccessView = DMJS.DMJSView.extend({
		id : 'checkSuccessView',
		name : 'checkSuccessView',
		tagName : 'div',
		className : "checkSuccessView",
		events : {
			
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			self.personMessage();
			return this;
		},
		personMessage:function(){
			var self=this;
			self.controller.userModel.findAuthentication({
				'cancelLightbox':true,
	        	"noCache":true,
	        	"success":function(response){
	        		self.$el.html(_.template(checkSuccess, response.data.singleResult)); // 将tpl中的内容写入到
	        		self.loadScroller();
	        	}
			});
		}
	});
		
	return checkSuccessView;
});
