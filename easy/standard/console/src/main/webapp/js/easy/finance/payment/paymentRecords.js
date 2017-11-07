/**
 * 后台-财务管理-支付记录
 * 
 */
var searchPaymentRecords = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 支付记录列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "searchPaymentRecordsForm",
					"serialize" : true,
					"url" : "finance/searchPaymentRecordsAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#searchPaymentRecordsD").empty();
				if (data.pageResult) {
					var list = data.pageResult.list;
					for ( var index in list) {
						list[index].payTypeName = {};
						list[index].payTypeName = searchPaymentRecords.enums.payType[list[index]["payType"]];
						list[index].paySourceName = {};
						list[index].paySourceName = searchPaymentRecords.enums.paySource[list[index]["paySource"]];
						list[index].payStatusName = {};
						list[index].payStatusName = searchPaymentRecords.enums.payStatus[list[index]["payStatus"]];
					}
				}
				// 填充数据
				$('#searchPaymentRecordsTemp').tmpl(data).appendTo("#searchPaymentRecordsD");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "searchPaymentRecordsTag",
					"formId" : "searchPaymentRecordsForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "finance/searchPaymentRecordsAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			enums : {
				payType : {
					"300" : "京东支付",
				    "200" : "微信支付",
					"100" : "通联支付"
		        },
		        paySource : {
				    "2" : "微信",
				    "3" : "安卓",
					"4" : "苹果"
		        },
		        payStatus : {
				    "3" : "支付成功",
				    "4" : "支付成功",	
				    "5" : "支付成功",	
				    "6" : "支付成功",	
				    "7" : "支付成功",	
				    "8" : "支付成功",	
				    "9" : "支付失败",	
				    "10" : "支付成功"
		        }
		   },
		});

//实例化控制器
var searchPaymentRecords = new searchPaymentRecords();
// 页面加载时调用
DM.Page.ready({
	"支付记录监控" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			searchPaymentRecords.loadRecord();
		});
		searchPaymentRecords.loadRecord();
		//绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "searchPaymentRecordsForm",
				"fileName" : "支付记录列表.xls",
				"url" : "finance/searchPaymentRecordsExport.do"
			});
		});
	}
});