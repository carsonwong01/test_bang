define([ 'text!startTemplate/startInfo.html',
		'commonTool/validator'], function(startInfoTemplate,Validator) {
	var startInfoView = DMJS.DMJSView.extend({
		id : 'startInfoContent',
		name : 'startInfoContent',
		tagName : 'div',
		className : "",
		events : {
			"change .Upload" : "setImgUrl",
			"tap .DelImg" : "delImg",//删除上传图
			"tap .setCover" : "setCover",//设置封面
			"tap #selLabel" : "selLabel",//是否需要回报
			"tap #returnList" : "update",//修改回报或目标
			'input input[name="targetAmount"]':'calculateFees',
		},
		data:{
			num : 0,//图片上传张数
			fileFilter : [],//图片上传的file的value
			cover : 1,//第几张图是封面
			content:"",//详细介绍显示
			imgDes:"",//公益项目图片要求描述
			backImgIngo:{},//上传图片返回图片信息
			describe:"",//筹款说明
			clickTag:0,//点击次数
			maxBack:0,//最大回报数量
			maxDream:0,//最大梦想目标数量
			singleResult:"",
			hasSuport:"",//是否拥有支持
			
		},
		init : function(options) {
			var self = this;
			_.extend(this, options);
			self.data.fileFilter = [];
			DMJS.returnList = [];//回报
			DMJS.proLabel = [];//存储选择标签
			DMJS.routeRul = window.location.hash;
		},
		render : function() {
			var self = this;
			self.data = {
				num : 0,//图片上传张数
				fileFilter : [],//图片上传的file的value
				cover : 1,//第几张图是封面
				content:"",//详细介绍显示
				imgDes:"",//公益项目图片要求描述
				backImgIngo:{},//上传图片返回图片信息
				describe:"",//筹款说明
				clickTag:0,//点击次数
				maxBack:0,//最大回报数量
				maxDream:0,//最大梦想目标数量
				singleResult:"",
				hasSuport:"",//是否有支持
				total:0,//最低筹集金额
				
			}
			switch (self.type){
				case "1-2":
		   		self.data.content = "建议详细描述受助人的基本情况：如家庭背景、经济状况、患病经历等。";
		   		self.data.imgDes = "灾难救助项目，建议上传受灾情况照片和受灾证明图片，提高项目可信度。建议图片尺寸大小870px * 420px";
		   		break;
		   	case "1-3":
		   		self.data.content = "建议详细描述受助人的基本情况：如家庭背景、经济状况、患病经历等。";
		   		self.data.imgDes = "动物保护项目，建议上传动物拍照，提高项目可信度。建议图片尺寸大小870px * 420px";
		   		break;
		   	case "1-4":
		   		self.data.content = "建议详细描述受助人的基本情况：如家庭背景、经济状况、患病经历等。";
		   		self.data.imgDes = "扶贫助学项目，建议上传家庭经济情况、财产证明和贫穷状况等照片，提高项目可信度。建议图片尺寸大小870px * 420px";
		   		break;
		   	case "1-5":
		   		self.data.content = "建议详细描述受助人的基本情况：如家庭背景、经济状况、患病经历等。";
		   		self.data.imgDes = "其他救助项目，建议上传患者治疗中的照片、患者患病前后生活照对比、医院诊断证明等照片。建议图片尺寸大小870px * 420px";
		   		break;
		   	case "2":
		   		self.data.content = "建议详细介绍产品或服务的详细内容。";
		   		self.data.imgDes = "请上传清晰的产品图片，建议图片尺寸大小870px * 420px。";
		   		break;
		   	case "3":
		   		self.data.content = "描述下梦想的具体内容。";
		   		self.data.imgDes = "请上传清晰的产品图片，建议图片尺寸大小870px * 420px。";
		   		break;
		   	default:
		   		self.data.content = "建议详细描述受助人的基本情况：如家庭背景、经济状况、患病经历等。建议图片尺寸大小870px * 420px";
		   		self.data.imgDes = "大病救助项目，建议上传患者治疗中的照片、患者患病前后生活照对比、医院诊断证明等照片，提高项目可信度。建议图片尺寸大小870px * 420px";
		   		break;
			}
			var today = new Date;
			if(self.proid){
				self.loadDate(today);
			}else{
				self.afterTomorrow =DMJS.formatDate(new Date(today.setDate(today.getDate()+2)),"yyyy-MM-dd");
				this.$el.html(_.template(startInfoTemplate, self)); // 将tpl中的内容写入到
				self.getProtocolTitle();
				self.loadScroller();
			}
			self.loadExplain();
			self.sysConst("RETURN_COUNT_MAX");//回报最大数量
			return this;
		},
		
		getProtocolTitle:function(){
			var self=this;
			self.controller.commonModel.clauseList({
				"data":{'id':2},
                'cancelLightbox':false,
    			"noCache":true,
    			"success":function(response){
    				$(".protocal").text(response.data.list[0].protocolTitle);
    			}
			});
		},
		
		
		loadDate:function(today){//查询项目详情
			var self = this;
			self.controller.startModel.projectDetailsCon({ //获取项目详情内容
				'data': {
					projectId:self.proid,  
				},
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					var data = response.data.singleResult;
					_.extend(self.data,response.data);
					_.extend(DMJS.returnList,data.dreamTargets);
					self.data.hasSuport = self.data.singleResult.supportTimes > 0?"true":"";//是否有支持
					for(var i in DMJS.returnList){//返回的回报/梦想目标
						var returnImg = {//回报项目图存储
								filesUrl:[],
								files:[]
						}
						//如果回报数量为-1则设置为空
						DMJS.returnList[i].upperCount = DMJS.returnList[i].remainingNum=="-1"?"":DMJS.returnList[i].remainingNum;
						//回报图片
						returnImg.filesUrl.push(Config.url("imgAddress")+DMJS.returnList[i].imgUrl);
						returnImg.files.push({
							addr:DMJS.returnList[i].imgUrl,
							fileId:DMJS.returnList[i].imgId,
						});
						DMJS.returnList[i].returnImg = returnImg;
						DMJS.returnList[i].returnDescribe = DMJS.returnList[i].content;//回报/梦想目标内容
						DMJS.returnList[i].supportAmount = DMJS.returnList[i].amount;//金额
					}
					var imgs = data.imgs;
					for(var i=0;i<imgs.length;i++){//存储查询出来的图
						if(imgs[i].fileId==data.coverImageId){//封面图
							self.data.cover = i+1;
						}
						self.data.fileFilter.push({
							addr:imgs[i].addr,
							fileId:imgs[i].fileId,
						});
					}
					//结束时间
					var time = data.dateCreate.substr(0,10).split("-");
					dateCreate = new Date(time[0],time[1]-1,time[2]);
					self.afterTomorrow =DMJS.formatDate(new Date(dateCreate.setDate(dateCreate.getDate()+parseInt(data.timeLimit))),"yyyy-MM-dd");
					//创建时间
					var time = self.data.singleResult.dateCreate.substr(0,10).split("-");
					self.data.singleResult.dateCreate = new Date(time[0],time[1]-1,time[2]);
					
					
					self.$el.html(_.template(startInfoTemplate, self)); // 将tpl中的内容写入到
					self.getProtocolTitle();
					self.loadScroller();
				 }
			});
		},
		sysConst:function(key){
			var self = this;
			if(key!=""){
				self.controller.commonModel.findCache({
		        	'data':{
		        		key:key,
		        	},
		        	'cancelLightbox':true,
		        	"noCache":true,
					"success":function(response){
						switch (key){
						case "RETURN_COUNT_MAX"://回报最大数量
							self.data.maxBack = response.data;
							self.sysConst("TARGET_COUNT");
					   		break;
					   	case "TARGET_COUNT"://梦想目标最大数量
					   		self.data.maxDream = response.data;
					   		self.sysConst("PROJECT_AMOUNT_MIN");
					   		break;
					   	case "PROJECT_AMOUNT_MIN"://目标最低金额
					   		if(self.data.singleResult.facTarget != 0&&self.data.singleResult.facTarget){
					   			$("input[name='targetAmount']").attr("validator","notEmpty;amountMin["
					   					+(response.data>self.data.singleResult.facTarget?response.data:self.data.singleResult.facTarget)
					   					+"];");
//					   			self.data.total = response.data>self.data.singleResult.facTarget?response.data:self.data.singleResult.facTarget;
					   		}else{
					   			$("input[name='targetAmount']").attr("validator","notEmpty;amountMin["+response.data+"];");
					   		}
					   		self.data.total = response.data;
					   		break;
					   	default:
					   		break;
						}
						return response.data;
					}
					
		        });
			}
		},
		calculateFees:function(e){//校正输入金额
			var self = this,amount;
			var __val=$(e.target).val();
			amount=__val.replace(/[^\d\.]/g,"");
			amount=amount*1;
			$(e.target).val(amount);
			
		},
		count :function(type){//筹资期限 最高30天最低2天
			var self = this;
			var day = parseInt($("#days").text());//天数
			var time = $("#date").text().split("-");
			var date = new Date(time[0],time[1]-1,time[2]);//日期  ios 解析new Date('2013-10-21')方式不一样 
			if(type=="add"){
				if(day < 30){
					day = ++day;
					date.setDate(date.getDate() + 1);//时间增加一天
				}
			}else{
				var minDay = self.data.singleResult.timeLimit ? self.data.singleResult.timeLimit:2;
				if(day > minDay){
					day = --day;
					date.setDate(date.getDate() - 1);//时间减一天
				}else{
					DMJS.CommonTools.popTip("支持天数不能小于" + minDay);
				}
			}
			$("#day").val(day);
			$("#days").text(day);
			$("#date").text(DMJS.formatDate(date,"yyyy-MM-dd"));
		},
		setImgUrl : function(e){
			var self = this,allowNum,fengM,
			files = e.target.files || e.dataTransfer.files;
			files = DMJS.CommonTools.filter(files);
			allowNum = 8 - self.data.fileFilter.length;//允许上传图片数
			if(files.length > allowNum){
				files.splice(allowNum - files.length,files.length-allowNum);
			}
			if(self.data.fileFilter.length > 0){fengM = "1"};
			self.data.fileFilter = self.data.fileFilter.concat(DMJS.CommonTools.filter(files));
			for(var i in files){
				objUrl = DMJS.CommonTools.getObjectURL(files[i]);
				if (objUrl) {
					self.data.num++;
					console.log(self.data.num);
					//图片html
					var imgHtml = "<div class='upload-file upload-file-img mg-t-10 mg-r-5' style='float: left;background-image: url("+
					objUrl + ");'><div class='del-img DelImg'></div><div class='setCover'><div class='tx-ac fn-c-white'>"+
					((self.data.num==1)&&(fengM!="1")?"封面图片":"设为封面")+"</div></div></div>";
					if(self.data.num >= 8){//最多上传8张图
						$(e.target).parent().addClass("uhide");//隐藏上传文件
					}
					$(e.target).val("");//防止上传同一图片不触发事件
	                $(e.target).parent().before(imgHtml) ;
	            }
			}
			self.loadScroller();
		},
        //删除图片
        delImg :function(e){
        	var self = this;
        	var dom = e.target||e;
        	var i = $(dom).parent().index();//获取当前图的序号
        	self.data.fileFilter.splice(i,1);//移除图片
        	$(dom).parent().remove();//移除整个图
        	
//        	var i = DMJS.CommonTools.delImg(e,self.data.fileFilter);
        	self.data.num--;//减少图片数量
        	console.log(self.data.num);
        	if($("#uploadImg").hasClass("uhide")){//如果上传图片框被隐藏则显示
        		$("#uploadImg").removeClass("uhide");
        	}
        	if(i == self.data.cover - 1){//删除封面
        		$(".setCover").children().text("设为封面");
    			$(".setCover").children().first().text("封面图片");
        	}
        	
        },
        setCover:function(e){//设置封面图片
        	var self = this,$dom = $(e.target);
        	if(!$dom.hasClass("setCover")){
        		$dom = $dom.parent();
        	}
        	//第几张是封面图
        	self.data.cover = $dom.parent().parent().children().index($dom.parent())+1;
    		$(".setCover").children().text("设为封面");
    		$dom.children().text("封面图片");
    		console.log(self.data.cover);
        },
        "turnRememberRido": function(e) {
			if ($("#autid").is(":checked")) {
				$("#autid").removeAttr("checked");
			} else {
				$("#autid").attr("checked", true);
			}
		},
		agreement:function(){//协议
			var self = this;
			self.noDestroy=true;
			DMJS.router.navigate("other/Message/agreement/2", true);
		},
		addTarget:function(){//添加回报或者添加梦想目标
			var self = this;
			self.noDestroy=true;
			if(self.type == "2"){//添加回报
				console.log("回报");
				if(DMJS.returnList.length >= self.data.maxBack){
					DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "添加回报数量已经达到上限",function(){
						console.log("关闭筹款说明弹框");
					},"知道了");
					return false;
				}
				DMJS.router.navigate("start/start/requite",true);
			}else{//添加梦想目标
				console.log("梦想目标");
				if(DMJS.returnList.length >= self.data.maxDream){
					DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "添加梦想目标数量已经达到上限",function(){
						console.log("关闭筹款说明弹框");
					},"知道了");
					return false;
				}
				DMJS.router.navigate("start/start/target",true);
			}
		},
		loadExplain:function(){//筹款说明加载
			var self = this,textId = "3";
			switch (self.type){
			   	case "2":
			   		textId = "4";
			   		break;
			   	case "3":
			   		textId = "5";
			   		break;
			}
			self.controller.commonModel.findTextInstructList({//文本说明列表查询
				/*1发起须知 2筹款攻略 3公益项目筹款说明 4回报项目筹款说明
				5梦想项目筹款说明 6提现温馨提示 7中华人民共和国民法通则 8中华人民共和国刑法*/
				"data" : {"textId":textId},'cancelLightbox':true,
				"success" : function(response) {
					self.data.describe = response.data.list[0];
					if(self.proid){
						return false;
					}
					if(self.data.describe.textContext){
						self.explain();
					}
				},
			});
		},
		explain:function(){//筹款说明
			var self = this;
			DMJS.CommonTools.alertCommon(self.data.describe.textTitle, self.data.describe.textContext?self.data.describe.textContext:"暂无攻略内容！",function(){
				console.log("关闭筹款说明弹框");
			},"知道了");
			
		},
		createPro:function(){//创建项目
			var self = this;
			if(self.data.clickTag > 0){
        		return;
        	}
        	self.data.clickTag++;
        	setTimeout(function () { self.data.clickTag = 0 }, 6000);
			if(!Validator.check($("#"+self.id))){self.data.clickTag = 0;return false}
			if(self.data.fileFilter.length < 1){
				DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "请上传相关照片");
				return false;
			} 
			var params = _.extend(self.$el.getFormValue(), self.data);
			var totalM = 0;//总金额
			for(var i in DMJS.returnList){
				totalM += parseInt(DMJS.returnList[i].supportAmount);
			}
			if(DMJS.returnList.length > 0 && self.type=="3"){//具有梦想目标
				if(totalM < self.data.total){
					DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "梦想目标金额总计不能低于" + self.data.total);
					return false;
				}
			}
			params['isNeddAddr'] = $("#needAddress").attr("checked");
			var fileType = 1;//图片类型1项目图片2验证医疗证明3户口本照片4资金用途证明5项目相关证明材料6项目动态7举报项目
			
			self.uploadImg(self.data.fileFilter,fileType,params);
		},
		updateProCall:function(params){//修改调用接口
			var self = this;
			var coverImg = self.data.backImgIngo[self.data.cover-1];//封面图片
			params['coverImageId'] = coverImg.batchNumber;//封面id
			params['coverImageUrl'] = coverImg.url;//封面url
			params['imgIds'] = [];
			for(var i in self.data.backImgIngo){//图片id
				params['imgIds'].push(self.data.backImgIngo[i].batchNumber);
			}
			params['imgIds']= params['imgIds'].toString();
			params['projectId']= self.proid;//项目id
			params['isOrdered']= params['singleResult'].supportTimes > 0?"1":"2";//是否支持订单 1有2无
			switch (self.type){
			   	case "1-1":
			   	case "1-2":
			   	case "1-3":
			   	case "1-4":
			   	case "1-5":
			   		self.controller.startModel.modifyWelfareProject({//公益项目
						"data" : params,'cancelLightbox':true,
						"success" : function(response) {
							DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "修改成功！",function(){
								DMJS.router.navigate("index/index/projectDetails/" + self.proid, true);
							});
						},
					});
			   		break;
			   	case "2":
			   		var imgList = [],returnList = []; 
			   		if(DMJS.returnList.length < 1){
			   			DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "请添加项目回报！");
			   			return false;
			   		}
					for(var i in DMJS.returnList){
						imgList.push(DMJS.returnList[i].returnImg.files[0]);//上传回报图片
					}
					
					var _call = function(imgData){
						for(var i in imgData){
							if(DMJS.returnList[i].id){//
								continue;
							}
							var img = {
//									"returnId":DMJS.returnList[i].id,//回报id
									"imageId":imgData[i].batchNumber,//回报图片ID
									"imageUrl":imgData[i].url,//回报图片URL
									"supportAmount":DMJS.returnList[i].supportAmount,//支持金额
									"upperCount":DMJS.returnList[i].upperCount?DMJS.returnList[i].upperCount:"-1",//没有就是不限量
									"returnDescribe":DMJS.returnList[i].returnDescribe//回报具体内容
							};
							returnList.push(img);
						}
						params["returnList"] = JSON.stringify(returnList);
						self.controller.startModel.modifyReturnProject({//编辑回报项目
							"data" : params,'cancelLightbox':true,
							"success" : function(response) {
								DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "修改成功！",function(){
									DMJS.router.navigate("index/index/projectDetails/" + self.proid, true);
								});
							},
						});
					}
					self.uploadReturn(imgList,"0",_call);
			   		break;
			   	case "3":
			   		if(DMJS.returnList.length < 1){
			   			DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "请添加梦想目标！");
			   			return false;
			   		}
			   		var returnList = [];
			   		for(var i in DMJS.returnList){
			   			if(DMJS.returnList[i].id){//
			   				continue;
						}
						returnList.push(DMJS.returnList[i]);
			   		}
					params["returnList"] = JSON.stringify(returnList);
			   		self.controller.startModel.modifyDreamProject({//梦现项目
						"data" : params,'cancelLightbox':true,
						"success" : function(response) {
							DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "修改成功！",function(){
								DMJS.router.navigate("index/index/projectDetails/" + self.proid, true);
							});
						},
					});
			   		break;
			   	default:
			   		break;
			}
			
		},
		addProCall:function(params){//新增调用接口
			var self = this;
			var coverImg = self.data.backImgIngo[self.data.cover-1];//封面图片
			params['coverImageId'] = coverImg.batchNumber;//封面id
			params['coverImageUrl'] = coverImg.url;//封面url
			params['imgIds'] = [];
			for(var i in self.data.backImgIngo){//图片id
				params['imgIds'].push(self.data.backImgIngo[i].batchNumber);
			}
			params['imgIds']= params['imgIds'].toString();
			switch (self.type){
			   	case "1-1":
			   	case "1-2":
			   	case "1-3":
			   	case "1-4":
			   	case "1-5":
			   		params['projectType'] = 1;
			   		switch(self.type){//项目类型
			   			case "1-2":params['projectType']='2';break;
			   			case "1-3":params['projectType']='3';break;
			   			case "1-4":params['projectType']='4';break;
			   			case "1-5":params['projectType']='5';break;
			   		}
			   		self.controller.startModel.initWelfareProject({//公益项目
						"data" : params,'cancelLightbox':true,
						"success" : function(response) {
							DMJS.router.navigate("start/start/proValidate/" + self.type + "/" +response.data.singleResult, true);  
						},
					});
			   		break;
			   	case "2":
			   		var imgList = [],returnList = []; 
			   		if(DMJS.returnList.length < 1){
			   			DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "请添加项目回报！");
			   			return false;
			   		}
					for(var i in DMJS.returnList){
						imgList.push(DMJS.returnList[i].returnImg.files[0]);//上传回报图片
					}
					
					var _call = function(imgData){
						for(var i in imgData){
							var img = {
									"imageId":imgData[i].batchNumber,
									"imageUrl":imgData[i].url,
									"supportAmount":DMJS.returnList[i].supportAmount,
									"upperCount":DMJS.returnList[i].upperCount?DMJS.returnList[i].upperCount:"-1",//没有就是不限量
									"returnDescribe":DMJS.returnList[i].returnDescribe
							};
							returnList.push(img);
						}
						params["returnList"] = JSON.stringify(returnList);
						self.controller.startModel.initReturnProject({//回报项目
							"data" : params,'cancelLightbox':true,
							"success" : function(response) {
								DMJS.router.navigate("start/start/proValidate/" + self.type + "/"+response.data.singleResult, true);  
							},
						});
					}
					self.uploadReturn(imgList,"0",_call);
			   		break;
			   	case "3":
			   		if(DMJS.returnList.length < 1){
			   			DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "请添加梦想目标！");
			   			return false;
			   		}
					params["returnList"] = JSON.stringify(DMJS.returnList);
			   		self.controller.startModel.initDreamProject({//梦现项目
						"data" : params,'cancelLightbox':true,
						"success" : function(response) {
							DMJS.router.navigate("start/start/proValidate/" + self.type + "/"+response.data.singleResult, true);  
						},
					});
			   		break;
			   	default:
			   		break;
			}
		},
		selLabel:function(){//选择标签
			var self = this;
			self.noDestroy=true;
			DMJS.router.navigate("start/start/proLabel/" + self.type, true);
		},
		showLabel : function(){//显示选择标签和回报
			var self = this;
			if(DMJS.proLabel){
				$("#selLabel span").html(DMJS.proLabel+"&nbsp;&nbsp;&nbsp;&nbsp;");
				$("input[name='projectLabel']").val(DMJS.proLabel.toString());
			}
			var ListHtml = "";
			if(DMJS.returnList && self.type=="2"){//回报项目
				if(DMJS.returnList.length >= self.data.maxBack){
					$("#addSel").addClass("uhide");
				}else{
					$("#addSel").removeClass("uhide");
				}
				for(var i=0;i<DMJS.returnList.length;i++){
					var newDate = DMJS.returnList[i];
					ListHtml += '<div rId="'+newDate.id+'" class="ub ub-ac uinput b-bottom lpd-all-10"><div class="width90  line-h-20">'+
					'<div class="ub ub-ac fn-c-blue2"><span class="dsb concern_img4" style="background-image: url('+
					newDate.returnImg.filesUrl[0]+')"></span><span class="pd-l-10">支持'+ 
					newDate.supportAmount +'元</span></div>'+
					'<span class="dsb pd-t-10">'+ newDate.returnDescribe +'</span></div>'+
					'<div class="ub ub-pe ub-f1"><i class="dsb img-more"></i></div></div>';
				}
			}else if(DMJS.returnList && self.type=="3"){//梦想项目
				if(DMJS.returnList.length >= self.data.maxDream){
					$("#addSel").addClass("uhide");
				}else{
					$("#addSel").removeClass("uhide");
				}
				for(var i=0;i<DMJS.returnList.length;i++){
					var newDate = DMJS.returnList[i];
					ListHtml += '<div rId="'+newDate.id+'" class="ub ub-ac uinput b-bottom lpd-all-10"><div class="width80  line-h-20">'+
					'<div class="fn-c-blue2">目标 ' + newDate.supportAmount + '元</div><span>' + newDate.returnDescribe + '</span></div>'+
					'<div class="ub ub-pe ub-f1"><i class="dsb img-more"></i></div></div>';
				}
			}
			$("#returnList").html(ListHtml);
			self.loadScroller();
		},
		uploadImg:function(files,fileType,params){//上传图
			var self = this;
			var fd = new FormData(fileType);
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
				self.data.backImgIngo = files;//记录上传图片信息
				if(self.proid){//存在项目id  则修改
					self.updateProCall(params);
				}else{//添加
					self.addProCall(params);
				}
				return false;
			}
			fd.append("fileType", fileType);
			console.log("项目传图");
			self.controller.commonModel.uploadAttachment({//上传图集合
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
					self.data.backImgIngo = files;//记录上传图片信息
					if(self.proid){//存在项目id  则修改
						self.updateProCall(params);
					}else{//添加
						self.addProCall(params);
					}
				},
			});
		},
		uploadReturn:function(files,fileType,_call){//上传回报图片
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
			console.log("回报传图");
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
		update:function(e){//修改回报或目标
			var self = this;
			var $dom=$(e.target);
			
            if(!$dom.is("#returnList > div")){
                $dom=$dom.parents("#returnList > div");
            }
            var rid = $dom.attr("rid");
			self.noDestroy=true;
			if(self.type == "2"){//添加回报
				console.log("回报");
				DMJS.router.navigate("start/start/requite/"+rid,true);
			}else{//添加梦想目标
				console.log("梦想目标");
				DMJS.router.navigate("start/start/target/"+rid,true);
			}
		},
	});

	return startInfoView;
});
