/**
 * 用户发起统计控制器
 */
var StatisticsRecord = DM.Controller.sub({
	init : function() {
	},
	/*
	 * 资金统计记录列表
	 */
	loadRecord : function(type) {
		if(type == "load"){
			var html = "<input id='dis' type='hidden' name='type' class='text border pl5 mr20' value='true' />";
			$("#form").append(html);
		}
		// 查询数据
		DM.ajax({
			"formId" : "form",
			"serialize" : true,
			"url" : "statistics/userInitiateAjax.do",
			"success" : this.pageCallBack
		});
		$("#dis").remove();
	},
	/*
	 * 分页回调
	 */
	pageCallBack : function(data) {
		// 清空表格数据
		$("#container").empty();
		// 填充数据
		$('#proLeadTemple').tmpl(data).appendTo("#container");
		if(data.type == "true"){
			$("#totalContent").empty();
			$('#statTemple').tmpl(data).appendTo("#totalContent");
		}
		 
		DM.Event.formatChar();// 保留两位小数 format=2
		// 初始化分页标签
		DM.PageTags.init({
			"divId" : "applyRecordTag",
			"formId" : "form",
			"curPage" : data.pageResult.pageIndex,
			"totalCount" : data.pageResult.recordCount,
			"pageCount" : data.pageResult.pageTotal,
			"url" : "statistics/userInitiateAjax.do",
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

var controller = new StatisticsRecord();
// 页面加载时调用
DM.Page.ready({
	"用户发起统计事件监控" : function() {
		var type = "load";
		// 实例化控制器
		// 绑定
		// 初始化查询
		controller.loadRecord(type);
		// 绑定查询事件
		$("#searchStatistics").bind("click", function() {
			controller.loadRecord("");
		});
		// 绑定导出事件
		$("#exportStatistics").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "form",
				"fileName" : "用户发起统计列表.xls",
				"url" : "statistics/userInitiateExport.do"
			});
		});
	}
});
