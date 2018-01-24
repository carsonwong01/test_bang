/**
 * @author yaochi
 * 公共模块头
 * 参数
 * 	leftBtn    左边按钮文字     必填
 * 	info       中间文字             必填
 *  rightBtn   右边按钮文字     非必填
 *  leftBtnClick   点击触发的事件   非必填
 *  rightBtnClick  点击触发的事件  非必填
 */

define(['Native'],function(){
	var HomeHeaderView = {
		backHome   : true,
		disableEvent : function(options){
			this.cancelEvent = true;
			Native.setNavButtonEnabled(options || {leftEnabled:false,rightEnabled:false},function(){},function(){});
		},
		enableEvent : function(options){
			this.cancelEvent = false;
			Native.setNavButtonEnabled(options || {leftEnabled:true,rightEnabled:true},function(){},function(){});
		},
		cancelEvent : false,
		init : function(){
			
		},
		render : function(options){
			this.options = options;
			var title = options.title,
				self  = this, 
				arg   = {};
			if(title.leftBtn){
				arg.left = title.leftBtn;
			}				
			if(title.rightBtn){
				arg.right = title.rightBtn;
			}

			this.info = arg.title = title.info || "";
        	Native.showHeader(arg,function(){},function(){});
        
			var back = typeof title.leftBtnClick == "function"
				? title.leftBtnClick
				: function(){};
			this.back = back;	
			this.leftBtnClick = function(){
				if(self.cancelEvent){
					return;
				}
				if(Config.ajaxCount != 0){
					wrapView.bottomDialog&&wrapView.bottomDialog.close();
					if(wrapView&&wrapView.FlipPrompt){
						wrapView.FlipPrompt.colse();
					}
					PAWA.killRequest();
					var urlList = wrapView.urlLists[0];
					if(urlList){
						if(urlList == "home/home/index1" || urlList == "home/home/index"){
							PAWA.router.navigate("home/home/index", true);
							return;
						}
					}
					
					back();
				}else{
					if(wrapView.bottomDialog && wrapView.bottomDialog.isShow){
						wrapView.bottomDialog.close();
						return;
					}
					if($("#FlipPrompt")[0] && $("#FlipPrompt")[0].style.display=="block"){
						if(wrapView&&wrapView.FlipPrompt){
							wrapView.FlipPrompt.colse();
							return;
						}
					}
					var urlList = wrapView.urlLists[0];
					if(urlList&&self.backHome){
						if(urlList == "home/home/index1" || urlList == "home/home/index"){
							PAWA.router.navigate("home/home/index", true);
							return;
						}
					}
					self.backHome = true;			
					back();
				}
			
			};	

			this.rightBtnClick = typeof title.rightBtnClick == "function"
				? function(){
					if(self.cancelEvent){return;}
					if(wrapView.bottomDialog && wrapView.bottomDialog.isShow){
						wrapView.bottomDialog.close();
					}					
					title.rightBtnClick();
				} 
				: function(){}
		},
		reset : function(){
			this.render(this.options);
		},
        setOptions : function(options){
        	if(!options || typeof options != "object")
        		return;
        	var arg = {};	
        	if(options.left){
        		arg.left = options.left;
        	}

        	if(options.right){
        		arg.right = options.right;
        	}
        	
        	if(options.title){
        		arg.title = options.title;
        	}
        	
        	if(typeof options.leftBtnClick == "function"){
        		wrapView.headerView.leftBtnClick = options.leftBtnClick;
        	}
        	
        	if(typeof options.rightBtnClick == "function"){
        		wrapView.headerView.rightBtnClick = options.rightBtnClick;
        	}         	        	        	
        		
			Native.setNavButton(arg,function(){},function(){});        	
        }
	}
	return HomeHeaderView;
});        		
