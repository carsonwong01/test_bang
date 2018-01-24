/**
 * @author yc
 * 底部弹框
 * 参数
 */
define(['text!commonTemplate/BottomDialogTpl.html'
	,'commonClass/commonTools'
], function(tpl) {
    var bottomDialogView = PAWA.PAWAView.extend({
        id : 'bottomDialogView',
        name : 'bottomDialogView',
        tagName : 'div',
        className : 'pop dsn',
        uid : 0,
        type   : 'control',
        isShow : false,        
        events : {
			"tap input" : "direction"        
        },
        // 初始化
        init : function(options) {
        	this.currController = options.controller;
			this.render(options,true);			
        },
        render : function(options,isHide){
        	var data = options.data,
        		callBacks = this.callBacks = {};
        	if(!data)
        		return;
        	$.each(data,function(i,d){
        		var uid = d.uid = i+1;
        		if(typeof d.action == "function"){        			
        			callBacks[uid] = d.action;
        			d.action = uid;
        		}else{
        			d.action = 0;
        		} 
        	});        	
        	this.data = options;
        	!isHide
        		&&this.show();      	
        },
        show : function(){
        	var html = _.template(tpl,this.data);
			this.$el.html(html).css("display","inline-block");
			wrapView.lightBox.show();
			this.el.style.webkitTransform = 'translate3d(0, 0px, 0)';
			this.isShow = true;
        },        
        direction : function(e){
        	var $a = $(e.target),
        		action = $a.attr("action");
        		to = $a.attr("to");

        	if(to&&to.length>0){
        		if(to == "cancel"){
        			this.close(true);
        		}else{
        			this.close();
	        		PAWA.router.navigate(to,true);	        			
        		}       			
        	}else{
        		this.close();
        	}
        	if(parseInt(action)>0){
        		var callBack = this.callBacks[action];
				typeof callBack == "function"
					&&callBack();
        	}        	        	
        },
        close : function(cancel){
        	var self = this;
			wrapView.lightBox.hide();
        	this.el.style.webkitTransform = 'translate3d(0,500px,0)';
			setTimeout(function(){
				self.$el.css("display","none");
				self.isShow = false;
			},210);      							        	
        }
    });

    return bottomDialogView;
});
