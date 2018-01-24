define([ 'text!userTemplate/payment/addCard.html',
		'commonTool/validator','Lib/base64'], function(addCard,Validator,Base64) {
	var addCardView = DMJS.DMJSView.extend({
		id : 'addCardView',
		name : 'addCardView',
		tagName : 'div',
		className : "addCardView",
		events : {
			'tap #infomation_title':'switchs',
			'tap #saveBank':'saveBank'
		},
		init : function(options) {
			_.extend(this, options);
			DMJS.place = {
					provinceStr:"请选择",  //省
					provinceId:"",	 //省id
					cityStr:"请选择",      //市
					cityId:"",       //市id
				    routeRul:window.location.hash.substring(1),
				};
		},
		data:{
			bankType:'0',
			realName:''
		},
		render : function() {
			var self = this;
			self.getUserInfo();
			this.$el.html(_.template(addCard, self)); // 将tpl中的内容写入到
			self.loadScroller();
			//获取银行列表
			self.bankList();
			return this;
		},
		
		switchs:function(e){
			var self=this;
        	var target=e.target;
        	var item=target.dataset.item;
        	var type=item.substring(4)*1;
        	$(target).parent().find('div .active-blue').removeClass('active-blue');
        	$(target).addClass('active-blue');
        	$('div[item]').addClass('hide');
        	$('div[item='+item+']').removeClass('hide');
        	
        	if(type==1){
        		self.data.bankType=0;
        		$("#companyBank").addClass("hide");
        		$("#personBank").removeClass("hide");
        		$("#selectBank").val('');
        		$("#bankNumber").val('');
        		$("#provinceS").text('请选择');
    			$("#cityS").text('请选择');
    			$("#bankName").val('');
    			$("#companyBank input").attr({"validator":""});
    			self.clearPlace();
        	}else{
        		self.data.bankType=1;
        		$("#personBank").addClass("hide");
        		$("#companyBank").removeClass("hide");
        		$("#selectBank").val('');
        		$("#bankNumber").val('');
        		$("#provinceS").text('请选择');
    			$("#cityS").text('请选择');
    			$("#bankName").val('');
    			$("#companyBank input").attr({"validator":"notEmpty;"});
    			self.clearPlace();
        	}
        },
        
        clearPlace:function(){
        	DMJS.place.provinceStr="请选择";
        	DMJS.place.provinceId="";
        	DMJS.place.cityStr="请选择";
        	DMJS.place.cityId="";
        },
        
        getUserInfo:function(){
        	var self=this;
        	self.controller.commonModel.findLoginCache({
        	'data':{
        		key:DMJS.userInfo.token
        	},
        	'cancelLightbox':true,
        	"noCache":true,
			"success":function(response){
				self.data.realName=response.data.realName;
				$("#userName").text(response.data.realName);
			}
        	});
        },
		
		bankList:function(){
			var self=this;
        	self.controller.commonModel.findCache({
        	'data':{
        		key:"USERBANK_LIST"
        	},
        	'cancelLightbox':true,
        	"noCache":true,
			"success":function(response){
				self.selectTip('selectBank','bank',response.data);
			}
			
        });
	  },
	 selectTip:function(id,selectId,list){
		var self=this;
		var optionVals=[],optionText=[];
		for(var i=0;i<list.length;i++){
			optionVals.push(list[i].id);
			optionText.push(list[i].bankName);
		}
        	 DMJS.CommonTools.showList({
                 'inputID':id,
                 'id':selectId,
                 'optionVals':optionVals,
                 'optionText':optionText
             },function(){});
             $("#selectBank").val("");
             
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
     
     changeText:function(){ //更改选择后的省市区
			$("#provinceS").text(DMJS.place.provinceStr);
			$("#cityS").text(DMJS.place.cityStr);
			if(DMJS.place.cityId){//判断是否重新选择地区
				$("#region").val(DMJS.place.cityId);
			}
		},
		
	saveBank:function(){
		var self=this;
		var params=$("#"+self.id).getFormValue();
		if(!Validator.check($("#"+self.id))){return false;}
		if(params['cardNumberEncrypt']){
			params['cardNumberEncrypt']= new Base64().encode(params['cardNumberEncrypt']);
		}
		if(self.data.bankType==0){
			params['cardUserName']=self.data.realName;
		}
		
		params['cardType']=self.data.bankType;
		
		self.controller.userModel.addBankCard({
			'data':params,
			'cancelLightbox':true,
        	"noCache":true,
			"success":function(response){
				DMJS.router.navigate('user/payment/myBankList', true);
			}
			
		});
	},
		
	});
		
	return addCardView;
});
