define([ 'text!userTemplate/personal/projectManagement.html'], function(projectManagement) {
	var projectManagementView = DMJS.DMJSView.extend({
		id : 'projectManagementView',
		name : 'projectManagementView',
		tagName : 'div',
		className : "projectManagementView",
		events : {
		     //'tap .JSAppointDropDown': 'JSAppointDropDown',
		},
		init : function(options) {
			_.extend(this, options);
		},
		data:{
			promandata:{
				projectId:"", //项目id
				projectStatus:"",//项目状态
				projectType:"",//项目类型
			},
		},
		render : function() {
			var self = this;
			if(self.projectId&&self.projectStatus&&self.projectType){
				self.data.promandata.projectId = self.projectId;
				self.data.promandata.projectStatus = self.projectStatus;
				self.data.promandata.projectType = self.projectType;
			}
			this.$el.html(_.template(projectManagement,self.data.promandata)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		supportOrderAction:function(){  //支持订单
			var self = this;
			var projectId = self.projectId;
			var projectType = self.projectType;
			if(!!projectId&&!!projectType){
				if(projectType == "6"){ //回报项目
					DMJS.router.navigate("user/personal/supportOrderReturnPro/"+projectId+"/"+projectType,true);
				}else{
					DMJS.router.navigate("user/personal/supportOrder/"+projectId+"/"+projectType,true);
				}
			}
		},
		proDeleteAction:function(){ //删除项目
			var self = this;
			DMJS.router.navigate("user/personal/proDel/"+self.projectId,true); 
		},
		proAheadEndAction:function(){
			var self = this;
			DMJS.router.navigate("user/personal/proAheadOver/"+self.projectId+"/"+self.projectType,true); 
		},
		toVali:function(){//去验证项目
			var self = this;
			var proType = self.projectType;//项目类型
			self.controller.commonModel.isProAuthenticated({//项目验证状态
				"data" : {"projectId":self.projectId},'cancelLightbox':true,
				"success" : function(response) {
					var valiType = response.data.singleResult.status;//项目验证类型
					if(valiType != "0"){//项目已经验证
						DMJS.router.navigate("index/index/proValidate/" +self.projectId, true);//项目验证结果
					}else{
						switch (proType){//根据项目不同跳转不同的项目验证
							case '1':
								DMJS.router.navigate("start/start/proValidate/1-1/" +self.projectId+"/manger", true);  
								break;
							case '2':
								DMJS.router.navigate("start/start/proValidate/1-2/" +self.projectId+"/manger", true);  
								break;
							case '3':
								DMJS.router.navigate("start/start/proValidate/1-3/" +self.projectId+"/manger", true);  
								break;
							case '4':
								DMJS.router.navigate("start/start/proValidate/1-4/" +self.projectId+"/manger", true);  
								break;
							case '5':
								DMJS.router.navigate("start/start/proValidate/1-5/" +self.projectId+"/manger", true);  
								break;
							case '6':
								DMJS.router.navigate("start/start/proValidate/2/" +self.projectId+"/manger", true);  
								break;
							case '7':
								DMJS.router.navigate("start/start/proValidate/3/" +self.projectId+"/manger", true);  
								break;
						}
					}
				},
			});
			
		},
		toUpdate:function(){//去编辑项目
			var self = this;
			var proType = self.projectType;//项目类型
			switch (proType){//根据项目不同跳转不同的项目验证
				case '1':
					DMJS.router.navigate("start/start/toStart/1-1/" +self.projectId, true);  
					break;
				case '2':
					DMJS.router.navigate("start/start/toStart/1-2/" +self.projectId, true);  
					break;
				case '3':
					DMJS.router.navigate("start/start/toStart/1-3/" +self.projectId, true);  
					break;
				case '4':
					DMJS.router.navigate("start/start/toStart/1-4/" +self.projectId, true);  
					break;
				case '5':
					DMJS.router.navigate("start/start/toStart/1-5/" +self.projectId, true);  
					break;
				case '6':
					DMJS.router.navigate("start/start/toStart/2/" +self.projectId, true);  
					break;
				case '7':
					DMJS.router.navigate("start/start/toStart/3/" +self.projectId, true);  
					break;
			}
		},
		
	});
		
	return projectManagementView;
});