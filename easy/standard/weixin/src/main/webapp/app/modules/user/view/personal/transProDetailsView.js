define([ 'text!userTemplate/personal/transProDetails.html'], function(transProDetails) {
	var transProDetailsView = DMJS.DMJSView.extend({
		id : 'transProDetailsView',
		name : 'transProDetailsView',
		tagName : 'div',
		className : "",
		events : {
		     'tap .JSAppointDropDown': 'JSAppointDropDown',
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
			var tradeType = self.tradeType;
			self.controller.userModel.supportDetail({ //订单详情
				'data': {
					"orderId":self.orderId,//订单id
					//"orderNo":self.orderNo//订单编号
				 },
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					if(response.code == "000000"){
						response.data.singleResult.tradeType = tradeType;//交易类型
						self.$el.html(_.template(transProDetails,response.data.singleResult)); // 将tpl中的内容写入到
						self.loadScroller();
					}
				}
					
			});
		},
	});
		
	return transProDetailsView;
});