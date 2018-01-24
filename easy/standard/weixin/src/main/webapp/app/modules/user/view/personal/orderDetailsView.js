define([ 'text!userTemplate/personal/orderDetails.html'], function(orderDetails) {
	var orderDetailsView = DMJS.DMJSView.extend({
		id : 'orderDetailsView',
		name : 'orderDetailsView',
		tagName : 'div',
		className : "bg-c-white",
		events : {
		     'tap #postGoods': 'postGoods',//发货
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			self.loadOrderDetailsDatas();
			return this;
		},
		loadOrderDetailsDatas:function(){
			var self = this;
			self.controller.userModel.supportDetail({ //订单详情
				'data': {
					"orderId":self.orderId,//订单id
					//"orderNo":self.orderNo//订单编号
				 },
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					if(response.code == "000000"){
						self.$el.html(_.template(orderDetails,response.data.singleResult)); // 将tpl中的内容写入到
						self.loadScroller();
					}
				}
					
			});
		},
		postGoods:function(e){ //发货
			var self = this;
			$dom = $(e.target);
			var isLogistics = $dom.attr("isLogistics");
			var orderId = $dom.attr("orderId");
			DMJS.router.navigate("user/personal/shippingDetails/"+isLogistics+"/"+orderId, true); 
		},
		
	});
		
	return orderDetailsView;
});