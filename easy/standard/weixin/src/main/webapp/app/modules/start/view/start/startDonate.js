define([ 'text!startTemplate/startDon.html',
		'Lib/native/weixin'], function(startDonTemplate,wx) {
	var startDonView = DMJS.DMJSView.extend({
		id : 'startDonContent',
		name : 'startDonContent',
		tagName : 'div',
		className : "bg-c-white",
		events : {
			
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(startDonTemplate, self)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
	});

	return startDonView;
});
