define(['userModel/UserModel',
	'commonController/MainController',
	'commonTool/tool',
	'commonClass/ActionFilter'
], function(UserModel, MainController, tool, ActionFilter) {
	var PaymentController = MainController.extend({
		module: 'user',
		name: 'payment',
		actions: {
			'withdraw':'withdraw',//提现
			'myBankList':'myBankList',//我的银行卡
			'addCard':'addCard'//增加银行卡
		},
		init: function() {
			this.userModel = new UserModel();
		},
		withdraw:function(){
			var self=this;
			self.setHeader({
	       		"key":"none",
	       		"title":"提现"
	       }); 
	       self.setFoot({
	        	"key":"none",
	       });
	       require(['userView/payment/withdrawView'], function(withdrawView){
	    	   self.setContent(withdrawView,{
	       			"controller":self
	    		}).render();
	       });
		},
		
		myBankList:function(){
			var self=this;
			self.setHeader({
	       		"key":"none",
	       		"title":"银行卡"
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	       });
	       require(['userView/payment/myBankListView'], function(myBankListView){
	    	   self.setContent(myBankListView,{
	       			"controller":self,
	    		}).render();
	       });
		},
		
		addCard:function(){
			var self=this;
			self.setHeader({
	       		"key":"none",
	       		"title":"银行卡"
	       }); 
	       self.setFoot({
	        	"key":"none",
	       });
	       require(['userView/payment/addCardView'], function(addCardView){
	    	   self.setContent(addCardView,{
	       			"controller":self,
	    		});
	    	   if(DMJS.currentView.fromCache!='Y'){
		    		 DMJS.currentView.render();
		 		}else{
		 			 DMJS.currentView.changeText();
		 		}
	       });
		},
	});
	return PaymentController;
});