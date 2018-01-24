define([ 'text!userTemplate/personal/aboutUs.html'], function(aboutUs) {
	var aboutUsView = DMJS.DMJSView.extend({
		id : 'aboutUsView',
		name : 'aboutUsView',
		tagName : 'div',
		className : "bg-c-white",
		events : {
		     'tap .JSAppointDropDown': 'JSAppointDropDown',
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			self.loadAboutUsContents();
			return this;
		},
		loadAboutUsContents:function(){ //获取关于我们内容
			var self = this;
			self.controller.commonModel.findCache({ //获取关于我们内容
				'data': {
					"key":"SITE_INFO",
				},
				"success": function(response) {
					if(response.code == "000000"){
						self.$el.html(_.template(aboutUs,response.data)); // 将tpl中的内容写入到
						$('#aboutCon').html(response.data.siteDescr);//填充内容
						self.loadScroller();
					}
				 }
			});
		},
	});
		
	return aboutUsView;
});



