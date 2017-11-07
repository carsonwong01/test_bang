/**
 * 项目审核列表js
 */
var ProjectAuditControler = DM.constructor.sub({
	// 查询的Ajax
	getProjectAuditListAjax : function() {
		var _self = this;
		/* myfn.AjaxFn("user/perInformation.do",$(".viewFramework-content"),$("#dataForm").serialize()); */
		DM.ajax({
			url : "bus/auditingManage/projectAuditListAjax.do",
			data : $("#dataForm").serialize(),
			success : function(data) {
				if (data) {
					_self.setProjectAuditListAjaxQuery(data.data);
				}
			},
			error : function(data) {

			}
		});
	},
	// 项目列表填充
	setProjectAuditListAjaxQuery : function(data) {
		var _self = this;
		$("#projectAuditData").empty();
		// 填充数据
		$('#projectAuditTemplate').tmpl(data.pageResult).appendTo(
				"#projectAuditData");
		// 初始化分页标签
		DM.PageTags.init({
			divId : "pagerTag", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : "bus/auditingManage/projectAuditListAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setProjectAuditListAjaxQuery(data.data);
			}
		});
	}
	
});

var controler = new ProjectAuditControler();
// 页面加载时调用
DM.Page.ready({

	"项目审核列表" : function() {
		controler.getProjectAuditListAjax();
	},

	"导出列表" : function() {
		// 绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "dataForm",
				"fileName" : "项目验证审核列表.xls",
				"url" : "bus/auditingManage/projectAuditListExport.do"
			});
		});
	}

});
