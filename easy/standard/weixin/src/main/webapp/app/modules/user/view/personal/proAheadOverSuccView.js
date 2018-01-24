define([ 'text!userTemplate/personal/proAheadOverSuccess.html'], function(proAheadOverSuccess) {
	var proAheadOverSuccView = DMJS.DMJSView.extend({
		id : 'proAheadOverSuccView',
		name : 'proAheadOverSuccView',
		tagName : 'div',
		className : "bg-c-white",
		events : {
		     'tap #goMyAccout': 'goMyAccout', //去我的账户
		     'tap #goProDetails': 'goProDetails',//去项目详情
		},
		init : function(options) {
			_.extend(this, options);
		},
		data:{
			tipsId:"",
		},
		render : function() {
			var self = this;
			self.data.tipsId = self.tipsId;
			this.$el.html(_.template(proAheadOverSuccess,self.data)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		goProDetails:function(){
			DMJS.router.navigate("index/index/projectDetails/"+self.projectId,true);
		},
		goMyAccout:function(){
			DMJS.router.navigate("user/personal/myAccount",true);
		},
	});
		
	return proAheadOverSuccView;
});



