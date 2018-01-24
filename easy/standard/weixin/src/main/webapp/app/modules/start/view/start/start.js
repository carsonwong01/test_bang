define([ 'text!startTemplate/start.html',
		'commonTool/validator','Lib/native/weixin'], function(startTemplate,Validator,wx) {
	var startView = DMJS.DMJSView.extend({
		id : 'startviewContent',
		name : 'startviewContent',
		tagName : 'div',
		className : "bg-c-white",
		events : {
			
		},
		data:{},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			var _call = function(){
				self.$el.html(_.template(startTemplate, self.data)); // 将tpl中的内容写入到
				self.loadScroller();
			}
			self.loadExpData("1",_call);
			self.loadExpData("2");
			return this;
		},
		loadExpData:function(textId,func){//加载发起须知
			var self = this;
			self.controller.commonModel.findTextInstructList({//文本说明列表查询
				/*1发起须知 2筹款攻略 3公益项目筹款说明 4回报项目筹款说明
				5梦想项目筹款说明 6提现温馨提示 7中华人民共和国民法通则 8中华人民共和国刑法*/
				"data" : {"textId":textId},'cancelLightbox':true,
				"success" : function(response) {
					if(textId == "1"){//发起须知
						self.data.startExp = response.data.list[0];
						if(func){
							func();
						}
					}else{//筹款攻略
						self.data.strategy = response.data.list[0];
					}
					
				},
			});
		},
		explain:function(){//筹款攻略
			var self = this;
			DMJS.CommonTools.alertCommon(self.data.strategy.textTitle, self.data.strategy.textContext,function(){
				console.log("关闭筹款策略弹框");
			},"知道了");
			
		},
		toStart:function(type){//去发起
			var self = this;
			if(DMJS.userInfo){
				self.controller.commonModel.findLoginCache({
		        	'data':{
		        		key:DMJS.userInfo.token
		        	},
		        	'cancelLightbox':true,
		        	"noCache":true,
					"success":function(response){
						if(response.data.userStatus=="1"){
							if(type=="1"){
								DMJS.router.navigate("start/start/startDonate", true); 
							}else{
								DMJS.router.navigate("start/start/toStart/" + type, true); 
							}
						}else if(response.data.userStatus=="3"){
							DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "该用户已被拉黑！");
						}else if(response.data.userStatus=="2"){
							DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "该用户已被锁定！");
						}
					}
	        	});
			}else{
				DMJS.router.navigate("start/start/toStart/" + type, true); 
			}
		},
	});

	return startView;
});
