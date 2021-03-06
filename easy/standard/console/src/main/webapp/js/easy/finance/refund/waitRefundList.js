/**
 * 后台-财务管理-退款管理-订单待退款
 * 
 */
var searchWaitRefundList = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 订单待退款列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "searchWaitRefundListForm",
					"serialize" : true,
					"url" : "finance/searchWaitRefundListAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#searchWaitRefundListD").empty();
				if (data.pageResult) {
					var list = data.pageResult.list;
					for ( var index in list) {
						list[index].refundTypeName = {};
						list[index].refundTypeName = searchWaitRefundList.enums.refundType[list[index]["refundType"]];
						list[index].supportSourceName = {};
						list[index].supportSourceName = searchWaitRefundList.enums.supportSource[list[index]["supportSource"]];
					}
				}
				// 填充数据
				$('#searchWaitRefundListTemp').tmpl(data).appendTo("#searchWaitRefundListD");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "searchWaitRefundListTag",
					"formId" : "searchWaitRefundListForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "finance/searchWaitRefundListAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			enums : {
				refundType : {
					"1" : "项目删除退款",	
					"2" : "众筹失败退款",
					"3" : "项目超额溢出退款",
					"4" : "回报不足溢出退款",
					"5" : "项目删除溢出退款",
					"6" : "众筹失败溢出退款"
		        },
		        supportSource : {
		        	"300" : "京东支付",
				    "200" : "微信支付",
					"100" : "通联支付"
		        }
		      },
		});

//实例化控制器
var searchWaitRefundList = new searchWaitRefundList();
// 页面加载时调用
DM.Page.ready({
	"支付记录监控" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			searchWaitRefundList.loadRecord();
		});
		searchWaitRefundList.loadRecord();
		//绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "searchWaitRefundListForm",
				"fileName" : "订单待退款.xls",
				"url" : "finance/searchWaitRefundListExport.do"
			});
		});
	}
});