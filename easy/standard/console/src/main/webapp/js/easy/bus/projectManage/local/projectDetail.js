/**
 * 业务管理->项目管理->所有项目--项目详情js denglijiao
 */
var ProjectDetailControler = DM.Controller
		.sub({
			// 上一页、下一页Tab显示或隐藏
			commonNext : function(showTabId, beforeTabName, nextTabName) {

				$(".tab-item").hide();// 隐藏所有Tab
				$("#" + showTabId).show();// 显示的TabId

				$("#" + beforeTabName).removeClass("select-a");// 当前Tab
				$("#" + nextTabName).addClass("select-a"); // 下一页Tab
				$("#" + nextTabName).append(
						"<i class='icon-i tab-arrowtop-icon'></i>");// tab下边的小箭头

			},
			piclytebox : function() {
				$(".imgPreviewNew")
						.on(
								"click",
								function() {
									var src = $(this).attr("src");
									if(src===undefined || src==null){
										src = $("#img_"+$(this).attr("id")).attr("src");
									}
									$("#lytebox_productPic").remove();
									$(this)
											.after(
													'<a href="#" id="lytebox_productPic" rel=""></a>');
									$("#lytebox_productPic").attr('rel',
											'lytebox[vacation]');
									$("#lytebox_productPic").attr('href', src);
									myLytebox
											.start(
													document
															.getElementById("lytebox_productPic"),
													false, false);
									return false;
								});
			}
		});

var projectDetailControler = new ProjectDetailControler();
//页面加载时调用
DM.Page.ready({

	"初始化方法" : function() {
		projectDetailControler.piclytebox();
	}
});