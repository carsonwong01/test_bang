dmCheck.init("#projectForm");
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		projectEditController.readyProject();
		//初始化input实时显示填写字数
		projectEditController.initCalculate($("textarea[name=modifyReason]"));
	}
});