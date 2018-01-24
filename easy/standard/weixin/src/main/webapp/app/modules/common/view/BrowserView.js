/**
* 浏览器本地头
* 
 */

define(['Native'],function(Native){ 
    var BrowserView = DMJS.DMJSView.extend({
        el : '<div style="z-index:100; position:fixed; margin:0 auto;width:100%; background-color:#ffffff;"><header id="header" class="uh t-wh ub c-red ub-ver"><div class="uh t-wh ub c-red"><div id="header_left" class="umw4 ub ub-ac uinn-al1 fn-s-15"><div class="t-btn-a1 ub-img8 uwh-tBtn2"></div></div> <div id="header_title" class="ut ub-f1 ut-s tx-c fn-s-15" tabindex="0">外&nbsp;部&nbsp;资&nbsp;源</div><div id="header_right" class="umw4 ub ub-ac ub-pe uinn-ar1 fn-s-15"></div></div></header><iframe style="width:100%;height:100%;border:none;"></iframe></div>',        
        dialogData : {}, 
        events:{
        	"tap #header_left":"test"
        },
        header : null,
        init : function(option){
          	_.extend(this,option);
          	$("input:focus").blur();
        },
        render:function(){
//        	this.$el.append(this.tempDialog);
        	var _currentIframe=this.$el.find("iframe");
        	_currentIframe.attr("src",this.url);
        	this.$el.find("#header_title").text(this.title);
        	this.$el.appendTo(document.body);
        	_currentIframe.height(wrapView.height-this.$el.find("#header").height());
        	return this;
        },
        test:function(){
        	this.destroy();
        	DMJS.navigate("user/personal/userInfo",true);
        }
    });
    
    return BrowserView;
});              
