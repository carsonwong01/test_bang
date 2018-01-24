define([ 'text!startTemplate/proValidate.html',
		'commonTool/validator','Lib/native/weixin'], function(proValidateTemplate,Validator,wx) {
	var proValidateView = DMJS.DMJSView.extend({
		id : 'proValidateContent',
		name : 'proValidateContent',
		tagName : 'div',
		className : "",
		events : {
			
		},
		init : function(options) {
			_.extend(this, options);
		},
		data:{
			proStatus:0,//项目验证状态 0未验证   1验证待审核   2验证不通过   3验证通过
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(proValidateTemplate, self)); // 将tpl中的内容写入到
			self.proValiStatus();
			return this;
		},
		proValiStatus:function(){//该项目验证状态
			var self = this;
			self.controller.commonModel.isProAuthenticated({//项目验证状态
				"data" : {"projectId":self.id},'cancelLightbox':true,
				"success" : function(response) {
					self.data.proStatus = response.data.singleResult;
				},
			});
		},
		toVali:function(type){//去验证
			var self = this;
			if(self.data.proStatus.status == "0"){//0未验证  1验证待审核 2验证不通过	 3验证通过
				if(self.type == "1-1"){//公益
					DMJS.router.navigate("start/start/illnValidate/" + type + "/" +self.id, true);  
				}else{//梦想或回报
					DMJS.router.navigate("start/start/validate/" + type + "/" +self.id, true);  
				}
			}else{
				DMJS.router.navigate("index/index/proValidate/" +self.id, true);//项目验证结果
			}
		},
		laterOn:function(){//稍后验证
			var self = this;
			wrapView.FlipPrompt.confirm({
                title: '资料准备中，稍后再验证',
                content:"未验证的项目会影响您的提现申请，也可在后续项目进行中验证，请确定是否后续再验证？",
                FBntconfirm: "取消",
                FBntcancel: "确定",
                FBntCancelColor: "pop_btn_orange",
                autoCloseBg:'true'
            }, function() {
           	
            }, function() {
            	DMJS.router.navigate("start/start/createSuc/" + self.type + "/" +self.id, true); 
            });
		},
	});

	return proValidateView;
});
