dmCheck.init("#projectForm");
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
        //初始化form表单缓存
        var cacheData = projectStartController.initFormCache($("#projectForm"), "disasterRelief");
        
		projectStartController.readyProject();
		//初始化input实时显示填写字数
		projectStartController.initCalculate($("input[name=projectName],input[name=projectIntro]"));
		//初始化富文本控件
		var projectDetails = projectStartController.initKindEditor("projectDetails","建议详细描述受灾情况：如受灾时间。受灾地点、受灾人家庭背景和经济状况、受灾过程等。","projectDetailsTip");
        if (cacheData.projectDetails && cacheData.projectDetails[0] != '') {
          projectDetails.html(cacheData.projectDetails ? cacheData.projectDetails[0] : "");
        }
		//初始化上传控件
		var option = {
				containerId: "projectImageUl",//容器ID,必须
                inputPrefix: "imagesIds",//input的name前缀,必须
				uploadUrl: "user/project/uploadAttachment.do",//上传文件url
				deleteUrl: "user/project/deleteAttachment.do",//删除文件url
				formData:{"fileType":"1"},//上传附带参数
				fileNumLimit: 8,
				pick: "#filePicker",
				accept: {//上传文件类型
		            title: '图片',
		            extensions: 'jpg,jpeg,bmp,png',
		            mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
		        },
		        isMulti: true,//是否有设置默认封面按钮
                files: cacheData.imagesIds ? cacheData.imagesIds : null,
                formId: "projectForm"
			};
		projectStartController.initUpload(option);
	}
});