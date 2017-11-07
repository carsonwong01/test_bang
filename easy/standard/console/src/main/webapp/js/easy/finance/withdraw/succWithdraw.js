/**
 * 后台-财务管理-提现管理-提现成功列表
 * 
 */
var searchSuccWithdraw = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 提现成功列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "searchSuccWithdrawForm",
					"serialize" : true,
					"url" : "finance/searchSuccWithdrawAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#searchSuccWithdrawD").empty();
				
				// 填充数据
				$('#searchSuccWithdrawTemp').tmpl(data).appendTo("#searchSuccWithdrawD");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "searchSuccWithdrawTag",
					"formId" : "searchSuccWithdrawForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "finance/searchSuccWithdrawAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			
		});

//实例化控制器
var searchSuccWithdraw = new searchSuccWithdraw();
// 页面加载时调用
DM.Page.ready({
	"监控" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			searchSuccWithdraw.loadRecord();
		});
		searchSuccWithdraw.loadRecord();
		//绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "searchSuccWithdrawForm",
				"fileName" : "提现成功列表.xls",
				"url" : "finance/searchSuccWithdrawExport.do"
			});
		});
	}
});