define([ 'text!userTemplate/payment/withdraw.html',
		'commonTool/validator'], function(withdraw,Validator) {
	var withdrawView = DMJS.DMJSView.extend({
		id : 'withdrawView',
		name : 'withdrawView',
		tagName : 'div',
		className : "withdrawView",
		events : {
			'tap .allProposed':'allProposed',
			'input input[name="amount"]':'calculateFees',
			'tap #toWidthdraw':'toWidthdraw',
			'tap .myBank':'chooseBank',
			'tap .helpImg':'lookHelp'
		},
		init : function(options) {
			_.extend(this, options);
		},
		data:{
			txRate:'',
			minWithdraw:'',
    		maxWithdraw:'',
    		serviceNumber:'',
    		availBalance:DMJS.userInfo.availableAmount
		},
		render : function() {
			var self = this;
			self.getBankList();
			self.feet(0);
			return this;
		},
		lookHelp:function(){
			var self=this;
			DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "<span class='tx-l'>提现费用为提现金额的"+self.data.txRate+"%，该费用为项目服务费与第三方支付接口费用，从每笔提现金额中支出</span>",function(){});
		},
		
		getBankList:function(){
			var self=this;
			self.controller.userModel.getBankList({
				'cancelLightbox':true,
	        	"noCache":true,
	        	"success":function(response){
	        		self.bankList=response.data.list;
	        		self.$el.html(_.template(withdraw, self)); 
	        		if($(".myBank").length>1){
	        			$(".myBank").first().removeClass("hide").addClass("show").addClass("selected");
	        		}else{
	        			$(".myBank").first().removeClass("hide").addClass("selected");
	        		}
	        		self.loadScroller();
				}
			})
		},
		
		chooseBank:function(e){
			var self=this;
			if($(e.target).hasClass("selectBank")){
				$(e.target).parents(".myBank").siblings('.myBank').removeClass("hide").addClass("show");
				$(e.target).parents(".myBank").siblings('.myBank').find(".selectBank").remove();
			}else{
				$(e.target).parents('.myBank').addClass('show selected');
				$(e.target).parents('.myBank').siblings(".myBank").addClass("hide").removeClass("selected");
				if( ! $(e.target).parents('.myBank').children().last().find(".selectBank")[0]){
					$(e.target).parents('.myBank').children().last().append("<span class='selectBank pd-b-10'></span>");
				}
				$(".cardMessage").prepend($(e.target).parents('.myBank'));
			}
			
		},
		
		allProposed:function(){
			var self=this;
			$("#amount").val(self.data.availBalance);
			self.feet(self.data.availBalance);
		},
		
	    calculateFees:function(e){
				var self=this;
				var amount;
				var __val=$(e.target).val();
				__val=__val.replace(/[^\d\.]/g,"").replace(/\.{2,}/,".").replace(/^[0|\.]/g,'');
	  	   		if(__val.split(".").length>=2){
	      		var __vals=__val.split(".");
	      		var __vals_last=__vals[0];
	      		var xhd=__vals[1];
	      		__val=__vals_last+"."+xhd.substring(0,2)
	  	  		 }
	             amount=__val*1;
	           	 $(e.target).val(__val);
	           	 if(amount<=0){
	           		$("#paySum").html('0.00');//实际金额
	           	    $("#txsxf").html('0.00');
	           	    return;
	           	 }
	           	 self.feet(amount);
	            
	        },
	        
	        feet:function(amount){
	        	var self=this;
	        	self.controller.userModel.findWithdrawSet({
	        		'cancelLightbox':true,
		        	"noCache":true,
		        	"success":function(response){
		        		var txRate=response.data.withdrawRate,
		        			txMaxfee=response.data.withdrawHighest,
		        			minWithdraw=response.data.minWithdraw,
		        			maxWithdraw=response.data.maxWithdraw;
		        		self.data.txRate=response.data.withdrawRate;
		        		self.data.minWithdraw=response.data.minWithdraw;
		        		self.data.maxWithdraw=response.data.maxWithdraw;
		        			
		        			var txsxf=amount*(txRate/100)>txMaxfee?txMaxfee:amount*(txRate/100);
			        		$("#txsxf").text(txsxf.toFixed(2));
			        		$("#paySum").text((amount-txsxf).toFixed(2));
		        	}
	        	
	        	});
	        },
	        
	        toWidthdraw:function(){
	        	var self=this;
	        	var totalAmount=$("#amount").val();
	        	if(totalAmount > self.data.availBalance){
	        		DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "提现金额超过可用金额，请重新提现！");
	        		return;
	        	}else if(totalAmount > self.data.maxWithdraw){
	        		DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "不符合最高提现限制"+self.data.maxWithdraw+"元，请重新提现！");
	        		return;
	        	}else if(totalAmount < self.data.minWithdraw){
	        		DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "不符合最低提现限制"+self.data.minWithdraw+"元，请重新提现！");
	        		return;
	        	}
	        	
	        	self.controller.userModel.checkSettingTradePwd({
	        		'cancelLightbox':true,
		        	"noCache":true,
		        	"success":function(response){
		        		//检查是否设置过提现密码，没有设置的话提示去设置
		        		self.controller.commonModel.findCache({
		    	        	'data':{
		    	        		key:"SETTING_TRADE_PASSWORD"
		    	        	},
		    	        	'cancelLightbox':true,
		    	        	"noCache":true,
		    				"success":function(response){
		    					if(response.data){
		    						//如果后台常量设置需要提现密码，输入密码后提现
		    						wrapView.FlipPrompt.confirm({
		    			                title: '请输入提现密码',
		    			                content:"<input type='password' maxlength='6' id='withdrawPassword' class='border-all width100 line-h-25 tx-c'/>",
		    			                FBntconfirm: "取消",
		    			                FBntcancel: "确定",
		    			                FBntCancelColor: "pop_btn_orange",
		    			                autoCloseBg:'true'
		    			            }, function() {
		    			            	
		    			            }, function() {
		    			            	self.verifyPassword();
		    			            });
		    						
		    					}else{
		    						//如果后台常量设置不需要提现密码直接提现
		    						self.insertWithdraw();
		    					}
		    				}
		    	        });
		        	},
		        	"error":function(response){
		        		wrapView.FlipPrompt.confirm({
			                title: '首次提现请先设置提现密码',
			                content:"<input type='password' maxlength='6' id='setPassword' placeholder='请设置提现密码' class='border-all width100 line-h-25'/>" +
			                		"<br/><br/><input type='password' maxlength='6' id='setPasswordOnce' placeholder='请再次输入提现密码' class='border-all width100 line-h-25'/>",
			                FBntconfirm: "取消",
			                FBntcancel: "确定",
			                FBntCancelColor: "pop_btn_orange",
			                autoCloseBg:'true'
			            }, function() {
			            	
			            }, function() {
			            	self.checkPassword();
			            });
		        	}
	        	});
	        },
	        
	        checkPassword:function(){
	        	var self=this;
				var reg=/^\d{6}$/;
				if(reg.test($('#setPassword').val()) && reg.test($('#setPasswordOnce').val())){
					
					if($('#setPassword').val() == $('#setPasswordOnce').val()){
						self.controller.userModel.updateTradePwd({
							'data':{
								newTradePassword:$('#setPasswordOnce').val()
							},
							'cancelLightbox':true,
				        	"noCache":true,
							"success":function(response){
								//设置成功后直接提现
								self.insertWithdraw();
							}
						});
					}else{
						 DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),'两次密码输入不一致，请重试！'); 
					}
					
				}else{
					DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),'请输入6位数字密码！'); 
				}
			
	        },
	        
	        verifyPassword:function(){
	        	var self=this;
	        	self.controller.userModel.checkTradePassword({
	        		'data':{
	        			tradePassword:$('#withdrawPassword').val()
	        		},
		        	'cancelLightbox':true,
		        	"noCache":true,
		        	"success":function(response){
		        		self.insertWithdraw();
		        	}
	        	});
	        },
	        
	        insertWithdraw:function(){
	        	var self=this;
	        	self.controller.userModel.insertWithdraw({
	        		'data':{
	        			bankCardId:$(".selected").attr("cardId"),
	        			withdrawAmt:$("#amount").val()
	        		},
	        		'cancelLightbox':true,
		        	"noCache":true,
		        	"success":function(response){
		        		DMJS.CommonTools.alertCommon("申请提现成功!",
		        				"<div class='width100 pd-all-10 fn-s-14 fn-c'>提现金额:￥"+$("#amount").val()+"元</div>" +
		        				"<div class='width100 pd-all-10 fn-s-14 fn-c'>预计到账金额:￥"+$("#paySum").text()+"元</div>" +
		        				"<div class='pd-lr-10 fn-c'><span>温馨提示：</span><br/><span>如果您在10个工作日后还没有收到提现的金额，请联系客服:"+DMJS.userInfo.serviceNumber+"</span></div>",
		        			function(){
		        			DMJS.router.navigate("user/personal/myAccount",true);
		        		});
		        			
		        	}
	        	});
	        }
	});
		
	return withdrawView;
});
