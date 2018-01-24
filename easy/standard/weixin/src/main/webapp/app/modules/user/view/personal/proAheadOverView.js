define([ 'text!userTemplate/personal/proAheadOver.html',
         'commonTool/validator'], function(proAheadOver,Validator) {
	var proAheadOverView = DMJS.DMJSView.extend({
		id : 'proAheadOverView',
		name : 'proAheadOverView',
		tagName : 'div',
		className : "",
		events : {
		     'tap #goFinishPro': 'goFinishPro',
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(proAheadOver)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		goFinishPro:function(){ //提交
			var self = this;
        	if(!Validator.check($("#"+self.id))){return false;}
    		var params = self.$el.getFormValue();
    		params["projectId"] = self.projectId;
    		self.controller.commonModel.isProAuthenticated({//项目验证状态
				"data" : {"projectId":self.projectId},'cancelLightbox':true,
				"success" : function(response) {
					if(response.data.singleResult.status == "3"){ //验证通过
						
						self.controller.userModel.finish({//提交结束项目
							"data" : params,
							'cancelLightbox':true,
							"success" : function(response) {
								if(response.code == "000000"){
									if(response.data.singleResult){
										DMJS.router.navigate("user/personal/proAheadOverSuccess/"+self.projectId+"/"+response.data.singleResult,true);
									}
									
								}
							}
						});
						
					}else{ //未验证、验证待审核、验证不通过
						wrapView.FlipPrompt.confirm({
			                title: '项目验证',
			                content:"项目提前结束时需要先通过项目验证！",
			                FBntconfirm: "取消",
			                FBntcancel: "去验证",
			                FBntCancelColor: "pop_btn_orange",
			                autoCloseBg:'true'
			            }, function() {
			           	
			            }, function() {
			            	switch(self.projectType)
			            	{
			            	case "1"://大病救助
			            	      self.projectType = "1-1";
			            	      break;
			            	case "2"://灾难救助
			            	      self.projectType = "1-2";
			            	      break;
			            	case "3"://动物保护
				            	  self.projectType = "1-3";
				            	  break;
			            	case "4"://扶贫助学
				            	  self.projectType = "1-4";
				            	  break;
			            	case "5"://其他救助
				            	  self.projectType = "1-5";
				            	  break;
			            	case "6"://回报项目
				            	  self.projectType = "2";
				            	  break;
			            	case "7"://梦想项目
				            	  self.projectType = "3";
				            	  break;
			            	}
			            	DMJS.router.navigate("start/start/proValidate/" + self.projectType + "/" +self.projectId, true); 
			            });
						
					}
				},
			});
		}
	});
		
	return proAheadOverView;
});



