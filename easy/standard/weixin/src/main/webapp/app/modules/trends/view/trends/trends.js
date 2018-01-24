define([ 'text!trendsTemplate/trendsTemplate.html',
		'text!trendsTemplate/trendsList.html',
		'text!trendsTemplate/comment.html',
		'commonClass/scroll/PTRScroll',
		'commonTool/slide',
		'commonTool/validator'], function(trendsTemplate,trendsList,comment,PTRScroll,Slide,Validator) {
	var trendsView = DMJS.DMJSView.extend({
		id : 'trendsviewContent',
		name : 'trendsviewContent',
		tagName : 'div',
		className : "trendsviewContent",
		events : {
			'tap #infomation_title' :'switchs',
			"tap .LookImg" : "LookImg",//查看图
			'tap .comment-control-action': 'commentControl',
			'tap .icon-message':'showComment',//评论
			'tap .commPerson':'replyComment',//回复评论
		},
	init : function(options) {
		var obj={
			page:{
	        	pageIndex:[1,1],
	        	pageSize:10,
	        	isOver:[false,false],
	        	ids:[0,1],
	        	type:0,
	        }};
			_.extend(this, options,obj);
		},
		
	data:{
		pageResult:'',
		commentResult:''
	},
		render : function() {
			var self = this;
			this.$el.html(_.template(trendsTemplate, self)); // 将tpl中的内容写入到
			self.loadTrendDates(self.page);
			self.loadListScroller(self.page);
			return this;
		},
		 switchs:function(e){
        	var self = this;
			var $dom = $(e.target);
			var type = $dom.attr("listType");
        	var $dom = $("#information_Article").find("div[item='item" + type + "']").find("div.ListArea");
	       
				$('.JSAppointDropDown li').removeClass('active-blue');
				$($('.JSAppointDropDown li')[type]).addClass('active-blue');
				$('div[item]').addClass('hide');
	        	$('div[item=item'+type+']').removeClass('hide');
				
				if(type==self.page.type){
					return false;
				}
	        	self.page.type=type;
	        	self.page.pageIndex[type] = 1;
	        	if(self.page.type==0){
	        		self.loadTrendDates.apply(self,[self.page]);
	        	}else{
	        		self.loadCommentDates.apply(self,[self.page]);
	        	}
	        
        },
        LookImg:function(e){//查看大图
        	var self = this;
        	var imgUrls = [];
        	var $dom = $(e.target);
        	if($dom.hasClass("LookImg")){
        		var beginUrl = $dom.attr("src");//当前点击图片的链接
        	}else{
        		var beginUrl = $dom.attr("src");//当前点击图片的链接
        		$dom = $dom.parent();
        	}
        	
        	var imgs = $dom.parent().find("img");
        	if(imgs.length > 0){
        		for(var i = 0;i < imgs.length;i++){
        			imgUrls.push($(imgs[i]).attr('src'));
        		}
        	}
        	DMJS.CommonTools.lookBigPicture(beginUrl,imgUrls);
        },
        
        
        //请求项目动态数据
        loadTrendDates:function(page,callBack){
        	var self=this;
        	var type=page.type;
        	if (page.isOver[type]) {
				callBack && callBack();
				return;
			}
        	
        	var __call=function(){
            	var dom=self.$el.find("div[item='item"+page.ids[type]+"']").find(".ListArea")[0];
         		var len=dom.children.length;
         		if(!self.data.pageResult.hasNextPage){
		     		if(self.data.pageResult.list.length==0){
		     				dom.innerHTML='<div class="ub fn-s-14 ub-pc ub-ac mg-t-10">当前没有数据!</div>';
		     			}
		    			return self.scroller[type].disablePullUpToLoadMore();
        			}else if(page.isOver[type]){
        				return self.scroller[type].disablePullUpToLoadMore();
        			}else{
        				return self.scroller[type].enablePullUpToLoadMore();
        			}
                };
        if(DMJS.userInfo){
	        	self.controller.trendsModel.projectDynamic({
	        		'data':{
	        			reqPageNum:page.pageIndex[page.type],
	        			maxResults:page.pageSize,
	        			userId:DMJS.userInfo.userId
	        		},
	        		'cancelLightbox':true,
		        	"noCache":true,
					"success":function(response){
						var $dom=self.$el.find("div[item='item"+page.ids[type]+"']").find(".ListArea");
						self.data.pageResult=response.data.pageResult;
						 if(!response.data.pageResult.hasNextPage){
							 page.isOver[type]=true;
							 DMJS.CommonTools.popTip("已经加载完所有数据！");
		                    }
		                     if(page.pageIndex[type] == 1){
		                    	 $dom.html(_.template(trendsList,response.data.pageResult));
		                     }else{
		                    	 $dom.append(_.template(trendsList,response.data.pageResult));
		                     }
		                     page.pageIndex[type]++;
				},
				"complete":function(){
					if (!!callBack) {
						callBack();
					}
					self.loadListScroller.apply(self,[self.page]);
					__call();
					}
	        	});
        	
           }else{
        	   DMJS.router.navigate('user/personal/login', true);
           }
        },
        
        //请求评论数据
        loadCommentDates:function(page,callBack){
        	var self=this;
        	var type=page.type;
        	if (page.isOver[type]) {
				callBack && callBack();
				return;
			}
        	var __call=function(){
        		var dom=self.$el.find("div[item='item"+page.ids[type]+"']").find(".ListArea")[0];
         		var len=dom.children.length;
         		if(!self.data.commentResult.hasNextPage){
         			if(self.data.pageResult.list.length==0){
	     				dom.innerHTML='<div class="ub fn-s-14 ub-pc ub-ac mg-t-10">当前没有评论!</div>';
	     			}
	    			return self.scroller[type].disablePullUpToLoadMore();
    			}else if(page.isOver[type]){
    				return self.scroller[type].disablePullUpToLoadMore();
    			}else{
    				return self.scroller[type].enablePullUpToLoadMore();
    			}
                };
        if(DMJS.userInfo){
	        	self.controller.trendsModel.projectCommentList({
	        		'data':{
	        			reqPageNum:page.pageIndex[page.type],
	        			maxResults:5,
	        			userId:DMJS.userInfo.userId
	        		},
	        		'cancelLightbox':true,
		        	"noCache":true,
					"success":function(response){
						var $dom=self.$el.find("div[item='item"+page.ids[type]+"']").find(".ListArea");
						self.data.commentResult=response.data.pageResult;
						 if(!response.data.pageResult.hasNextPage){
							 page.isOver[type]=true;
							 DMJS.CommonTools.popTip("已经加载完所有数据！");
		                    }
		                     if(page.pageIndex[type] == 1){
		                    	 $dom.html(_.template(comment,response.data.pageResult));
		                     }else{
		                    	 $dom.append(_.template(comment,response.data.pageResult));
		                     }
		                     page.pageIndex[type]++;
				},
				"complete":function(){
					if (!!callBack) {
						callBack();
					}
					self.loadListScroller.apply(self,[self.page]);
					__call();
					}
	        	});
        	
           }else{
        	   DMJS.router.navigate('user/personal/login', true);
           }
        },
        
      //点击评论图标进行评论
		showComment:function(e){
			var self=this;
			if(DMJS.userInfo){
				var orderId=$(e.target).parents().find("div.support-item-info").attr("orderId");
				var type='pl';
				wrapView.FlipPrompt.confirm({
	                title: '评论'+$(e.target).parent().next().find(".nickName").text(),
	                content:"<textarea maxlength='50' id='commentContent' placeholder='最多可输入50字评论' class='border-all width100 hei-60 pd-all-5'></textarea>",
	                FBntconfirm: "取消",
	                FBntcancel: "评论",
	                FBntCancelColor: "pop_btn_orange",
	                autoCloseBg:'true'
	            }, function() {
	            	
	            }, function() {
	            	if($("#commentContent").val()==''){
	            		DMJS.CommonTools.alertCommon("温馨提示", "评论内容不能为空！");
	            	}else{
	            		//评论参数（1.订单id,2.点击要回复人的ID 3.评论类型。4.获取点击的元素）
	                	self.toComment(orderId,'',type,$(e.target));
	            	}
	            	
	            });
			}else{
				wrapView.FlipPrompt.confirm({
	                title: '温馨提示',
	                content:"<span class='ub ub-pc'>请先登录再评论！</span>",
	                FBntconfirm: "取消",
	                FBntcancel: "确认",
	                FBntCancelColor: "pop_btn_orange",
	                autoCloseBg:'true'
	            }, function() {
	            	
	            }, function() {
	            	DMJS.router.navigate('user/personal/login', true);
	            });
			}
		},
		
		toComment:function(orderId,commPersomId,type,target){
			var self=this;
			var data={
					orderId:'',
					replyId:'',
					commentContent:''
			};
			if(type=='pl'){
				data.orderId=orderId;
				data.replyId='';
				data.commentContent=$("#commentContent").val();
			}else if(type=='hf'){
				data.orderId=orderId;
				data.replyId=commPersomId;
				data.commentContent=$("#replyContent").val();
			}
			self.controller.trendsModel.insertComment({
				'data':data,
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					if(type=='pl'){
						var $dom=target.parents(".commentMessage").siblings(".support-message-con").find(".support-comment-con").children();
						var newComment=$("<div class='comment-con fn-s-12 t-6' commentid='"+response.data.comment.id+"'>" +
								"<div class='show comm-more'>"+
									"<p class='comm-item'>" +
										"<span class='comm-blue commPerson' commPersonId='"+response.data.comment.userId+"'>"+response.data.comment.nickName+":</span>" +
										"<span class='t-6'>"+response.data.comment.content+"</span>" +
									"</p>"+
								  "</div>"+
							  "</div>");
						if($dom && $dom.length>2){
							$dom.last().before(newComment);
						}else{
							if($dom.length==0){
								var $domNew = target.parents(".commentMessage").siblings(".support-message-con");
								var $sccDiv =$("<div class='support-comment-con'><div></div></div>");
								$domNew.append($sccDiv);
								$domNew.find(".support-comment-con").children().last().before(newComment);
								
							}else{
								$dom.last().before(newComment);
							}
							$dom=target.parents(".commentMessage").siblings(".support-message-con").find(".support-comment-con").children().last();
						}
						$dom.siblings().children(".comm-more").removeClass("hide").addClass("show");
						$dom.children(".control-con").text("收起");
						$dom.children(".icon-down").removeClass('icon-down').addClass('icon-up');
						self.scroller[1].refresh();
						
					}else if(type=='hf'){
						var $ele=target.parent().parent();
						
							var replyComment=$("<div class='comm-more show' commentid='"+response.data.comment.id+"'>"+
									"<p class='comm-item'>" +
									"<span class='comm-blue commPerson'  commPersonId='"+response.data.comment.userId+"'>"+response.data.comment.nickName+"</span>回复<span class='comm-blue commPerson' commPersonId='"+response.data.comment.replyUserId+"'>"+response.data.comment.replyNickName+"：</span>" +
									"<span>"+response.data.comment.content+"</span>" +
									"</p>"+				            			
								"</div>");	
							$ele.after(replyComment);
						
						$ele.removeClass("hide").addClass("show");
						$ele.parents(".comment-con").last().children(".control-con").text("收起");
						$ele.parents(".comment-con").last().children(".icon-down").removeClass('icon-down').addClass('icon-up');
						self.scroller[1].refresh();
					}
				}
			});
		},
		
		replyComment:function(e){
			var self=this;
			var orderId=$(e.target).parents().find("div.support-item-info").attr("orderId");
			var commPersomId=$(e.target).attr("commPersonId");
			var type='hf';
			
			if(DMJS.userInfo){ 
			   if(DMJS.userInfo.userId == commPersomId){//自己不能回复自己的
				   DMJS.CommonTools.alertCommon("温馨提示", "不能回复自己的评论！");
			   }else{
				   wrapView.FlipPrompt.confirm({
		                title: '回复'+$(e.target).text(),
		                content:"<textarea maxlength='50' id='replyContent' placeholder='最多可输入50字评论' class='border-all width100 hei-60 pd-all-5'></textarea>",
		                FBntconfirm: "取消",
		                FBntcancel: "回复",
		                FBntCancelColor: "pop_btn_orange",
		                autoCloseBg:'true'
		            }, function() {
		            	
		            }, function() {
		            	if($("#replyContent").val()==''){
		            		DMJS.CommonTools.alertCommon("温馨提示", "回复内容不能为空！");
		            	}else{
		            		//评论参数（1.订单id,2.点击要回复人的ID 3.评论类型。4.获取点击的元素）
			            	self.toComment(orderId,commPersomId,type,$(e.target));
		            	}
		            	
		            });
			   }
			}else{
				wrapView.FlipPrompt.confirm({
	                title: '温馨提示',
	                content:"<span class='ub ub-pc'>请先登录再评论！</span>",
	                FBntconfirm: "取消",
	                FBntcancel: "确认",
	                FBntCancelColor: "pop_btn_orange",
	                autoCloseBg:'true'
	            }, function() {
	            	
	            }, function() {
	            	DMJS.router.navigate('user/personal/login', true);
	            });
			}

		},
        
        commentControl : function(e){   //支持内容展开控制
			var self = this;
			var $dom=$(e.target);
			var trendsClass = '.support-comment-con .comment-control-action';
			var trendsMore = '.comm-more';
			var trendsConClass= '.control-con';
			var trendsIcon = '.control-icon';
			var textConUp = "收起";
			var textConDown = "展开";
			self.conControl($dom,trendsClass,trendsMore,trendsConClass,textConUp,textConDown,trendsIcon);
			self.scroller[1].refresh();
		},
		
		
		conControl:function(dom,conClass,more,textConClass,textConUp,textConDown,Icon){  //展开收起控制函数
			if(!dom.is(conClass)){
                dom=dom.parents(conClass);
            }
            $moreContent = dom.parent().find(more);
            if($moreContent.hasClass('hide')){
            	$moreContent.removeClass('hide').addClass('show');
            	dom.find(textConClass).text(textConUp);
                dom.find(Icon).removeClass('icon-down').addClass('icon-up');
            }else{
            	$moreContent.removeClass('show').addClass('hide');
            	dom.find(textConClass).text(textConDown);
                dom.find(Icon).removeClass('icon-up').addClass('icon-down');
            }
		},
		
		
		
        loadListScroller: function(page){
         	var type=page.type;
            var self = this; 
            var wraper = self.$el.find("div[item='item"+page.ids[type]+"']"); 
            !self.scroller&&(self.scroller={});
            if(!self.scroller[type]){
            	 wraper.height(wrapView.height-$("#infomation_title").height()-$("#footer").height());
            	self.scroller[type] = new PTRScroll(wraper[0], {
            		pullUpToLoadMore:!page.isOver[type],
                    hideScrollbar: true,
                    refreshContent: function(done){
                    	page.pageIndex[type]=1;
                    	page.isOver[type]=false;
                    	if(type==0){
                    		self.loadTrendDates(page,done);
                    	}else{
                    		self.loadCommentDates(page,done);
                    	}
                    	
                    },
                    loadMoreContent: function(done){
                    	if(type==0){
                    		self.loadTrendDates(page,done);
                    	}else{
                    		self.loadCommentDates(page,done);
                    	}
                    }
                },true);
            }
            else{
            	if(page.isOver[type]){
                	self.scroller[type].disablePullUpToLoadMore();
            	}else{
            		self.scroller[type].enablePullUpToLoadMore();
            	}
        }
        },
		
		});

	return trendsView;
});
