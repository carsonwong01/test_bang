define([ 'text!indexTemplate/labelPro.html',
         'text!indexTemplate/labelProList.html',
         'commonClass/scroll/PTRScroll'
		], function(labelPro,labelProList,PTRScroll) {
	var myAttentionView = DMJS.DMJSView.extend({
		id : 'myAttentionView',
		name : 'myAttentionView',
		tagName : 'div',
		className : "myAttentionView",
		events : {
		},
		init : function(options) {
			var self = this;
			var obj = {
					page: {
						pageIndex: 1,
						pageSize: 10,
						isOver: false
					}
				};
			_.extend(self, options, obj);
		},
		data:{
			pageResult:''
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(labelPro, self)); // 将tpl中的内容写入到 this.el 元素中  
			self.loadDatas(self.page);
			return this;
		},
		
		loadDatas:function(page,callBack){
        	var self=this;
        	if (page.isOver) {
				callBack && callBack();
				return;
			}
        	var __call=function()
        	{
                    	var dom=self.$el.find("#labelProList")[0];
                 		if(!self.data.pageResult.hasNextPage){
                 			if(self.data.pageResult.list.length==0){
                 				dom.innerHTML='<div class="ub fn-s-14 ub-pc ub-ac mg-t-10">当前没有项目!</div>';
                 			}
            				return self.scroller.disablePullUpToLoadMore();
            			}else if(page.isOver/*||$('#FlipPrompt')*/){
            				return self.scroller.disablePullUpToLoadMore();
            			}else{
            				return self.scroller.enablePullUpToLoadMore();
            			}
            			
            }
        	self.controller.indexModel.recommendList({
				'data':{
					reqPageNum:page.pageIndex,
        			maxResults:page.pageSize,
        			tagType:self.labelName
				},
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					var $dom=self.$el.find("#labelProList");
				     if(!response.data.pageResult.hasNextPage)
				     {
	                    page.isOver=true;
	                    DMJS.CommonTools.popTip("已经加载完所有数据！");
	                 }
				     self.data.pageResult = response.data.pageResult;
			         if(page.pageIndex == 1){
			        	 $dom.html(_.template(labelProList,self.data.pageResult));
			         }else{
			        	 $dom.append(_.template(labelProList,self.data.pageResult));
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
        loadListScroller: function(page)
        {
            var self = this; 
            var wraper = $("#"+self.id); 
            if(!self.scroller){
            	 wraper.height(wrapView.height);
            	self.scroller = new PTRScroll(wraper[0], {
            		pullUpToLoadMore:!page.isOver,
                    hideScrollbar: true,
                    refreshContent: function(done){
                    	page.pageIndex=1;
                    	page.isOver=false;
                    	self.loadDatas(page,done);
                    },
                    loadMoreContent: function(done){
                    	self.loadDatas(page,done);
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
		
	return myAttentionView;
});
