dmCheck.init("#dataForm");
var BaseInfomationController = DM.Controller.sub({
	userInfoSubmit:function(){
		$("#tj").bind("click",function(){
			var _nickName = $("#nickName").val();
			if(_nickName==null || _nickName==''){
				
				$("#nickName1").val("");
			}else{
				
				$("#nickName1").val(encodeURIComponent($("#nickName").val()));
			}
			
			if(dmCheck.check("#formData")){
				DM.ajax({
					url:"user/updateUserBaseInfo.do",
					async:false,
					type:"post",
					formId : "formData", // 表单id
					serialize : true,
					success:function(data){
				      if(data.code!="000000"){
				    	  Dialog.show("修改基本信息失败","error");
				      }else{
				    	  Dialog
							.show({
								title : "提示信息",// 需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
								msg : "保存成功",
								picClass : "success",// 需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
								showClose : false,
								callBack : function() {
									 window.location.href = basePath + "user/userCenter.do?to=grzl";
								}
							});
				    	 
				      }
					},
					error:function(data){
						Dialog.confirm({
							msg:"您的登录已失效,请重新登录!",
							picClass:"error",
							title:"提示信息",
							showCancel:false,
							callBack:function(){
				    			window.location.href = basePath + "home/login.do";
							}
						});
					}
				});
			}else{
			}
		});
	},
	sleep:function(numberMillis){
		var now = new Date();
		   var exitTime = now.getTime() + numberMillis;  
		   while (true) { 
		       now = new Date(); 
		       if (now.getTime() > exitTime)    
		    	   return;
		    }
	},
	//上传头像图片
	casePicUpload:function (idStr,hiddenName,url,showUrl){
		
		var fileName=$("#fileImageId").val();
		var  value=fileName.substr(fileName.indexOf(".")); // 截取图片后缀。
		if (!/\.(jpg|png|jpeg|JPG|PNG|JPEG)$/.test(value)) {  
			 Dialog.show("请上传JPG/PNG/JPEG格式图片，文件大小请控制在1M以内。","error");  
	        return false;  
	    }else{
	    	var file=document.getElementById(idStr);
			var size=this.fileChange(file);
	    	if(size>1024){   
	    		Dialog.show("请上传JPG/PNG/JPEG格式图片，文件大小请控制在1M以内。","error");  
	    		return false;
	    	}else if(size == 0){
	    		Dialog.show("文件大小验证未生效！\r\n启用此验证，请如下修改浏览器设置：工具->Internet选项->安全->本地Intranet->自定义级别->ActiveX控件和插件->对没有标记为安全的ActiveX控件进行初始化和脚本运行->启用！","tip");  
	    		return false;
	    	} 
	    	$.ajaxFileUpload({
		          url: basePath+"common/upload.do", //用于文件上传的服务器端请求地址
		          secureuri: false, //是否需要安全协议，一般设置为false
		          fileElementId: idStr, //文件上传域的ID
		          dataType: 'json', //返回值类型 一般设置为json
		          success: function (data, status)  //服务器成功响应处理函数
		          {
//		        	  data = eval('(' + data + ')');;
		        	  if(data.status=='ok'){
			        	  $("#"+hiddenName).val(data.batchNumber);
			        	  //$("#fileImageId").text(data.oldName);
			        	  if(url != null && url != ''){
			        		  $("#"+url).val(data.url);
			        		  $("#"+showUrl).attr("src",data.url);
			        	  }
		        	  }else if(data.status=="error"){
		        		  $("#"+showUrl).attr("src",basePath+"images/add_case.jpg");
		        		  Dialog.show(data.descr,"error"); 
		        	  }else{
		        		  $("#"+showUrl).attr("src",basePath+"images/portrait.png");
		        		  Dialog.show("上传图片失败","error"); 
		        	  }
		          },
		          error: function (data, status, e)//服务器响应失败处理函数
		          {
		        	  //$("#"+showUrl).attr("src",basePath+"images/add_case.jpg");
		              Dialog.show("上传图片失败","error");
		          }
		      });
	    }  
	},
	//校验上传文件大小
	 fileChange:function(target) {     
			var isIE = /msie/i.test(navigator.userAgent) && !window.opera;     
			var fileSize = 0;     
			if (isIE) {   
				try{
					target.select();
				    var filePath = document.selection.createRange().text;    
				    var fileSystem = new ActiveXObject("Scripting.FileSystemObject");         
				    var file = fileSystem.GetFile(filePath);      
				    fileSize = file.Size;
			  	}catch (e) {
					if(e.description=="Automation 服务器不能创建对象"){
						//opts.callBack({fileName:this.value,errorMsg:"文件大小验证未生效！\r\n启用此验证，请如下修改浏览器设置：工具->Internet选项->安全->本地Intranet->自定义级别->ActiveX控件和插件->对没有标记为安全的ActiveX控件进行初始化和脚本运行->启用！",fileSize:-1});
						fileSize=0;
					}
				}
			} else {
				fileSize = target.files[0].size;      
			}
			var size = fileSize / 1024;     
		   	return size; 
		     
		}
});


var baseInfomationController =new  BaseInfomationController();

DM.ready({
	"提交":function(){
		baseInfomationController.userInfoSubmit();
	}
});