define([ 'text!startTemplate/validate.html',
		'commonTool/validator','Lib/base64'], function(validateTemplate,Validator,Base64) {
	var validateView = DMJS.DMJSView.extend({
		id : 'validateContent',
		name : 'validateContent',
		tagName : 'div',
		className : "",
		events : {
			"change .Upload" : "setImgUrl",
			"tap .LookImg" : "LookImg",//查看图
			"input input[name='receiveIdCard']":"changeVali",//身份证修改
		},
		data:{
			idVali : /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}(\d|x|X)$/,//身份证正则表达式
			clickTag:0,//点击次数
		},
		init : function(options) {
			_.extend(this, options);
		},
		reset :function(){
			var self = this;
			self.data.idCardFiles={//身份证
					files:[],
					filesUrl:[],
					num:2
				};
			self.data.MechanismFiles={//组织机构资质证明
					files:[],
					filesUrl:[],
					num:1
				};
			self.data.ProProve={//项目相关证明
					files:[],
					filesUrl:[],
					num:6
				};
			self.data.receiveCardImageIds={};//手持身份证照片
			self.data.proveImgIds={};//医疗诊断证明图片ID集合
			self.data.useProveImgIds={},//资金用途证明图片ID集合
			self.data.projectProveImgIds={},//项目相关证明材料（可多张）
			self.data.singleResult = {};//验证返回信息
		},
		render : function() {
			var self = this;
			switch (self.type){
				case '1-2-1':case '1-2-2':
					self.data.hint = '请提供正规的受灾证明照片';
					break;
				case '1-3-1':case '1-3-2':
					self.data.hint = '请提供资金用途证明或正规发票';
					break;
				case '1-4-1':case '1-4-2':
					self.data.hint = '请提供贫困证明（或低保证明）和学校资质证明';
					break;
				case '1-5-1':case '1-5-2':
					self.data.hint = '请提供可以证明需要他人帮助的证明材料';
					break;
				case '2-2':
					self.data.hint = '营业执照上的所有信息必须清晰可见';
					break;
				case '3-1':case '3-2':
					self.data.hint = '项目相关证明材料上的所有信息必须清晰可见';
					break;
				default:
					self.data.hint = '';
					break;
			}
			self.reset();
			self.proValiStatus();
			return this;
		},
		proValiStatus:function(){//该项目验证状态
			var self = this;
			self.controller.commonModel.isProAuthenticated({//项目验证状态
				"data" : {"projectId":self.id},'cancelLightbox':true,
				"success" : function(response) {
					self.data.type = self.type;
					if(response.data.singleResult.status != "0"){//项目已经验证过
						self.valiDetail();
					}else{
						self.loadExpImg();
					}
				},
			});
		},
		valiDetail:function(){//查询验证详情
			var self = this;
			self.controller.startModel.proAuthenticatedDetail({//项目验证状态
				"data" : {"projectId":self.id},'cancelLightbox':true,
				"success" : function(response) {
					_.extend(self.data,response.data);
					if(response.data.singleResult.organizationAptitudeUrl){
						self.data.MechanismFiles.files.push({//查询出来的组织机构资质/营业执照图片
							addr:response.data.singleResult.organizationAptitudeUrl,
							fileId:response.data.singleResult.organizationAptitudeId,
						});
					}
					self.data.MechanismFiles.filesUrl.push(response.data.singleResult.organizationAptitudeUrl);
					
					_.extend(self.data.idCardFiles.files,response.data.receiveCardImageIds);//查询出来的手持身份证照片
					for(var i in response.data.receiveCardImageIds){
						self.data.idCardFiles.filesUrl.push(Config.url("imgAddress")+response.data.receiveCardImageIds[i].addr);
					}
					
					var ProProve = response.data.projectProveImgIds.length > 0 ? response.data.projectProveImgIds:response.data.useProveImgIds;
					_.extend(self.data.ProProve.files,ProProve);//查询出来的资金用途证明图片/项目相关证明图片
					for(var i in ProProve){
						self.data.ProProve.filesUrl.push(Config.url("imgAddress")+ProProve[i].addr);
					}
					self.loadExpImg();
				},
			});
		},
		loadExpImg:function(){//加载示例图片
			var self = this;
			self.controller.startModel.findImgModel({
				'cancelLightbox':true,
				"success" : function(response) {
					_.extend(self.data,response.data);
					self.$el.html(_.template(validateTemplate, self.data)); // 将tpl中的内容写入到
					setTimeout(function(){
						self.loadScroller();
					}, 300);
				},
			});
		},
		comeBackIMGId:function(data){//返回img id的数组
			var imgs = [];//身份证id数组
			for(var i=0 ; i < data.length ; i++){
				imgs.push(data[i].batchNumber);
			}
			return imgs;
		},
		commit:function(params){//提交验证
			var self = this;
			self.controller.startModel.proAuthenticated({
				"data" : params,'cancelLightbox':true,
				"success" : function(response) {
					DMJS.CommonTools.alertCommon("提交成功！请等待验证审核", "亲爱的用户，您好！您的项目审核资料已经提交成功，我们的工作人员将会在1-2个工作日内完成审核，并通知到您，请耐心等待，谢谢您的合作！",
						function(){
							if(listHash.length > 3){
								if(listHash[listHash.length-3].indexOf(user/personal/projectManagement)!="-1"){
									DMJS.router.navigate("index/index/projectDetails/" +self.id, true); 
									return false;
								}
							}
							DMJS.router.navigate("start/start/createSuc/" + self.type + "/" +self.id, true); 
					},"知道了");
				},
			});
			
		},
		LoadData:function(){//提交前对数据进行处理
			var self = this;
			if(self.data.clickTag > 0){//防止重复提交
        		return;
        	}
        	self.data.clickTag++;
        	setTimeout(function () { self.data.clickTag = 0 }, 3000);
        	
			if(!Validator.check($("#"+self.id))){return false}
			var params="";
			var params = _.extend(self.$el.getFormValue(), self.data);
			params['projectId'] = self.id;
			if(self.data.singleResult.validationId){//验证id存在就修改
				params['validationId'] = self.data.singleResult.validationId;
			}
			//身份证加密
			if(params['receiveIdCard']){
				if(params['receiveIdCard'] == params['recipient']){//收款人和受助人身份证不能相同
					DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "收款人和受助人的身份证不能相同");
					return false;
				}
				params['receiveIdCard'] = new Base64().encode(params['receiveIdCard']);
			}
			if(params['recipient']){
				params['recipient'] = new Base64().encode(params['recipient']);
			}
			
			switch (self.type){
				case '1-2-1':
				case '1-3-1':
				case '1-4-1':
				case '1-5-1':
					params['validationType'] = "1";//验证类型，本人验证1
					var _commitVali=function(data){
						params["useProveImgIds"] = self.comeBackIMGId(data).toString();
						self.commit(params);
					}
					var _uploadMD= function(data){
						params["receiveCardImageIds"] = self.comeBackIMGId(data).toString();
						self.uploadReturn(self.data.ProProve.files,"4",_commitVali);
					}
					self.uploadReturn(self.data.idCardFiles.files,"8",_uploadMD);//上传身份证图
					break;
				case '1-2-2':
				case '1-3-2':
				case '1-4-2':
				case '1-5-2':
					params['validationType'] = "4";//验证类型，本人验证1
					var _commitVali=function(data){
						params["projectProveImgIds"] = self.comeBackIMGId(data).toString();
						self.commit(params);
					}
					var _uploadMD= function(data){
						params["organizationAptitudeId"] = data[0].batchNumber;//组织机构资质/营业执照图片ID
						params["organizationAptitudeUrl"] = data[0].url;//组织机构资质/营业执照图片URL
						self.uploadReturn(self.data.ProProve.files,"4",_commitVali);
					}
					self.uploadReturn(self.data.MechanismFiles.files,"0",_uploadMD);//上传身份证图
					break;
				case '2-1':
					params['validationType'] = "1";//验证类型，本人验证1
					var _commitVali=function(data){
						params["receiveCardImageIds"] = self.comeBackIMGId(data).toString();
						self.commit(params);
					}
					self.uploadReturn(self.data.idCardFiles.files,"8",_commitVali);//上传身份证图
					break;
				case '2-2':
					params['validationType'] = "4";//验证类型，本人验证1
					var _commitVali=function(data){
						params["organizationAptitudeId"] = data[0].batchNumber;//组织机构资质/营业执照图片ID
						params["organizationAptitudeUrl"] = data[0].url;//组织机构资质/营业执照图片URL
						self.commit(params);
					}
					var _uploadMD= function(data){
						params["receiveCardImageIds"] = self.comeBackIMGId(data).toString();
						self.uploadReturn(self.data.MechanismFiles.files,"0",_commitVali);
					}
					self.uploadReturn(self.data.idCardFiles.files,"8",_uploadMD);//上传身份证图
					break;
				case '3-1':
					params['validationType'] = "1";//验证类型，本人验证1
					var _commitVali=function(data){
						params["projectProveImgIds"] = self.comeBackIMGId(data).toString();
						self.commit(params);
					}
					var _uploadMD= function(data){//项目证明
						params["receiveCardImageIds"] = self.comeBackIMGId(data).toString();
						self.uploadReturn(self.data.ProProve.files,"5",_commitVali);
					}
					self.uploadReturn(self.data.idCardFiles.files,"8",_uploadMD);//上传身份证图
					break;
				case '3-2':
					params['validationType'] = "4";//验证类型，本人验证1
					var _commitVali=function(data){
						params["projectProveImgIds"] = self.comeBackIMGId(data).toString();
						self.commit(params);
					}
					var _uploadMD= function(data){//项目证明
						params["organizationAptitudeId"] = data[0].batchNumber;//组织机构资质/营业执照图片ID
						params["organizationAptitudeUrl"] = data[0].url;//组织机构资质/营业执照图片URL
						self.uploadReturn(self.data.ProProve.files,"5",_commitVali);
					}
					self.uploadReturn(self.data.MechanismFiles.files,"0",_uploadMD);//组织机构资质
					break;
				default:
					break;
			}
		},
		
		setImgUrl : function(e,files){//选择图片
			var self = this;
			var e_order = $(".Upload").index(e.target);//上传图的input是当前页面第几个
			switch (self.type){
				case '1-2-1':
				case '1-3-1':
				case '1-4-1':
				case '1-5-1':
					if(e_order == "0"){//公益项目本人认证收款人身份证图片
						self.data.idCardFiles = DMJS.CommonTools.setImgUrl(e,self.data.idCardFiles,self.data.idCardFiles.num,"","delIdCardImg");
					}else if(e_order == "1"){//项目相关证明
						self.data.ProProve = DMJS.CommonTools.setImgUrl(e,self.data.ProProve,self.data.ProProve.num,"","delIdCardImg");
					}
					break;
				case '1-2-2':
				case '1-3-2':
				case '1-4-2':
				case '1-5-2':
					if(e_order == "0"){//公益项目组织结构
						self.data.MechanismFiles = DMJS.CommonTools.setImgUrl(e,self.data.MechanismFiles,self.data.MechanismFiles.num,"","delIdCardImg");
					}else if(e_order == "1"){//项目相关证明
						self.data.ProProve = DMJS.CommonTools.setImgUrl(e,self.data.ProProve,self.data.ProProve.num,"","delIdCardImg");
					}
					break;
				case '2-1':
					if(e_order == "0"){//回报项目本人认证收款人身份证图片
						self.data.idCardFiles = DMJS.CommonTools.setImgUrl(e,self.data.idCardFiles,self.data.idCardFiles.num,"","delIdCardImg");//身份证允许传两张
					}
					break;
				case '2-2':
					if(e_order == "0"){//回报项目本人认证收款人身份证图片
						self.data.idCardFiles = DMJS.CommonTools.setImgUrl(e,self.data.idCardFiles,self.data.idCardFiles.num,"","delIdCardImg");//身份证允许传两张
					}else if(e_order == "1"){//回报项目组织机构资质证明
						self.data.MechanismFiles = DMJS.CommonTools.setImgUrl(e,self.data.MechanismFiles,self.data.MechanismFiles.num,"","delIdCardImg");//营业执照
					}
					break;
				case '3-1':
					if(e_order == "0"){//梦想项目本人认证收款人身份证图片
						self.data.idCardFiles = DMJS.CommonTools.setImgUrl(e,self.data.idCardFiles,self.data.idCardFiles.num,"","delIdCardImg");//身份证允许传两张
					}else if(e_order == "1"){//梦想项目组织机构资质证明
						self.data.ProProve = DMJS.CommonTools.setImgUrl(e,self.data.ProProve,self.data.ProProve.num,"","delIdCardImg");//组织机构资质证明
					}
					break;
				case '3-2':
					if(e_order == "0"){//梦想项目组织结构
						self.data.MechanismFiles = DMJS.CommonTools.setImgUrl(e,self.data.MechanismFiles,self.data.MechanismFiles.num,"","delIdCardImg");
					}else if(e_order == "1"){//项目相关证明
						self.data.ProProve = DMJS.CommonTools.setImgUrl(e,self.data.ProProve,self.data.ProProve.num,"","delIdCardImg");
					}
					break;
				default:
					break;
			}
			
			self.loadScroller();
			return files;
		},
        //删除图片
		delIdCardImg :function(e,files){
        	var self = this;
        	var $Upload = $(e).parent().parent().find(".Upload");
        	var e_order = $(".Upload").index($Upload);//上传图的input是当前页面第几个
        	var  $uploadImg = $(e).parent().parent().find("#uploadImg");//获取上传图的对象
			switch (self.type){
				case '1-2-1':
				case '1-3-1':
				case '1-4-1':
				case '1-5-1':
					if(e_order == "0"){//公益项目本人认证收款人身份证图片
						DMJS.CommonTools.delImg(e,self.data.idCardFiles);
						if(!self.data.idCardFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "1"){//梦想项目组织机构资质证明
						DMJS.CommonTools.delImg(e,self.data.ProProve);
						if(!self.data.ProProve.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}
					break;
				case '1-2-2':
				case '1-3-2':
				case '1-4-2':
				case '1-5-2':
					if(e_order == "0"){//公益项目组织结构证明
						DMJS.CommonTools.delImg(e,self.data.MechanismFiles);
						if(!self.data.MechanismFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "1"){//梦想项目组织机构资质证明
						DMJS.CommonTools.delImg(e,self.data.ProProve);
						if(!self.data.ProProve.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}
					break;
				case '2-1':
					if(e_order == "0"){//回报项目本人认证收款人身份证图片
						DMJS.CommonTools.delImg(e,self.data.idCardFiles);
						if(!self.data.idCardFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}
					break;
				case '2-2':
					if(e_order == "0"){//回报项目本人认证收款人身份证图片
						DMJS.CommonTools.delImg(e,self.data.idCardFiles);
						if(!self.data.idCardFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "1"){//梦想项目组织机构资质证明
						DMJS.CommonTools.delImg(e,self.data.MechanismFiles);
						if(!self.data.MechanismFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}
					break;
				case '3-1':
					if(e_order == "0"){//梦想项目本人认证收款人身份证图片
						DMJS.CommonTools.delImg(e,self.data.idCardFiles);
						if(!self.data.idCardFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "1"){//项目相关证明
						DMJS.CommonTools.delImg(e,self.data.ProProve);
						if(!self.data.ProProve.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}
					break;
				case '3-2':
					if(e_order == "0"){//梦想项目组织机构资质证明
						DMJS.CommonTools.delImg(e,self.data.MechanismFiles);
						if(!self.data.MechanismFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "1"){//项目相关证明
						DMJS.CommonTools.delImg(e,self.data.ProProve);
						if(!self.data.ProProve.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}
					break;
				default:
					break;
			}
        	if($uploadImg.hasClass("uhide")){//如果上传图片框被隐藏则显示
        		$uploadImg.removeClass("uhide");
        	}
        	
        },
        LookImg:function(e){//查看大图
        	var self = this;
        	var imgUrls = [];
        	var $dom = $(e.target);
        	if(!$dom.hasClass("LookImg")){//不拥有LookImg样式并且拥有action属性
        		$dom = $dom.parent();
        		return false;
        	}
        	var beginUrl = $dom.css("background-image");//当前点击图片的链接
        	switch (self.type){
	        	case '1-2-1':
				case '1-3-1':
				case '1-4-1':
				case '1-5-1':
					for(var i=0 ; i<self.data.idCardFiles.filesUrl.length;i++){
						imgUrls.push(self.data.idCardFiles.filesUrl[i]);
					}
					imgUrls.push(Config.url("imgAddress") + self.data.list[2].imageUrl);//添加身份证示例图
					for(var i=0 ; i<self.data.ProProve.filesUrl.length;i++){
						imgUrls.push(self.data.ProProve.filesUrl[i]);
					}
					break;	
				case '1-2-2':
				case '1-3-2':
				case '1-4-2':
				case '1-5-2':
	        		for(var i=0 ; i<self.data.MechanismFiles.filesUrl.length;i++){
	        			imgUrls.push(self.data.MechanismFiles.filesUrl[i]);
	        		}
	        		for(var i=0 ; i<self.data.ProProve.filesUrl.length;i++){
	        			imgUrls.push(self.data.ProProve.filesUrl[i]);
	        		}
	        		break;	
				case '2-1':
					for(var i=0 ; i<self.data.idCardFiles.filesUrl.length;i++){
			        	imgUrls.push(self.data.idCardFiles.filesUrl[i]);
		        	}
					imgUrls.push(Config.url("imgAddress") + self.data.list[2].imageUrl);//添加身份证示例图
					break;
				case '2-2':
					for(var i=0 ; i<self.data.idCardFiles.filesUrl.length;i++){
						imgUrls.push(self.data.idCardFiles.filesUrl[i]);
					}
					imgUrls.push(Config.url("imgAddress") + self.data.list[2].imageUrl);//添加身份证示例图
					for(var i=0 ; i<self.data.MechanismFiles.filesUrl.length;i++){
						imgUrls.push(self.data.MechanismFiles.filesUrl[i]);
					}
					break;
				case '3-1':
					for(var i=0 ; i<self.data.idCardFiles.filesUrl.length;i++){
						imgUrls.push(self.data.idCardFiles.filesUrl[i]);
					}
					imgUrls.push(Config.url("imgAddress") + self.data.list[2].imageUrl);//添加身份证示例图
					for(var i=0 ; i<self.data.ProProve.filesUrl.length;i++){
						imgUrls.push(self.data.ProProve.filesUrl[i]);
					}
					break;
				case '3-2':
					for(var i=0 ; i<self.data.MechanismFiles.filesUrl.length;i++){
						imgUrls.push(self.data.MechanismFiles.filesUrl[i]);
					}
					for(var i=0 ; i<self.data.ProProve.filesUrl.length;i++){
						imgUrls.push(self.data.ProProve.filesUrl[i]);
					}
					break;
				default:
					break;
			}
        	DMJS.CommonTools.lookBigPicture(beginUrl,imgUrls);
        },
        uploadReturn:function(files,fileType,_call){//上传图片
			var self = this;
			var fd = new FormData();
			var notNewFile = true;
			for ( var i in files) {
				if(!files[i].fileId && !files[i].batchNumber && (files[i].lastModifiedDate||files[i].lastModified)){//不是后台查询出来的数据
					fd.append("files"+i,files[i]);
					notNewFile = false;
				}
			}
			if(notNewFile){
				var j=0;
				for(var i in files){
					files[i].batchNumber = files[i].fileId;//赋值对象
					files[i].url = files[i].addr;//赋值对象
				}
				return _call(files);
			}
			fd.append("fileType", fileType);
			self.controller.commonModel.uploadAttachment({//上传回报图
				"data" : fd,'cancelLightbox':true,
				"processData": false,  // 告诉jQuery不要去处理发送的数据
				"contentType": false ,  // 告诉jQuery不要去设置Content-Type请求头
				"success" : function(response) {
					var j=0;
					for(var i in files){
						if(!files[i].fileId){//不是查询图片
							files[i] = response.data[j];
							j++;
						}else{
							files[i].batchNumber = files[i].fileId;//赋值对象
							files[i].url = files[i].addr;//赋值对象
						}
					}
					return _call(files);
				},
			});
		},
		changeVali:function(e){//切换身份证校验，有改动则加入校验
			var self = this;
			var eName = $(e.target).attr("name");
			if(!$(e.target).attr("validator")){
				$(e.target).attr("validator","notEmpty;length[15,18];reg["+self.data.idVali+"];");
			}
			//移除校验
			if(eName=="receiveIdCard" && $(e.target).val() == self.data.singleResult.receiveIdCard){//收款人身份证号码没有修改
				$(e.target).removeAttr("validator");
			}else if(eName=="recipient"){//受助人身份证没有修改
				$(e.target).removeAttr("validator");
			}
		},
	});

	return validateView;
});
