define([ 'text!userTemplate/personal/proDel.html'], function(proDel) {
	var proDelView = DMJS.DMJSView.extend({
		id : 'proDelView',
		name : 'proDelView',
		tagName : 'div',
		className : "bg-c-white",
		events : {
		     'tap #delSureBtn': 'delSure',
		     'tap #delCancel': 'delCancel'
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(proDel)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		delSure:function(){
			var self = this;
			self.controller.userModel.prodelete({//确定删除
				'data': {
					"projectId":self.projectId,//项目id
				},
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					if(response.code == "000000"){
	                    DMJS.router.navigate("user/personal/proDelSucc", true); 
					}else{
						DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),"项目删除失败");
					}
				 }
			  });
		},
		delCancel:function(){ //取消删除
			DMJS.router.navigate(window.listHash[window.listHash.length-2], true);
		},
	});
		
	return proDelView;
});



