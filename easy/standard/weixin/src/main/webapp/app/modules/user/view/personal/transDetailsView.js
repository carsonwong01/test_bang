define([ 
         'text!userTemplate/personal/transDetails.html',
         'text!userTemplate/personal/transDetailsList.html',
         'commonClass/scroll/PTRScroll',
         ], function(transDetails,transDetailsList,PTRScroll) {
	var transDetailsView = DMJS.DMJSView.extend({
		id : 'transDetailsView',
		name : 'transDetailsView',
		tagName : 'div',
		className : "",
		events : {
			'tap #postDet': 'postDet',//提现，提现手续费
		},
		init : function(options) {
			var obj = {
					page: {
						pageIndex: 1,
						pageSize: 10,
						isOver: false,
						type:''
					}
			};
			_.extend(this, options,obj);
		},
		data:{
			pageResult:'',
			ymTime : "", //保存当前页最后一个年月日
		},
		render : function() {
			var self = this;
			self.$el.html(_.template(transDetails,self));
			self.loadTransDetailsContent(self.page);
			return this;
		},
	    loadTransDetailsContent:function(page,callBack){
	    	var self=this;
	    	if (page.isOver) {
				callBack && callBack();
				return;
			}
        	var __call=function()
        	{
            	var dom=self.$el.find(".trans-details-con")[0];
         		if(!self.data.pageResult.hasNextPage){
         			if(self.data.pageResult.list.length==0){
         				dom.innerHTML='<div class="ub fn-s-14 ub-pc ub-ac mg-t-10">当前没有交易明细数据!</div>';
         			}
         			self.scroller.disablePullUpToLoadMore();
    				return; 
    			}else if(page.isOver){
    				return self.scroller.disablePullUpToLoadMore();
    			}else{
    				return self.scroller.enablePullUpToLoadMore();
    			}
            			
            }
			self.controller.userModel.findTradeList({ //获取交易明细
				'data': {
					"reqPageNum":self.page.pageIndex,
					"maxResults":self.page.pageSize
				 },
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					 var $dom=self.$el.find(".trans-details-con");
				     self.data.pageResult = response.data.pageResult;
				     var length = self.data.pageResult.list.length;
			         if(page.pageIndex == 1){
			        	 self.data.pageResult.yearMonth = "";
			        	 $dom.html(_.template(transDetailsList,self.data.pageResult));
			         }else{
			        	 self.data.pageResult.yearMonth = self.data.ymTime;
			        	 $dom.append(_.template(transDetailsList,self.data.pageResult));
			         }
			         
			         if(length > 0){
		        		 self.data.ymTime = self.data.pageResult.list[length-1].yearMonth;
		        	 }

			         page.pageIndex++;
			         if(!response.data.pageResult.hasNextPage)
				     {
	                    page.isOver=true;
	                    DMJS.CommonTools.popTip("已经加载完所有数据！");
	                 }
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
	     
	     //加载滚动条
         loadListScroller: function(page){
             var self = this; 
             var wraper = $("#"+self.id); 
             if(!self.scroller){
             	wraper.height(wrapView.height);
             	self.scroller = new PTRScroll(wraper[0], {
             		pullUpToLoadMore: !page.isOver,
					hideScrollbar: true,
					//pullDownToRefresh:false,
					refreshContent: function(done) {
						page.pageIndex = 1;
						page.isOver = false;
						self.loadTransDetailsContent(page, done);
					},
					loadMoreContent: function(done) {
						self.loadTransDetailsContent(page, done);
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
         },
         postDet:function(e){
        	 var self = this;
        	 $dom = $(e.target);
        	 if(!$dom.hasClass("#postDet")){
        		 $dom = $dom.parents('#postDet')
        	 }
        	 var postData = {
        		 tradeAmount:"",
        		 tradeType:"",
        		 dateCreate:"",
        	 };
        	 postData.tradeAmount = $dom.attr('tradeAmount');
        	 postData.tradeType = $dom.attr('tradeType');
        	 postData.dateCreate = $dom.attr('dateCreate');
        	 var dateCreate = new Date(postData.dateCreate).getTime();
        	 DMJS.router.navigate("user/personal/shippingDetails/"+postData.tradeAmount+"/"+postData.tradeType+"/"+dateCreate, true); 
        	 
         },
	});
		
	return transDetailsView;
});