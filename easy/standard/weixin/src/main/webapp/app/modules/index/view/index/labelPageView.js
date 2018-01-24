define([ 'text!indexTemplate/labelPage.html'], function(labelPage) {
	var labelPageView = DMJS.DMJSView.extend({
		id : 'labelPageContent',
		name : 'labelPageContent',
		tagName : 'div',
		className : "",
		events : {
			'tap .label-tab-tap': 'lableTabAction',
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(labelPage, self)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		}
	});
	return labelPageView;
});
