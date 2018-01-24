define([ 'text!userTemplate/personal/personSet.html',
		'commonTool/validator'], function(personSet,Validator) {
	var personSetView = DMJS.DMJSView.extend({
		id : 'personSetView',
		name : 'personSetView',
		tagName : 'div',
		className : "personSetView",
		events : {
			'tap #accountNick':'accountNick',
			'tap #userImg':'setUserImg',
			'tap #logout':'logout'

		},
		init : function(options) {
			_.extend(this, options);
			
		},
		data:{
			returnImg:{
				files:[],
				filesUrl:[]
			},//图片
		},
		render : function() {
			var self = this;
			self.getUserInfo();
			
			return this;
		},
		accountNick:function(){
			var self=this;
			wrapView.FlipPrompt.confirm({
                title: '修改账号昵称',
                content:'<input type="text" id="accNick" name="accNick" class="width100 line-h-20 border-all">',
                FBntconfirm: "取消",
                FBntcancel: "确定",
                FBntCancelColor: "pop_btn_orange",
                autoCloseBg:'true'
	            }, function() {
	            	
	            }, function() {
	            	var nickName =$("#accNick").val();
	            	if(nickName.length < 4 || nickName.length > 20){
	            		DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "长度必须在4-20个字符之间");
	            		return false;
	            	}
	            	self.controller.userModel.updateUserBaseInfo({
	            		'data':{
	            			nickName:nickName
	            		},
	            		'cancelLightbox':true,
	    	        	"noCache":true,
	    				"success":function(response){
	    					 $("#nickName").text($("#accNick").val());
	    				}
	            	});
	              
	         });
		},
		
		setUserImg:function(e){
        	var self=this;
        	var uploadImg ='<div class="ub ub-pc"><div id="uploadImg" class="upload-file radius5 bd-dashed mg-t-10 mg-r-5 " style="float: left;">'
					+'<div class="add-img"></div><span class="dsb ub ub-pc tx-c">上传头像</span>'
					+'<input id="cameraInput" class="upload-file Upload" type="file" style="opacity: 0; position: absolute; top: 0px; left: 0px;" accept="image/jpeg,image/png,image/bmp">'
				+'</div></div>';
        	wrapView.FlipPrompt.confirm({    //设置头像
   				title: "设置头像",
   				/*content: '<input type="file" capture="camera" accept="image/*" id="cameraInput" name="cameraInput"><p id="tips"></p>',*/
   				content: uploadImg,
   				FBntconfirm: "取消",
				FBntcancel: "设置",
				FBntCancelColor: "pop_btn_orange"
				}, function() {}, function() {
					
		       	 	self.uploadAndSubmit();

				});
		},
		 uploadAndSubmit:function () {
	        	var self=this;
	        	 var cameraInput =document.getElementById('cameraInput'); 
	        	 var file = cameraInput.files[0],fSize=3*1024*1024; 
	        	 
	        	 if (!!file) { 
	        		 var fd = new FormData();
	        		 fd.append('file', file);
	        		 self.controller.userModel.uploadFile({
	                     "noCache": true,
	                     "data": fd,
	                     "processData": false,  // 告诉jQuery不要去处理发送的数据
	                     "contentType": false ,  // 告诉jQuery不要去设置Content-Type请求头
	                     "success": function(response) { 
	                    	 self.updateImg(response);
	                     },
	                 });
		             }else { 
	        		    DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "请选择一张图片！");
		        	 } 
	        },
	        updateImg:function(response){
	        	var self = this,params = response.data;
	             self.controller.userModel.updateUserBaseInfo({
	                    "noCache": true,
	                    "data": {
	                    	imageUrl:response.data.url,
	                    	imageId:response.data.batchNumber,
	                    },
	                    "success": function(response) { 
	                    	DMJS.userInfo.imageUrl = params.url;
	                    	self.reflush();
	                    }
	                });
	        },
		getUserInfo:function(){
			var self=this;
			self.controller.userModel.findAccInfo({
				'data':{
					userId:DMJS.userInfo.userId
				},
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					_.extend(DMJS.userInfo,response.data.singleResult);
					var userInfo = JSON.stringify(DMJS.userInfo);
					userInfo = encodeURI(userInfo); 
					document.cookie="userInfo="+userInfo; 
					self.$el.html(_.template(personSet, response.data.singleResult)); // 将tpl中的内容写入到
					self.getPasswordSet();
					self.loadScroller();
				}
			});
		},
		
		getPasswordSet:function(){
			var self=this;
			self.controller.commonModel.findCache({
	        	'data':{
	        		key:"SETTING_TRADE_PASSWORD"
	        	},
	        	'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					if(response.data){
						$("#transP").removeClass("hide");
					}
				}
				
	        });
		},
		setCheckName:function(){//实名认证
			var self = this;
			if(DMJS.userInfo.idcardStatus=="1"){
    			DMJS.router.navigate("user/personal/checkSuccess", true);
    		}else{
    			DMJS.router.navigate("user/personal/checkName", true);
    		}
		},
		logout:function(){
			var self=this;
			self.controller.userModel.logout({
				'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					wrapView.FlipPrompt.confirm({
		                title: '是否退出登录？',
		                content:' ',
		                FBntconfirm: "取消",
		                FBntcancel: "确定",
		                FBntCancelColor: "pop_btn_orange",
		                autoCloseBg:'true'
			            }, function() {
			            	
			            }, function() {
			            	DMJS.isLogout=true;//是否是退出登录
			            	DMJS.CommonTools.replaceCoBack("index/index/index");
			            	DMJS.router.navigate("user/personal/login", true);
			              
			         });
				}
			});
		}
		
	});
		
	return personSetView;
});
