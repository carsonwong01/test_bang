/**
 * 用户支持统计控制器
 */
dmCheck.init("#form");
var StatisticsRecord = DM.Controller.sub({
	init : function() {
	},
	/*
	 * 查询用户支持统计记录列表
	 */
	loadRecord : function(type) {
		if(!dmCheck.check("#form")){ 
			return false;
     	}
		if(type == "load"){
			var html = "<input id='dis' type='hidden' name='type' class='text border pl5 mr20' value='true' />";
			$("#form").append(html);
		}
		// 查询数据
		DM.ajax({
			"formId" : "form",
			"serialize" : true,
			"url" : "statistics/userSupportAjax.do",
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
	
		// 初始化分页标签
		DM.PageTags.init({
			"divId" : "applyRecordTag",
			"formId" : "form",
			"curPage" : data.pageResult.pageIndex,
			"totalCount" : data.pageResult.recordCount,
			"pageCount" : data.pageResult.pageTotal,
			"url" : "statistics/userSupportAjax.do",
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
	"用户支持统计事件监控" : function() {
		// 实例化控制器
		// 绑定
		// 初始化查询
		controller.loadRecord("load");
		// 绑定查询事件
		$("#searchStatistics").bind("click", function() {
			controller.loadRecord("");
		});
		// 绑定导出事件
		$("#exportStatistics").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "form",
				"fileName" : "用户支持统计列表.xls",
				"url" : "statistics/userSupportExport.do"
			});
		});
	}
});
