
define(['userModel/UserModel',
        'commonController/MainController',
        'commonTool/tool',
        'indexModel/IndexModel',
       ], function(UserModel, MainController,tool,IndexModel){
    var PersonalController = MainController.extend({
    	
        module: 'user',
        name: 'personal',
        actions: {
        	'login': 'login',//登录
        	'qqlogin(/:code)': 'qqlogin',//qq授权登录
        	'wblogin(/:code)': 'wblogin',//微博授权登录
        	'userCenter':'userCenter',//个人中心
        	'myAccount':'myAccount',//我的账户
        	'myOrder':'myOrder',//支持的项目
        	'myAttention':'myAttention',//关注的项目
        	'myReward':'myReward',//我的奖励
        	'checkName':'checkName',//实名认证
        	'checkSuccess':'checkSuccess',//认证成功
        	'myLaunch':'myLaunch',//我发起的项目
        	'freezeProject/:freezeBalance':'freezeProject',//冻结项目验证
        	'projectManagement/:projectId/:projectStatus/:projectType':'projectManagement',//项目管理
        	'updateDynamics/:projectId':'updateDynamics',//更新动态
        	'personSet':'personSet',//个人设置
        	'bindAccount':'bindAccount',//绑定账号
        	'supportOrder/:projectId/:projectType':'supportOrder',//支持订单记录（梦想和公益）
        	'supportOrderReturnPro/:projectId/:projectType':'supportOrderReturnPro',//支持订单记录(回报)
        	'orderDetails(/:orderId)(/:orderNo)':'orderDetails',//支持订单订单详情
        	'proOrderDetails(/:orderId)(/:orderNo)':'proOrderDetails',//支持项目订单详情
        	'transProDetails(/:tradeType)(/:orderId)':'transProDetails',//交易明细订单详情
        	'cashPostDetails(/:tradeAmount)(/:tradeType)(/:dateCreate)':'cashPostDetails',//交易明细提现（提现手续费详情）
        	'transDetails':'transDetails',//交易明细
        	'feedback':'feedback',//意见反馈
        	'bindAccountDetail/:type':'bindAccountDetail',//对应的账户解绑
        	'help':'help',//帮助中心
        	'helpCenterList/:type':'helpCenterList',//帮助中心二级问题列表
        	'questionDetail/:id/:type':'questionDetail',//问题详情
        	'proAheadOver/:projectId/:projectType':'proAheadOver',//提前结束
        	'proAheadOverSuccess/:projectId/:tipsId':'proAheadOverSuccess',//提前结束成功
        	'proDel/:projectId':'proDel',//项目删除
        	'proDelSucc':'proDelSucc',//项目已删除 
        	'proOff':'proOff',//项目已下架 
        	'shippingDetails(/:isLogistics)(/:orderId)':'shippingDetails',//发货详情（订单发货）
        	'aboutUs':'aboutUs',//关于我们
        	'myAddress':'myAddress',//我的收货地址
        	'editAddress/:addressId':'editAddress',//编辑收货地址
        	'shen':'shen',//选择省
        	'city(/:shenId)':'city',//选择市
        	'county(/:cityId)':'county',//选择市
        	
        },
        init: function(){
        	this.userModel = new UserModel();
        	this.indexModel = new IndexModel();
        },
        "login":function(){
        	var self=this;
        	var search = window.location.search.length > 0?window.location.search.substr(1):"";
        	var str = search.split("&");
        	var theRequest = new Object();
        	for(var i = 0; i < str.length; i ++) {
				theRequest[str[i].split("=")[0]]=(str[i].split("=")[1]);
			}
        	var code = theRequest['code'];
	       self.setHeader({
	       		"key":"none",
	       		"title":"登录"
	       }); 
	       self.setFoot({
	        	"key":"none",
	       });
	       require(['userView/personal/loginView'], function(loginView){
	    	   self.setContent(loginView,{
	       			"controller":self,
	       			"code":code,
	    	   });
	    	   if(DMJS.currentView.fromCache!='Y'){
	    		   DMJS.currentView.render();
	 		   }
	       });
        },
        "qqlogin":function(code){
        	var self=this;
        	self.setHeader({
        		"key":"none",
        		"title":"登录"
        	}); 
        	self.setFoot({
        		"key":"none",
        	});
        	require(['userView/personal/loginView'], function(loginView){
        		self.setContent(loginView,{
        			"controller":self,
        			"code":code?code.split("=")[1]:"",
        		});
        		if(DMJS.currentView.fromCache!='Y'){
        			DMJS.currentView.qqrender();
        		}
        	});
        },
        "wblogin":function(code){
        	var self=this;
        	self.setHeader({
        		"key":"none",
        		"title":"登录"
        	}); 
        	self.setFoot({
        		"key":"none",
        	});
        	require(['userView/personal/loginView'], function(loginView){
        		self.setContent(loginView,{
        			"controller":self,
        			"code":code?code.split("=")[1]:"",
        		});
        		if(DMJS.currentView.fromCache!='Y'){
        			DMJS.currentView.wbrender();
        		}
        	});
        },
        'userCenter':function(){
        	var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"我的"
	       }); 
	       self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	       });
	       require(['userView/personal/userCenterView'], function(userCenterView){
	    	   self.setContent(userCenterView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        personSet:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"个人设置"
        	});
        	self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	        });
	         require(['userView/personal/personSetView'], function(personSetView){
	    	   self.setContent(personSetView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        updateDynamics:function(projectId){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"更新动态"
        	});
        	self.setFoot({
	        	"key":"none",
	        	"hash":"userInfo"
	        });
	         require(['userView/personal/updateDynamicsView'], function(updateDynamicsView){
	    	   self.setContent(updateDynamicsView,{
	       			"controller":self,
	       			projectId:projectId
	    		}).render();
	       });
        },
        
        bindAccount:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"绑定第三方账号"
        	});
        	self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	        });
	         require(['userView/personal/bindAccountView'], function(bindAccountView){
	    	   self.setContent(bindAccountView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        bindAccountDetail:function(type){
        	var self=this,title="";
        	var search = window.location.search.length > 0?window.location.search.substr(1):"";
        	var str = search.split("&");
        	var theRequest = new Object();
        	for(var i = 0; i < str.length; i ++) {
				theRequest[str[i].split("=")[0]]=(str[i].split("=")[1]);
			}
        	var code = theRequest['code'];
        	switch(type){
        		case "wx" :
	        		title="微信";
	        		break;
        		case "xl" :
	        		title="新浪微博";
	        		break;
	        	case "qq" :
	        		title="腾讯QQ";
	        		break;
        	}
        	self.setHeader({
        		"key":"none",
	       		"title":title+"账号绑定"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/bindAccountDetailView'], function(bindAccountDetailView){
	    	   self.setContent(bindAccountDetailView,{
	       			"controller":self,
	       			"type":type,
	       			"code":code
	    		}).render();
	       });
        },
        
        myAccount:function(){
        	var self=this;
	       self.setHeader({
	       		"key":"none",
	       		"title":"我的账户"
	       }); 
	       self.setFoot({
	        	'btnName': {
							text: "可用金额提现",
				}, //text 是按钮内容
				"key": "oneButtonFoot",
				"func":{
					"button": function(){
						if (DMJS.currentView.fromCache != 'Y') {
							DMJS.currentView.toWithdraw();
							}
					},
				}
	       });
	       require(['userView/personal/myAccountView'], function(myAccountView){
	    	   self.setContent(myAccountView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        myOrder:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"我的订单"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/myOrderView'], function(myOrderView){
	    	   self.setContent(myOrderView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        myAttention:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"我的关注"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/myAttentionView'], function(myAttentionView){
	    	   self.setContent(myAttentionView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        myReward:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"我的奖励"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/myRewardView'], function(myRewardView){
	    	   self.setContent(myRewardView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        checkName:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"实名认证"
        	});
        	self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	        });
	         require(['userView/personal/checkNameView'], function(checkNameView){
	    	   self.setContent(checkNameView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        checkSuccess:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"认证成功"
        	});
        	self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	        });
	         require(['userView/personal/checkSuccessView'], function(checkSuccessView){
	    	   self.setContent(checkSuccessView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        myLaunch:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"我发起的"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/myLaunchView'], function(myLaunchView){
	    	   self.setContent(myLaunchView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        freezeProject:function(freezeBalance){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"验证冻结账户"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/freezeProjectView'], function(freezeProjectView){
	    	   self.setContent(freezeProjectView,{
	       			"controller":self,
	       			"freeBalance":freezeBalance
	    		}).render();
	       });
        },
        projectManagement:function(projectId,projectStatus,projectType){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"项目管理"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/projectManagerView'], function(projectManagerView){
	    	   self.setContent(projectManagerView,{
	       			"controller":self,
	       			"projectId":projectId,  //项目id
	       			"projectStatus":projectStatus,//项目状态
	       			"projectType":projectType //项目类型
	    		}).render();
	       });
        },
         //支持订单记录（梦想和公益）
         supportOrder:function(projectId,projectType){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"支持订单"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/supportOrderView'], function(supportOrderView){
	    	   self.setContent(supportOrderView,{
	       			"controller":self,
	       			"projectId":projectId,
	       			"projectType":projectType
	    		}).render();
	       });
        },
        //支持订单记录（回报）
        supportOrderReturnPro:function(projectId,projectType){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"支持订单"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/supportOrderReturnProView'], function(supportOrderReturnProView){
	    	   self.setContent(supportOrderReturnProView,{
	       			"controller":self,
	       			"projectId":projectId,
	       			"projectType":projectType
	    		}).render();
	       });
        },
        help:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"帮助中心"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/helpView'], function(helpView){
	    	   self.setContent(helpView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        //帮助中心二级问题列表
        helpCenterList:function(type){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"帮助中心"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/helpCenterListView'], function(helpCenterListView){
	    	   self.setContent(helpCenterListView,{
	       			"controller":self,
	       			"type":type
	    		}).render();
	       });
        },
        //问题详情
        questionDetail:function(id,type){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"帮助中心"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/questionDetailView'], function(questionDetailView){
	    	   self.setContent(questionDetailView,{
	       			"controller":self,
       				"id":id,
       				"type":type
	    	   
	    		}).render();
	       });
        },
       
        //支持订单-订单详情
        orderDetails:function(orderId,orderNo){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"订单详情"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/orderDetailsView'], function(orderDetailsView){
	    	   self.setContent(orderDetailsView,{
	       			"controller":self,
	       			"orderId":orderId,//订单id
	       			"orderNo":orderNo,//订单编号
	    		}).render();
	       });
        },
        
        //支持项目-订单详情
        proOrderDetails:function(orderId,orderNo){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"订单详情"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/proOrderDetailsView'], function(proOrderDetailsView){
	    	   self.setContent(proOrderDetailsView,{
	       			"controller":self,
	       			"orderId":orderId,//订单id
	       			"orderNo":orderNo,//订单编号
	    		});
	    	   if(DMJS.currentView.fromCache!='Y'){
	    		   DMJS.currentView.render();
	 		   }else{
	 			   DMJS.currentView.loadNewInfo();
	 		   }
	       });
        },
        
        //交易明细订单详情
        transProDetails:function(tradeType,orderId){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"交易详情"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/transProDetailsView'], function(transProDetailsView){
	    	   self.setContent(transProDetailsView,{
	       			"controller":self,
	       			"tradeType":tradeType,//交易类型
	       			"orderId":orderId,//订单id
	    		}).render();
	       });
        },
        //交易明细提现和提现手续费订单详情
        cashPostDetails:function(tradeAmount,tradeType,dateCreate){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"交易详情"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/cashPostDetailsView'], function(cashPostDetailsView){
	    	   self.setContent(cashPostDetailsView,{
	       			"controller":self,
	       			"tradeAmount":tradeAmount,
	       			"tradeType":tradeType,
	       			"dateCreate":dateCreate
	    		}).render();
	       });
        },
        //交易明细
        transDetails:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"交易明细"
        	});
        	self.setFoot({
	        	"key":"none",
	        });
	         require(['userView/personal/transDetailsView'], function(transDetailsView){
	    	   self.setContent(transDetailsView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        //意见反馈
        feedback:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"意见反馈"
        	});
        	self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	        });
	         require(['userView/personal/feedbackView'], function(feedbackView){
	    	   self.setContent(feedbackView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        //提前结束
        proAheadOver:function(projectId,projectType){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"提前结束"
        	});
        	self.setFoot({
	        	"key":"none"
	        });
	         require(['userView/personal/proAheadOverView'], function(proAheadOverView){
	    	   self.setContent(proAheadOverView,{
	       			"controller":self,
	       			"projectId":projectId,
	       			"projectType":projectType,
	    		}).render();
	       });
        },
        
        //提前结束成功
        proAheadOverSuccess:function(projectId,tipsId){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"提前结束"
        	});
        	self.setFoot({
	        	"key":"none"
	        });
	         require(['userView/personal/proAheadOverSuccView'], function(proAheadOverSuccView){
	    	   self.setContent(proAheadOverSuccView,{
	       			"controller":self,
	       			"projectId":projectId,
	       			"tipsId":tipsId
	    		}).render();
	       });
        },
        
        //项目删除
        proDel:function(projectId){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"项目删除"
        	});
        	self.setFoot({
	        	"key":"none"
	        });
	         require(['userView/personal/proDelView'], function(proDelView){
	    	   self.setContent(proDelView,{
	       			"controller":self,
	       			"projectId":projectId,
	    		}).render();
	       });
        },
        
        //项目已删除
        proDelSucc:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"项目删除"
        	});
        	self.setFoot({
	        	"key":"none"
	        });
	         require(['userView/personal/proDelSuccView'], function(proDelSuccView){
	    	   self.setContent(proDelSuccView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        //项目已下架
        proOff:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"项目已下架"
        	});
        	self.setFoot({
	        	"key":"none"
	        });
	         require(['userView/personal/proOffView'], function(proOffView){
	    	   self.setContent(proOffView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        //发货详情
        shippingDetails:function(isLogistics,orderId){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"订单发货"
        	});
        	self.setFoot({
	        	"key":"none"
	        });
	         require(['userView/personal/shippingDetailsView'], function(shippingDetailsView){
	    	   self.setContent(shippingDetailsView,{
	       			"controller":self,
	       			"isLogistics":isLogistics,
	       			"orderId":orderId
	    		}).render();
	       });
        },
        
        //关于我们
        aboutUs:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"关于帮你筹"
        	});
        	self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	        });
	         require(['userView/personal/aboutUsView'], function(aboutUsView){
	    	   self.setContent(aboutUsView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        //我的收货地址
        myAddress:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"我的收货地址"
        	});
        	self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	        });
	         require(['userView/personal/myAddressView'], function(myAddressView){
	    	   self.setContent(myAddressView,{
	       			"controller":self,
	    		}).render();
	       });
        },
        
        //编辑收货地址
        editAddress:function(addressId){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"编辑收货地址"
        	});
        	self.setFoot({
        		"key":"none"
	        });
	         require(['userView/personal/editAddressView'], function(editAddressView){
	    	   self.setContent(editAddressView,{
	       			"controller":self,
	       			'addressId':addressId
	    		});
	    		if(DMJS.currentView.fromCache!='Y'){
		    		 DMJS.currentView.render();
		 		}else{
		 			 DMJS.currentView.changeText();
		 		}
	       });
        },
        
        //省
        shen:function(){
         	var self=this;
   	       self.setHeader({
   	    	    "key":"none",
   	       		"title":"选择省",
   	       }); 
   	       self.setFoot({
   	        	"key":"none"
   	       });
   	       require(['userView/personal/shen'], function(shen){
   	    	   self.setContent(shen,{
   	       			"controller":self,
   	    		}).render();
   	       });
         	
         },
         
         //市
         city:function(shenId){
         	var self=this;
   	       self.setHeader({
   	    	    "key":"none",
	       		"title":"选择市",
   	       }); 
   	       self.setFoot({
   	        	"key":"none"
   	       });
   	       require(['userView/personal/city'], function(city){
   	    	   self.setContent(city,{
   	       			"controller":self,
   	       			'provinceId':shenId
   	    		}).render();
   	       });
         	
         },
         
         //区
         county:function(cityId){
        	 var self=this;
        	 self.setHeader({
    	    	  "key":"none",
 	       		  "title":"选择区",
    	       }); 
        	 self.setFoot({
        		  "key":"none"
        	 });
        	 require(['userView/personal/county'], function(city){
        		 self.setContent(city,{
        			 "controller":self,
        			 'cityId':cityId
        		 }).render();
        	 });
        	 
         },
        
    });
    return PersonalController;
});
