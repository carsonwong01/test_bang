define([ 'text!userTemplate/payment/myBankList.html',
		'commonTool/validator'], function(myBankList,Validator) {
	var myBankListView = DMJS.DMJSView.extend({
		id : 'myBankListView',
		name : 'myBankListView',
		tagName : 'div',
		className : "myBankListView",
		events : {
			'touchstart .JSMoveHOrs': 'start',
			'touchmove .JSMoveHOrs': 'move',
			'touchend .JSMoveHOrs': 'end',
			'tap .DeleteCard':'dele',
			'tap #addBank':'addBank'
		},
		init : function(options) {
			_.extend(this, options);
		},
		data: {
			X: 0,
			width: 0,
			$selDom:""
		},

		startX: 0,
		endX: 0,
		render : function() {
			var self = this;
			self.getBankList();
			return this;
		},
		
		getBankList:function(){
			var self=this;
			self.controller.userModel.getBankList({
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					
					self.$el.html(_.template(myBankList, response.data)); // 将tpl中的内容写入到
					self.controller.commonModel.findCache({
						'data':{
							'key':'BIND_BANK_CARD_MAX_COUNT'
							},
						'cancelLightbox':true,
			        	"noCache":true,
						"success":function(response){
							if($("#listContent > div").length == response.data){
								$("#addBank").addClass("hide");
							}
							self.loadScroller();
						}
					});
				}
			});
		},
		
		 dele:function(e){
				var self=this;
				var id=e.target.dataset.dele;
				wrapView.FlipPrompt.confirm({
					title: "温馨提示",
					content: '<span class="ub ub-pc">是否确定删除此银行卡?</span>',
					FBntconfirm: "是",
					FBntcancel: "否",
					FBntConfirmColor: "pop_btn_orange",
					autoCloseBg:"false",
				}, function() {
					self.controller.userModel.deleteBankCard({
						'data': {id:id},'cancelLightbox': false,"noCache": true,
						"success": function(response) {	
//							DMJS.navigate('user/personal/cardManage',true);
							DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "删除成功！",function(){
								self.reflush();
								
							});
						},
						'error': function(response) {
							if(response.code=="200055"){
								DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "银行卡不存在");
								self.reflush();
							}
						 }
						});
					
				}, function() {});
				
			},
		
		
		
		start:function(e){
			this.data.X=e.touches[0].clientX;
			e.preventDefault();
			e.returnValue=false;
		},
		move:function(e){
			var width=e.touches[0].clientX-this.data.X;
			console.log(width);
			this.data.width+=width;
			if(this.data.$selDom){
				this.data.$selDom.style.webkitTransform='translate(0px, 0px) scale(1) translateZ(0px)';
			}
			this.data.$selDom = e.target.parentNode;
			if($("#listContent > div").has(this.data.$selDom).length<1){
				return;
			}
			if(!$(this.data.$selDom).is("#listContent > div")){
                    this.data.$selDom=$("#listContent > div").has(this.data.$selDom)[0];
            }
			e.target.parentNode.style.webkitTransitionDuration="200ms";
			if(width>10){
				this.data.$selDom.style.webkitTransform='translate(0px, 0px) scale(1) translateZ(0px)';	
			}
				else if(this.data.width<-100){
					this.data.$selDom.style.webkitTransform='translate(-150px, 0px) scale(1) translateZ(0px)';	
			}else if(width-this.data.width>3){
				this.data.$selDom.style.webkitTransform='translate('+width+'px, 0px) scale(1) translateZ(0px)';
				//alert(e.target.parentNode.style.transform);
			}
		},
		 end:function (e) {
		 	if(this.data.X-e.changedTouches[0].clientX>100){
		 		this.data.$selDom.style.webkitTransform='translate(-150px, 0px) scale(1) translateZ(0px)';
		 	}
		 		this.data.X=0;
        		this.data.width=0;
           },
           
           addBank:function(){
        	   var self=this;
        	   self.controller.userModel.findAuthentication({
       			'cancelLightbox':true,
               	"noCache":true,
               	"success":function(response){
               		if(response.data.singleResult.auditStatus=="1"){
               			DMJS.router.navigate('user/payment/addCard',true);
               		}else{
               			wrapView.FlipPrompt.confirm({
                            title: '温馨提示',
                            content:"<span class='ub ub-pc'>添加银行卡需要先实名认证</span>",
                            FBntconfirm: "取消",
                            FBntcancel: "去认证",
                            FBntCancelColor: "pop_btn_orange",
                            autoCloseBg:'true'
                        }, function() {
                       	
                        }, function() {
                        	DMJS.router.navigate('user/personal/checkName',true);
                        });
               		}
               		
               	}
       		});
           }
      
	});
		
	return myBankListView;
});
