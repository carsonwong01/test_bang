	/**
* 弹出提示框
*/
define(['text!commonTemplate/FlipPromptTpl.html',
        "Lib/share/jquery.share.min"
        ], function(tpl,share) {
    var FlipPrompt = DMJS.DMJSView.extend({
        id : 'FlipPrompt',
        name : 'FlipPrompt',
        tagName : 'div',
        type   : 'control',
        className : 'FlipPrompt pop1 dsn hide',
        isLoading : false,  
        isBlock : false,   //是否显示      
        events : {
            "tap #FlipPrompt" : "clickCallback",    //绑定事件
            "blur input[type='password']" :'inputBlur',
            "focus input[type='password']" :'inputFocus',
            "blur input[type='text']" :'inputBlur',
            "focus input[type='text']" :'inputFocus',
            "change .Upload" : "setImgUrl",
            "tap #shareCancel" : "shareCancel",//取消分享
            "tap .h5-share-qrcode":"shareQrCode",//二维码
            "tap .h5-share-weibo":"shareWeibo",//微博分享
            "tap .h5-share-qq":"shareQQ",//qq分享
            "tap .h5-share-qqzone":"shareQqzone",//空间分享
            "tap .h5-share-weixin":"shareWexin"//微信分享
        },
        // 初始化
        init : function(options) {    //类型alert,confirm,Flayer
            this.options = options;
            //判断设置值是否存在、如果不存在则初始化
            this.options["type"] = "alert";
            this.options["content"] = this.options["content"] || "当前网络不给力";

            if (this.options["type"] == "alert") {     //提示框一个按钮
                this.options["title"] = this.options["title"] || Config.lang("alertCommonTitle"); 
                this.options["alert"] =  this.options["alert"] || null;
            }
            else if(this.options["type"] == "confirm"){   //提示框2个按钮
                this.options["title"] = this.options["title"] || Config.lang("alertCommonTitle");
                this.options["BntFontone"] = this.options["BntFontone"] || "确定";
                this.options["BntFonttwo"] = this.options["BntFonttwo"] || "取消" ;
            }
            else if(this.options["type"] == "Flayer"){  //Flayer直接显示内容

            }
           
            //this.render(options);
        },
        render : function(options){
            var data = options.data;
            var html = _.template(tpl,options);  
            
            if(options["type"] != "Flayer" && options["type"] != "Loading"&& options["type"] != "alert"
            	&& options["type"] != "Tip"){
	                wrapView.lightBox.show(); //遮罩曾显示 
            }
            
            if(options["type"] == "Loading"||options["type"] == "Tip"){
            	wrapView.lightBox.show(true);
            }
            this.$el.html(html);
            this.el.style.display="block";
            if(options["type"] == "alert" || options["type"] == "confirm"){
                var ClientHeight = document.documentElement.clientHeight;
                var popHeight = $($(".FlipPrompt")[0]).height();
                var EndHeight = (((ClientHeight + 50) - popHeight)/2) + 50;
				$($(".FlipPrompt")[0]).css({"top":EndHeight+"px"});  
				this.popTopObj={"top":EndHeight+"px"};
            }
            if(options["type"]!= "Loading"&&options["type"]!= "Tip"){
//              this.$el.addClass("pop-with-scale");
            }
            var self=this;
            var closeBgFunction = function(e){
            	//setTimeout(function(){
            		//self.closeBG();
            	//},350);
            	if($("#project-share").find($(e.target)).length > 0){
            		return false;
            	}
            	if(false){
            		$(".dsn").unbind("click", closeBgFunction);
            	}else{
            		$(".dsn").unbind("tap", closeBgFunction);
            	}
            	
				//回调函数
				if (typeof(self.FBntAlert) == "function" && self.FBntAlert != null/*&& options["displaySure"]=="no"*/) {
	               self.FBntAlert.call();
	            }
			}
            if(options["type"]=="alert"||options["type"]=="promptShare"){
            	//添加点击旁边层框框消失事件
				var self=this;
				if(false){
					$(".dsn").bind("click",closeBgFunction);
				}else{
					$(".dsn").bind("tap",closeBgFunction);
				}	
            }
        },
        
        clickCallback : function(e){   //事件处理
        	var self = this;
            var $dom = $(e.target);
            var action = $dom.attr("action");
            if(action){
                if(action == "FBntAlert"){
                	
                	setTimeout(function(){
                		self.closeBG();
                	},350);
                    
                    if (this.FBntAlert) {
                        this.FBntAlert();   
                        this.FBntAlert = null; 
                    };
                }
                else if(action == "FBntconfirm"){
                    if(self.autoCloseBg==='false'){
                    	this.FBntconfirm(); 
                    }else{
                   
	                	setTimeout(function(){
	                		self.closeBG();
	                	},500);
	                    
	                    
	                    if (this.FBntconfirm) {
	                        this.FBntconfirm();    
	                        this.FBntconfirm = null;
	                    };
	                }
                }
                else if(action == "FBntcancel"){
                   
                   if(this.confirmBGClose){
                	   self.closeBG(true,self.notHideProp);
                   }
                   else{
                	   self.closeBG(false,self.notHideProp);
                   }
					
                   if (this.FBntcancel) {
                        this.FBntcancel();    
                        this.FBntcancel = null;
                    };
                }
                this.noRemove=false;
            }
        },
        alert:function(option,callback){   //弹出事件
        	if(this.isBlock&&this.noRemove){
        		console.log("高级别弹出，无法覆盖");
        		return;
        	}
        	
            var options = {};
            options["type"] = "alert";
            if(option == null || option == "undefined"){
                options["title"] = Config.lang("alertCommonTitle");
                options["content"] = "当前网络不给力";
                options["displaySure"]="no";  //不显示确定按钮
                options["btnName"]="确定";  //不显示确定按钮
            }
            else{
                options["title"] = option["title"] || Config.lang("alertCommonTitle");
                options["content"] = option["content"] || "当前网络不给力";
                options["displaySure"]=option["displaySure"]||"no";   //不显示确定按钮
                options["btnName"]=option["btnName"]||"确定";   //不显示确定按钮
            }
           
            this.render(options);

            if (typeof(callback) == "function" && callback != null) {
               this.FBntAlert = callback;
            }
            this.isLoading = false;
            this.isBlock = true;
        },
        promptComment:function(option,FBntconfirm,FBntcancel){     //弹出确认框
        	if(this.isBlock&&this.noRemove){
        		console.log("高级别弹出，无法覆盖");
        		return;
        	}
        	
            var options = {};
            options["type"] = "promptComment";
            options["title"] = option["title"] || Config.lang("alertCommonTitle");
            options["content"] = option["content"] || "当前网络不给力";
            options["FBntconfirm"] = option["FBntconfirm"] || "确定";
            options["FBntcancel"] = option["FBntcancel"] || "取消" ;  
            options["FBntConfirmColor"] = option["FBntConfirmColor"] || "pop_btn_grey"; 
            options["FBntCancelColor"] = option["FBntCancelColor"] || "pop_btn_grey";
            this.autoCloseBg=option['autoCloseBg']||'true';
            if(option["BGClose"] != null && option["BGClose"] != undefined){
            	options["BGClose"] = option["BGClose"];
            }
            else{
            	options["BGClose"] = true;
            }
			
			this.confirmBGClose = options["BGClose"];   //标示是否关闭背景 
            this.notHideProp=option["notHideProp"]?option["notHideProp"]:false;//是否关闭弹出
            this.noRemove=option['noRemove']?option['noRemove']:false;
            this.render(options);
			
            if (typeof(FBntconfirm) == "function" && FBntconfirm != null) {
               this.FBntconfirm = FBntconfirm;
            }
            if (typeof(FBntcancel) == "function" && FBntcancel != null) {
               this.FBntcancel = FBntcancel;
            }
            this.isLoading = false;
            this.isBlock = true;
        },
        confirm:function(option,FBntconfirm,FBntcancel){     //弹出确认框
        	if(this.isBlock&&this.noRemove){
        		console.log("高级别弹出，无法覆盖");
        		return;
        	}
        	
            var options = {};
            options["type"] = "confirm";
            if(option == null || option == "undefined"){
                options["title"] =  Config.lang("alertCommonTitle");
                options["content"] =  "当前网络不给力";
                options["FBntconfirm"] =  "确定";
                options["FBntcancel"] =  "取消" ;   
                options["FBntConfirmColor"] = "pop_btn_grey";  //f_c_dc4b16
                options["FBntCancelColor"] = "pop_btn_grey";
                options["BGClose"] = true;
            }
            else{
                options["title"] = option["title"] || Config.lang("alertCommonTitle");
                options["content"] = option["content"] || "当前网络不给力";
                options["FBntconfirm"] = option["FBntconfirm"] || "确定";
                options["FBntcancel"] = option["FBntcancel"] || "取消" ;  
                options["FBntConfirmColor"] = option["FBntConfirmColor"] || "pop_btn_grey"; 
                options["FBntCancelColor"] = option["FBntCancelColor"] || "pop_btn_grey";
                this.autoCloseBg=option['autoCloseBg']||'true';
                if(option["BGClose"] != null && option["BGClose"] != undefined){
                	options["BGClose"] = option["BGClose"];
                }
                else{
                	options["BGClose"] = true;
                }
            }
			
			this.confirmBGClose = options["BGClose"];   //标示是否关闭背景 
            this.notHideProp=option["notHideProp"]?option["notHideProp"]:false;//是否关闭弹出
            this.noRemove=option['noRemove']?option['noRemove']:false;
            this.render(options);
			
            if (typeof(FBntconfirm) == "function" && FBntconfirm != null) {
               this.FBntconfirm = FBntconfirm;
            }
            if (typeof(FBntcancel) == "function" && FBntcancel != null) {
               this.FBntcancel = FBntcancel;
            }
            this.isLoading = false;
            this.isBlock = true;
        },
        Flayer:function(content,mark,SetTime){   //弹出吐丝框
        	
        	var arg_length=arguments.length;
        	
        	var thismark = (mark==""||mark==undefined||mark==null)?true:false;
        	var getTime = 1000;
        	if(SetTime != "" && SetTime != undefined && SetTime != null){
        		getTime = SetTime;
        	}
        	if(mark){thismark = true;}
	        else if(mark === false){thismark = false;}
            var self = this;
            var options = {};
            options["type"] = "Flayer";
            options["content"] = content;
            this.render(options);
            
            this.isLoading = false;
             
            if (thismark) {
                this.FlayerInter = setTimeout(function(){
                    self.$el.hide();
                    self.el.style.display="none";
                    self.FlayerFun();
                    if(arg_length==3){
                    	wrapView.lightBox.hide(); //遮罩隐藏
                    }
                    
                    self.isBlock = false;
                    
                },getTime);
            }
           
            this.isBlock = true;
        },
        loading : function(content){
        	var options = {};
            options["type"] = "Loading";
            options["content"] = content;
            this.render(options);
            this.isLoading = true;
            this.isBlock = true;
        },
        tip : function(content){
        	var options = {};
            options["type"] = "Tip";
            options["content"] = content;
            this.render(options);
            this.isLoading = true;
            this.isBlock = true;
        },
        FlayerFun:function(){   //吐丝框计时器
           clearInterval(this.FlayerInter)
        },
        closeFlayer:function(){        	
            this.$el.hide();
            this.el.style.display="none";
        	this.isLoading = false;
        	this.isBlock = false;

            this.$el.removeClass("pop-with-scale");
        },
        closeBG:function(bgclose,notHideProp){
        	if(notHideProp){
        		return false;
        	}
        	if(bgclose || bgclose == undefined){
        		wrapView.lightBox.hide(); //遮罩隐藏	
        	}
            this.$el.hide();     //先隐藏显示
            this.isLoading = false;
            this.isBlock = false;
            this.$el.removeClass("pop-with-scale");
        },
        colse : function(loading){     //取消关闭事件
			if(!(loading && this.isLoading == false)){
				wrapView.lightBox.hide(); //遮罩隐藏
				this.$el.hide();   //先隐藏显示
	            this.$el.removeClass("pop-with-scale");
			}
            this.isLoading = false;
            this.isBlock = false;
        },
        inputBlur:function(){
        	$($(".FlipPrompt")[0]).css(this.popTopObj);  
        },
        inputFocus:function(){

        	$($(".FlipPrompt")[0]).css({'top':'100px'});  

        },
        setImgUrl:function(e){//上传头像
        	var self = this,
        	files = e.target.files || e.dataTransfer.files,//获取上传图片
        	objUrl = DMJS.CommonTools.getObjectURL(files[0]);
        	$(e.target).parent().children().addClass("uhide");
        	$(e.target).parent().css({
        		"background-image":("url("+objUrl+")"),
        		"background-size":"100%",
        		"background-repeat":"no-repeat",
			});
        	$(e.target).removeClass("uhide");
        },
        shareToFriend:function(callback){  //分享
			var self = this;
			var options = {};
            options["type"] = "promptShare";
			this.render(options);
			jQuery('#shareComponent').share(
				{
					url:DMJS.shareData.shareUrl, // 网址，默认使用 window.location.href
					source:'', // 来源（QQ空间会用到）, 默认读取head标签：<meta name="site" content="http://overtrue" />
					title:DMJS.shareData.shareTitle, // 标题，默认读取 document.title 或者 <meta name="title" content="share.js" />
					description:DMJS.shareData.shareDes, // 描述, 默认读取head标签：<meta name="description" content="PHP弱类型的实现原理分析" />
					image:DMJS.shareData.shareImages, // 图片, 默认取网页中第一个img标签
					sites:['weibo','qq','qzone'], // 启用的站点
				}
			);
			
			if (typeof(callback) == "function" && callback != null) {
               this.FBntAlert = callback;
            }
		},
		shareCancel:function(e){ //取消分享
			DMJS.CommonTools.hideLightBoxAlert();
		},
		shareWeibo:function(e){
			var self = this;
			var href = $(".icon-weibo").attr("href");
			window.open(href,"_self");
		},
		shareQQ:function(e){
			var self = this;
			var href = $(".icon-qq").attr("href");
			window.open(href,"_self");
		},
		shareQqzone:function(e){
			var self = this;
			var href = $(".icon-qzone").attr("href");
			window.open(href,"_self");
		},
		shareWexin:function(e){
			var self = this;
			e.preventDefault();
			e.stopPropagation();
			$dom = $(e.target);
			if(!$dom.hasClass('modal-dialog')){
				$dom = $dom.parents('.modal-dialog');
			}
			$dom.hide();
			$('.modal-direction').css('display','block');
		},
		shareQrCode:function(e){
			var self = this;
			$dom = $(e.target);
			if(!$dom.hasClass('modal-dialog')){
				$dom = $dom.parents('.modal-dialog');
			}
			$dom.hide();
			$('.modal-QrCode').css('display','block');
		},
    });

    return FlipPrompt;
});