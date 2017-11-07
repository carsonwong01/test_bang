dmCheck.init("#projectForm");
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
	    var projectType = $("#projectType").val();
	    
		projectEditController.readyProject();
		
		//初始化input实时显示填写字数
		projectEditController.initCalculate($("input[name=projectName],input[name=projectIntro]"));
		//初始化富文本框
		var projectDetails;
		switch(projectType){
		    case '1':
		        projectDetails = projectEditController.initKindEditor("projectDetails","建议详细描述受助人的基本情况：如家庭背景、经济状况、患病经历等。","projectDetailsTip");
		      break;
            case '2':
                projectDetails = projectEditController.initKindEditor("projectDetails","建议详细描述受灾情况：如受灾时间。受灾地点、受灾人家庭背景和经济状况、受灾过程等。","projectDetailsTip");
              break;
            case '3':
                projectDetails = projectEditController.initKindEditor("projectDetails","建议详细描述受灾情况：如动物特殊情况介绍、申请动物保护理由等。","projectDetailsTip");
              break;
            case '4':
                projectDetails = projectEditController.initKindEditor("projectDetails","建议详细描述扶贫助学情况：如申请扶贫助学团体或个人的经济状况、资金用途及未来规划。","projectDetailsTip");
              break;
            case '5':
                projectDetails = projectEditController.initKindEditor("projectDetails","建议详细描述救助的情况、资金用途。","projectDetailsTip");
              break;
            default:
              break;
		}
        projectDetails.html($("#detailContent").html());
		
		//初始化上传控件
		var option = {
				containerId: "projectImageUl",//容器ID,必须
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
		        files: projectFiles
			};
		projectEditController.initUpload(option);
	}
});