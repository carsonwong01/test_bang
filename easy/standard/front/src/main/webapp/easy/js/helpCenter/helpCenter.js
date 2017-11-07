/**
 * 帮助中心-新手指南左菜单控制器js wuxiao
 */
var HLeftMainControler = DM.constructor.sub({

	leftLoadData : function(type) {
		var _self = this;
		$("#paging").empty();
		$("#munuType").val(type);
		// 标题
		var helpTitle = "发起项目相关问题";
		if (type == 2) {
			helpTitle = "项目管理相关问题";
		} else if (type == 3) {
			helpTitle = "支持项目相关问题";
		} else if (type == 4) {
			helpTitle = "其他问题";
		}
		/*
		 * $("#leftMeunUl
		 * li").eq(type-1).childrens().addClass("active").siblings("li").removeClass("active");
		 */
		$("#leftMeunUl li").each(function(index, item) {
			if (type - 1 == index) {
				$(this).children().addClass("active");
			}else{
				$(this).children().removeClass("active")
			}

		});

		$("#helpTitle").text(helpTitle);
		DM.ajax({
			url : "frontHome/helpCenterAjax.do",
			data : {
				"type" : type
			},
			success : function(data) {
				if (data) {
					_self.showHelpCenterList(data);
				}
			}
		});
	},

	showHelpCenterList : function(data) {
		var _self = this;
		$("#helpCenterId").empty();
		// 填充数据
		$('#helpCenterTemplate').tmpl(data.pageResult)
				.appendTo("#helpCenterId");
		// 展开、收起
		nav_slider('.help-centerPage .rightBox dt.til', 'active');
		if (data.pageResult.recordCount != null
				&& data.pageResult.recordCount >= 10) {
			// 初始化分页标签
			DM.PageTags.init({
				divId : "paging", // 放入分页的div的id
				formId : "dataForm", // 表单id
				curPage : data.pageResult.pageIndex, // 当前页
				totalCount : data.pageResult.recordCount,// 总记录数
				pageCount : data.pageResult.pageTotal,// 总页数
				showPages : 10, // 显示记录数
				url : basePath + "frontHome/helpCenterAjax.do", // 请求路径
				toPageCallBack : function(data) { // 返回函数
					_self.showHelpCenterList(data);
				}
			});
		}
	}
});

var leftMaincontroler = new HLeftMainControler();

/**
 * Created by faith on 2016/3/8.
 */
$(document).ready(function() {

	leftMaincontroler.leftLoadData($("#typeFooter").val());

	/*
	 * var navH = $(".sidemenu").offset().top; //获取要定位元素距离浏览器顶部的距离 //滚动条事件
	 * $(window).scroll(function(){ var scrollH = $(this).scrollTop();
	 * if(scrollH >= navH){
	 * $(".sidemenu").css({"position":"fixed","z-index":"999","top":0}); }else{
	 * $(".sidemenu").css({"position":"static"}); } });
	 */
});
