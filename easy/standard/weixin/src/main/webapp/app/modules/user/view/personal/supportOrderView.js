define([ 'text!userTemplate/personal/supportOrder.html',
         'text!userTemplate/personal/supportOrderList.html',
         'commonClass/scroll/PTRScroll'], 
		function(supportOrder,supportOrderList,PTRScroll) {
	var supportOrderView = DMJS.DMJSView.extend({
		id : 'supportOrderView',
		name : 'supportOrderView',
		tagName : 'div',
		className : "supportOrderView",
		events : {
		     //'tap .JSAppointDropDown': 'JSAppointDropDown',
		},
		init : function(options) {
			var obj = {
				page: {
					pageIndex: 1,
					pageSize: 10,
					isOver: false,
				}
			};
			_.extend(this, options,obj);
		},
		data:{
			statResult:'',//总计
			pageResult:'' //订单支持记录
		},
		render : function() {
			var self = this;
			self.$el.html(_.template(supportOrder,self));
			self.loadSupportListContent(self.page);
			return this;
		},
	    loadSupportListContent:function(page,callBack){
	    	var self=this;
	    	if (page.isOver) {
				callBack && callBack();
				return;
			}
        	var __call=function()
        	{
            	var dom=self.$el.find("#support-order")[0];
         		if(!self.data.pageResult.hasNextPage){
         			if(self.data.pageResult.list.length==0){
         				dom.innerHTML='<div class="ub fn-s-14 ub-pc ub-ac mg-t-10">当前没有订单支持记录!</div>';
         			}
    				return self.scroller.disablePullUpToLoadMore();
    			}else if(page.isOver){
    				return self.scroller.disablePullUpToLoadMore();
    			}else{
    				return self.scroller.enablePullUpToLoadMore();
    			}
            			
            }
			self.controller.userModel.prosupportList({ //支持订单记录
				'data': {
					"reqPageNum":self.page.pageIndex,
					"maxResults":self.page.pageSize,
					"projectId":self.projectId,
					"type":"1" //查询总计
				 },
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					 self.data.statResult = response.data.statResult;
				     self.data.pageResult = response.data.pageResult;
				     $('.supportCount').text(self.data.statResult.supportCount);
				     $('.supportAmtTotal').text(self.data.statResult.supportAmtTotal)
				     var $dom=self.$el.find("#support-order");
			         if(page.pageIndex == 1){
			        	 $dom.html(_.template(supportOrderList,self.data.pageResult));
			         }else{
			        	 $dom.append(_.template(supportOrderList,self.data.pageResult));
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
					pullDownToRefresh:false,
					refreshContent: function(done) {
						page.pageIndex = 1;
						page.isOver = false;
						self.loadSupportListContent(page, done);
					},
					loadMoreContent: function(done) {
						self.loadSupportListContent(page, done);
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
		
	return supportOrderView;
});