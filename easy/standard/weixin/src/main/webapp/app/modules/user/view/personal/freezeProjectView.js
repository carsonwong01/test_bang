define([ 'text!userTemplate/personal/freezeProject.html',
         'text!userTemplate/personal/freezeProjectList.html',
         'commonClass/scroll/PTRScroll',
		'commonTool/validator'], function(freezeProject,freezeProjectList,PTRScroll,Validator) {
	var freezeProjectView = DMJS.DMJSView.extend({
		id : 'freezeProjectView',
		name : 'freezeProjectView',
		tagName : 'div',
		className : "freezeProjectView",
		events : {
			
		},
		init : function(options) {
			var self=this;
			var obj = {
					page: {
						pageIndex: 1,
						pageSize:5,
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
			self.$el.html(_.template(freezeProject, self)); // 将tpl中的内容写入到
			$("#freeBalance").text(self.freeBalance);
			self.findFreezePro(self.page);
			return this;
		},
		
		findFreezePro:function(page,callBack){
			var self=this;
			if (page.isOver) {
				callBack && callBack();
				return;
			}
        	var __call=function(){
                    	var dom=self.$el.find("#freezeList")[0];
                 		if(!self.data.pageResult.hasNextPage){
                 			if(self.data.pageResult.list.length==0){
                 				dom.innerHTML='<div class="ub fn-s-14 ub-pc ub-ac mg-t-10">当前没有交易记录!</div>';
                 			}
            				return self.scroller.disablePullUpToLoadMore();
            			}else if(page.isOver){
            				return self.scroller.disablePullUpToLoadMore();
            			}else{
            				return self.scroller.enablePullUpToLoadMore();
            			}
            			
            }
        	
        	self.controller.userModel.findFreezePro({
        		'data':{
        			reqPageNum:page.pageIndex,
        			maxResults:page.pageSize
        		},
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					var $dom=self.$el.find("#freezeList");
				   if(!response.data.pageResult.hasNextPage)
				     {
	                    page.isOver=true;
	                    DMJS.CommonTools.popTip("已经加载完所有数据！");
	                 }
				     self.data.pageResult = response.data.pageResult;
			         if(page.pageIndex == 1){
			        	 $dom.html(_.template(freezeProjectList,self.data.pageResult));
			         }else{
			        	 $dom.append(_.template(freezeProjectList,self.data.pageResult));
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
                    	self.findFreezePro(page,done);
                    },
                    loadMoreContent: function(done){
                    	self.findFreezePro(page,done);
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
		
	return freezeProjectView;
});
