define([ 'text!userTemplate/personal/bindAccountDetail.html',
		'commonTool/validator'], function(bindAccountDetail,Validator) {
	var bindAccountDetailView = DMJS.DMJSView.extend({
		id : 'bindAccountDetailView',
		name : 'bindAccountDetailView',
		tagName : 'div',
		className : "bindAccountDetailView",
		events : {
			
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			if(self.code){//有授权返回的code则请求
				self.controller.userModel.addThirdUser({//绑定新账号
					"data":{
						sourceType:"5",//2微信 3微博 4QQ 5公众号用户
						code:self.code,
						},
	                "noCache": true,
	                "success": function(response) { 
	                	self.loadData();
	                },
	            });
			}else{
				self.loadData();
			}
			return this;
		},
		loadData:function(){
			var self = this;
			self.controller.userModel.findThirdPartyList({
				'cancelLightbox':true,
	        	"noCache":true,
	        	"success":function(response){
	        		self.list = [];
	        		switch (self.type){
						case "wx":
							self.list = response.data.wxList;
							break;
					   	case "xl":
					   		self.list = response.data.wbList;
					   		break;
					   	case "qq":
					   		self.list = response.data.qqList;
					   		break;
					}
	        		self.$el.html(_.template(bindAccountDetail, self)); // 将tpl中的内容写入到
	    			self.loadScroller();
	        	}
			});
		},
		unbind:function(e){//解绑
			var self = this;
			var $dom = $(e);
			if(!$dom.is("#bindList > div")){
				$dom = $dom.parents("#bindList > div");
			}
			var bindid = $dom.attr("bindid");
			wrapView.FlipPrompt.confirm({
                title: '解绑提示',
                content:"您确定要解绑账户“"+self.list[0].nickName+"”吗？",
                FBntconfirm: "取消",
                FBntcancel: "确定",
                FBntCancelColor: "pop_btn_orange",
                autoCloseBg:'true'
            }, function() {
            	
            }, function() {
            	self.controller.userModel.unbundling({
    				'data':{id:bindid},
    				'cancelLightbox':true,
    	        	"noCache":true,
    	        	"success":function(response){
    	        		$dom.parent().remove($dom);//删除自己
    	        		$("#tobind").removeClass("uhide");
    	    			self.loadScroller();
    	        	}
    			});
            });
		},
		bindNew:function(){//绑定新账号
			var self = this;
			wrapView.FlipPrompt.confirm({
                title: '绑定第三方账号',
                content:"绑定第三方账号需要退出当前账号重新登录，是否退出？",
                FBntconfirm: "取消",
                FBntcancel: "确定",
                FBntCancelColor: "pop_btn_orange",
                autoCloseBg:'true'
            }, function() {
            	
            }, function() {
            	switch (self.type){
				case "wx":
					DMJS.router.navigate("user/personal/login", true);
					break;
			   	case "xl":
			   		self.controller.commonModel.findCache({
			        	'data':{
			        		key:"WB_APPID",
			        	},
			        	'cancelLightbox':true,
			        	"noCache":true,
						"success":function(response){
							var callUrl = encodeURIComponent(window.location.origin+window.location.pathname+"?#user/personal/wblogin");
                            // var callUrl = "http%3a%2f%2fwww.365bangnichou.com%2fweixin%2f%3f%23user%2fpersonal%2fwblogin";
							window.location.href="https://api.weibo.com/oauth2/authorize?client_id="+
								response.data+"&response_type=code&redirect_uri="+callUrl;
						}
						
			        });
			   		break;
			   	case "qq":
			   		self.controller.commonModel.findCache({
			        	'data':{
			        		key:"QQ_APPID",
			        	},
			        	'cancelLightbox':true,
			        	"noCache":true,
						"success":function(response){
							var callUrl = encodeURIComponent(window.location.origin+window.location.pathname+"?#user/personal/qqlogin");
							window.location.href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id="+
							response.data+"&redirect_uri="+
							callUrl+"&scope=9024ca9109dc1ebec99f2993f25edfa4";
						}
						
			        });
			   		break;
            	}
            	
            });
		},
	});
		
	return bindAccountDetailView;
});
