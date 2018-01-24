define(['indexModel/IndexModel',
        'userModel/UserModel',  
	'commonController/MainController',
	'commonTool/tool',
	'commonClass/ActionFilter'
], function(IndexModel,UserModel,MainController, tool,ActionFilter) {
	var IndexController = MainController.extend({
		module: 'index',
		name: 'index',
		tabFlag: 0, //第几个tab页
		actions: {
			"index":"index",
			"projectDetails/:projectId":"projectDetails",//项目详情
			"labelDetail/:labelName":"labelDetail",//查询有此标签的项目
			"getHarvestAddress":"getHarvestAddress",//获取收货地址
			"addHarvestAddress(/:type)":"addHarvestAddress",//新增收获地址
			"information(/:noticeId)":"information",//平台公告
			"proReport/:projectId":"proReport",//项目举报
			"supportResult/:orderid":"supportResult",//项目支持结果
			"proValidate/:proid":"proValidate",//项目验证结果
			"supportOrderDrem/:proid/:type/:isNeddAddr":"supportOrderDrem",//支持下单--梦想
			"supportOrderReturn/:proid/:isNeddAddr":"supportOrderReturn",//支持下单--回报
			"myLabel":"myLabel",//我的标签
			"labelPage":"labelPage",//标签页
		},
		init: function() {
			this.indexModel = new IndexModel();
			this.userModel = new UserModel();
		},
		"index":function(){
		   var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"帮你筹绿色通道"
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"index"
	       });
	       require(['indexView/index/index'], function(index){
	    	   self.setContent(index,{
	       			"controller":self,
	    		}).render();
	       });
		},
		
		//项目详情
		'projectDetails': function(projectId) { 
			var self = this;
			projectId = projectId.indexOf("?")==-1?projectId:projectId.substring(0,projectId.indexOf("?"));
			projectId = projectId.indexOf("&")==-1?projectId:projectId.substring(0,projectId.indexOf("&"));
			DMJS.CommonTools.wxConfig(projectId);
			self.setHeader({
				'title': "",
				"left":{
	       			"html":"返回首页",
	       			"func":function(){ 
	       			    DMJS.router.navigate("index/index/index", true);
	       			}
	       		},
				"right_right": {
					"html": "举报",
					"func": function() {
						if(DMJS.userInfo){
							DMJS.router.navigate('index/index/proReport/'+projectId, true);
						}else{
							DMJS.router.navigate('user/personal/login', true);
						}
					}
				}
			});
			self.setFoot({
				"key": "projectDetsFoot",
				"func":{
					"concern":function(){
						DMJS.currentView.concernControl();//关注
					},
					"support":function(){
						DMJS.currentView.goSupportOrder();//支持下单
					},
					"share":function(){
						DMJS.currentView.shareToFriend();//支持下单
					}
				},
			});
			require(['indexView/index/projectDetails'], function(projectDetails) {
				self.setContent(projectDetails, {
					"controller": self,
					"projectId":projectId,
				}).render();
			});
		},
		//根据标签查询有此标签的项目
		labelDetail:function(labelName){
			var self=this;
			self.setHeader({
				"key":"none",
	       		"title":labelName
				
			});
			self.setFoot({
	        	"key":"none",
			});
	       require(['indexView/index/labelDetailView'], function(labelDetailView){
	    	   self.setContent(labelDetailView,{
	       			"controller":self,
	       			"labelName":labelName
	    		}).render();
	       });
		},
		
		//选择收货地址
		"getHarvestAddress":function(){
		   var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"选择收货地址"
	       }); 
	       self.setFoot({
	        	"key":"none",
	       });
	       require(['indexView/index/getHarvestAddress'], function(getHarvestAddress){
	    	   self.setContent(getHarvestAddress,{
	       			"controller":self,
	    		}).render();
	       });
		},
		
		//新增收货地址
		"addHarvestAddress":function(type){
		   var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"新增收货地址"
	       }); 
	       self.setFoot({
	        	"key":"none",
	       });
	       require(['indexView/index/addHarvestAddress'], function(addHarvestAddress){
	    	   self.setContent(addHarvestAddress,{
	       			"controller":self,
	       			"type":type,
	    		});
	    	   if(DMJS.currentView.fromCache!='Y'){
		    		 DMJS.currentView.render();
		 		}else{
		 			 DMJS.currentView.changeText();
		 		}
	       });
		},
		
		//公告
		information:function(noticeId){
			var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"公告"
	       }); 
	       self.setFoot({
	        	"key":"none"
	       });
	       require(['indexView/index/informationView'], function(informationView){
	    	   self.setContent(informationView,{
	       			"controller":self,
	       			"noticeId":noticeId
	    		}).render();
	       });
		},
		"supportResult":function(orderid){//项目支持结果
		   var self=this;
		   self.indexModel.supportOrderStatus({ //订单详情
				'data': {
					"orderId":orderid,//订单id
				 },
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					   var data = response.data.singleResult,title ="支付成功",type = "error";
					   if(data.orderStatus=="3"||data.orderStatus=="4"||data.orderStatus=="5"||data.orderStatus=="6"){
						   type = "success";
					   }else if(data.orderStatus=="7"||data.orderStatus=="8"){
						   title = "支付成功"
					   }else{
						   title = "支付失败"
					   }
					   self.setHeader({
				       		"key":"none",
							"title":title
				       }); 
				       self.setFoot({
				        	"key":"none",
				       });
				       require(['indexView/index/supportResult'], function(supportResult){
				    	   self.setContent(supportResult,{
				       			"controller":self,
				       			"orderid":orderid,
				       			"orderData":data,
				       			"type":type,
				    		}).render();
				       });
				},
				"error":function(response){
					DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code),function(){
						tool._Navi_default('index/index/index');
             		});
				}
					
			});
		},
		"proValidate":function(proid){//项目验证结果
		   var self=this;
	       self.setHeader({
	       		"key":"none",
				"title":"项目验证"
	       }); 
	       self.setFoot({
	        	"key":"none",
	       });
	       require(['indexView/index/proValidate'], function(proValidate){
	    	   self.setContent(proValidate,{
	       			"controller":self,
	       			"proid":proid
	    		}).render();
	       });
		},
		
		//项目举报
		proReport:function(projectId){
			var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"项目举报"
	       }); 
	       self.setFoot({
	        	"key":"none"
	       });
	       require(['indexView/index/proReportView'], function(proReportView){
	    	   self.setContent(proReportView,{
	       			"controller":self,
	       			"projectId":projectId
	    		}).render();
	       });
		},
		
		//支持下单--梦想
		supportOrderDrem:function(proid,type,isNeddAddr){
			var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"支持下单"
	       }); 
	       self.setFoot({
	        	"key":"none"
	       });
	       require(['indexView/index/supportOrderDremView'], function(supportOrderDremView){
	    	   self.setContent(supportOrderDremView,{
	       			"controller":self,
	       			"proid":proid,//项目id
	       			"type":type,//项目类型
	       			"isNeddAddr":isNeddAddr,//是否需要收货地址
	    		});
	    	   if(DMJS.currentView.fromCache!='Y'){
	    		   DMJS.currentView.render();
	 		   }else{
	 			   DMJS.currentView.loadNewInfo();
	 		   }
	       });
		},
		
		//支持下单--回报
		supportOrderReturn:function(proid,isNeddAddr){
			var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"支持下单"
	       }); 
	       self.setFoot({
	        	"key":"supportOrderReFoot",
				"func":{
					"button":function(){DMJS.currentView.weixinPay();}
				},
	       });
	       require(['indexView/index/supportOrderReturnView'], function(supportOrderReturnView){
	    	   self.setContent(supportOrderReturnView,{
	       			"controller":self,
	       			"proid":proid,
	       			"isNeddAddr":isNeddAddr,
	    		});
	    	   if(DMJS.currentView.fromCache!='Y'){
	    		   DMJS.currentView.render();
	 		   }else{
	 			   DMJS.currentView.loadNewInfo();
	 		   }
	       });
		},
		
		//我的标签
		myLabel:function(){
			var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"我的标签"
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"index"
	       });
	       require(['indexView/index/myLabelView'], function(myLabelView){
	    	   self.setContent(myLabelView,{
	       			"controller":self,
	    		}).render();
	       });
		},
		
		//标签页 
		labelPage:function(){
			var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"标签页"
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"index"
	       });
	       require(['indexView/index/labelPageView'], function(labelPageView){
	    	   self.setContent(labelPageView,{
	       			"controller":self,
	    		}).render();
	       });
		},
	});
	return IndexController;
});