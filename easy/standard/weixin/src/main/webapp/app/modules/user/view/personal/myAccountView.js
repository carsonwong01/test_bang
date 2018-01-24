define([ 'text!userTemplate/personal/myAccount.html',
         'text!userTemplate/personal/myAccountList.html',
         'commonClass/scroll/PTRScroll',
		'commonTool/validator'], function(myAccount,myAccountList,PTRScroll,Validator) {
	var myAccountView = DMJS.DMJSView.extend({
		id : 'myAccountView',
		name : 'myAccountView',
		tagName : 'div',
		className : "myAccountView",
		events : {
			'change #transStatus':'transStatus',
			'tap #toFreeze':'toFreeze'
		},
		init : function(options) {
			var self=this;
			var obj = {
					page: {
						pageIndex: 1,
						pageSize: 10,
						isOver: false,
						status:''
					}
				};
			_.extend(self, options, obj);
		},
		data:{
			pageResult:'',
			availBalance:'',
			ymTime : "" //保存当前页最后一个年月日
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(myAccount, self)); // 将tpl中的内容写入到
			//查询账户金额
			self.getMyAmount();
			//查询交易记录
			self.transRecords(self.page);
			return this;
		},
		transStatus:function(){
			var self=this;
			var status=$("#transStatus").val();
			self.page.status=status;
			self.page.pageIndex=1;
			self.page.isOver=false,
			self.transRecords(self.page);
		},
		toFreeze:function(){
			var self=this;
			DMJS.router.navigate("user/personal/freezeProject/"+$("#freezeBalance").text(), true);
		},
		
		toWithdraw:function(){
			var self=this;
			if(DMJS.userInfo.availableAmount == 0){
				DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "您的可用金额不足，无法提现!");
				return;
			}
			self.controller.userModel.getBankList({
				'cancelLightbox':true,
	        	"noCache":true,
	        	"success":function(response){
	        		if(response.data.list.length==0){
	        			wrapView.FlipPrompt.confirm({
	                        title: '温馨提示',
	                        content:"您还没有可用于提现的银行卡，请先添加一张银行储蓄卡!",
	                        FBntconfirm: "取消",
	                        FBntcancel: "添加银行卡",
	                        FBntCancelColor: "pop_btn_orange",
	                        autoCloseBg:'true'
	                    }, function() {
	                   	
	                    }, function() {
	                    	DMJS.router.navigate('user/payment/myBankList', true);
	                    });
	        		}else{
	        			DMJS.router.navigate('user/payment/withdraw', true);
	        		}
				}
			})
			
		},
		getMyAmount:function(page,callBack){
        	var self=this;
        	self.controller.userModel.myAmount({
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					DMJS.userInfo.availableAmount=response.data.singleResult.availableAmount;
					$("#availBalance").text(response.data.singleResult.availableAmount);
					$("#freezeBalance").text(response.data.singleResult.frozenAmount);
				}
				
			});
        },
        
        transRecords:function(page,callBack){
        	var self=this;
        	if (page.isOver) {
				callBack && callBack();
				return;
			}
        	var __call=function(){
                    	var dom=self.$el.find("#transList")[0];
                 		if(!self.data.pageResult.hasNextPage){
                 			if(self.data.pageResult.list.length==0){
                 				dom.innerHTML='<div class="ub fn-s-14 ub-pc ub-ac mg-t-10">当前没有交易记录!</div>';
                 			}
            				return self.scroller.disablePullUpToLoadMore();
            			}else if(page.isOver/*||$('#FlipPrompt')*/){
            				return self.scroller.disablePullUpToLoadMore();
            			}else{
            				return self.scroller.enablePullUpToLoadMore();
            			}
            			
            }
        	self.controller.userModel.transRecords({
        		'data':{
        			reqPageNum:page.pageIndex,
        			maxResults:page.pageSize,
        			direction:page.status
        		},
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					var $dom=self.$el.find("#transList");
				    if(!response.data.pageResult.hasNextPage)
				     {
	                    page.isOver=true;
	                    DMJS.CommonTools.popTip("已经加载完所有数据！");
	                 }
				     self.data.pageResult = response.data.pageResult;
				     var length = self.data.pageResult.list.length;
			         if(page.pageIndex == 1){
			        	 self.data.pageResult.yearMonth = "";
			        	 $dom.html(_.template(myAccountList,self.data.pageResult));
			         }else{
			        	 self.data.pageResult.yearMonth = self.data.ymTime;
			        	 $dom.append(_.template(myAccountList,self.data.pageResult));
			        	 }
			         
			         if(length > 0){
		        		 self.data.ymTime = self.data.pageResult.list[length-1].yearMonth;
		        	 }
			         page.pageIndex++;
				},
				"complete":function(){
					if (!!callBack) {
						callBack();
					}
					self.loadListScroller(self.page);
                  	__call();
                  	
                  }
			});
        },
        loadListScroller: function(page){
            var self = this; 
            var wraper = $("#"+self.id); 
            if(!self.scroller){
            	 wraper.height(wrapView.height- $("#footer").height);
            	self.scroller = new PTRScroll(wraper[0], {
            		pullUpToLoadMore:!page.isOver,
                    hideScrollbar: true,
                    pullDownToRefresh:false,
                    refreshContent: function(done){
                    	page.pageIndex=1;
                    	page.isOver=false;
                    	self.transRecords(page,done);
                    },
                    loadMoreContent: function(done){
                    	self.transRecords(page,done);
                    }
                },true);
            }
            else{
            	if(page.isOver){
                	self.scroller.disablePullUpToLoadMore();
            	}else{
            		self.scroller.enablePullUpToLoadMore();
            	}
            }
        }
	});
		
	return myAccountView;
});
