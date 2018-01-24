define([ 'text!userTemplate/password/forgetWithdrawP.html',
		'commonTool/validator'], function(forgetWithdrawP,Validator) {
	var forgetWithdrawPView = DMJS.DMJSView.extend({
		id : 'forgetWithdrawPView',
		name : 'forgetWithdrawPView',
		tagName : 'div',
		className : "forgetWithdrawPView",
		events : {
			
		},
		data:{
			clickTag:0
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(forgetWithdrawP, self)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		
		getMobileCode: function(e) {
			var self = this;
			if(self.data.clickTag > 0){
        		return;
        	}
        	self.data.clickTag++;
        	setTimeout(function () { self.data.clickTag = 0 }, 3000);
			var timee=document.getElementById('yzm_count');
			var yzm=document.getElementById('yzm');
			var yzm_info=document.getElementById('yzm_info');
			
			self.controller.userModel.getPasswordCode({
				'cancelLightbox': false,
				"noCache": true,
				"success": function(response) {
					yzm.style.display="none";
					yzm_info.style.display="block";
					self.reckTime(timee,yzm,yzm_info);
					DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "验证码已发送,请查收！");
				},
			});
		},
		reckTime :function(obj,yzm,yzm_info){
			var times=60;
			var sid=setInterval(function(){
					times=times-1;
					obj.innerHTML=times;
					if(times==0){
						clearInterval(sid);
						yzm.style.display="block";
						yzm_info.style.display="none";
						obj.innerHTML=60;
					}
					console.log(times);
				},1000);
			window.threadId=sid;
			},
		//验证手机验证码
		verificationCode:function(){
			var self=this;
			self.controller.commonModel.commonVerifyCode({
				'data':{
					verifyMethod:DMJS.userInfo.userName,
					type:2,
					verifyCode:$("#verityCode").val()
				},
			'cancelLightbox': false,
			"noCache": true,
			"success": function(response) {
				DMJS.router.navigate("user/password/updateWithdrawP", true);
			}
			
			})
			
		}	
			
			
	});
		
	return forgetWithdrawPView;
});
