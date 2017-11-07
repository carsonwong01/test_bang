var TradeListController = DM.Controller.sub({
	getTradeList : function() {
		var _self = this;
		DM.ajax({
			url : basePath + "user/findTradeListAjax.do",
			formId : "dataForm", // 表单id
			serialize : true,
			success : function(data) {
				if (data.data) {
					_self.setTradeList(data.data);
				}
			}
		});
	},
	setTradeList : function(data) {
		var _self = this;
		$("#tradeListData").empty();
		// 填充数据
		$('#tradeListTemplate').tmpl(data.pageResult)
				.appendTo("#tradeListData");

		// 初始化分页标签
		DM.PageTags.init({
			divId : "pagingTradeList", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : basePath + "user/findTradeListAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setTradeList(data.data);
			}
		});
	}

});
// 实例化控制器
var tradeListController = new TradeListController();
// 页面加载时调用
DM.Page.ready({
	"初始化" : function() {

		$(".dateRange").click(function() {
			$("#dateRangeType").val($(this).attr("id"));
			$(this).siblings().removeClass("cur");
			$(this).addClass("cur");
			tradeListController.getTradeList();
		});

		$("#search").click(function() {
			$("#dateRangeType").val("");
			$(".dateRange").removeClass("cur");
			tradeListController.getTradeList();
		})

		tradeListController.getTradeList();

	}
});