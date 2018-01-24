define([ 'text!userTemplate/personal/editAddress.html',
		'commonTool/validator'], function(editAddress,Validator) {
	var editAddressView = DMJS.DMJSView.extend({
		id : 'editAddressView',
		name : 'editAddressView',
		tagName : 'div',
		className : "",
		events : {
			"tap #defaultAddress" : "defaultAddress",//是否默认
			"tap #updateAddressBtn" : "updateAddress",//保存修改
			"tap #delAddressBtn" : "delAddress",//删除地址
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
		data:{
			isDefault:""
		},
		render : function() {
			var self = this;
			self.loadEditAddressDatas();
			return this;
		},
		loadEditAddressDatas:function(){
			var self = this;
			self.controller.userModel.findAddressDetail({ //查询收货地址详情
				'data': {
					id:self.addressId
				},
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					 var data = response.data.singleResult;
					 response.data.singleResult.countyId = data.provinceId + data.cityId + data.countyId;
				     self.$el.html(_.template(editAddress, response.data.singleResult)); // 将tpl中的内容写入到
					 self.loadScroller();
					 DMJS.place.provinceId = response.data.singleResult.provinceId;
					 DMJS.place.provinceStr = response.data.singleResult.province;
					 DMJS.place.cityStr = response.data.singleResult.city;
					 DMJS.place.cityId = response.data.singleResult.cityId;
					 DMJS.place.countyStr = response.data.singleResult.county;
					 DMJS.place.countyId = response.data.singleResult.countyId;
					 DMJS.place.countyId =  response.data.singleResult.countyId;//初始默认的地区id
					 self.data.isDefault = response.data.singleResult.isDefault;
				 }
			});
		},
		updateAddress:function(){ //保存修改的地址数据
			var self = this;
    		if(!Validator.check($("#"+self.id))){return false;}
    		var params = self.$el.getFormValue();
    		params["type"] = "1";
    		params["id"] = self.addressId;
    		params["regionId"] = DMJS.place.countyId;
    		params["isDefault"] = self.data.isDefault;
			self.controller.userModel.updateAddress({ //保存修改的地址数据
				'data': params,
				"success": function(response) {
					if(response.code == "000000"){
						DMJS.router.navigate("user/personal/myAddress", true);
						DMJS.CommonTools.popTip("修改地址成功");
					}else{
						DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),response.description);
					}
				 }
			});
		},
		delAddress:function(){ //删除地址
			var self = this;
			wrapView.FlipPrompt.confirm({
                title: '提示信息',
                content:"删除地址后将无法恢复，您确定要删除吗？",
                FBntconfirm: "取消",
                FBntcancel: "确定",
                FBntCancelColor: "pop_btn_orange",
                autoCloseBg:'true'
            }, function() {
           	
            }, function() {
            	self.controller.userModel.updateAddress({ //保存修改的地址数据
    				'data': {
    					"type":"2",
    					"id":self.addressId
    				},
    				"success": function(response) {
    					if(response.code == "000000"){
    						DMJS.router.navigate("user/personal/myAddress", true); 
    					}else{
    						DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),response.description);
    					}
    				 }
    			});
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
        	this.noDestroy=true;
        	DMJS.router.navigate("user/personal/city", true);
        },
        toCounty:function(){ //跳转到区
        	this.noDestroy=true;
        	DMJS.router.navigate("user/personal/county", true);
        },
	    defaultAddress:function(e){//是否默认地址
			var self = this,$dom = $(e.target);
			setTimeout(function(){
				if($dom.attr("checked")){
					self.data.isDefault = "1";
					
				}else{//关闭默认
					self.data.isDefault = "2";
				}
			},500);
		},
	});

	return editAddressView;
});
