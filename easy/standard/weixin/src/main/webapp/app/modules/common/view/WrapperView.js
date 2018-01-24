
/**
 * 定义最外层的视图对象
 */
define(['DMJSAll','commonClass/commonTools','commonClass/scroll/iscroll','commonClass/stringTools','text!commonTemplate/wrapper.html'], function(DMJS,BrowserView,iscroll,stringTools,wrapper) {
    var WrapView = DMJS.DMJSView.extend({
        // 标签id
        id : 'wrapperView',
        name : 'wrapperView',
        tagName : 'div',
        index : 0,
        // 顶部视图对象
        headerView : null,
        // 内容区域视图对象
        bodyView : null,
        // 底部视图对象
        footerView : null,
        init : function(){
        	//屏幕的宽度  高度  
        	var self=this; 
        	var body = document.body;
            this.width    = body.scrollWidth;
            this.height   = body.scrollHeight;
            //头的高度
            this.setConfig();
            //分享的高度
            this.myScroll = {refresh : function(){}}
            this.urlLists = [];
            this.noSearchDiv="<div class='ub uinn-pa2 ulev-app4 ub-pc ub-ac t-ddd' id='noData'>暂无数据</div>";
            $.fn['getFormValue']=function(){
            	var returnVal={};
            	$(this).find("input,select,textarea").each(function(){
            		var name=$(this).attr("name");
            		var value=$(this).val();
            		if(stringTools.isNotEmpty(name)&&
            				stringTools.isNotEmpty(value)){
            			if($(this).is("input[type='radio']")&&
            					!$(this).is("input:checked")){
            			}else{
            				returnVal[name]=value;
            			}
            		}
            	});
            	return returnVal;
            }
        },
        setConfig : function(){
	       var ua = navigator.userAgent.toLowerCase(),
	          device;
	       if(ua.indexOf("android")!=-1){
	          device = "android";
	       }else if(ua.indexOf("iphone")!=-1){
	          device = "iphone";
	       }else{
	          device = "";
	       }
           this.device = device; 
           require(['commonView/FlipPromptView'],function(FlipPrompt){
				wrapView.setFlipPrompt(FlipPrompt,{ 
					title:"提示",
					content:""
				});	
			});
        },


        // 渲染视图对象
        render : function() {
            // 将当前对象的DOM设置到<body>区域
			//有2个遮罩层  防止点击事件透传啊
//        	$(document.body).append(_.template(wrapper,this));
	        var lightBox  = $("<div class='bg hide dsn'></div>").appendTo(document.body).css({"marginTop":"0px","height":"100%"}),
	            wLightBox = $("<div id='bgWhiteId' class='bg_white hide dsn'></div>").appendTo(document.body);
			var isAndroid = this.device=="android";
			isAndroid&&lightBox.css({"position":"fixed",height:"200%",width:"100%"});
	        this.lightBox = {
	           time : null,
	           index:0,
	           dom  : lightBox,
	           show : function(noLightBox){
		              this.index++;
	                  wLightBox.show();
	                  !noLightBox&&lightBox.show();      
	                 },
	           hide : function(){
	                 clearTimeout(this.timer);
	                 this.index--;
	                 this.index=this.index<=0?0:this.index-1;
	                 if(this.index==0){
		                  lightBox.hide();
		                  this.timer = setTimeout(function(){
		                     wLightBox.hide();
		                     wLightBox.css("margin-top" , "").css("height" , "100%");
		                  },300);   
	                }
	            }
	        }    
		
			//添加一个tap事件
			this.$lightDom = null;
			var startTime,ismove,ish=false,top,x,y,$traget,$lightDom,isEnd=true,timer1=null,xx=false;
			function findLight(dom){
				if(dom.nodeName == "BODY"){
					return false;
				}
				var my = arguments.callee;
				if(dom.getAttribute("light")){
					return dom;
				}else{
					return dom.parentNode ? my(dom.parentNode) : false;					 					
				}				
			}
			
			var xx;
			var isAbortMove=false;
					
			$(document.body)
			.bind("touchstart",function(e){
				if(self.$lightDom)
					return false;
				var touch = e.changedTouches[0];
				x = touch.pageX;
				y = touch.pageY;
				top = document.body.scrollTop;
				startTime = new Date().getTime();
				
				var $target=$(e.target);
				if($target.parents("#header").length>0){
					isAbortMove=true;
				}
				if(DMJS.currentView){
					if($target.is("div[action]")){
						DMJS.currentView.activityDom=$target;
					}else{
						DMJS.currentView.activityDom=$target.parents("div[action]");
					}
					if(DMJS.currentView.activityDom.length>0){
						DMJS.currentView.activityDom.addClass("active");
					}
				}
				if(wrapView.FlipPrompt.isBlock){
					isAbortMove=true;
				}
				if(DMJS.currentView&&
					DMJS.currentView.touchstart){
					    DMJS.currentView.touchstart(e);
				    }
			})
			.bind("touchmove",function(e){
				if(isAbortMove){
					e.preventDefault();
				}
				if(DMJS.currentView&&
						DMJS.currentView.touchmove){
					DMJS.currentView.touchmove(e);
				}
			})
			.bind("touchend",function(e){
				isAbortMove=false;
				if(DMJS.currentView&&
						DMJS.currentView.touchend){
					DMJS.currentView.touchend(e);
				}
				if(DMJS.currentView&&DMJS.currentView.activityDom&&DMJS.currentView.activityDom.length>0){
					DMJS.currentView.activityDom.removeClass("active");
				}
			});
            $(window).resize(this.onResize);
			$.fn['tap'] = function(callback){ return this.bind('tap', callback) }
			this.setHeadTap();
        },
        setHeight : function(){
        	if(this.contentHeight==0){
        		this.contentHeight = window.innerHeight;
        	}else{
        		var height = window.innerHeight;
        		if(height!=this.contentHeight){
        			this.contentHeight = Math.min(height,this.contentHeight)+45;
        			wrapView.setHeight= function(){};
        		}
        	}
        },        
        hashView : {},
        htmlView:{},
        clearScroll : function (bodyView){
        	for(prop in bodyView){
        		if(bodyView[prop] instanceof  iscroll ){
        			bodyView[prop] = null;
        		}
        	}
        },
		setFlipLayer : function(ViewClass, options) {
            // 与顶部视图对象的设置流程一致
            var FlipLayer = this.FlipLayer;
            // if(FlipLayer && this.FlipLayer instanceof ViewClass) {
                // FlipLayer.render(options);
                // return FlipLayer;
            // } else 
            if(FlipLayer) {
                FlipLayer.destroy();
            }
			
            FlipLayer = new ViewClass(options);
            // 底部视图会被添加到外层视图的最后面
            //this.$el.append(FlipLayer.el);
            $(document.body).append(FlipLayer.el);
            this.FlipLayer = FlipLayer;
            return FlipLayer;
        },   
        // 弹出提示框
        setFlipPrompt : function(ViewClass, options) {
            //与顶部视图对象的设置流程一致
            var FlipPrompt = this.FlipPrompt;
            // if(FlipPrompt && this.FlipPrompt instanceof ViewClass) {
                // FlipPrompt.render(options);
                // return FlipPrompt;
            // } else 
            if(FlipPrompt) {
                FlipPrompt.destroy();
            }

            FlipPrompt = new ViewClass(options);
            // 底部视图会被添加到外层视图的最后面
            //this.$el.append(FlipPrompt.el);
            $(document.body).append(FlipPrompt.el);
            this.FlipPrompt = FlipPrompt;
            return FlipPrompt;
        },
        back : function(){
        	wrapView.headerView.leftBtnClick();
        },
        tab : {
        	"0": false,
        	"1": false,
        	"2": false,
        	"3": false
        },

        setHeadTap:function(){
        	var self=this;
        	self.headCalls=self.headCalls?self.headCalls:{};
        	$("#header_title").tap(function(){
        		if(self.headCalls.title){
        			self.headCalls.title();
        		}
        	});
        	$("#header_left").tap(function(){
        		if(self.headCalls.left){
        			self.headCalls.left();
        		}
        	});
        	
        	$("#header_right_left").live("tap",function(){
        		if(self.headCalls.right_left){
        			self.headCalls.right_left();
        			
        		}
        		return false;
        	});
  
        	$("#header_right_right").live("tap",function(){
        		if(self.headCalls.right_right){
        			self.headCalls.right_right();
        			
        		}
        		return false;
        	});
        	
          	$("#tab_title_left").live("tap",function(){
        		if(self.headCalls.title_left){
        			self.headCalls.title_left();
        		}
        	});
          	$("#tab_title_right").live("tap",function(){
        		if(self.headCalls.title_right){
        			self.headCalls.title_right();
        		}
        	});
        },
        "onResize":function(){
        	console.info("window resize");
        	if(DMJS.currentView&&DMJS.currentView.resizable &&wrapView.device == "android"){
        		var currentResizeHeight=document.body.scrollHeight;
        		DMJS.currentView.$el.height(currentResizeHeight-$("#header").height()- $("#footer").height());
        		if(DMJS.currentView.scroller){
           		 	DMJS.currentView.scroller._resize();
           		 	var inputFocus=DMJS.currentView.$el.find("input:focus");
           		 	if(inputFocus.length==1){
           		 		var offsetTop=inputFocus.offset().top;
           		 		console.info("input offset Top :"+offsetTop+" and current height:"+currentResizeHeight);
//           		 		scrollToElement(inputFocus, 200);
           		 		if(offsetTop+40>currentResizeHeight){
           		 			setTimeout(function(){
                   		 		DMJS.currentView.scroller.scrollTo(0,currentResizeHeight-offsetTop-50,100);
           		 			},100);
           		 		}
           		 	}
           	 	}
        		
        	}
        }
    });
    return WrapView;
});
