define([ 'text!userTemplate/personal/proOff.html'], function(proOff) {
	var proOffView = DMJS.DMJSView.extend({
		id : 'proOffView',
		name : 'proOffView',
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
			this.$el.html(_.template(proOff)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		backToIndex:function(){
			DMJS.router.navigate('index/index/index', true);
		}
	});
		
	return proOffView;
});



