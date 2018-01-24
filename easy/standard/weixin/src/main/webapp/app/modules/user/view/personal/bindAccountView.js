define([ 'text!userTemplate/personal/bindAccount.html',
		'commonTool/validator'], function(bindAccount,Validator) {
	var bindAccountView = DMJS.DMJSView.extend({
		id : 'bindAccountView',
		name : 'bindAccountView',
		tagName : 'div',
		className : "bindAccountView",
		events : {
			
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			self.loadData();
			return this;
		},
		loadData:function(){//加载第三方账号列表
			var self = this;
			self.controller.userModel.findThirdPartyList({
				'cancelLightbox':true,
	        	"noCache":true,
	        	"success":function(response){
	        		self.$el.html(_.template(bindAccount, response.data)); // 将tpl中的内容写入到
	    			self.loadScroller();
	        	}
			});
		},
	});
		
	return bindAccountView;
});
