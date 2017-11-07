/**
 * 后台-财务管理-支付记录
 * 
 */
var ProjectSupportRecordListController = DM.Controller.sub({
			init : function() {
				
			},
			/*
			 * 支付记录列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "dataForm",
					"serialize" : true,
					"url" : "bus/projectManage/projectSupportRecordsAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#supportRecords").empty();
				
				// 填充数据
				$('#supportRecordsTemp').tmpl(data).appendTo("#supportRecords");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "supportRecordsTag",
					"formId" : "dataForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "projectSupportRecordsAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			
		});

//实例化控制器
var controller = new ProjectSupportRecordListController();
// 页面加载时调用
DM.Page.ready({
	"支持记录" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			controller.loadRecord();
		});
		controller.loadRecord();
	}
});