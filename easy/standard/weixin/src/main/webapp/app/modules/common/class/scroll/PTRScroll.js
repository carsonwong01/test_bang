
define(["commonClass/scroll/iscroll"], function(iScroll){
	/* @author yaochi001
     * @description iScroll的子类，实现下拉刷新和上拉加载更多
     */
    
	function BaseClass(){}
	BaseClass.prototype = iScroll.prototype;
	
	var html_pull_down = '<div id="pullDownRefresh" class=""></div>';
	var html_pull_down_to_refresh = '<div class="ub ub-pc ub-ac uinn-a22"><div class="refresh_01 ub "/><div class="ub  ulev-app15 uinn-a7 ub-pc ub-ac">下拉刷新数据</div> </div>'
	var html_release_to_refresh =  '<div class="ub ub-pc ub-ac uinn-a22"><div class="refresh_01 ub ub-rotate-180"/><div class="ub  ulev-app15 uinn-a7 ub-pc ub-ac">松开立即刷新</div> </div>'
	var html_refreshing = '<div class="ub ub-pc ub-ac uinn-a22"><div class="loading_01 ub "/><div class="ub  ulev-app15 uinn-a7 ub-pc ub-ac">正在刷新...</div> </div>'
	
	var html_pull_up = '<div id="pullUpLoadMore" class=""></div>';
	var html_pull_up_to_load_more = '<div class="ub ub-pc ub-ac uinn-a22"><div class="refresh_02 ub "/><div class="ub  ulev-app15 uinn-a7 ub-pc ub-ac">上拉加载更多</div> </div>'
	var html_release_to_load_more = '<div class="ub ub-pc ub-ac uinn-a22"><div class="refresh_02 ub ub-rotate-180"/><div id="scroll_bottom_tip" class="ub  ulev-app15 uinn-a7 ub-pc ub-ac">松开立即加载</div> </div>'
	var html_loading = '<div class="ub ub-pc ub-ac uinn-a22"><div class="loading_01 ub ub-rotate-180"/><div class="ub  ulev-app15 uinn-a7 ub-pc ub-ac">正在加载中...</div> </div>'
	
	
	function PTRScroll(el, options,initWithLoading){
		options = _.extend({}, PTRScroll.defaultOptions, options);
        
		this._status = {};
		iScroll.call(this, el, options);
		this._initializeDOMStructure(initWithLoading);
		
		this.options.topOffset = this._pullDownOffset();
		this.refresh();
		this.scrollTo(0, -this.options.topOffset, 0);
	}
	
	PTRScroll.prototype = _.extend(new BaseClass, {
		constructor: PTRScroll,
		
		_setMinScrollY: function(minScrollY){
	        this.minScrollY = minScrollY;
	        this.scrollerW = Math.round(this.scroller.offsetWidth * this.scale);
	        this.scrollerH = Math.round((this.scroller.offsetHeight + this.minScrollY) * this.scale);
	        this.maxScrollX = this.wrapperW - this.scrollerW;
	        this.maxScrollY = this.wrapperH - this.scrollerH + this.minScrollY;
	   },
	   
	   _pullDownOffset: function(recalculate){
            if(!this.options.pullDownToRefresh) return 0;
            if(!this.pullDownEl) return 0;
            // hard code 28px, for that 
            // offsetHeight is 0 if entire scroller is hidden
            return this.pullDownEl.offset().height || 28;
        },
        _pullUpOffset: function(recalculate){
            if(!this.options.pullUpToLoadMore) return 0;
            if(!this.pullUpEl) return 0;
            // hard code 28px, for that 
            // offsetHeight is 0 if entire scroller is hidden
            return this.pullUpEl.offset().height || 28;
        },
		
        _initializeDOMStructure: function(initWithLoading){
			this.pullDownEl = $(html_pull_down).prependTo(this.scroller);
			this._renderComponentByStatus("pulldown to refresh");
			
			this.pullUpEl = $(html_pull_up).appendTo(this.scroller);
			if(initWithLoading){
				this._renderComponentByStatus("loading");
				this._status.loading=true;
			}else{
				this._renderComponentByStatus("pullup to load more");
			}
		},
		
		enablePullDownToRefresh: function(){
            this.options.pullDownToRefresh = true;
            this._status.toRefresh = this._status.refreshing = false;
            this._renderComponentByStatus("pulldown to refresh");
            this.refresh();
        },
        
		disablePullDownToRefresh: function(){
            this.options.pullDownToRefresh = false;
            this.options.topOffset = this._pullDownOffset();
            this.refresh();
		},
		
		enablePullUpToLoadMore: function(){
			this.options.pullUpToLoadMore = true;
			this._status.toLoad = this._status.loading = false;
			this._renderComponentByStatus("pullup to load more");
			this.pullUpEl.show();
			this.refresh();
		},
		
		disablePullUpToLoadMore: function(){
			this.options.pullUpToLoadMore = false;
			this.pullUpEl.hide();
			this._status.loading=false;
			this.refresh();
		},
		
        disabledPullUpToLoadMore: function(){
            if(console) console.log("*Deprecated*, rename to disablePullUpToLoadMore");
            return this.disablePullUpToLoadMore.apply(this, arguments);            
        },
		
		refresh: function(){
		    this.pullDownEl && this.pullDownEl.toggle(this.options.pullDownToRefresh);
		    this.pullUpEl && this.pullUpEl.toggle(this.options.pullUpToLoadMore);
		    
		    this.options.topOffset = this._pullDownOffset();
		    return iScroll.prototype.refresh.apply(this, arguments);
		},
		
		destroy: function(){
		    this.pullDownEl.remove();
		    this.pullUpEl.remove();
            return iScroll.prototype.destroy.apply(this, arguments);
		},
		
		_renderComponentByStatus: function(keyword){
			if(keyword === "pulldown to refresh")
				return this.pullDownEl && this.pullDownEl.html(html_pull_down_to_refresh);
			if(keyword === "release to refresh")
				return this.pullDownEl && this.pullDownEl.html(html_release_to_refresh);
			if(keyword === "refreshing")
				return this.pullDownEl && this.pullDownEl.html(html_refreshing);
			if(keyword === "pullup to load more")
				return this.pullUpEl && this.pullUpEl.html(html_pull_up_to_load_more);
			if(keyword === "release to load more"){
				if(this.pullUpEl){
					this.pullUpEl.find("div.refresh_02").addClass("ub-rotate-180");
					this.pullUpEl.find(".ulev-app15").text("松开加载更多数据");;
				}
				return;
			}
				
			if(keyword === "loading")
				return this.pullUpEl && this.pullUpEl.html(html_loading);
		}
	});
	
	PTRScroll.defaultOptions = {
	    // hide scrollbar default
	    hScrollbar: false,
        vScrollbar: true,
            
		refreshContent: function(){},
		loadMoreContent: function(){},
		
		pullDownToRefresh: true,
		pullUpToLoadMore: true,
		
		onScrollMove: function(){
			var status = this._status;
			if(status.refreshing||status.loading){
				return;
			}
			if(this.options.pullDownToRefresh&&!status.loading&&!status.refreshing){
				if(!status.toRefresh && this.y > 30){
		            status.toRefresh = true;
		            this._renderComponentByStatus("release to refresh");
		            this._setMinScrollY(0);
		        }
		        
		        if(status.toRefresh && this.y <= 30){
		            status.toRefresh = false;
		            this._renderComponentByStatus("pulldown to refresh");
		            this._setMinScrollY(-this._pullDownOffset());
		        }	
			}
			
			if(this.options.pullUpToLoadMore&&!status.loading&&!status.refreshing){
				if(!status.toLoad && this.y < Math.min(this.maxScrollY, this.minScrollY) - 70){
		            status.toLoad = true;
		            this._renderComponentByStatus("release to load more");
		        }
		        
		        if(status.toLoad && this.y >= Math.min(this.maxScrollY, this.minScrollY) - 70){
		            status.toLoad = false;
		            this._renderComponentByStatus("pullup to load more");
		        }	
			}
		},
		
		onScrollEnd: function(){
			var that = this;
			var status = this._status;
			
			if(status.toRefresh&&!status.loading&&!status.refreshing) this._renderComponentByStatus("pulldown to refresh");
			if(status.toLoad&&!status.loading&&!status.refreshing) this._renderComponentByStatus("pullup to load more");
			
			
			if(this.options.pullDownToRefresh && status.toRefresh && !status.refreshing&&!status.loading){
	            status.refreshing = true;
	            this._renderComponentByStatus("refreshing");
//	            this._renderComponentByStatus("loading");
	            this.pullUpEl.show();
	            this.options.refreshContent.call(this, function(){
	            	_.defer(function(){
	            		status.refreshing = status.toRefresh = false;
						that._renderComponentByStatus("pulldown to refresh");
						that._renderComponentByStatus("pullup to load more");
//		                that.refresh();
	            	});
	            });
	        }
	        
	        if(this.options.pullUpToLoadMore && status.toLoad && !status.loading&&!status.refreshing){
	            status.loading = true;
	            this._renderComponentByStatus("loading");
	            
	            this.options.loadMoreContent.call(this, function(){
	            	_.defer(function(){
	            		status.loading = status.toLoad = false;
		                that._renderComponentByStatus("pullup to load more");
	            		
		                // hold current minScrollY after refresh
		                //var topOffset = that.options.topOffset;
		                //if(status.refreshing) that.options.topOffset = that.minScrollY;
//		                that.refresh();
		                //if(status.refreshing) that.options.topOffset = topOffset;
	            	}); 
	            });
	        }
		}
	};
	
	return PTRScroll;
});