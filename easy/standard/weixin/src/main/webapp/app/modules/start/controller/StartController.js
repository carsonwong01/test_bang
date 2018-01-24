define(['startModel/StartModel',
	'commonController/MainController',
	'commonTool/tool',
	'commonClass/ActionFilter'
], function(StartModel, MainController, tool,ActionFilter) {
	var IndexController = MainController.extend({
		module: 'start',
		name: 'start',
		tabFlag: 0, //第几个tab页
		actions: {
			"start":"start",//发起项目
			"startDonate":"startDonate",//发起公益项目
			"toStart/:type(/:proid)":"toStart",//去填写发起项目
			"requite(/:returnId)":"requite",//回报
			"target(/:returnId)":"target",//目标
			"proLabel/:type":"proLabel",//项目标签
			"createSuc/:type/:id":"createSuc",//项目创建成功
			"proValidate/:type/:id(/:source)":"proValidate",//项目验证
			"validate/:type/:id":"validate",//大病救助外其他项目验证
			"illnValidate/:type/:id":"illnValidate",//大病救助项目验证
			
		},
		init: function() {
			this.startModel = new StartModel();
		},
		"start":function(){//发起项目
		   var self=this;
	       self.setHeader({
	       		"key":"none",
				"title":"发起项目"
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"start"
	       });
	       require(['startView/start/start'], function(start){
	    	   self.setContent(start,{
	       			"controller":self,
	    		}).render();
	       });
		},
		"startDonate":function(){//发起公益项目
		   var self=this;
	       self.setHeader({
	       		"key":"none",
				"title":"发起个人求助"
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"start"
	       });
	       require(['startView/start/startDonate'], function(startDonate){
	    	   self.setContent(startDonate,{
	       			"controller":self,
	    		}).render();
	       });
		},
		"toStart":function(type,proid){//发起公益项目
		   var self=this,title = "大病救助";
		   switch (type){
		   	case "1-2":
		   		title = "灾难救助"
		   		break;
		   	case "1-3":
		   		title = "动物保护"
		   		break;
		   	case "1-4":
		   		title = "救贫助学"
		   		break;
		   	case "1-5":
		   		title = "其他救助"
		   		break;
		   	case "2":
		   		title = "紧急项目"
		   		break;
		   	case "3":
		   		title = "实现梦想"
		   		break;
		   	default:
		   		title = "大病救助"
		   		break;
		   }
	       self.setHeader({
	       		"key":"none",
				"title":title
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"start"
	       });
	       require(['startView/start/startInfo'], function(startInfo){
	    	   self.setContent(startInfo,{
	       			"controller":self,
	       			"type":type,
	       			"proid":proid,
	    		});
	    	   if(DMJS.currentView.fromCache!='Y'){
	    		   DMJS.currentView.render();
	 		   }else{
	 			   DMJS.currentView.showLabel();
	 		   }
	       });
		},
		"requite":function(returnId){//项目回报
		   var self=this,title=returnId?"修改回报":"添加回报";
	       self.setHeader({
	       		"key":"none",
				"title":title
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"start"
	       });
	       require(['startView/start/requite'], function(requite){
	    	   self.setContent(requite,{
	       			"controller":self,
	       			"returnId":returnId,
	    		}).render();
	       });
		},
		"target":function(returnId){//项目目标
		   var self=this,title=returnId?"修改目标":"添加目标";
	       self.setHeader({
	       		"key":"none",
				"title":title
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"start"
	       });
	       require(['startView/start/target'], function(target){
	    	   self.setContent(target,{
	       			"controller":self,
	       			"returnId":returnId,
	    		}).render();
	       });
		},
		"proLabel":function(type){//项目标签
			var self=this;
			self.setHeader({
				"key":"none",
				"title":"项目标签"
			}); 
			self.setFoot({
				"key":"none",
			});
			require(['startView/start/proLabel'], function(proLabel){
				self.setContent(proLabel,{
					"controller":self,
					"type":type,
				}).render();
			});
		},
		"createSuc":function(type,id){//项目创建成功
		   var self=this;
		   DMJS.CommonTools.wxConfig(id);
	       self.setHeader({
	       		"key":"none",
				"title":"创建成功"
	       }); 
	       self.setFoot({
	        	"key":"none",
	       });
	       require(['startView/start/createSuccess'], function(createSuccess){
	    	   self.setContent(createSuccess,{
	       			"controller":self,
	       			"type":type,
	       			"id":id,
	    		}).render();
	       });
		},
		proValidate:function(type,id,source){//项目验证
			var self=this;
	       self.setHeader({
	       		"key":"none",
				"title":"创建成功"
	       }); 
	       self.setFoot({
	        	"key":"none",
	       });
	       require(['startView/start/proValidate'], function(proValidate){
	    	   self.setContent(proValidate,{
	       			"controller":self,
	       			"type":type,
	       			"id":id,
	       			"source":source,//来源
	    		}).render();
	       });
		},
		validate:function(type,id){//大病救助外其他项目验证
			var self=this,title = "个人验证";
			if(type.indexOf("-2")!="-1"){
				title = "组织机构验证";
			}
	       self.setHeader({
	       		"key":"none",
				"title":title
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"start"
	       });
	       require(['startView/start/validate'], function(validate){
	    	   self.setContent(validate,{
	       			"controller":self,
	       			"type":type,
	       			"id":id,
	    		}).render();
	       });
		},
		illnValidate:function(type,id){//大病救助项目验证
		   var self=this,title = "患者本人验证";
		   switch (type){
		   	case "1-1-2":
		   		title = "亲属验证"
		   		break;
		   	case "1-1-3":
		   		title = "夫妻验证"
		   		break;
		   	case "1-1-4":
		   		title = "组织机构验证"
		   		break;
		   	default:
		   		title = "患者本人验证"
		   		break;
		   }
	       self.setHeader({
	       		"key":"none",
				"title":title
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"start"
	       });
	       require(['startView/start/illnVali'], function(illnVali){
	    	   self.setContent(illnVali,{
	       			"controller":self,
	       			"type":type,
	       			"id":id,
	    		});
	    	   if(DMJS.currentView.fromCache!='Y'){
	    		   DMJS.currentView.render();
	 		   }else{
	 			   DMJS.currentView.comeBack();
	 		   }
	       });
		},
	});
	return IndexController;
});