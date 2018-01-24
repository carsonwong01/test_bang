define([ 'text!userTemplate/personal/helpTemplate.html',
		'commonTool/validator'], function(helpTemplate,Validator) {
	var helpView = DMJS.DMJSView.extend({
		id : 'helpView',
		name : 'helpView',
		tagName : 'div',
		className : "helpView",
		events : {
			'tap #firstQuestion':'nextLevel'
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			self.$el.html(_.template(helpTemplate,self));
			self.loadScroller();
			return this;
		},
		nextLevel:function(e){
			var self=this;
			var $dom=$(e.target);
			var type=$dom.parent().attr("type")||$dom.attr("type");
			DMJS.router.navigate("user/personal/helpCenterList/"+type, true);
		}
	});
		
	return helpView;
});
