/**
 * 帮助中心-新手指南控制器js wuxiao
 */
var investmentInfoType = $("#investmentInfoType").val();
var id = $("#id").val();

var NewsInfosDetailsControler = DM.constructor.sub({
	getNewsInfosDetailsList : function() {
		var _self = this;
		$("#ulLi li").removeClass("cur");
		$(_self).addClass("cur");
		DM.ajax({
			url : basePath + "home/newsInfosDetailsAjax.do",
			data : {
				"investmentInfoType" : investmentInfoType,
				"id" : id
			},
			success : function(data) {

				if (data) {
					_self.setNewsInfosDetailsList(data);
				}
			}
		});
	},
	setNewsInfosDetailsList : function(data) {
		
		$("#newsInfosDetailsId").empty();
		// 填充数据
		$('#newsInfosDetailsTemplate').tmpl(data).appendTo(
				"#newsInfosDetailsId");
	}
});

//页面加载时调用
DM.Page.ready({
	"新闻资讯/平台公告详情" : function() {
	
	}
});
