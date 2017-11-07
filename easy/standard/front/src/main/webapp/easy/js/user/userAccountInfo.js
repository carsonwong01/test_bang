var UserAccountInfoController = DM.Controller.sub({
	getCurTimes:function(){
		now = new Date(),hour = now.getHours();
		if(hour < 6){ return "凌晨好";}
		else if (hour < 9){return "早上好";}
		else if (hour < 12){return "上午好";}
		else if (hour < 14){return "中午好";}
		else if (hour < 17){return "下午好";}
		else if (hour < 19){return "傍晚好";}
		else if (hour < 22){return "晚上好";} 
		else {document.write("夜里好");}
	},
	getRecommendList : function() {
		var _self = this;
		DM.ajax({
			url : basePath + "user/findRecommendAjax.do",
			success : function(data) {
				if (data.data) {
					_self.setRecommendList(data.data);
				}
			}
		});
	},
	setRecommendList : function(data) {
		$("#recommendProject").empty();
		// 填充数据
		$('#recommendProjectTemplate').tmpl(data).appendTo(
				"#recommendProject");
	}
});
// 实例化控制器
var userAccountInfoController = new UserAccountInfoController();
// 页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		$("#goodText").html( userAccountInfoController.getCurTimes() +"，");
		userAccountInfoController.getRecommendList();
	}
});