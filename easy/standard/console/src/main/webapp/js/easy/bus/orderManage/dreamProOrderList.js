/**
 * 梦想订单列表
 * 
 */
var dreamProOrderListController = DM.Controller.sub({
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
					"url" : "bus/orderManage/projectOrderListAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#dreamProOrderList").empty();
				
				// 填充数据
				$('#dreamProOrderListTemp').tmpl(data).appendTo("#dreamProOrderList");
				$("#orderTotalCount").html(data.pageResult.recordCount);
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "dreamProOrderListTag",
					"formId" : "dataForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "bus/orderManage/projectOrderListAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			
		});

//实例化控制器
var controller = new dreamProOrderListController();
// 页面加载时调用
DM.Page.ready({
	"梦想项目订单列表" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			controller.loadRecord();
		});
		controller.loadRecord();
		
	}
});