/**
 * 用户统计控制器
 */
var StatisticsRecord = DM.Controller.sub({
	init : function() {
	},
	/*
	 * 用户统计记录列表
	 */
	loadRecord : function() {
		// 查询数据
		DM.ajax({
			"formId" : "form",
			"serialize" : true,
			"url" : "statistics/userRelevantStatisticsAjax.do",
			"success" : this.pageCallBack
		});
	},
	/*
	 * 分页回调
	 */
	pageCallBack : function(data) {
		// 清空表格数据
		$("#container").empty();
		$("#totalContent").empty();
		// 填充数据
		$('#proLeadTemple').tmpl(data).appendTo("#container");
		$('#statTemple').tmpl(data).appendTo("#totalContent");
		// 初始化分页标签
		DM.PageTags.init({
			"divId" : "applyRecordTag",
			"formId" : "form",
			"curPage" : data.pageResult.pageIndex,
			"totalCount" : data.pageResult.recordCount,
			"pageCount" : data.pageResult.pageTotal,
			"url" : "statistics/userRelevantStatisticsAjax.do",
			"toPageCallBack" : arguments.callee
		});
	},
	/*
	 * 枚举字段
	 */
	rechargeType : {
		"1" : ""
	}
});

// 页面加载时调用
DM.Page.ready({
	"用户统计事件监控" : function() {
		// 实例化控制器
		var controller = new StatisticsRecord();
		// 绑定
		// 初始化查询
		controller.loadRecord();
		// 绑定查询事件
		$("#searchStatistics").bind("click", function() {
			controller.loadRecord();
		});
		// 绑定导出事件
		$("#exportStatistics").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "form",
				"fileName" : "用户统计列表.xls",
				"url" : "statistics/userRelevantStatisticsExport.do"
			});
		});

	}
});
