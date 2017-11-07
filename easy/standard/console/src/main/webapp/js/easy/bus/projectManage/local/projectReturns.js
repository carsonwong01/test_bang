/**
 * 用户信息列表js
 */
var ProjectReturnControler = DM.constructor.sub({
	// 查询的Ajax
	getProjectReturnsAjaxList : function() {
		var _self = this;
		/* myfn.AjaxFn("user/perInformation.do",$(".viewFramework-content"),$("#dataForm").serialize()); */
		DM.ajax({
			url : "bus/projectManage/projectReturnsAjax.do",
			data : $("#dataForm").serialize(),
			success : function(data) {
				if (data) {
					_self.setProjectReturnsAjaxQuery(data.data);
				}
			},
			error : function(data) {

			}
		});
	},
	// 用户信息列表填充
	setProjectReturnsAjaxQuery : function(data) {
		var _self = this;
		$("#projectReturnData").empty();
		// 填充数据
		$('#projectReturnTemplate').tmpl(data.pageResult).appendTo(
				"#projectReturnData");
		//初始化图片放大查看
		_self.piclytebox();
		// 初始化分页标签
		DM.PageTags.init({
			divId : "projectReturnPagerTag", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : "bus/projectManage/projectReturnsAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setProjectReturnsAjaxQuery(data.data);
			}
		});
	},
	piclytebox : function() {
		$(".imgPreviewNew").on(
				"click",
				function() {
					var src = $(this).attr("src");
					if (src === undefined || src == null) {
						src = $("#img_" + $(this).attr("id")).attr("src");
					}
					$("#lytebox_productPic").remove();
					$(this).after(
							'<a href="#" id="lytebox_productPic" rel=""></a>');
					$("#lytebox_productPic").attr('rel', 'lytebox[vacation]');
					$("#lytebox_productPic").attr('href', src);
					myLytebox
							.start(document
									.getElementById("lytebox_productPic"),
									false, false);
					return false;
				});
	}
});

var controler = new ProjectReturnControler();
// 页面加载时调用
DM.Page.ready({

	"项目管理" : function() {
		controler.getProjectReturnsAjaxList();
	}

});
