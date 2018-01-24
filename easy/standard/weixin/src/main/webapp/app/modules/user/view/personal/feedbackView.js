define([ 'text!userTemplate/personal/feedback.html',
         'commonTool/validator'], function(feedback,Validator) {
	var feedbackView = DMJS.DMJSView.extend({
		id : 'feedbackView',
		name : 'feedbackView',
		tagName : 'div',
		className : "",
		events : {
		     'tap #getFeedConBtn': 'getFeedCon',
		},
		data:{
			clickTag:0
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(feedback,self)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		getFeedCon:function(){ //提交反馈内容
			var self = this;
			if(self.data.clickTag > 0){
        		return;
        	}
        	self.data.clickTag++;
        	setTimeout(function () { self.data.clickTag = 0 }, 3000);
        	
    		if(!Validator.check($("#"+self.id))){return false;}
    		var params = self.$el.getFormValue();
			self.controller.userModel.suggestion({ //提交反馈内容
				'data': params,
				"success": function(response) {
					if(response.code == "000000"){
                        DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),"意见反馈成功",function(){
                        	DMJS.router.navigate("user/personal/userCenter", true); 
						});
					}else{
						DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),response.description);
					}
				 }
			});
		},
	});
	return feedbackView;
});



