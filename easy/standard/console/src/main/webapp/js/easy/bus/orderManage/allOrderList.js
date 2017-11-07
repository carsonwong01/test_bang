/**
 * 所有订单列表
 * 
 */
var AllOrderListController = DM.Controller.sub({
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
					"url" : "bus/orderManage/allOrderListAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#allOrderList").empty();
				
				// 填充数据
				$('#allOrderListTemp').tmpl(data).appendTo("#allOrderList");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "allOrderListTag",
					"formId" : "dataForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "bus/orderManage/allOrderListAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			
		});

//实例化控制器
var controller = new AllOrderListController();
// 页面加载时调用
DM.Page.ready({
	"所有订单" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			controller.loadRecord();
		});
		controller.loadRecord();
		//绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "dataForm",
				"fileName" : "所有订单记录列表.xls",
				"url" : "bus/orderManage/allOrderListExport.do"
			});
		});
	}
});