define([ 'text!userTemplate/personal/proDelSucc.html'], function(proDelSucc) {
	var proDelSuccView = DMJS.DMJSView.extend({
		id : 'proDelSuccView',
		name : 'proDelSuccView',
		tagName : 'div',
		className : "bg-c-white",
		events : {
		     'tap #backToIndex': 'backToIndex',
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(proDelSucc)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		backToIndex:function(){
			DMJS.router.navigate('index/index/index', true);
		}
	});
		
	return proDelSuccView;
});



