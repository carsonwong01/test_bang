/**
 * 业务管理->项目管理--项目动态js
 */
var ProjectDynamicsDetailsControler = DM.Controller.sub({
	// 项目动态
	getProjectDynamicsDetails : function() {
		var _self = this;
		DM.ajax({
			url : "bus/projectManage/projectDynamicsDetailsAjax.do",
			data : $("#dataForm").serialize(),
			success : function(data) {
				if (data.code == "000000") {
					_self.setProjectDynamicsDetails(data.data);
				}
			},
			error : function(data) {
				Dialog.show("系统异常，请联系管理员", "error");
			}
		});
	},
	setProjectDynamicsDetails : function(data) {
		var _self = this;
		$("#projectDynamicsDetailsData").empty();
		// 填充数据

		$('#projectDynamicsDetailsTemp').tmpl(data.pageResult).appendTo(
				"#projectDynamicsDetailsData");
		//初始化放大图片方法
		_self.piclytebox();
		DM.Event.limit();// 截取字符 DM.jsc
		// 初始化分页标签
		DM.PageTags.init({
			divId : "paging", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : basePath + "bus/projectManage/projectDynamicsDetailsAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setProjectDynamicsDetails(data.data);
			}
		});
	},piclytebox : function() {
		$(".imgPreviewNew")
		.on(
				"click",
				function() {
					var src = $(this).attr("src");
					if(src===undefined || src==null){
						src = $("#img_"+$(this).attr("id")).attr("src");
					}
					$("#lytebox_productPic").remove();
					$(this)
							.after(
									'<a href="#" id="lytebox_productPic" rel=""></a>');
					$("#lytebox_productPic").attr('rel',
							'lytebox[vacation]');
					$("#lytebox_productPic").attr('href', src);
					myLytebox
							.start(
									document
											.getElementById("lytebox_productPic"),
									false, false);
					return false;
				});
}
});

var dynamicsDetailsControler = new ProjectDynamicsDetailsControler();
// 页面加载时调用
DM.Page.ready({
	"页面加载" : function() {
		dynamicsDetailsControler.getProjectDynamicsDetails();
	}
});