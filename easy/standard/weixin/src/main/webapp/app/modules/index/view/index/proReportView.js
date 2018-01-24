define([ 'text!indexTemplate/proReport.html',
		'commonTool/validator'], function(proReport,Validator) {
	var proReportView = DMJS.DMJSView.extend({
		id : 'proReportView',
		name : 'proReportView',
		tagName : 'div',
		className : "",
		events : {
			"change .Upload" : "setReportPIc",//传图
			"tap #reportBtn" : "getReport", //提交资料
			"tap #peopleLawOfChina":"getPeopleLaw",//中华人民共和国民法通则
			"tap #criminalLawOfChina":"getCriminalLaw"//中华人民共和国刑法
		},
		data:{
			reportFiles:{//举报材料
				files:[],
				filesUrl:[]
			} ,
			clickTag:0
		},
		init : function(options) {
			var self = this;
			self.data.reportFiles.files = [];
			_.extend(self,options);
		},
		render : function() {
			var self = this;
			self.$el.html(_.template(proReport, self)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		//上传举报图片
		setReportPIc:function(e){
			var self = this;
			self.data.reportFiles = DMJS.CommonTools.setImgUrl(e,self.data.reportFiles,6,"","delReportImg");//限制6张
			self.loadScroller();
		},
		//删除举报图片
        delReportImg :function(e){
        	var self = this;
        	var  $uploadImg = $(e).parent().parent().find("#uploadImg");
        	DMJS.CommonTools.delImg(e,self.data.reportFiles);
        	if($uploadImg.hasClass("uhide")){//如果上传图片框被隐藏则显示
        		$uploadImg.removeClass("uhide");
        	}
        },
        getReport:function(){ 
        	var self = this;
        	if(self.data.clickTag > 0){
        		return;
        	}
        	self.data.clickTag++;
        	//setTimeout(function () { self.data.clickTag = 0 }, 8000);
        	
        	if(!Validator.check($("#"+self.id))){
        		self.data.clickTag = 0;
        		return false;
        	}
    		var params = self.$el.getFormValue();
			var _uploadMD= function(data){
				params["imgIds"] = self.comeBackIMGId(data).toString();//添加img数组
				params["projectId"] = self.projectId;//项目ID
				self.controller.indexModel.inform({ //提交举报内容
					'data': params,
					'cancelLightbox': true,
					"noCache": true,
					"success": function(response) {
						if(response.code == "000000"){
	                        DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),"举报资料提交成功",function(){
	                        	DMJS.router.navigate("index/index/projectDetails/"+self.projectId, true); 
	                        	self.data.reportFiles.files = [];
							});
						}else{
							DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),response.description);
						}
					 },
					 "error":function(response){
						 self.data.clickTag = 0;
						 DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code));
					 }
					 
				});
			};
			if(self.data.reportFiles.files.length > 0){
				self.uploadReturn(self.data.reportFiles.files,"7",_uploadMD);//上传举报图
			}else{
				params["projectId"] = self.projectId;//项目ID
				self.controller.indexModel.inform({ //提交举报内容
					'data': params,
					'cancelLightbox': true,
					"noCache": true,
					"success": function(response) {
						if(response.code == "000000"){
	                        DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),"举报资料提交成功",function(){
	                        	DMJS.router.navigate("index/index/projectDetails/"+self.projectId, true); 
							});
						}else{
							DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),response.description);
						}
					 },
					 "error":function(response){
						 self.data.clickTag = 0;
						 DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code));
					 }
				});
			}
			
        },
        uploadReturn:function(files,fileType,_call){//上传图片
			var self = this;
			var fd = new FormData();
			for ( var i in files) {
				fd.append("files"+i,files[i]);
			}
			fd.append("fileType", fileType);
			self.controller.commonModel.uploadAttachment({//上传回报图
				"data" : fd,'cancelLightbox':true,
				"processData": false,  // 告诉jQuery不要去处理发送的数据
				"contentType": false ,  // 告诉jQuery不要去设置Content-Type请求头
				"success" : function(response) {
					return _call(response.data);
				},
				"error":function(response){
					 self.data.clickTag = 0;
					 DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code));
				 }
			});
		},
		comeBackIMGId:function(data){//返回img id的数组
			var imgs = [];//img id数组
			for(var i=0 ; i < data.length ; i++){
				imgs.push(data[i].batchNumber);
			}
			return imgs;
		},
		getPeopleLaw:function(){ //中华人民共和国民法通则
			var self = this;
			var textId = "7";
			self.controller.commonModel.findTextInstructList({
				"data" :{
					textId:textId
				},
				'cancelLightbox':true,
				"success" : function(response) {
					if( response.data.list.length > 0){
						var textTitle = response.data.list[0].textTitle;
						var textContext = response.data.list[0].textContext;
						if(textContext == ""){
							textContext = "暂时无内容";
						}
						DMJS.CommonTools.alertCommon(textTitle,textContext,function(){
                    	
						});
					}
				},
			});
		},
		getCriminalLaw:function(){ //中华人民共和国刑法
			var self = this;
			var textId = "8";
			self.controller.commonModel.findTextInstructList({
				"data" :{
					textId:textId
				},
				'cancelLightbox':true,
				"success" : function(response) {
					if( response.data.list.length > 0){
						var textTitle = response.data.list[0].textTitle;
						var textContext = response.data.list[0].textContext;
						if(textContext == ""){
							textContext = "暂时无内容";
						}
						DMJS.CommonTools.alertCommon(textTitle,textContext,function(){
                    	
						});
					}
				},
			});
		}
		
	});

	return proReportView;
});
