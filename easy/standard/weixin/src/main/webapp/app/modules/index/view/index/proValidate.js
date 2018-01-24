define([ 'text!indexTemplate/proValidate.html',
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
		data:{},
		render : function() {
			var self = this;
			self.loadProDetialsDatas();
			return this;
		},
		loadProDetialsDatas:function(){
			var self = this;
			self.controller.indexModel.projectDetailsCon({ //获取项目详情内容
				'data': {
					projectId:self.proid,  
				    projectNo:""
				},
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					_.extend(self.data,response.data);
					self.proStuts();
				 }
			});
	    },
	    proStuts:function(){//去验证
			var self = this;
			self.controller.commonModel.isProAuthenticated({//项目验证状态
				"data" : {"projectId":self.proid},'cancelLightbox':true,
				"success" : function(response) {
					self.proVali(response.data.singleResult.validationId);
				},
			});
		},
		proVali:function(validationId){//项目验证状态
			var self = this;
			self.controller.indexModel.authenticatedRecord({
				"data" : {"valiId":validationId},'cancelLightbox':true,
				"success" : function(response) {
					_.extend(self.data,response.data);
					self.$el.html(_.template(proValidateTemplate, self.data)); // 将tpl中的内容写入到
					self.loadScroller();
				},
			});
		},
		toUpdateVali:function(){//去修改验证信息
			var self = this;
			var proType = self.data.singleResult.type;//项目类型
			var valiType = self.data.singleResult.validationType;//项目验证类型
			switch (proType){
				case '1':
					switch (valiType){
						case '1':
							DMJS.router.navigate("start/start/illnValidate/1-1-1/" +self.proid, true);  
							break;
						case '2':
							DMJS.router.navigate("start/start/illnValidate/1-1-2/" +self.proid, true);  
							break;
						case '3':
							DMJS.router.navigate("start/start/illnValidate/1-1-3/" +self.proid, true);  
							break;
						case '4':
							DMJS.router.navigate("start/start/illnValidate/1-1-4/" +self.proid, true);  
							break;
					}
					break;
				case '2':
				case '3':
				case '4':
				case '5':
					switch (valiType){
						case '1':
							DMJS.router.navigate("start/start/validate/1-"+proType+"-1/" +self.proid, true);  
							break;
						case '4':
							DMJS.router.navigate("start/start/validate/1-"+proType+"-2/" +self.proid, true);  
							break;
					}
					break;
				case '6':
					switch (valiType){
						case '1':
							DMJS.router.navigate("start/start/validate/2-1/" +self.proid, true);  
							break;
						case '4':
							DMJS.router.navigate("start/start/validate/2-2/" +self.proid, true);  
							break;
					}
					break;
				case '7':
					switch (valiType){
						case '1':
							DMJS.router.navigate("start/start/validate/3-1/" +self.proid, true);  
							break;
						case '4':
							DMJS.router.navigate("start/start/validate/3-2/" +self.proid, true);  
							break;
					}
					break;
			}
		},
	});

	return proValidateView;
});
