define([ 'text!userTemplate/personal/myAddress.html'], function(myAddress) {
	var myAddressView = DMJS.DMJSView.extend({
		id : 'myAddressView',
		name : 'myAddressView',
		tagName : 'div',
		className : "",
		events : {},
		data:{},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
		    self.addMaxnum();
			return this;
		},
		addMaxnum:function(){//收货地址最大条数
			var self = this;
			self.controller.commonModel.findCache({
				'data': {
					"key":"ADDRESS_MAX_COUNT",
				},
				"success": function(response) {
					self.data.total = response.data;//最大数量
					self.loadAddressData();
				 }
			});
		},
		loadAddressData:function(){
			var self = this;
			self.controller.userModel.findAddress({ //获取收货地址
				'data': {},
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					_.extend(self.data,response.data);
					self.$el.html(_.template(myAddress, self.data)); // 将tpl中的内容写入到
					self.loadScroller();
				 }
			});
	    },
	});
	return myAddressView;
});
