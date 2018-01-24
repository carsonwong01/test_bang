define([ 'text!userTemplate/personal/myOrder.html',
		'text!userTemplate/personal/myOrderList.html',
		'commonClass/scroll/PTRScroll',
		'commonTool/slide',
		'commonTool/validator','Lib/native/weixin'], function(myOrder,myOrderList,PTRScroll,Slide,Validator,wx) {
	var myOrderView = DMJS.DMJSView.extend({
		id : 'myOrderView',
		name : 'myOrderView',
		tagName : 'div',
		className : "myOrderView",
		events : {
		     'tap .JSAppointDropDown': 'switchs',
		     'tap #cancelOrder':'cancelOrder',//取消订单
		     'tap #proOrderDets':'getOrderDets'//项目详情
		},
		data:{
			clickTag:0,//点击次数
		},
		init : function(options) {
			var self=this;
			self.pageInfo = {
					"0": {
						"pageIndex": 1,
						"pageSize":10,
						"loaded": false,
						"isOver": false,
						"id": 0,
						'dataS': ''
					},
					"1": {
						"pageIndex": 1,
						"pageSize":10,
						"loaded": false,
						"isOver": false,
						"id": 1,
						'dataS': '1'
					},
					"2": {
						"pageIndex": 1,
						"pageSize":10,
						"loaded": false,
						"isOver": false,
						"id": 2,
						'dataS': '3'
					},
					"3": {
						"pageIndex": 1,
						"pageSize":10,
						"loaded": false,
						"isOver": false,
						"id": 3,
						'dataS': '5'
					}
				};
			_.extend(self, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(myOrder, self)); // 将tpl中的内容写入到
			self.slider = new Slide(self.$el.find("#slider")[0], "H", function() {
				
				var cur = this.currentPoint;
				if(cur!=self.currentType){
					self.currentType=cur;
					$('.JSAppointDropDown li').removeClass('active-blue');
					$($('.JSAppointDropDown li')[cur]).addClass('active-blue');
					self.loadDatas(self.pageInfo[cur]);
				}
			}, false, function(e) {});
			self.loadDatas(self.pageInfo["0"]);
			return this;
		},
		switchs:function(e){
			var self = this;
			var $dom = $(e.target);
			var chooiceType = $dom.attr("listType");
			if(chooiceType!=self.currentType){
				self.currentType=chooiceType;
				
				$('.JSAppointDropDown li').removeClass('active-blue');
				$($('.JSAppointDropDown li')[chooiceType]).addClass('active-blue');
				
				self.loadDatas(self.pageInfo[chooiceType]);
				self.slider.moveToPoint(parseInt(chooiceType));
			}
        },
		loadDatas:function(pageInfo,callBack){
			var self=this;
			if (pageInfo.isOver) {
				callBack && callBack();
				return;
			}
			var __call = function() {
				var type = pageInfo.id;
				var $dom = self.$el.find("div[items='" + type + "']").find("div.ListArea");
				var $dom_content = $dom.find("div");
				
				if ($dom_content.find("div").length == 0) {
					$dom.html("<div class='ub uinn-pa2 fn-s-14 pd-t-20 ub-pc ub-ac t-ddd' id='noData'>暂无数据</div>");
					self.scroller[type].disablePullUpToLoadMore();
					return;
				}else if(pageInfo.isOver){
				 self.scroller[type].disablePullUpToLoadMore();
    			}else{
    				 self.scroller[type].enablePullUpToLoadMore();
    			}
			};
			self.controller.userModel.supportList({
				'data':{
					reqPageNum:pageInfo.pageIndex,
        			maxResults:pageInfo.pageSize,
        			status:pageInfo.dataS
				},
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					var $dom = self.$el.find("div[items='" + pageInfo.id + "']").find("div.ListArea");
					var datalist=response.data.pageResult.list;
					if (!response.data.pageResult.hasNextPage || datalist.length < Config.base("pageSize")) {
						$.ajaxSettings.lightboxHide = false;
						pageInfo.isOver = true;
						DMJS.CommonTools.popTip("已经加载完所有数据！");
					}
	                 if(pageInfo.pageIndex == 1){
	                    	 $dom.html(_.template(myOrderList,response.data.pageResult));
	                     }else{
	                    	 $dom.append(_.template(myOrderList,response.data.pageResult));
	                     }
	                 pageInfo.pageIndex++;
				},
				"complete":function(){
					if (!!callBack) {
						callBack();
					}
                    self.loadListScroller(pageInfo);
                  	__call();
                  }
			});
			
		},
		loadListScroller: function(pageInfo) {
			var self = this;
			var type = pageInfo.id;
			!self.scroller && (self.scroller = {});
			var wraper = $("div[items='" + type + "']");
			if (!self.scroller[type]) {
				wraper.height(wrapView.height-$('#indexTitleContent').height());
				self.scroller[type] = new PTRScroll(wraper[0], {
					pullUpToLoadMore: !pageInfo.isOver,
					hideScrollbar: true,
					refreshContent: function(done) {
						pageInfo.pageIndex = 1;
						pageInfo.isOver = false;
						pageInfo.loaded=false;

						self.loadDatas(pageInfo, done);

					},
					loadMoreContent: function(done) {
						self.loadDatas(pageInfo, done);
					}
				}, true);
			} else {
				if (pageInfo.isOver) {
					self.scroller[type].disablePullUpToLoadMore();
				} else {
					self.scroller[type].enablePullUpToLoadMore();
				}
			}
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
			               },
			               cancel:function(){//用户取消支付
			            	   DMJS.router.navigate("user/personal/proOrderDetails/"+data.json.ordeId, true);  
			               }
						});
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
    						$dom.parents(".order-item").remove();
    					});
    				},
    				
    			});
            });
			
		},
		getOrderDets:function(e){//订单详情
			var self = this;
			$dom = $(e.target);
			var orderId = $dom.attr("orderId");
			DMJS.router.navigate("user/personal/proOrderDetails/"+orderId, true); 
		},
		
	});
		
	return myOrderView;
});
