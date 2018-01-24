define([ 'text!userTemplate/personal/checkName.html',
		'commonTool/validator','Lib/base64'], function(checkName,Validator,Base64) {
	var checkNameView = DMJS.DMJSView.extend({
		id : 'checkNameView',
		name : 'checkNameView',
		tagName : 'div',
		className : "checkNameView",
		events : {
			'tap #submit':'toCheckName'
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(checkName, self)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		toCheckName:function(e){
			var self=this;
			if(!Validator.check($("#"+self.id))){
				return false;
			}
			var parms=$("#"+self.id).getFormValue();
			parms['idNumber']= new Base64().encode(parms['idNumber']);
			self.controller.userModel.idCardUnique({
				'data':{
					idCardNmber:parms.idNumber
				},
				'cancelLightbox':true,
	        	"noCache":true,
	        	"success":function(response){
	        		self.controller.userModel.authentication({
	    				'data': parms,
	    				'cancelLightbox':true,
	    	        	"noCache":true,
	    	        	"success":function(response){
	    	        		DMJS.userInfo.idcardStatus = "1";//修改认证状态
	    	        		 DMJS.router.navigate("user/personal/checkSuccess", true);
	    	        	}
	    			}); 
	        		
	        	}
			});
		}
	});
		
	return checkNameView;
});
