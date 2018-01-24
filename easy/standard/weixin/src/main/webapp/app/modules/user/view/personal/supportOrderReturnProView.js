define([ 'text!userTemplate/personal/supportOrderReturnPro.html',
         'text!userTemplate/personal/supportOrderList.html',
         'commonTool/slide',
         'commonClass/scroll/PTRScroll'], 
		function(supportOrderReturnPro,supportOrderList,Slide,PTRScroll) {
	var supportOrderReturnProView = DMJS.DMJSView.extend({
		id : 'supportOrderReturnProView',
		name : 'supportOrderReturnProView',
		tagName : 'div',
		className : "supportOrderReturnProView",
		events : {
			'tap .JSAppointDropDown': 'switchs',//tab切换
		},
		init : function(options) {
			var self = this;
			self.pageInfo = {
					"0": {
						"pageIndex": 1,
						"pageSize":10,
						"isOver": false,
						"id": 0,
						'dataS': "" //全部
					},
					"1": {
						"pageIndex": 1,
						"pageSize":10,
						"isOver": false,
						"id": 1,
						'dataS': '4'  //待发货
					},
					"2": {
						"pageIndex": 1,
						"pageSize":10,
						"isOver": false,
						"id": 2,
						'dataS': '5'  //待收货
					},
					"3": {
						"pageIndex": 1,
						"pageSize":10,
						"isOver": false,
						"id": 3,
						'dataS': '6'  //已收货
					}
				};
			_.extend(this, options);
		},
		data:{
			statResult:'',//总计
			pageResult:'' //订单支持记录
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(supportOrderReturnPro, self)); // 将tpl中的内容写入到
			self.slider = new Slide(self.$el.find("#slider")[0], "H", function() {
				var cur = this.currentPoint;
				if(cur!=self.currentType){
					self.currentType=cur;
					$('.JSAppointDropDown li').removeClass('select');
					$($('.JSAppointDropDown li')[cur]).addClass('select');
					self.loadSupportListContent(self.pageInfo[cur]);
				}
			}, false, function(e) {});
			self.loadSupportListContent(self.pageInfo["0"]);
			return this;
		},
		switchs:function(e){
			var self = this;
			var $dom = $(e.target);
			if($dom.hasClass('order-c')){
				$dom = $dom.parents("li");
			}
			var chooiceType = $dom.attr("listType");
			if(chooiceType!=self.currentType){
				self.currentType=chooiceType;
				
				$('.JSAppointDropDown li').removeClass('select');
				$($('.JSAppointDropDown li')[chooiceType]).addClass('select');
				
				self.loadSupportListContent(self.pageInfo[chooiceType]);
				self.slider.moveToPoint(parseInt(chooiceType));
			}
        },
	    loadSupportListContent:function(pageInfo,callBack){
	    	var self=this;
			if (pageInfo.isOver) {
				callBack && callBack();
				return;
			}
			var __call = function() {
				var type = pageInfo.id;
				var $dom = self.$el.find("div[items='" + type + "']").find("div.ListArea");
				var $dom_content = $dom.find("div");
				
				if ($dom_content.find("div").length == 0) {
					$dom.html("<div class='ub uinn-pa2 fn-s-14 pd-t-20 ub-pc ub-ac t-ddd' id='noData'>暂无数据</div>");
					self.scroller[type].disablePullUpToLoadMore();
					return;
				}else if(pageInfo.isOver){
				 self.scroller[type].disablePullUpToLoadMore();
    			}else{
    				 self.scroller[type].enablePullUpToLoadMore();
    			}
			};
        	var params = {};
			params["reqPageNum"] =pageInfo.pageIndex;
			params["maxResults"] =pageInfo.pageSize;
			if(pageInfo.dataS){
				params["status"] =pageInfo.dataS;
			}
			params["projectId"] =self.projectId;
			params["type"] ="1";//查询总计
			self.controller.userModel.prosupportList({ //支持订单记录
				'data': params,
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response){
					 self.data.statResult = response.data.statResult;
				     self.data.pageResult = response.data.pageResult;
				     $('.supportCount').text(self.data.statResult.supportCount);
				     $('.supportAmtTotal').text(self.data.statResult.supportAmtTotal)
				     if(self.data.statResult.waiteSendCount == "0"){
				    	 $('.order-til-num').removeClass('order-til-num');
				     }else{
				    	 $('.order-til-num').text(self.data.statResult.waiteSendCount);//待发货数量
				     }
				     var $dom = self.$el.find("div[items='" + pageInfo.id + "']").find("div.ListArea");
			         if(pageInfo.pageIndex == 1){
			        	 $dom.html(_.template(supportOrderList,self.data.pageResult));
			         }else{
			        	 $dom.append(_.template(supportOrderList,self.data.pageResult));
			         }
			         pageInfo.pageIndex++;
			         if(!response.data.pageResult.hasNextPage)
				     {
			        	pageInfo.isOver=true;
	                    DMJS.CommonTools.popTip("已经加载完所有数据！");
	                 }
				 },
				 "complete":function(){
					 if (!!callBack) {
							callBack();
						}
                     self.loadListScroller(pageInfo);
                   	__call();
                  }
			});
	     },
	     
	     //加载滚动条
	     loadListScroller: function(pageInfo) {
				var self = this;
				var type = pageInfo.id;
				!self.scroller && (self.scroller = {});
				var wraper = $("div[items='" + type + "']");
				if (!self.scroller[type]) {
					wraper.height(wrapView.height-$('#indexContent').height());
					self.scroller[type] = new PTRScroll(wraper[0], {
						pullUpToLoadMore: !pageInfo.isOver,
						hideScrollbar: true,
						refreshContent: function(done) {
							pageInfo.pageIndex = 1;
							pageInfo.isOver = false;
							self.loadSupportListContent(pageInfo, done);
						},
						loadMoreContent: function(done) {
							self.loadSupportListContent(pageInfo, done);
						}
					}, true);
				} else {
					if (pageInfo.isOver) {
						self.scroller[type].disablePullUpToLoadMore();
					} else {
						self.scroller[type].enablePullUpToLoadMore();
					}
				}
			},
		
		
	});
		
	return supportOrderReturnProView;
});