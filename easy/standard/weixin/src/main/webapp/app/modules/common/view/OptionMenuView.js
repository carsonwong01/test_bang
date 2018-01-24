/**
* 浏览器本地头
* 
 */

define(['Native',"text!commonTemplate/OptionMenuTpl.html"],function(Native,OptionMenuTpl){ 
    var BrowserView = DMJS.DMJSView.extend({    
    	el:'<div id="optionMenuTip" class="ub ub-ver pt-page-moveFromRight" style="position: fixed; bottom: 0px; right: 0px; height: 585px; min-width: 60%; max-width: 40em; z-index: 41; overflow-y: scroll; background: rgb(243, 243, 243);"></div>',
        dialogData : {}, 
        events:{
        	'tap li[action]':'goAction',
        },
        header : null,
        init : function(option){
          	_.extend(this,option);
          	$("input:focus").blur();
        },
        render:function(){
        	this.$el.append(_.template(OptionMenuTpl,this));
        	wrapView.lightBox.show();
        	this.$el.height($("#content").height());
        	this.$el.appendTo(document.body);
        	this.exitFun = _.bind(this.exit,this)
        	$(".dsn").bind("tap",this.exitFun);
//        	this.loadScroller();
        	return this;
        },
        test:function(){
        	this.destroy();
        },
        onDestroy:function(){
        	$(".dsn").unbind("tap",this.exitFun);
        },
        goHash:function(hash){
        	DMJS.navigate(hash);
        	this.exit();
        },
        exit:function(){
        	wrapView.lightBox.hide();
        	this.$el.addClass("pt-page-moveToRight");
        	var self=this;
        	setTimeout(function(){
        		self.destroy();
        	},300);
        	
        },
        logout:function(){
        	if(DMJS.userInfo){
        		new DMJS.DMJSModel().commonRequest({
        			"success":function(){
                        DMJS.userInfo = '';
                        DMJS.localData.set('loginStatus','N');
                        Native.exit();
        			},
        			"urlKey":"user.loginOut"
        		})
        	}else{
        		Native.exit();
        	}
        },
        setTranPassword:function(){
        	this.exit();
            if(!DMJS.currentView.data.mobileVerified){
                DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),"请先认证手机号码",function(){DMJS.router.navigate("user/personal/basicInfo",true);});
            }else{ 
	        	if(!DMJS.currentView.data.withdrawPsw){  //没有设置过交易密码
	        		DMJS.router.navigate("user/password/setTranPassword",true);
	        	}else{
	        		DMJS.router.navigate("user/password/updateTranPassword",true);
	        	}
            }
        },
    });
    
    return BrowserView;
});              
