define([ 'text!userTemplate/personal/shippingDetails.html',
         'commonTool/validator'], function(shippingDetails,Validator) {
	var shippingDetailsView = DMJS.DMJSView.extend({
		id : 'shippingDetailsView',
		name : 'shippingDetailsView',
		tagName : 'div',
		className : "",
		events : {
		     'tap #defaultLogistics': 'defaultLogistics',
		},
		init : function(options) {
			var self = this;
			self.data.isLogistics = "1";
			_.extend(this, options);
		},
		data:{
			isLogistics:"1"
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(shippingDetails,self.data)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		confirmGoods:function(){//确认发货
			var self = this;
			var params = {};
			if(self.data.isLogistics == "1"){
				if(!Validator.check($("#"+self.id))){return false;}
	    		params = self.$el.getFormValue();
	    		params["isLogistics"] = self.data.isLogistics;
	    		params["orderId"] = self.orderId;
			}else if(self.data.isLogistics == "2"){
				params["isLogistics"] = self.data.isLogistics;
				params["orderId"] = self.orderId;
			}
			self.controller.userModel.post({
				'data':params,
				'cancelLightbox': false,
				"noCache": true,
				"success": function(response) {
					DMJS.CommonTools.alertCommon("温馨提示", "发货成功",function(){
						//跳转至详情页面
						DMJS.router.navigate("user/personal/orderDetails/"+self.orderId,true);
					});
				},
			});
		},
		defaultLogistics:function(e){//是否默认物流
			var self = this,$dom = $(e.target);
			setTimeout(function(){
				if($dom.attr("checked")){
					self.data.isLogistics = "1";
					if($('#courierCompany').hasClass("hide-import")){
						$('#courierCompany').removeClass("hide-import");
					}
					if($('#courierNumber').hasClass("hide-import")){
						$('#courierNumber').removeClass("hide-import")
					}
					
				}else{//关闭默认
					self.data.isLogistics = "2";
					$('#courierCompany').addClass("hide-import");
					$('#courierNumber').addClass("hide-import");
				}
			},500);
		},
	});
		
	return shippingDetailsView;
});



