define([ 'text!userTemplate/personal/userCenter.html',
		'commonTool/validator'], function(userCenterTemplate,Validator) {
	var userCenterView = DMJS.DMJSView.extend({
		id : 'userCenteriewContent',
		name : 'userCenterviewContent',
		tagName : 'div',
		className : "userCenterviewContent",
		events : {
			
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			self.controller.userModel.findAccInfo({
				'data':"",
				'cancelLightbox': false,
				"noCache": true,
				"success": function(response) {
					_.extend(DMJS.userInfo,response.data.singleResult);
					var userInfo = JSON.stringify(DMJS.userInfo);
					userInfo = encodeURI(userInfo); 
					document.cookie="userInfo="+userInfo; 
					self.$el.html(_.template(userCenterTemplate, response.data.singleResult)); // 将tpl中的内容写入到
					self.getServiceNumber();
					self.loadScroller();
				},
			});
			return this;
		},
		
		getServiceNumber:function(){
			var self=this;
			self.controller.commonModel.findCache({
	        	'data':{
	        		key:"SITE_INFO"
	        	},
	        	'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					DMJS.userInfo.serviceNumber=response.data.servicePhone;
				}
			});
		},
		myOrder:function(){//支持项目列表
			//为了微信支付，单页面模式必须用?让 微信自动去掉后面路由
			location.href=location.origin+location.pathname+"?#user/personal/myOrder";
		},
		
    });
    
	return userCenterView;
});
