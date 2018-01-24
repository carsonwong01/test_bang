define([ 'text!userTemplate/personal/proOrderDetails.html'
         ,'Lib/native/weixin'], function(proOrderDetails,wx) {
	var proOrderDetailsView = DMJS.DMJSView.extend({
		id : 'proOrderDetailsView',
		name : 'proOrderDetailsView',
		tagName : 'div',
		className : "",
		events : {
		     'tap #cancelOrder':'cancelOrder',//取消订单
		     'tap #confirmReceipt':'confirmReceipt'//确认收货
		},
		data:{
			isLogistics:"",
			clickTag:0,//点击次数
		},
		init : function(options) {
			_.extend(this, options);
			DMJS.backUrl = window.location.hash.substr(1);
		},
		render : function() {
			var self = this;
			self.getOrderDets();
			return this;
		},
		getOrderDets:function(){//订单详情
			var self = this;
			self.controller.userModel.supportDetail({ //订单详情
				'data': {
					"orderId":self.orderId,//订单id
					//"orderNo":self.orderNo//订单编号
				 },
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					self.data.isLogistics = response.data.singleResult.isLogistics;
					self.data.receiverAddr = response.data.singleResult.receiverAddr;
					if(response.code == "000000"){
						self.$el.html(_.template(proOrderDetails,response.data.singleResult)); // 将tpl中的内容写入到
						self.loadScroller();
						self.controller.commonModel.findCache({
				        	'data':{
				        		key:"ORDER_OVERDUE_TIME"
				        	},
				        	'cancelLightbox':true,
				        	"noCache":true,
							"success":function(response){
								$('#orderTime').text(response.data);
							}
						});	
						self.controller.userModel.findAddress({ //获取收货地址
							'data': {},
							'cancelLightbox': true,
							"noCache": true,
							"success": function(response) {
								if(response.data.list.length > 0){
									DMJS.selAdd = response.data.list[0];
								}
							 }
						});
					}
				}
					
			});
		},
		//取消订单
		cancelOrder:function(e){
			var self = this;
			$dom = $(e.target);
			var orderId = $dom.attr("orderId");
			wrapView.FlipPrompt.confirm({
                title:"",
                content:"<div class='tx-c fn-s-13'>是否确定取消该订单？</div>",
                FBntconfirm: "取消",
                FBntcancel: "确定",
                FBntCancelColor: "pop_btn_orange",
                autoCloseBg:'true'
            }, function() {
            	
            }, function() {
            	self.controller.userModel.cancel({
    				'data':{
    					id:orderId,
    				},
    				'cancelLightbox':true,
    	        	"noCache":true,
    				"success":function(response){
    					DMJS.CommonTools.alertCommon("","订单已取消",function(){
    						DMJS.router.navigate("user/personal/myOrder", true); 
    					});
    				},
    			});
            });
			
		},
		payOrder:function(e){//支付订单
			var self = this;
			if(self.data.clickTag > 0){//防止重复提交
        		return;
        	}
        	self.data.clickTag++;
        	setTimeout(function () { self.data.clickTag = 0 }, 5000);
			if(!DMJS.userInfo.gzhyhOpenId){//
				var hint = DMJS.CommonTools.isWeiXin()?"请重新登录绑定微信号！":"请使用微信客户端重新登录绑定微信号！";
				DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),hint,function(){
					DMJS.router.navigate("user/personal/login", true);
				});
				return false;
			}
			var params={};
			params['orderId'] = $(e).attr("orderid");//项目订单id
			params['userIP'] = DMJS.userInfo.lastLoginIp;//用户IP
			if(self.data.isLogistics == "1"){ //需要地址
				if(!DMJS.selAdd){
					DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),"请选择收货地址！");
				}else{
					params['deliveryAddrId'] = DMJS.selAdd.addressId;//收货地址ID
				}
			}
			
			self.controller.userModel.payOrder({
				'data': params,
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					var data = response.data;
					wx.chooseWXPay({
			               timestamp: data.json.timeStamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
			               nonceStr: data.json.nonceStr, // 支付签名随机串，不长于 32 位
			               package: "prepay_id="+data.json.prepayId, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
			               signType: data.json.signType, // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
			               paySign: data.json.paySign, // 支付签名
			               success: function (res) {
			                   //成功之后的处理
			            	   DMJS.router.navigate("index/index/supportResult/"+data.json.ordeId, true); 
			               },
			               fail:function(res){
			            	   DMJS.router.navigate("index/index/supportResult/"+data.json.ordeId, true); 
			               }
						});
				 }
			});
			
		},
		selectAdd:function(){//选择收货地址
			var self = this;
			self.noDestroy=true;
			DMJS.router.navigate("index/index/getHarvestAddress", true);
		},
		loadNewInfo:function(){//渲染选择收货地址
			var self = this;
			if(DMJS.selAdd){
				var addHtml = '<p class="or-user-info t-3 fn-s-14">'+
					   '<span class="pd-r-5">'+DMJS.selAdd.userName+'</span>'+
					   '<span class="pd-r-10">（'+DMJS.selAdd.phoneNumber+'）</span>'+
				    '</p><p class="or-place-info t-9 fn-s-12">'+DMJS.selAdd.area+DMJS.selAdd.detaileAddress+'</p>';
				$("#address").html(addHtml);
			}
		},
		confirmReceipt:function(e){//确认收货
			var self = this;
			$dom = $(e.target);
			var orderId  = $dom.attr('orderId');
			self.controller.userModel.confirmReceipt({
				'data':{
					id:orderId,
				},
				'cancelLightbox': false,
				"noCache": true,
				"success": function(response) {
					DMJS.CommonTools.alertCommon("温馨提示", "确认收货成功",function(){
						 DMJS.currentView.render();
						 //self.render();
					});
				},
			});
		},
	});
		
	return proOrderDetailsView;
});