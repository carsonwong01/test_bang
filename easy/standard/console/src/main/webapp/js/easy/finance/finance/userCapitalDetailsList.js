/**
 * 后台-财务管理-财务管理-用户资金明细
 * 
 */
var searchUserCapitalDetailsList = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 用户资金明细列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "searchUserCapitalDetailsListForm",
					"serialize" : true,
					"url" : "finance/searchUserCapitalDetailsListAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#searchUserCapitalDetailsListD").empty();
				if (data.pageResult) {
					var list = data.pageResult.list;
					for ( var index in list) {
						list[index].typeName = {};
						list[index].typeName = searchUserCapitalDetailsList.enums.tradeType[list[index]["type"]];
					}
				}
				// 填充数据
				$('#searchUserCapitalDetailsListTemp').tmpl(data).appendTo("#searchUserCapitalDetailsListD");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "searchUserCapitalDetailsListTag",
					"formId" : "searchUserCapitalDetailsListForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "finance/searchUserCapitalDetailsListAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			enums : {
				tradeType : {
				    "1" : "订单支付",	
					"2" : "提现",
					"3" : "提现手续费",
					"5" : "订单退款"
		        }
		      },
			
		});

//实例化控制器
var searchUserCapitalDetailsList = new searchUserCapitalDetailsList();
// 页面加载时调用
DM.Page.ready({
	"监控" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			searchUserCapitalDetailsList.loadRecord();
		});
		searchUserCapitalDetailsList.loadRecord();
		
		//绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "searchUserCapitalDetailsListForm",
				"fileName" : "用户资金明细列表.xls",
				"url" : "finance/searchUserCapitalDetailsListExport.do"
			});
		});
	}
});