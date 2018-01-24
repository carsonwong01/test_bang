define([ 'text!indexTemplate/supportOrderReturn.html',
		'commonTool/validator','Lib/native/weixin'], function(supportOrderReturn,Validator,wx) {
	var supportOrderReturnView = DMJS.DMJSView.extend({
		id : 'supportOrderReturnView',
		name : 'supportOrderReturnView',
		tagName : 'div',
		className : "",
		
		events : {
			
		},
		data:{
			backid:"",//回报id
			maxBack:0,//回报上限
			money:0,//回报支持金额
			selected:-2,
			clickTag:0,//点击次数
		},
		init : function(options) {
			_.extend(this, options);
			
			DMJS.backUrl = window.location.hash.substr(1);
		},
		render : function() {
			var self = this;
			if(location.href.indexOf("?#")==-1){
				location.href=location.origin+location.pathname+"?#index/index/supportOrderReturn/"+self.proid+'/'+self.isNeddAddr;
			}
			self.proReturn();
			return this;
		},
		getProtocolTitle:function(){
			var self=this;
			self.controller.commonModel.clauseList({
				"data":{'id':3},
                'cancelLightbox':false,
    			"noCache":true,
    			"success":function(response){
    				$(".protocal").text(response.data.list[0].protocolTitle);
    				$('#autid').attr('title',"请阅读"+response.data.list[0].protocolTitle);
    			}
			});
		},
		loadNewInfo:function(){//渲染选择收货地址
			var self = this;
			if(DMJS.selAdd){
				var addHtml = '<p class="or-user-info t-3 fn-s-14">'+
					   '<span class="pd-r-5">'+DMJS.selAdd.userName+'</span>'+
					   '<span class="pd-r-10">（'+DMJS.selAdd.phoneNumber+'）</span>'+
				    '</p><p class="or-place-info t-9 fn-s-12">'+DMJS.selAdd.area+DMJS.selAdd.detaileAddress+'</p>';
				$("#address").html(addHtml);
				$("#totalAmount").text((parseInt($("#retrunNum").val())*parseInt(self.data.money)).toFixed(2))
			}
		},
		turnRememberRido: function(e) {
			if ($("#autid").is(":checked")) {
				$("#autid").removeAttr("checked");
			} else {
				$("#autid").attr("checked", true);
			}
		},
		agreement:function(){//协议
			var self = this;
			self.noDestroy=true;
			DMJS.router.navigate("other/Message/agreement/3", true);
		},
		count :function(type){ //回报数量加减
			var self = this;
			var day = parseInt($("#retrunNums").text());
			if(type=="add"){
				if(day < self.data.maxBack || self.data.maxBack < 0){//-1不限量
					day++;
				}
			}else{
			   if(day>1){
			   	 day--;
			   }
			}
			$("#retrunNum").val(day);
			$("#retrunNums").text(day);
			$("#totalAmount").text((parseInt(day)*parseInt(self.data.money)).toFixed(2));
		},
		proReturn:function(){//项目回报或者梦想清单
			var self = this;
			self.controller.indexModel.findReturnOrDreamList({
				'data': {projectId:self.proid},
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					_.extend(self.data,response.data);
					for(var i=0;i<self.data.comment.length;i++){
						if(self.data.comment[i].remainingNum != 0){//剩余数量大于1 -1则为无限大
							self.data.maxBack = self.data.comment[i].remainingNum;
							self.data.backid = self.data.comment[i].id;
							self.data.money = self.data.comment[i].amount;
							$("#totalAmount").text((1*self.data.comment[i].amount).toFixed(2));
							self.data.selected = i;//控制页面默认选中回报
							i = self.data.comment.length;//直接结束循环
						}
					}
					self.data.isNeddAddr = self.isNeddAddr;//是否需要收货地址
					if(self.data.isNeddAddr=="1"){
						self.loadAddress();
					}else{
						self.$el.html(_.template(supportOrderReturn, self.data)); // 将tpl中的内容写入到
						self.getProtocolTitle();
						self.loadScroller();
					}
				 }
			});
		},
		loadAddress:function(){//获取收货地址
			var self = this;
			self.controller.indexModel.findAddress({
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					self.data.address = response.data.list;
					if(self.data.address.length > 0){
						DMJS.selAdd = self.data.address[0];
					}
					self.$el.html(_.template(supportOrderReturn, self.data)); // 将tpl中的内容写入到
					self.getProtocolTitle();
					self.loadScroller();
				 }
			});
		},
		selectBack:function(remainingNum,money,e){//选择回报
			var self = this;
			if(remainingNum != 0){//为结束
				self.data.backid = $(e).attr("returnid");
				self.data.maxBack = remainingNum;
				self.data.money = money;
				$(e).parent().find(".icon-select").removeClass("icon-select").addClass("icon-unselect");
				$(e).find("i").removeClass("icon-unselect").addClass("icon-select");
				//重新计算总金额
				var supportNum = $("#retrunNum").val();//支持数量
				$("#totalAmount").text((parseInt(supportNum)*parseInt(money)).toFixed(2));
			}else{
				DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "对不起，您选择的回报已售罄！");
			}
		},
		selectAdd:function(){//选择收货地址
			var self = this;
			self.noDestroy=true;
			DMJS.router.navigate("index/index/getHarvestAddress", true);
		},
		weixinPay:function(){//进行支付
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
			if(!Validator.check($("#"+self.id))){return false;}
			var params = self.$el.getFormValue();
			params['projectId'] = self.proid;//项目id
			params['userIP'] = DMJS.userInfo.lastLoginIp;//用户IP
			params['returnId'] = self.data.backid;//回报/梦想ID
			params['amount'] = self.data.money * params['returnNumber'];//回报金额
			
			if(self.data.isNeddAddr=="1"&&!DMJS.selAdd){
				DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),"请选择收货地址！");
				return false;
			}else if(self.data.isNeddAddr=="1"){
				params['deliveryAddrId'] = DMJS.selAdd.addressId;//收货地址ID
			}
			if(!params['message']){
				params['message'] = "支持";
			}
			self.controller.indexModel.support({
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
		}
	});

	return supportOrderReturnView;
});
