define([ 'text!userTemplate/personal/myLaunch.html',
         'text!userTemplate/personal/myLanunchList.html',
         'commonClass/scroll/PTRScroll',
         'commonTool/slide',
         'commonTool/validator'], function(myLaunch,myLanunchList,PTRScroll,Slide,Validator) {
	var myLaunchView = DMJS.DMJSView.extend({
		id : 'myLaunchView',
		name : 'myLaunchView',
		tagName : 'div',
		className : "myLaunchView",
		events : {
		     'tap .JSAppointDropDown': 'switchs',//tab切换
		     'tap .projectManager':'projectManager',//项目管理
		     'tap .failInfo':'getFailInfo',//查看失败详情
		     'tap .ListArea':'launchList',//发起列表监听
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
					'dataS': '1'  //众筹中
				},
				"2": {
					"pageIndex": 1,
					"pageSize":10,
					"isOver": false,
					"id": 2,
					'dataS': '2'  //众筹成功
				},
				"3": {
					"pageIndex": 1,
					"pageSize":10,
					"isOver": false,
					"id": 3,
					'dataS': '3'  //众筹失败
				}
			};
			_.extend(this, options);
		},
		
		render : function() {
			var self = this;
			this.$el.html(_.template(myLaunch, self)); // 将tpl中的内容写入到
			self.slider = new Slide(self.$el.find("#slider")[0], "H", function() {
				var cur = this.currentPoint;
				if(cur!=self.currentType){
					self.currentType=cur;
					$('.JSAppointDropDown li').removeClass('select');
					$($('.JSAppointDropDown li')[cur]).addClass('select');
					self.loadDatas(self.pageInfo[cur]);
				}
			}, false, function(e) {});
			self.loadDatas(self.pageInfo["0"]);
			return this;
		},
		switchs:function(e){
			var self = this;
			var $dom = $(e.target);
			var chooiceType = $dom.attr("listType");
			if(chooiceType!=self.currentType){
				self.currentType=chooiceType;
				
				$('.JSAppointDropDown li').removeClass('select');
				$($('.JSAppointDropDown li')[chooiceType]).addClass('select');
				
				self.loadDatas(self.pageInfo[chooiceType]);
				self.slider.moveToPoint(parseInt(chooiceType));
			}
        },
        loadDatas:function(pageInfo,callBack){
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
				params["projectStatus"] =pageInfo.dataS;
			}
			self.controller.userModel.myInitProjectList({
				'data':params,
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					var $dom = self.$el.find("div[items='" + pageInfo.id + "']").find("div.ListArea");
					var datalist=response.data.pageResult.list;
					if (!response.data.pageResult.hasNextPage) {
						pageInfo.isOver = true;
						DMJS.CommonTools.popTip("已经加载完所有数据！");
					}
	                 if(pageInfo.pageIndex === 1){
	                    	 $dom.html(_.template(myLanunchList,response.data.pageResult));
	                     }else{
	                    	 $dom.append(_.template(myLanunchList,response.data.pageResult));
	                     }
	                 pageInfo.pageIndex++;
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
		loadListScroller: function(pageInfo) {
			var self = this;
			var type = pageInfo.id;
			!self.scroller && (self.scroller = {});
			var wraper = $("div[items='" + type + "']");
			if (!self.scroller[type]) {
				wraper.height(wrapView.height-$('#indexTitleContent').height());
				self.scroller[type] = new PTRScroll(wraper[0], {
					pullUpToLoadMore: !pageInfo.isOver,
					hideScrollbar: true,
					refreshContent: function(done) {
						pageInfo.pageIndex = 1;
						pageInfo.isOver = false;
						self.loadDatas(pageInfo, done);
					},
					loadMoreContent: function(done) {
						self.loadDatas(pageInfo, done);
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
		launchList:function(e){ //点击项目跳详情
			e.preventDefault();
			var $dom=$(e.target);
			if($dom.hasClass("projectManager")||$dom.hasClass("failInfo")){
				return false;
			}
            if(!$dom.is(".ListArea > div")){
                $dom=$dom.parents(".ListArea > div");
            }
            var proId = $dom.attr("proId");
            if(!!proId){
               DMJS.router.navigate("index/index/projectDetails/"+proId,true);
            }
		},
		
		projectManager:function(e){ //项目管理
			$dom = $(e.target);
			var projectId = $dom.attr('projectId');
			var projectStatus = $dom.attr('projectStatus');
			var projectType = $dom.attr('projectType');
			if(!!projectId&&!!projectStatus){
				DMJS.router.navigate("user/personal/projectManagement/"+projectId+"/"+projectStatus+"/"+projectType,true);
			}
		},
		getFailInfo:function(e){//查看失败详情
			$dom = $(e.target);
			var failReason = $dom.attr('failReason');
			DMJS.CommonTools.alertCommon("失败详情",failReason,function(){
				
			});
		},
	});
		
	return myLaunchView;
});