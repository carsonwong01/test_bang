dmCheck.init("#dataForm");
var AddProjectDynamicController = DM.Controller.sub({
	init:function(){
	    //初始化上传控件
        var option = {
                containerId: "imgsIdsUl",//容器ID,必须
                inputPrefix: "imagesIds",//input的name前缀,必须
                uploadUrl: "user/project/uploadAttachment.do",//上传文件url
                deleteUrl: "user/project/deleteAttachment.do",//删除文件url
                formData:{"fileType":"6"},//上传附带参数
                fileNumLimit: 8,
                pick: "#filePicker",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: false//是否有设置默认封面按钮
            };
        projectStartController.initUpload(option);
	    
		//添加项目动态
		$("#addProjectDynamic").click(function(){
			if(dmCheck.check("#dataForm")){
			    var imgsIds = new Array();
                $("#imgsIdsUl li.upload-state-done input[name=imagesIds]").each(function(){
                    imgsIds.push($(this).val());
                });
				DM.ajax({
					url:basePath+"user/project/addDynamicAjax.do",
					type:"post",
					data: {"projectId":$("#projectId").val(),"dynamicInfo":$("#dynamicInfo").val(),"imgsIds": imgsIds.toString()},
					success: function(data){
						if(data.code == '000000'){
							Dialog.show({
								title:"提示信息",// 需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
								msg:"操作成功",
								picClass:"success",// 需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
								showClose:false,
								callBack:function(){
									$("li#gxdt a").click();
								}
							});
						}else{
		             		Dialog.show(data.description,"error");
		             	}
					},
					error:function(data){
						Dialog.confirm("你当前的会话已失效，请重新登录。",{
							picClass:"error",
							showCancel:false,
							callBack:function(){
								window.location.href=basePath+"home/login.do";
							}
						});
					 }
				});
			}
		});
	}
});

var addProjectDynamicController =new  AddProjectDynamicController();

DM.ready({
	"初始化" : function() {
		projectManageController.initCalculate($("#dynamicInfo"));
	}
});
