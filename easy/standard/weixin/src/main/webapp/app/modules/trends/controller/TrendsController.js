define(['trendsModel/TrendsModel',
	'commonController/MainController',
	'commonTool/tool',
	'commonClass/ActionFilter'
], function(TrendsModel, MainController, tool,ActionFilter) {
	var IndexController = MainController.extend({
		module: 'trends',
		name: 'trends',
		tabFlag: 0, //第几个tab页
		actions: {
			"trends":"trends"
		},
		init: function() {
			this.trendsModel = new TrendsModel();
		},
		"trends":function(){
		   var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"动态"
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"trends"
	       });
	       require(['trendsView/trends/trends'], function(trends){
	    	   self.setContent(trends,{
	       			"controller":self,
	    		}).render();
	       });
		},
		
	});
	return IndexController;
});