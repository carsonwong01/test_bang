define([ 'text!startTemplate/illnVali.html',
		'commonTool/validator','Lib/base64'], function(illnValiTemplate,Validator,Base64) {
	var illnValiView = DMJS.DMJSView.extend({
		id : 'illnValiContent',
		name : 'illnValiContent',
		tagName : 'div',
		className : "",
		events : {
			"change .Upload" : "setImgUrl",
			"tap .LookImg" : "LookImg",//查看图
			"input input[name='receiveIdCard']":"changeVali",//身份证修改
			"input input[name='recipient']":"changeVali",//身份证修改
		},
		data:{
			idVali : /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}(\d|x|X)$/,//身份证正则表达式
			clickTag:0,//点击次数
		},
		init : function(options) {
			_.extend(this, options);
			DMJS.place = {
				provinceStr:"",  //省
				provinceId:"",	 //省id
				cityStr:"",      //市
				cityId:"",       //市id
				countyStr:"",    //区
				countyId:"",      //区id
			    routeRul:window.location.hash.substring(1),
			};
		},
		reset :function(){
			var self = this;
			self.data.MCidCardFiles={//收款人身份证图片
				files:[],
				filesUrl:[],
				num:2
			};
			self.data.BHidCardFiles={//受助人身份证图片
				files:[],
				filesUrl:[],
				num:2
			};
			self.data.MDFiles={//验证医疗证明
				files:[],
				filesUrl:[],
				num:6
			};
			self.data.MCAccountFiles={//收款人户口本证明
				files:[],
				filesUrl:[],
				num:1
			};
			self.data.BHAccountFiles={//受助人户口本证明
				files:[],
				filesUrl:[],
				num:1
			};
			self.data.OHAccountFiles={//其他户口本证明补充
				files:[],
				filesUrl:[],
				num:1
			};
			self.data.MarryFiles={//结婚证图
				files:[],
				filesUrl:[],
				num:1
			};
			self.data.MechanismFiles={//组织机构资质证明
				files:[],
				filesUrl:[],
				num:1
			};
			self.data.receiveCardImageIds={};//手持身份证照片
			self.data.recipientCardImageIds={};//受助人手持身份证照片ID集合
			self.data.proveImgIds={};//医疗诊断证明图片ID集合
			self.data.accountBookImgIds={};//户口本图片ID集合
			self.data.useProveImgIds={},//资金用途证明图片ID集合
			self.data.projectProveImgIds={},//项目相关证明材料（可多张）
			self.data.singleResult = {}
		},
		render : function() {
			var self = this;
			switch (self.type){
				case '1-2-1':case '1-2-2':
					self.hint = '请提供正规的受灾证明照片';
					break;
				case '1-3-1':case '1-3-2':
					self.hint = '请提供资金用途证明或正规发票';
					break;
				case '1-4-1':case '1-4-2':
					self.hint = '请提供贫困证明（或低保证明）和学校资质证明';
					break;
				case '1-5-1':case '1-5-2':
					self.hint = '请提供可以证明需要他人帮助的证明材料';
					break;
				case '2-2':
					self.hint = '请提供可以证明需要他人帮助的证明材料';
					break;
				case '3-1':case '3-2':
					self.hint = '项目相关证明材料上的所有信息必须清晰可见';
					break;
				default:
					self.hint = '';
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
					_.extend(self.data.MCidCardFiles.files,response.data.receiveCardImageIds);//查询出来的收款人身份证照片
					for(var i in response.data.receiveCardImageIds){
						self.data.MCidCardFiles.filesUrl.push(Config.url("imgAddress")+response.data.receiveCardImageIds[i].addr);
					}
					
					_.extend(self.data.BHidCardFiles.files,response.data.recipientCardImageIds);//查询出来的受助人身份证照片
					for(var i in response.data.recipientCardImageIds){
						self.data.BHidCardFiles.filesUrl.push(Config.url("imgAddress")+response.data.recipientCardImageIds[i].addr);
					}
					
					_.extend(self.data.MDFiles.files,response.data.proveImgIds);//查询出来的验证医疗证明
					for(var i in response.data.proveImgIds){
						self.data.MDFiles.filesUrl.push(Config.url("imgAddress")+response.data.proveImgIds[i].addr);
					}
					
					if(response.data.accountBookImgIds.length > 0){
						self.data.MCAccountFiles.files.push(response.data.accountBookImgIds[0]);//查询出来的收款人户口本证明
						self.data.MCAccountFiles.filesUrl.push(Config.url("imgAddress")+response.data.accountBookImgIds[0].addr);
						
						self.data.BHAccountFiles.files.push(response.data.accountBookImgIds[1]);//查询出来的受助人户口本证明
						self.data.BHAccountFiles.filesUrl.push(Config.url("imgAddress")+response.data.accountBookImgIds[1].addr);
						
						if(response.data.accountBookImgIds.length > 3){//如果长度大于2，就是有其他的
							self.data.OHAccountFiles.files.push(response.data.accountBookImgIds[1]);//其他户口本证明补充
							self.data.OHAccountFiles.filesUrl.push(Config.url("imgAddress")+response.data.accountBookImgIds[1].addr);
						}
					}
					if(response.data.singleResult.weddingPictureUrl){
						self.data.MarryFiles.files.push({//查询出来的组织机构资质/营业执照图片
							addr:response.data.singleResult.weddingPictureUrl,
							fileId:response.data.singleResult.weddingPictureId,
						});
					}
					if(response.data.singleResult.organizationAptitudeUrl){
						self.data.MechanismFiles.files.push({//组织机构资质证明
							addr:response.data.singleResult.organizationAptitudeUrl,
							fileId:response.data.singleResult.organizationAptitudeId,
						});
					}
					
					self.loadExpImg();
				},
			});
		},
		comeBack:function(){
			var self = this;
			$("#address").text(DMJS.place.provinceStr + DMJS.place.cityStr + DMJS.place.countyStr);//选择医院的省市区
			$("#address").parent().find("input").val(DMJS.place.countyId);
			
		},
		loadExpImg:function(){//加载示例图片
			var self = this;
			self.controller.startModel.findImgModel({
				'cancelLightbox':true,
				"success" : function(response) {
					_.extend(self.data,response.data);
					self.$el.html(_.template(illnValiTemplate, self.data)); // 将tpl中的内容写入到
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
			if(params['receiveIdCard'] == params['recipient']){//收款人和受助人身份证不能相同
				DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "收款人和受助人的身份证不能相同");
				return false;
			}
			if(params['receiveIdCard']){
				params['receiveIdCard'] = new Base64().encode(params['receiveIdCard']);
			}
			if(params['recipient']){
				params['recipient'] = new Base64().encode(params['recipient']);
			}
			
			switch (self.type){
				case '1-1-1':
					params['validationType'] = "1";//验证类型，本人验证1
					var _commitVali=function(data){//提交验证结果
						params["proveImgIds"] = self.comeBackIMGId(data).toString();//医疗诊断证明图片数组
						self.commit(params);
					}
					var _uploadMD= function(data){
						params["receiveCardImageIds"] = self.comeBackIMGId(data).toString();//添加身份证数组
						self.uploadReturn(self.data.MDFiles.files,"2",_commitVali);//上传医疗证明图
					}
					self.uploadReturn(self.data.MCidCardFiles.files,"8",_uploadMD);//上传身份证图
					break;
				case '1-1-2':
					params['validationType'] = "2";//验证类型，亲属验证2
					var _commitVali=function(data){//提交验证结果
						params["recipientCardImageIds"] = self.comeBackIMGId(data).toString();//添加身份证数组
						self.commit(params);
					}
					var _BHidCard = function(data){//添加受助人身份证图片
						params["accountBookImgIds"] = self.comeBackIMGId(data).toString();
						self.uploadReturn(self.data.BHidCardFiles.files,"9",_commitVali);
					}
					var _uploadAccount = function(data){//添加户口本图片
						params["proveImgIds"] = self.comeBackIMGId(data).toString();
						var files = [];
						files.push(self.data.MCAccountFiles.files[0]);//户口本收款人页
						files.push(self.data.BHAccountFiles.files[0]);//户口本受助人页
						if(self.data.OHAccountFiles.files.length > 0){//户口本其他补充图
							files.push(self.data.OHAccountFiles.files[0]);
						}
						self.uploadReturn(files,"3",_BHidCard);
					}
					
					var _uploadMD= function(data){//上传医疗证明图
						params["receiveCardImageIds"] = self.comeBackIMGId(data).toString();//添加身份证数组
						self.uploadReturn(self.data.MDFiles.files,"2",_uploadAccount);
					}
					self.uploadReturn(self.data.MCidCardFiles.files,"8",_uploadMD);//上传身份证图
					break;
				case '1-1-3':
					params['validationType'] = "3";//验证类型，亲属验证2
					var _commitVali=function(data){//提交验证结果
						params["recipientCardImageIds"] = self.comeBackIMGId(data).toString();//添加身份证数组
						self.commit(params);
					}
					var _BHidCard = function(data){//添加受助人身份证图片
						params["weddingPictureId"] = data[0].batchNumber;//结婚证照片ID
						params["weddingPictureUrl"] = data[0].url;//结婚证照片URL
						self.uploadReturn(self.data.BHidCardFiles.files,"9",_commitVali);
					}
					var _uploadAccount = function(data){//添加结婚证图片
						params["proveImgIds"] = self.comeBackIMGId(data).toString();
						self.uploadReturn(self.data.MarryFiles.files,"0",_BHidCard);
					}
					
					var _uploadMD= function(data){//上传医疗证明图
						params["receiveCardImageIds"] = self.comeBackIMGId(data).toString();//添加身份证数组
						self.uploadReturn(self.data.MDFiles.files,"2",_uploadAccount);
					}
					self.uploadReturn(self.data.MCidCardFiles.files,"8",_uploadMD);//收款人身份证图片
					break;
				case '1-1-4':
					params['validationType'] = "4";//验证类型，组织验证(企业验证)4
					var _commitVali=function(data){//提交验证结果
						params["proveImgIds"] = self.comeBackIMGId(data).toString();//医疗诊断证明图片数组
						self.commit(params);
					}
					var _uploadMD= function(data){
						params["organizationAptitudeId"] = data[0].batchNumber;//组织机构资质/营业执照图片ID
						params["organizationAptitudeUrl"] = data[0].url;//组织机构资质/营业执照图片URL
						self.uploadReturn(self.data.MDFiles.files,"2",_commitVali);//上传医疗证明图
					}
					self.uploadReturn(self.data.MechanismFiles.files,"0",_uploadMD);//上传组织资质认证图
					break;
				default:
					break;
			}
		},
		
		setImgUrl : function(e,files){//选择图片
			var self = this;
			var e_order = $(".Upload").index(e.target);//上传图的input是当前页面第几个
			switch (self.type){
				case '1-1-1':
					if(e_order == "0"){//大病救助本人认证收款人身份证图片
						self.data.MCidCardFiles = DMJS.CommonTools.setImgUrl(e,self.data.MCidCardFiles,2,"","delIdCardImg");//身份证允许传两张
					}else if(e_order == "1"){//大病救助本人认证医疗证明
						self.data.MDFiles = DMJS.CommonTools.setImgUrl(e,self.data.MDFiles,6,"","delIdCardImg");//证明传六张
					}
					break;
				case '1-1-2':
					if(e_order == "0"){//大病救助亲属认证收款人身份证图片
						self.data.MCidCardFiles = DMJS.CommonTools.setImgUrl(e,self.data.MCidCardFiles,2,"","delIdCardImg");//身份证允许传两张
					}else if(e_order == "1"){//大病救助亲属认证受助人身份证图片
						self.data.BHidCardFiles = DMJS.CommonTools.setImgUrl(e,self.data.BHidCardFiles,2,"","delIdCardImg");//身份证允许传六张
					}else if(e_order == "2"){//收款人户口本图
						self.data.MCAccountFiles = DMJS.CommonTools.setImgUrl(e,self.data.MCAccountFiles,1,"","delIdCardImg");
					}else if(e_order == "3"){//受助人户口本图
						self.data.BHAccountFiles = DMJS.CommonTools.setImgUrl(e,self.data.BHAccountFiles,1,"","delIdCardImg");
					}else if(e_order == "4"){//其他户口本图
						self.data.OHAccountFiles = DMJS.CommonTools.setImgUrl(e,self.data.OHAccountFiles,1,"","delIdCardImg");
					}else if(e_order == "5"){//大病救助亲属认证医疗证明
						self.data.MDFiles = DMJS.CommonTools.setImgUrl(e,self.data.MDFiles,6,"","delIdCardImg");//证明允许传六张
					}
					break;
				case '1-1-3':
					if(e_order == "0"){//大病救助夫妻认证收款人身份证图片
						self.data.MCidCardFiles = DMJS.CommonTools.setImgUrl(e,self.data.MCidCardFiles,2,"","delIdCardImg");//身份证允许传两张
					}else if(e_order == "1"){//大病救助夫妻认证受助人身份证图片
						self.data.BHidCardFiles = DMJS.CommonTools.setImgUrl(e,self.data.BHidCardFiles,2,"","delIdCardImg");//身份证允许传六张
					}else if(e_order == "2"){//结婚证图
						self.data.MCAccountFiles = DMJS.CommonTools.setImgUrl(e,self.data.MarryFiles,1,"","delIdCardImg");
					}else if(e_order == "3"){//大病救助亲属认证医疗证明
						self.data.MDFiles = DMJS.CommonTools.setImgUrl(e,self.data.MDFiles,6,"","delIdCardImg");//证明允许传六张
					}
					break;
				case '1-1-4':
					if(e_order == "0"){//大病救助组织机构收
						self.data.MechanismFiles = DMJS.CommonTools.setImgUrl(e,self.data.MechanismFiles,1,"","delIdCardImg");//身份证允许传两张
					}else if(e_order == "1"){//大病救助本人认证医疗证明
						self.data.MDFiles = DMJS.CommonTools.setImgUrl(e,self.data.MDFiles,6,"","delIdCardImg");//证明传六张
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
				case '1-1-1':
					if(e_order == "0"){//大病救助本人认证收款人身份证图片
						DMJS.CommonTools.delImg(e,self.data.MCidCardFiles);
						if(!self.data.MCidCardFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "1"){//大病救助本人认证医疗证明
						DMJS.CommonTools.delImg(e,self.data.MDFiles);
						if(!self.data.MDFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}
					break;
				case '1-1-2':
					if(e_order == "0"){//大病救助亲属认证收款人身份证图片
						DMJS.CommonTools.delImg(e,self.data.MCidCardFiles);
						if(!self.data.MCidCardFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "1"){//大病救助亲属认证受助人身份证图片
						DMJS.CommonTools.delImg(e,self.data.BHidCardFiles);
						if(!self.data.BHidCardFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "2"){//收款人户口本图
						DMJS.CommonTools.delImg(e,self.data.MCAccountFiles);
						if(!self.data.MCAccountFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "3"){//受助人户口本图
						DMJS.CommonTools.delImg(e,self.data.BHAccountFiles);
						if(!self.data.BHAccountFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "4"){//其他户口本图
						DMJS.CommonTools.delImg(e,self.data.OHAccountFiles);
						if(!self.data.OHAccountFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "5"){//证明允许传六张
						DMJS.CommonTools.delImg(e,self.data.MDFiles);
						if(!self.data.MDFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}
					break;
				case '1-1-3':
					if(e_order == "0"){//大病救助亲属认证收款人身份证图片
						DMJS.CommonTools.delImg(e,self.data.MCidCardFiles);
						if(!self.data.MCidCardFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "1"){//大病救助亲属认证受助人身份证图片
						DMJS.CommonTools.delImg(e,self.data.BHidCardFiles);
						if(!self.data.BHidCardFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "2"){//收款人户口本图
						DMJS.CommonTools.delImg(e,self.data.MarryFiles);
						if(!self.data.MarryFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "3"){//证明允许传六张
						DMJS.CommonTools.delImg(e,self.data.MDFiles);
						if(!self.data.MDFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}
					break;
				case '1-1-4':
					if(e_order == "0"){//大病救助公司资质认证图片
						DMJS.CommonTools.delImg(e,self.data.MechanismFiles);
						if(!self.data.MechanismFiles.files.length > 0){//图片删除完开始图片校验
							$Upload.attr("validator","{notEmpty};");
						}
					}else if(e_order == "1"){//大病救助本人认证医疗证明
						DMJS.CommonTools.delImg(e,self.data.MDFiles);
						if(!self.data.MDFiles.files.length > 0){//图片删除完开始图片校验
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
				case '1-1-1':
					for(var i=0 ; i<self.data.MCidCardFiles.filesUrl.length;i++){
			        	imgUrls.push(self.data.MCidCardFiles.filesUrl[i]);
		        	}
					imgUrls.push(Config.url("imgAddress") + self.data.list[2].imageUrl);//添加身份证示例图
					break;
				case '1-1-2':
					for(var i=0 ; i<self.data.MCidCardFiles.filesUrl.length;i++){
			        	imgUrls.push(self.data.MCidCardFiles.filesUrl[i]);
		        	}
					imgUrls.push(Config.url("imgAddress") + self.data.list[2].imageUrl);//添加身份证示例图
					
					for(var i=0 ; i<self.data.BHidCardFiles.filesUrl.length;i++){
						imgUrls.push(self.data.BHidCardFiles.filesUrl[i]);
					}
					imgUrls.push(Config.url("imgAddress") + self.data.list[2].imageUrl);//添加身份证示例图
					
					for(var i=0 ; i<self.data.MCAccountFiles.filesUrl.length;i++){
						imgUrls.push(self.data.MCAccountFiles.filesUrl[i]);
					}
					for(var i=0 ; i<self.data.BHAccountFiles.filesUrl.length;i++){
						imgUrls.push(self.data.BHAccountFiles.filesUrl[i]);
					}
					for(var i=0 ; i<self.data.OHAccountFiles.filesUrl.length;i++){
						imgUrls.push(self.data.OHAccountFiles.filesUrl[i]);
					}
					break;
				case '1-1-3':
					for(var i=0 ; i<self.data.MCidCardFiles.filesUrl.length;i++){
			        	imgUrls.push(self.data.MCidCardFiles.filesUrl[i]);
		        	}
					imgUrls.push(Config.url("imgAddress") + self.data.list[2].imageUrl);//添加身份证示例图
					
					for(var i=0 ; i<self.data.BHidCardFiles.filesUrl.length;i++){
						imgUrls.push(self.data.BHidCardFiles.filesUrl[i]);
					}
					imgUrls.push(Config.url("imgAddress") + self.data.list[2].imageUrl);//添加身份证示例图
					
					for(var i=0 ; i<self.data.MarryFiles.filesUrl.length;i++){
						imgUrls.push(self.data.MarryFiles.filesUrl[i]);
					}
					imgUrls.push(Config.url("imgAddress") + self.data.list[4].imageUrl);//添加结婚证示例图
					break;
				case '1-1-4':
					for(var i=0 ; i<self.data.MechanismFiles.filesUrl.length;i++){
			        	imgUrls.push(self.data.MechanismFiles.filesUrl[i]);
		        	}
					break;
				default:
					break;
			}
        	for(var i=0 ; i<self.data.MDFiles.filesUrl.length;i++){
	        	imgUrls.push(self.data.MDFiles.filesUrl[i]);
        	}
			imgUrls.push(Config.url("imgAddress") + self.data.list[3].imageUrl);//添加医疗证明示例图
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
			}else if(eName=="recipient" && $(e.target).val() == self.data.singleResult.recipient){//受助人身份证没有修改
				$(e.target).removeAttr("validator");
			}
		},
		toShen:function(){ //跳转到省
        	this.noDestroy=true;
        	DMJS.router.navigate("user/personal/shen", true);
        },
	});

	return illnValiView;
});
