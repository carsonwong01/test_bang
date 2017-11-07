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
        
        //身份证输入框绑定事件
        $('#receiveIdCard,#recipient').blur(function(){
            $("#receiveIdCardMsg").hide();
            $("#recipientMsg").hide();
            if ($(this).attr('id') == 'receiveIdCard' && $.trim($("#receiveIdCard").val()) != '' && $.trim($("#recipient").val()) != '' && $.trim($("#receiveIdCard").val()) == $.trim($("#recipient").val())) {
                $("#receiveIdCardMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("收款人身份证不能和受助人身份证相同").show();
            }
            if ($(this).attr('id') == 'recipient' && $.trim($("#receiveIdCard").val()) != '' && $.trim($("#recipient").val()) != '' && $.trim($("#receiveIdCard").val()) == $.trim($("#recipient").val())) {
                $("#recipientMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("受助人身份证和收款人身份证不能相同").show();
            }
        });
		
		//初始化地区
		DM.Region.init();
		
		//示例图片click事件
		$(".defaultImage").click(function(){
			projectEditController.showImg(this, $(this).attr("src"));
		});
		
		//初始化上传控件
		//收款人身份证图片
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
		//收款人和受助人关系（户口簿）
		//户口本收款人个人页
		option = {
                containerId: "accountBookImgIds1",//容器ID,必须
                uploadUrl: "user/project/uploadAttachment.do",//上传文件url
                deleteUrl: "user/project/deleteAttachment.do",//删除文件url
                formData:{"fileType":"3"},//上传附带参数
                fileNumLimit: 1,
                pick: "#accountBookImgIdsPicker1",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: false,//是否有设置默认封面按钮
                files: accountBookFiles1
            };
        projectEditController.initUpload(option);
        //户口本受助人(患者)个人页
        option = {
                containerId: "accountBookImgIds2",//容器ID,必须
                uploadUrl: "user/project/uploadAttachment.do",//上传文件url
                deleteUrl: "user/project/deleteAttachment.do",//删除文件url
                formData:{"fileType":"3"},//上传附带参数
                fileNumLimit: 1,
                pick: "#accountBookImgIdsPicker2",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: false,//是否有设置默认封面按钮
                files: accountBookFiles2
            };
        projectEditController.initUpload(option);
        //户口本其他补充图片
        option = {
                containerId: "accountBookImgIds3",//容器ID,必须
                uploadUrl: "user/project/uploadAttachment.do",//上传文件url
                deleteUrl: "user/project/deleteAttachment.do",//删除文件url
                formData:{"fileType":"3"},//上传附带参数
                fileNumLimit: 1,
                pick: "#accountBookImgIdsPicker3",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: false,//是否有设置默认封面按钮
                files: accountBookFiles3
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
	},
    /**
     * 修改项目验证 
     */
    validation:function(){
        var _this = this;
        if(!dmCheck.check("#validationForm")){
            return;
        }
        if ($.trim($("#receiveIdCard").val()) == $.trim($("#recipient").val())) {
            $("#receiveIdCardMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("收款人身份证不能和受助人身份证相同").show();
            $("#recipientMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("受助人身份证和收款人身份证不能相同").show();
            $("#recipient").focus();
            return;
        }else{
            $("#receiveIdCardMsg").hide();
            $("#recipientMsg").hide();
        }
        //收款人身份证图片必填验证
        if ($("#receiveCardImage li.upload-state-done") && $("#receiveCardImage li.upload-state-done").length > 0) {
            $("#receiveCardImageMsg").hide();
        }else{
            $("#receiveCardImageMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
            return;
        }
        //受助人身份证图片必填验证
        if ($("#recipientCardImageIds li.upload-state-done") && $("#recipientCardImageIds li.upload-state-done").length > 0) {
            $("#recipientCardImageIdsMsg").hide();
        }else{
            $("#recipientCardImageIdsMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
            return;
        }
        //收款人受助人关系（户口本）图片必填验证
        if ($("#accountBookImgIds1 li.upload-state-done") && $("#accountBookImgIds1 li.upload-state-done").length > 0) {
            $("#accountBookImgIdsMsg").hide();
        }else{
            $("#accountBookImgIdsMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("请提供户口本收款人个人页").show();
            return;
        }
        if ($("#accountBookImgIds2 li.upload-state-done") && $("#accountBookImgIds2 li.upload-state-done").length > 0) {
            $("#accountBookImgIdsMsg").hide();
        }else{
            $("#accountBookImgIdsMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("请提供户口本受助人(患者)个人页").show();
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
        $("#receiveCardImage li.upload-state-done input[name=imagesIds]").each(function(){
            $(this).attr("name","receiveCardImageIds");
        });
        $("#recipientCardImageIds li.upload-state-done input[name=imagesIds]").each(function(){
            $(this).attr("name","recipientCardImageIds");
        });
        $("#accountBookImgIds1 li.upload-state-done input[name=imagesIds],#accountBookImgIds2 li.upload-state-done input[name=imagesIds],#accountBookImgIds3 li.upload-state-done input[name=imagesIds]").each(function(){
            $(this).attr("name","accountBookImgIds");
        });
        $("#proveImgIds li.upload-state-done input[name=imagesIds]").each(function(){
            $(this).attr("name","proveImgIds");
        });
        //身份证号码加密
        $("#receiveIdCardVal").val(new Base64().encode($("#receiveIdCard").val()));
        $("#recipientVal").val(new Base64().encode($("#recipient").val()));
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