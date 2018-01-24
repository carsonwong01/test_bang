define([ 'text!userTemplate/personal/questionDetail.html',
		'commonTool/validator'], function(questionDetail,Validator) {
	var questionDetailView = DMJS.DMJSView.extend({
		id : 'questionDetailView',
		name : 'questionDetailView',
		tagName : 'div',
		className : "questionDetailView",
		events : {
			
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			self.questionDetail();
			self.loadScroller();
			return this;
		},

		questionDetail:function(){
			var self=this;
			self.controller.userModel.getHelpList({
				'data':{
					id:self.id,
					type:self.type
				},
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					self.$el.html(_.template(questionDetail, response.data.pageResult));
					DMJS.CommonTools.imgDown.apply(self,[$('img')]);
					$("#infoContent").find("img").css("max-width","100%");
					self.loadScroller();
				}
			});
		
		}
		
	});
		
	return questionDetailView;
});
