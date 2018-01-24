define([ 'text!userTemplate/personal/myAttention.html',
         'text!userTemplate/personal/myAttentionList.html',
         'commonClass/scroll/PTRScroll'
		], function(myAttention,myAttentionList,PTRScroll) {
	var myAttentionView = DMJS.DMJSView.extend({
		id : 'myAttentionView',
		name : 'myAttentionView',
		tagName : 'div',
		className : "myAttentionView",
		events : {
			'tap .attentionProject':'attentionProject',
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
			this.$el.html(_.template(myAttention, self)); // 将tpl中的内容写入到 this.el 元素中  
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
                    	var dom=self.$el.find("#attention")[0];
                 		if(!self.data.pageResult.hasNextPage){
                 			if(self.data.pageResult.list.length==0){
                 				dom.innerHTML='<div class="ub fn-s-14 ub-pc ub-ac mg-t-10">当前没有关注的项目!</div>';
                 			}
            				return self.scroller.disablePullUpToLoadMore();
            			}else if(page.isOver/*||$('#FlipPrompt')*/){
            				return self.scroller.disablePullUpToLoadMore();
            			}else{
            				return self.scroller.enablePullUpToLoadMore();
            			}
            			
            }
        	self.controller.userModel.collectionList({
				'data':{
					reqPageNum:page.pageIndex,
        			maxResults:page.pageSize
				},
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					var $dom=self.$el.find("#attention");
				     if(!response.data.pageResult.hasNextPage)
				     {
	                    page.isOver=true;
	                    DMJS.CommonTools.popTip("已经加载完所有数据！");
	                 }
				     self.data.pageResult = response.data.pageResult;
			         if(page.pageIndex == 1){
			        	 $dom.html(_.template(myAttentionList,self.data.pageResult));
			         }else{
			        	 $dom.append(_.template(myAttentionList,self.data.pageResult));
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
        
        attentionProject:function(e){
        	var self=this;
        	var $dom=$(e.target);
        	var projectId=$dom.parents(".attentionProject").attr("projectId");
        	if($dom.hasClass("cancleAttention")){
        		wrapView.FlipPrompt.confirm({
                    title: '温馨提示',
                    content:'<span class="fn-s-15 tx-c ub ub-pc fn-c">确认取消关注此项目？</span>',
                    FBntconfirm: "取消",
                    FBntcancel: "确定",
                    FBntCancelColor: "pop_btn_orange",
                    autoCloseBg:'true'
                }, function() {
                	
                }, function() {
                	self.controller.userModel.cancelCollect({
                		'data':{
        					id:projectId
        				},
        				'cancelLightbox':true,
        	        	"noCache":true,
        				"success":function(response){
        					self.reflush();
        				}
                	});
                });
        	}else{
        		DMJS.router.navigate("index/index/projectDetails/"+projectId,true);
        	}
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
