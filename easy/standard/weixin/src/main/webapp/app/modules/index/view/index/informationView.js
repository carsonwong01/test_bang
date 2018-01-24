define([ 'text!indexTemplate/information.html',
		'commonTool/validator'], function(information,Validator) {
	var informationView = DMJS.DMJSView.extend({
		id : 'informationView',
		name : 'informationView',
		tagName : 'div',
		className : "bc-white",
		events : {
			
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			self.controller.indexModel.noticeDetail({
				'data':{
					id:self.noticeId
				},
				"noCache": true,
				cancelLightbox: true,
				"success": function(response){
					self.$el.html(_.template(information, response.data)); // 将tpl中的内容写入到
					DMJS.CommonTools.imgDown.apply(self,[$('img')]);
					$("#infoContent").find("img").css("max-width","100%")
					self.loadScroller();
				}
			});
			
			return this;
		},
	});

	return informationView;
});
