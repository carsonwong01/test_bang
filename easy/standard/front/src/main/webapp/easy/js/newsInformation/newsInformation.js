/**
 * 帮助中心-新手指南控制器js wuxiao
 */

var NewsInfosControler = DM.constructor.sub({

	getNewsInfosList : function(investmentInfoType) {
		var infoType = $("#infoType").val();
		if ("" != infoType) {
			investmentInfoType = infoType;
			$("#infoType").val("");
		}
		var _self = this;
		$("#pagingNews").empty();
		$("#manuInvestmentInfoType").val(investmentInfoType);
		DM.ajax({
			type : "POST",
			url : basePath + "home/newsInfosAjax.do",
			data : {
				"investmentInfoType" : investmentInfoType
			},
			success : function(data) {
				if (data) {
					_self.setNewsInfosList(data);
				}
			}
		});
	},
	setNewsInfosList : function(data) {
		var _self = this;
		$("#newsInfosId").empty();
		// 填充数据
		$('#newsInfosTemplate').tmpl(data.pageResult).appendTo("#newsInfosId");
		var newTitle = "新闻资讯";
		var investmentInfoType = data.pageResult.list[0].investmentInfoType;
		if (investmentInfoType == 1) {
			newTitle = "平台公告";
		} else {

		}
		$("#helpTitle").html(newTitle);
		$("#sidemenu li").each(function(index, item) {
			if (investmentInfoType == 2 && index==0) {
				$(this).children().addClass("active");
			} else if (investmentInfoType == 1 && index==1) {
				$(this).children().addClass("active");
			} else{
				$(this).children().removeClass("active")
			}
		});
		$("#newTitleBigId").text(newTitle);
		if (data.pageResult.recordCount != null
				&& data.pageResult.recordCount > 10) {
			// 初始化分页标签
			DM.PageTags.init({
				divId : "pagingNews", // 放入分页的div的id
				formId : "dataForm", // 表单id
				curPage : data.pageResult.pageIndex, // 当前页
				totalCount : data.pageResult.recordCount,// 总记录数
				pageCount : data.pageResult.pageTotal,// 总页数
				showPages : 10, // 显示记录数
				url : basePath + "home/newsInfosAjax.do", // 请求路径
				isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
				toPageCallBack : function(data) { // 返回函数
					_self.setNewsInfosList(data);
				}
			});
		}
	}
});

var newControler = new NewsInfosControler();
// 页面加载时调用
DM.Page.ready({
	"新闻资讯/平台公告" : function() {
		newControler.getNewsInfosList(2);
		$("#HEADER_MENUS>li").removeClass("cur");
		$("#H_XWZX").addClass("cur");
	}
});
