define([ 'text!indexTemplate/projectDetailsTemplate.html',
         'text!indexTemplate/proSupportList.html',
         'commonClass/scroll/PTRScroll',
		'commonTool/validator'], function(projectDetailsTemplate,proSupportList,PTRScroll,Validator) {
	var projectDetailsView = DMJS.DMJSView.extend({
		id : 'projectDetailsContent',
		name : 'projectDetailsContent',
		tagName : 'div',
		className : "projectDetailsContent",
		events : {
			'tap .comment-control-action': 'commentControl',
			'tap .trends-control-action': 'trendsControl',
			'tap .pro-con-control':'proDetsControl',
			'tap .icon-message':'showComment',//评论
			'tap .commPerson':'replyComment',//回复评论
			"tap .LookImg" : "LookImg",//查看图
		},
		init : function(options) {
			var obj = {
					page: {
						pageIndex: 1,
						pageSize: 10,
						isOver: false,
					}
			};
			DMJS.shareData = {
				shareUrl:window.location.href,//分享路径	
				shareTitle:'',//分享title
				shareDes:'',//分享描述
				shareImages:'',//分享图片
				qrcodeImages:'',//二维码
			};
			_.extend(this, options,obj);
		},
		render : function() {
			var self = this;
			self.loadProDetialsDatas();
			return this;
		},
		data:{
			proData:{}, //项目详情数据
		    userId:"",
		    projectStatus:"",//众筹状态
		    facTarget:"",//目标金额
		    supportAmt:"",//支持金额
		    pageResult:"",
		    shieldStatus:"",//下架状态
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
			self.controller.indexModel.insertComment({
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
						self.loadScroller();
						self.scroller.scrollToElement($dom[0],$dom.offset().left,$dom.offset().top);
						
					}else if(type=='hf'){
						var $ele=target.parent().parent();
						
							var replyComment=$("<div class='comm-more show' commentid='"+response.data.comment.id+"'>"+
									"<p class='comm-item'>" +
									"<span class='comm-blue commPerson' commPersonId='"+response.data.comment.userId+"'>"+response.data.comment.nickName+"</span>回复<span class='comm-blue commPerson' commPersonId='"+response.data.comment.replyUserId+"'>"+response.data.comment.replyNickName+"：</span>" +
									"<span>"+response.data.comment.content+"</span>" +
									"</p>"+				            			
								"</div>");	
							$ele.after(replyComment);
						
						$ele.removeClass("hide").addClass("show");
						$ele.parents(".comment-con").last().children(".control-con").text("收起");
						$ele.parents(".comment-con").last().children(".icon-down").removeClass('icon-down').addClass('icon-up');
						self.loadScroller();
						self.scroller.scrollToElement($ele[0],$ele.offset().left,$ele.offset().top);
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
		
		
		loadProDetialsDatas:function(){
			var self = this;
			if(DMJS.userInfo){
				self.data.userId = DMJS.userInfo.userId;
			}
			self.controller.indexModel.projectDetailsCon({ //获取项目详情内容
				'data': {
					projectId:self.projectId,  
				    projectNo:"",
				    userId:self.data.userId,
				},
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					self.data.proData.proDetList = response.data.singleResult;
					self.data.projectStatus = response.data.singleResult.projectStatus;
					self.data.shieldStatus = response.data.singleResult.shieldStatus;
					self.data.facTarget = response.data.singleResult.facTarget;
					self.data.supportAmt = response.data.singleResult.supportAmt;
					if(self.data.proData.proDetList.coverImgUrl){//分享图片
						DMJS.shareData.shareImages = Config.url('imgAddress')+self.data.proData.proDetList.coverImgUrl;
					}
					if(self.data.proData.proDetList.title){//分享标题
						DMJS.shareData.shareTitle = self.data.proData.proDetList.title;
					}
					if(self.data.proData.proDetList.projectIntro){//分享描述
						DMJS.shareData.shareDes = self.data.proData.proDetList.projectIntro;
					}
					if(self.data.proData.proDetList.qrcodeImg){
						DMJS.shareData.qrcodeImages = self.data.proData.proDetList.qrcodeImg;
					}
					if(self.data.projectStatus == "4"){ //已删除
						DMJS.router.navigate('user/personal/proDelSucc', true);//已删除
						return;
					}
					if(self.data.shieldStatus == "1"){  //已下架
						DMJS.router.navigate('user/personal/proOff', true);//已下架
						return;
					}
					
					self.loadProDynamic();
					if(response.data.singleResult.isFocus){
						var concernType = response.data.singleResult.isFocus;//关注状态 0否、1是
						if(concernType == "0"){
							if($('#concernIcon').hasClass('icon-concerned')){
								$('#concernIcon').removeClass('icon-concerned').addClass('icon-concern');
							}
						}else{
							if($('#concernIcon').hasClass('icon-concern')){
								$('#concernIcon').removeClass('icon-concern').addClass('icon-concerned');
							}
						}
					}
					if(self.data.projectStatus == "1"){ //众筹中
						
						if(self.data.proData.proDetList.type == "6"){ //回报项目不用考虑支持和目标金额比例
							$('#support').removeClass("unable").addClass("enable");//可支持下单
						}else{//梦想和公益项目
							if(parseInt(self.data.supportAmt) < parseInt(self.data.facTarget)){ //已支持金额小于目标金额
								$('#support').removeClass("unable").addClass("enable");//可支持下单
							}
						}
						
					}else{}
					
				 }
			});
	    },
	    loadProDynamic:function(){
	    	var self = this;
			self.controller.indexModel.projectDynamic({ //获取项目动态内容
				'data': {
					projectId:self.projectId,
				    useId:""
				},
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					self.data.proData.proDymList = response.data.pageResult;
					self.$el.html(_.template(projectDetailsTemplate,self.data.proData)); //将tpl中的内容写入到
					if(self.data.proData.proDetList){
						$('#proDetCon').html(self.data.proData.proDetList.content);//填充项目详情内容
						var proConHeight = $('#proConDetView').height();
						if(proConHeight > 144){ //12rem
							$('#proConDetView').addClass('pro-over');
						}else{
							$('#proConControl').addClass('hide');//内容高度不够隐藏
						}
					}
					self.loadProSupComm(self.page);
				 }
			});
	    },

	    loadProSupComm:function(page,callBack){
	    	var self = this;
	    	if (page.isOver) {
				callBack && callBack();
				return;
			}
	    	var __call=function()
        	{
            	var dom=self.$el.find("#support-list")[0];
         		if(!self.data.proData.proCommList.hasNextPage){
         			if(self.data.proData.proCommList.list.length==0){
         				//dom.innerHTML='<div class="ub fn-s-14 ub-pc ub-ac mg-t-10">暂无支持记录!</div>';
         			}
    				return self.scroller.disablePullUpToLoadMore();
    			}else if(page.isOver){
    				return self.scroller.disablePullUpToLoadMore();
    			}else{
    				return self.scroller.enablePullUpToLoadMore();
    			}
            			
            }
			self.controller.indexModel.projectCommentList({ //获取项目支持评论
				'data': {
					projectId:self.projectId,
				    useId:"",
				    reqPageNum:self.page.pageIndex,
					maxResults:self.page.pageSize
				},
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					 var $dom=self.$el.find("#support-list");
				     self.data.proData.proCommList = response.data.pageResult;
				     
			         if(page.pageIndex == 1){
			        	 $dom.html(_.template(proSupportList,self.data.proData));
			         }else{
			        	 $dom.append(_.template(proSupportList,self.data.proData));
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
            	wraper.height(wrapView.height-$('#header').height()-$('.pro-dets-foot').height());
            	self.scroller = new PTRScroll(wraper[0], {
            		pullUpToLoadMore: !page.isOver,
					hideScrollbar: true,
					pullDownToRefresh:false,
					refreshContent: function(done) {
						page.pageIndex = 1;
						page.isOver = false;
						self.loadProSupComm(page, done);
					},
					loadMoreContent: function(done) {
						self.loadProSupComm(page, done);
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
            self.loadScroller();
		},
		trendsControl : function(e){   //动态内容展开控制
			var self = this;
			var $dom=$(e.target);
			var trendsClass = '.trends-control-action';
			var trendsMore = '.trends-item-more';
			var trendsConClass= '.trends-con';
			var trendsIcon = '.trends-icon';
			var textConUp = "收起";
			var textConDown = "查看全部";
			self.conControl($dom,trendsClass,trendsMore,trendsConClass,textConUp,textConDown,trendsIcon);
            self.loadScroller();
		},
		proDetsControl :function(e){ //项目详情内容展开
			var self = this;
			var $dom=$(e.target);
			if(!$dom.is('.pro-con-control')){
				$dom=$dom.parents('.pro-con-control');
			}
			var $proConDetView = $('#proConDetView');
			console.log($dom);
			if($proConDetView.hasClass('pro-over')){
				$dom.find('.dets-con').text("收起");
				$dom.find('.dets-icon').removeClass('icon-down').addClass('icon-up')
				$proConDetView.removeClass('pro-over');
			}else{
				$dom.find('.dets-con').text("展开");
				$dom.find('.dets-icon').removeClass('icon-up').addClass('icon-down')
				$proConDetView.addClass('pro-over');
			}
			self.loadScroller();
			
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
		concernControl:function(){ //关注和取消关注
			var self = this;
			if(DMJS.userInfo){
				if($('#concernIcon').hasClass('icon-concern')){
					self.controller.indexModel.collect({//添加关注
						'data': {id:self.projectId},
						"noCache": true,
						"success": function(response) {
							if(response.code == "000000"){
								$('#concernIcon').removeClass('icon-concern').addClass('icon-concerned');
								DMJS.CommonTools.alertCommon("温馨提示", "已添加关注！");
								setTimeout(function(){wrapView.lightBox.hide();
	                            wrapView.FlipPrompt.closeFlayer();},2500);
							}
						}
					});
				}else{
					self.controller.userModel.cancelCollect({//取消关注
						'data': {id:self.projectId},
						"noCache": true,
						"success": function(response) {
							if(response.code == "000000"){
								$('#concernIcon').removeClass('icon-concerned').addClass('icon-concern');
								DMJS.CommonTools.alertCommon("温馨提示", "已取消关注！");
								setTimeout(function(){wrapView.lightBox.hide();
	                            wrapView.FlipPrompt.closeFlayer();},2500);
							}
						}
					});
				}
			}else{
				
				DMJS.router.navigate('user/personal/login', true);
			}
		},
		goSupportOrder:function(){ //支持下单
			console.log("支持下单")
			var self = this;
			if(self.data.projectStatus == "1"){ //众筹中
				
				if(self.data.proData.proDetList.type == "6"){ //回报项目
					//可支持下单
					if(DMJS.userInfo){ //已登录
						if(self.data.proData.proDetList.type=="6"){//回报项目
							location.href=location.origin+location.pathname+"?#index/index/supportOrderReturn/"+self.projectId+'/'+self.data.proData.proDetList.isNeddAddr;
//							DMJS.router.navigate('index/index/supportOrderReturn/'+self.projectId+'/'+self.data.proData.proDetList.isNeddAddr, true);
						}else{//其他项目
							location.href=location.origin+location.pathname+"?#index/index/supportOrderDrem/"+self.projectId+'/'+self.data.proData.proDetList.type+'/'+self.data.proData.proDetList.isNeddAddr;
//							DMJS.router.navigate('index/index/supportOrderDrem/'+self.projectId+'/'+self.data.proData.proDetList.type+'/'+self.data.proData.proDetList.isNeddAddr, true);
						}
						
						
					}else{
						DMJS.router.navigate('user/personal/login', true);
					}
					
				}else{
					if(parseInt(self.data.supportAmt) < parseInt(self.data.facTarget)){ //已支持金额小于目标金额
						//可支持下单
						if(DMJS.userInfo){ //已登录
							if(self.data.proData.proDetList.type=="6"){//回报项目
								location.href=location.origin+location.pathname+"?#index/index/supportOrderReturn/"+self.projectId+'/'+self.data.proData.proDetList.isNeddAddr;
//								DMJS.router.navigate('index/index/supportOrderReturn/'+self.projectId+'/'+self.data.proData.proDetList.isNeddAddr, true);
							}else{//其他项目
								location.href=location.origin+location.pathname+"?#index/index/supportOrderDrem/"+self.projectId+'/'+self.data.proData.proDetList.type+'/'+self.data.proData.proDetList.isNeddAddr;
//								DMJS.router.navigate('index/index/supportOrderDrem/'+self.projectId+'/'+self.data.proData.proDetList.type+'/'+self.data.proData.proDetList.isNeddAddr, true);
							}
							
						}else{
							DMJS.router.navigate('user/personal/login', true);
						}
						
					}else{
						return;
					}
				}

			}else{
				return;
			}
		},
		shareToFriend:function(){  //分享
			var self = this;
			DMJS.CommonTools.shareToFriend();
		},
	});

	return projectDetailsView;
});
