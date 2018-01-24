define([ 'text!userTemplate/personal/updateDynamics.html',
		'commonTool/validator'], function(updateDynamics,Validator) {
	var uupdateDynamicsView = DMJS.DMJSView.extend({
		id : 'uupdateDynamicsView',
		name : 'uupdateDynamicsView',
		tagName : 'div',
		className : "uupdateDynamicsView",
		events : {
			"change .Upload" : "setImgUrl",//传图
			"tap #updateDynamics":"updateDynamics",//更新动态
			"input #updateContent":"contentLength"
		},
		data:{
			num : 0,//图片上传张数
			fileFilter :{
				files:[],
				filesUrl:[]
			},//图片上传的file的value
			backImgIngo:{},//上传图片返回图片信息
			clickTag:0
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(updateDynamics, self)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		//上传项目图片
		setImgUrl:function(e){
			var self = this;
			self.data.fileFilter = DMJS.CommonTools.setImgUrl(e,self.data.fileFilter,8,"","delIdCardImg");
			console.log(JSON.stringify(self.data.fileFilter));
			self.loadScroller();
		},
		//删除项目图片
        delIdCardImg :function(e){
        	var self = this;
        	var  $uploadImg = $(e).parent().parent().find("#uploadImg");
        	DMJS.CommonTools.delImg(e,self.data.fileFilter);
        	if($uploadImg.hasClass("uhide")){//如果上传图片框被隐藏则显示
        		$uploadImg.removeClass("uhide");
        	}
        	
        },
        contentLength:function(e){
        	var self=this;
        	var result=$(e.target).val();
        	$("#words").text(result.length);
        },
        
        updateDynamics:function(){
        	var self=this;

        	if(self.data.clickTag > 0){
        		return;
        	}
        	self.data.clickTag++;
        	//setTimeout(function () { self.data.clickTag = 0 }, 5000);
        	
        	var fileType = 6;
        	if( !$("#updateContent").val()){
        		DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "更新内容为空，请重新输入!");
        		self.data.clickTag = 0;
				return;
        	}
        	if(self.data.fileFilter.files.length < 1){
				self.addProCallNoPic();
        	}else{
        		self.uploadImg(self.data.fileFilter.files,fileType);
        	}
        	
        },
        
        uploadImg:function(files,fileType){//上传图
			var self = this;
			var fd = new FormData();
			for ( var i in files) {
				fd.append("files"+i,files[i]);
			}
			fd.append("fileType", fileType);
			self.controller.commonModel.uploadAttachment({//上传图集合
				"data" : fd,'cancelLightbox':true,
				"processData": false,  // 告诉jQuery不要去处理发送的数据
                "contentType": false ,  // 告诉jQuery不要去设置Content-Type请求头
				"success" : function(response) {
					self.data.backImgIngo = response.data;//记录上传图片信息
					self.addProCall();
				},
				"error":function(response){
					 self.data.clickTag = 0;
					 DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code));
				 }
			});
		},
		
		addProCall:function(){
			var self=this;
			var params={};
			params['projectId']=self.projectId;
			params['dynamicInfo']=$("#updateContent").val();
			params['imgsIds'] = [];
			for(var i in self.data.backImgIngo){//图片id
				params['imgsIds'].push(self.data.backImgIngo[i].batchNumber);
			}
			params['imgsIds'] = params['imgsIds'].toString();
			self.controller.userModel.addDynamic({
				'data':params,
				'cancelLightbox':true,
				"success" : function(response) {
					DMJS.router.navigate("index/index/projectDetails/" + self.projectId, true);  
				},
				"error":function(response){
					 self.data.clickTag = 0;
					 DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code));
				 }
			});
		},
		addProCallNoPic:function(){
			var self=this;
			var params={};
			params['projectId']=self.projectId;
			params['dynamicInfo']=$("#updateContent").val();
			self.controller.userModel.addDynamic({
				'data':params,
				'cancelLightbox':true,
				"success" : function(response) {
					DMJS.router.navigate("index/index/projectDetails/" + self.projectId, true);  
				},
				"error":function(response){
					 self.data.clickTag = 0;
					 DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code));
				 }
			});
		}
    });
    
	return uupdateDynamicsView;
});
