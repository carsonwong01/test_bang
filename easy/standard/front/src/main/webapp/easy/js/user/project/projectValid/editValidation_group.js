dmCheck.init("#validationForm");
var ProjectValidController = DM.Controller.sub({
	init:function(){
        var _this = this;
        
	    $("#closeBtn,#successDialog a.out").click(function(){
	        window.location.href = basePath+"project/projectDetails.do?projectId=" + $("#projectId").val();
	    });
	    
		//项目验证提交按钮
        $("#projectValidBtn").click(function(){
            _this.validation();
        });
		
		//初始化地区
		DM.Region.init();
		
		//示例图片click事件
		$(".defaultImage").click(function(){
			projectEditController.showImg(this, $(this).attr("src"));
		});
		
		//初始化上传控件
		//组织机构资质证明/营业执照图片
		option = {
                containerId: "organizationAptitude",//容器ID,必须
                uploadUrl: "user/project/uploadFile.do",//上传文件url
                deleteUrl: "user/project/deleteFile.do",//删除文件url
                formData:null,//上传附带参数
                fileNumLimit: 1,
                pick: "#organizationAptitudePicker",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: false,//是否有设置默认封面按钮
                files: organizationAptitudeFiles
            };
        projectEditController.initUpload(option);
		//资金用途证明图片
        option = {
                containerId: "useProveImgIds",//容器ID,必须
                uploadUrl: "user/project/uploadAttachment.do",//上传文件url
                deleteUrl: "user/project/deleteAttachment.do",//删除文件url
                formData:{"fileType":"4"},//上传附带参数
                fileNumLimit: 6,
                pick: "#useProveImgIdsPicker",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: false,//是否有设置默认封面按钮
                files: useProveFiles
            };
        projectEditController.initUpload(option);
        //项目相关证明图片
        option = {
                containerId: "projectProveImgIds",//容器ID,必须
                uploadUrl: "user/project/uploadAttachment.do",//上传文件url
                deleteUrl: "user/project/deleteAttachment.do",//删除文件url
                formData:{"fileType":"5"},//上传附带参数
                fileNumLimit: 6,
                pick: "#projectProveImgIdsPicker",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: false,//是否有设置默认封面按钮
                files: projectProveFiles
            };
        projectEditController.initUpload(option);
		//受助人身份证图片
		option = {
                containerId: "recipientCardImageIds",//容器ID,必须
                uploadUrl: "user/project/uploadAttachment.do",//上传文件url
                deleteUrl: "user/project/deleteAttachment.do",//删除文件url
                formData:{"fileType":"9"},//上传附带参数
                fileNumLimit: 2,
                pick: "#recipientCardImageIdsPicker",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: false,//是否有设置默认封面按钮
                files: projectRecipientCardFiles
            };
        projectEditController.initUpload(option);
		//医疗证明图片
		option = {
				containerId: "proveImgIds",//容器ID,必须
				uploadUrl: "user/project/uploadAttachment.do",//上传文件url
				deleteUrl: "user/project/deleteAttachment.do",//删除文件url
				formData:{"fileType":"2"},//上传附带参数
				fileNumLimit: 6,
				pick: "#proveImgIdsPicker",
				accept: {//上传文件类型
		            title: '图片',
		            extensions: 'jpg,jpeg,bmp,png',
		            mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
		        },
		        isMulti: false,//是否有设置默认封面按钮
                files: proveFiles
			};
		projectEditController.initUpload(option);
        //法人身份证图片
        var option = {
                containerId: "receiveCardImage",//容器ID,必须
                uploadUrl: "user/project/uploadAttachment.do",//上传文件url
                deleteUrl: "user/project/deleteAttachment.do",//删除文件url
                formData:{"fileType":"8"},//上传附带参数
                fileNumLimit: 2,
                pick: "#receiveCardImagePicker",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: false,//是否有设置默认封面按钮
                files: projectReceiveCardFiles
            };
        projectEditController.initUpload(option);
	},
    /**
     * 修改项目验证 
     */
    validation:function(){
        var _this = this;
        var projectType = $("#projectType").val();
        if(!dmCheck.check("#validationForm")){
            return;
        }
        switch(projectType)
        {
            case '1':
                //资质证明/营业执照图片必填验证
                if ($("#organizationAptitude li.upload-state-done") && $("#organizationAptitude li.upload-state-done").length > 0) {
                    $("#organizationAptitudeMsg").hide();
                }else{
                    $("#organizationAptitudeMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
                    return;
                }
                //受助人身份证图片必填验证
                if ($("#recipientCardImageIds li.upload-state-done") && $("#recipientCardImageIds li.upload-state-done").length > 0) {
                    $("#recipientCardImageIdsMsg").hide();
                }else{
                    $("#recipientCardImageIdsMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
                    return;
                }
                //医院省市验证
                if($("#hospitalRegionId").val() == null || $("#hospitalRegionId").val() == ''){
                    $("#hospitalRegionIdMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
                    return;
                }else{
                    $("#hospitalRegionIdMsg").hide();
                }
                //医疗证明图片必填验证
                if ($("#proveImgIds li.upload-state-done") && $("#proveImgIds li.upload-state-done").length > 0) {
                    $("#proveImgIdsMsg").hide();
                }else{
                    $("#proveImgIdsMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
                    return;
                }
                //身份证号码加密
                $("#recipientVal") && $("#recipientVal").val(new Base64().encode($("#recipient").val()));
                break;
            case '2':
            case '3':
            case '4':
            case '5':
                //资质证明/营业执照图片必填验证
                if ($("#organizationAptitude li.upload-state-done") && $("#organizationAptitude li.upload-state-done").length > 0) {
                    $("#organizationAptitudeMsg").hide();
                }else{
                    $("#organizationAptitudeMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
                    return;
                }
                //资金用途证明图片必填验证
                if ($("#useProveImgIds li.upload-state-done") && $("#useProveImgIds li.upload-state-done").length > 0) {
                    $("#useProveImgIdsMsg").hide();
                }else{
                    $("#useProveImgIdsMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
                    return;
                }
                break;
            case '6':
                //法人身份证图片必填验证
                if ($("#receiveCardImage li.upload-state-done") && $("#receiveCardImage li.upload-state-done").length > 0) {
                    $("#receiveCardImageMsg").hide();
                }else{
                    $("#receiveCardImageMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
                    return;
                }
                //资质证明/营业执照图片必填验证
                if ($("#organizationAptitude li.upload-state-done") && $("#organizationAptitude li.upload-state-done").length > 0) {
                    $("#organizationAptitudeMsg").hide();
                }else{
                    $("#organizationAptitudeMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
                    return;
                }
                //身份证号码加密
                $("#receiveIdCardVal").val(new Base64().encode($("#receiveIdCard").val()));
                break;
            case '7':
                //资质证明/营业执照图片必填验证
                if ($("#organizationAptitude li.upload-state-done") && $("#organizationAptitude li.upload-state-done").length > 0) {
                    $("#organizationAptitudeMsg").hide();
                }else{
                    $("#organizationAptitudeMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
                    return;
                }
                //项目相关材料证明图片必填验证
                if ($("#projectProveImgIds li.upload-state-done") && $("#projectProveImgIds li.upload-state-done").length > 0) {
                    $("#projectProveImgIdsMsg").hide();
                }else{
                    $("#projectProveImgIdsMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
                    return;
                }
                break;
            default:
                break;
        }
        $("#organizationAptitudeId") && $("#organizationAptitudeId").val($("#organizationAptitude li.upload-state-done input[name=imagesIds]").val());
        $("#organizationAptitudeUrl") && $("#organizationAptitudeUrl").val($("#organizationAptitude li.upload-state-done input[name=imagesUrls]").val());
        $("#useProveImgIds li.upload-state-done input[name=imagesIds]").each(function(){
            $(this).attr("name","useProveImgIds");
        });
        $("#projectProveImgIds li.upload-state-done input[name=imagesIds]").each(function(){
            $(this).attr("name","projectProveImgIds");
        });
        $("#recipientCardImageIds li.upload-state-done input[name=imagesIds]").each(function(){
            $(this).attr("name","recipientCardImageIds");
        });
        $("#proveImgIds li.upload-state-done input[name=imagesIds]").each(function(){
            $(this).attr("name","proveImgIds");
        });
        $("#receiveCardImage li.upload-state-done input[name=imagesIds]").each(function(){
            $(this).attr("name","receiveCardImageIds");
        });
        //项目验证提交按钮取消click事件防止重复提交
        $("#projectValidBtn").unbind("click");
        DM.ajax({
            type:"POST",
            url:"user/project/proAuthenticated.do",
            data:$("#validationForm").serialize(),
            async : false, 
            success:function(data){
                if(data.code == '000000'){
                    $("#successDialog").show();
                }else{
                    Dialog.show(data.description,"error");
                    //项目验证提交按钮
                    $("#projectValidBtn").click(function(){
                        _this.validation();
                    });
                }
            },
            error:function(data){
                Dialog.show("系统异常,请联系系统管理员！","error");
                //项目验证提交按钮
                $("#projectValidBtn").click(function(){
                    _this.validation();
                });
            }
        });
    }
});
//实例化控制器
var projectValidController = new ProjectValidController();
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		
	}
});