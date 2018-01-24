define([ 'text!indexTemplate/addHarvestAddress.html',
		'commonTool/validator'], function(addHarvestAddressTemplate,Validator) {
	var addHarvestAddressView = DMJS.DMJSView.extend({
		id : 'addHarvestAddressContent',
		name : 'addHarvestAddressContent',
		tagName : 'div',
		className : "",
		events : {
			"tap #addNewAddress" : "addNewAddress",//新增
		},
		init : function(options) {
			_.extend(this, options);
			DMJS.place = {
				provinceStr:"",  //省
				provinceId:"",	 //省id
				cityStr:"",      //市
				cityId:"",       //市id
				countyStr:"",    //区
				countyId:"",      //区id
			    routeRul:window.location.hash.substring(1),
			};
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(addHarvestAddressTemplate, self)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		addNewAddress:function(){ //新增地址数据
			var self = this;
			var parms=$("#"+self.id).getFormValue();
    		if(!Validator.check($("#"+self.id))){return false;}
    		var params = self.$el.getFormValue();
    		params["type"] = "0";
    		params["regionId"] = DMJS.place.countyId;
    		
			self.controller.userModel.updateAddress({ //保存修改的地址数据
				'data': params,
				"success": function(response) {
					if(response.code == "000000"){
						if(self.type){//跳回选择地址
							DMJS.router.navigate("index/index/getHarvestAddress", true);
						}else{
							DMJS.router.navigate("user/personal/myAddress", true);
							DMJS.CommonTools.popTip("新增地址成功");
						}
					}else{
						DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),response.description);
					}
				 }
			});
		},
		changeText:function(){ //更改选择后的省市区
			
			$("#provinceS").text(DMJS.place.provinceStr);
			$("#cityS").text(DMJS.place.cityStr);
			$("#countyS").text(DMJS.place.countyStr);
			if(DMJS.place.countyId){//判断是否重新选择地区
				$("#region").val(DMJS.place.countyId);
			}
			
		},
		toShen:function(){ //跳转到省
        	this.noDestroy=true;
        	DMJS.router.navigate("user/personal/shen", true);
        },
        toCity:function(){ //跳转到市
        	if(DMJS.place.provinceId){
        		this.noDestroy=true;
            	DMJS.router.navigate("user/personal/city", true);
        	}
        },
        toCounty:function(){ //跳转到区
        	if(DMJS.place.cityId){
        		this.noDestroy=true;
            	DMJS.router.navigate("user/personal/county", true);
        	}
        }
	});

	return addHarvestAddressView;
});
