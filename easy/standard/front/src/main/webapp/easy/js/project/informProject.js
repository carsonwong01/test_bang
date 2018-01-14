dmCheck.init("#projectForm");
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
        //初始化form表单缓存
        var cacheData = projectStartController.initFormCache($("#projectForm"), "diseaseRelief");
        
		projectStartController.readyProject();
		//初始化input实时显示填写字数
		projectStartController.initCalculate($("input[name=projectName],input[name=projectIntro]"));
		//初始化富文本控件
		var content = projectStartController.initKindEditor("content","请填写您举报该项目的原因与理由","projectDetailsTip");
		if (cacheData.projectDetails && cacheData.projectDetails[0] != '') {
		  projectDetails.html(cacheData.projectDetails ? cacheData.projectDetails[0] : "");
		}
		//初始化上传控件
		var option = {
				containerId: "projectImageUl",//容器ID,必须
				inputPrefix: "imgIds",//input的name前缀,必须
				uploadUrl: "user/project/uploadAttachment.do",//上传文件url
				deleteUrl: "user/project/deleteAttachment.do",//删除文件url
				formData:{"fileType":"1"},//上传附带参数
				fileNumLimit: 6,
				pick: "#filePicker",
				accept: {//上传文件类型
		            title: '图片',
		            extensions: 'jpg,jpeg,bmp,png',
		            mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
		        },
		        isMulti: true,//是否有设置默认封面按钮
		        files: cacheData.imgIds ? cacheData.imgIds : null,
		        formId: "projectForm"
			};
		projectStartController.initUpload(option);
	}
});