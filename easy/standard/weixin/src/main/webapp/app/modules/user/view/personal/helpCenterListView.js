define([ 'text!userTemplate/personal/helpCenterList.html',
		'commonTool/validator'], function(helpCenterList,Validator) {
	var helpCenterListView = DMJS.DMJSView.extend({
		id : 'helpCenterListView',
		name : 'helpCenterListView',
		tagName : 'div',
		className : "helpCenterListView",
		events : {
			'tap #secondQuestion':'questionDetail'
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			self.helpCenterList();
			self.loadScroller();
			return this;
		},
		
		
		helpCenterList:function(){
			var self=this;
			self.controller.userModel.getHelpList({
				'data':{
					type:self.type,
					status:1
				},
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					self.$el.html(_.template(helpCenterList, response.data.pageResult));
					$("#secondQuestion > div").last().removeClass("bd-b");
					self.loadScroller();
				}
			});
		
		},
		
		questionDetail:function(e){
			var self=this;
			var $dom=$(e.target);
			var id=$dom.parent().attr("dataId")||$dom.attr("dataId");
			DMJS.router.navigate("user/personal/questionDetail/"+id+"/"+self.type, true);
		}
	});
		
	return helpCenterListView;
});
