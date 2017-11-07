/**
 * 后台-财务管理-财务管理-平台资金明细
 * 
 */
var searchPFCapitalDetailsList = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 平台资金明细列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "searchPFCapitalDetailsListForm",
					"serialize" : true,
					"url" : "finance/searchPFCapitalDetailsListAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#searchPFCapitalDetailsListD").empty();
				if (data.pageResult) {
					var list = data.pageResult.list;
					for ( var index in list) {
						list[index].typeName = {};
						list[index].typeName = searchPFCapitalDetailsList.enums.tradeType[list[index]["type"]];
					}
				}
				// 填充数据
				$('#searchPFCapitalDetailsListTemp').tmpl(data).appendTo("#searchPFCapitalDetailsListD");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "searchPFCapitalDetailsListTag",
					"formId" : "searchPFCapitalDetailsListForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "finance/searchPFCapitalDetailsListAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			enums : {
				tradeType : {
				    "1" : "订单支付",	
					"2" : "提现",
					"3" : "提现手续费",
					"4" : "平台调账",
					"5" : "订单退款"
		        }
		      },
			
		});

//实例化控制器
var searchPFCapitalDetailsList = new searchPFCapitalDetailsList();
// 页面加载时调用
DM.Page.ready({
	"监控" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			searchPFCapitalDetailsList.loadRecord();
		});
		searchPFCapitalDetailsList.loadRecord();
		
		//绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "searchPFCapitalDetailsListForm",
				"fileName" : "平台资金明细列表.xls",
				"url" : "finance/searchPFCapitalDetailsListExport.do"
			});
		});
	}
});