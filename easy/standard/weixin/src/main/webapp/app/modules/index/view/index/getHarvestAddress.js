define([ 'text!indexTemplate/getHarvestAddress.html',
		'commonTool/validator'], function(getHarvestAddressTemplate,Validator) {
	var getHarvestAddressView = DMJS.DMJSView.extend({
		id : 'getHarvestAddressContent',
		name : 'getHarvestAddressContent',
		tagName : 'div',
		className : "",
		events : {
			'tap #selAddress': 'selectAdd',
			//'tap .trends-control-action': 'trendsControl',
		},
		data:{},
		init : function(options) {
			_.extend(this, options);
			DMJS.selAdd = "";//存储选择地址
		},
		render : function() {
			var self = this;
			self.loadAddress();
			return this;
		},
		loadAddress:function(){//获取收货地址
			var self = this;
			self.controller.indexModel.findAddress({
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					self.data.list = response.data.list;
					self.$el.html(_.template(getHarvestAddressTemplate, self.data)); // 将tpl中的内容写入到
					self.loadScroller();
				 }
			});
		},
		selectAdd:function(e){//选择地址
			var self = this;
			var $dom = $(e.target);
			if(!$dom.is("#selAddress>div")){
				$dom = $dom.parents("#selAddress>div")
			}
			var addid = $dom.attr("addid");
			for(var i=0;i< self.data.list.length;i++){
				if(self.data.list[i].addressId == addid){
					DMJS.selAdd = self.data.list[i];
				}
			}
			if(DMJS.backUrl){//上个页面定义回调地址
				DMJS.router.navigate(DMJS.backUrl, true);
			}
		},
	});

	return getHarvestAddressView;
});
