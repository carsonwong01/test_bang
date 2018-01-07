var FindFreezeProController = DM.Controller
		.sub({
			getFreezePro : function() {
				var _self = this;
				DM.ajax({
					url : basePath + "user/findFreezeProAjax.do",
					serialize : true,
					success : function(data) {
						if (data.data) {
							_self.setFreezePro(data.data);
						}
					}
				});
			},
			setFreezePro : function(data) {
				var _self = this;
//				$("#con_one_1").empty();
				var html = "<div class=\"freeze_til-01\"><ul class=\"clearfix\"><li class=\"mod_l\"><span class=\"ml20\">冻结金额项目</span></li><li class=\"mod_r\"><span class=\"mr10\">冻结金额（元)：<b class=\"highlight2\">"+$("#freezeAmount").val()+"</b></span></li></ul></div>";
				// 填充数据
				if (data.pageResult) {
					var lastDate = "";
					var len = data.pageResult.list.length;
					$.each(
						data.pageResult.list,
						function(index,item) {

							// 新的一个月开始
							if (item.yearMonth != lastDate) {
								lastDate = item.yearMonth;
								// 首li不
								if (index > 0) {
									html += "</ul></div>";
								}
								html += "<div class=\"project_til\"><ul class=\"clearfix\"><li class=\"mod_l\"><span class=\"ml20 f16\">"+item.yearMonth+"</span></li></ul></div><div class=\"project_con freeze-tex\"><ul>";
							}
							html += "<li class=\"item\"><div class=\"clearfix\"><div class=\"mod_l\"><div class=\"pic\"><a href=\"javascript:void(0)\" onclick=\"userCenterController.goProjectDetails('"+ item.proId+"')\" ><img src=\""+item.proImg+"\" /></a> </div> <div class=\"info pt10\"><div class=\"til\"> <a href=\"javascript:void(0)\" onclick=\"userCenterController.goProjectDetails('"+ item.proId+"')\">"+item.proTitle+"</a> <span class=\"state\">众筹结束</span></div> <p class=\"time\">"+item.proCreteTime+"</p> </div> </div> <div class=\"mod_r\"> <div class=\"con\"> <span class=\"money\">+"+item.proFreezeMoney+"</span><div class=\"con validateBtn"+(item.sendStatus=="1"?" verify-btn":"")+"\">"+(item.validStatus=='2'?"<a href=\""+basePath+"user/project/projectManage.do?projectId="+item.proId+"&projectType="+item.projectType+"&to=xmyz\"  target=\"_blank\"  class=\"btn-public btn-w70 btn-blue toValidate\">去验证</a>":"")+(item.sendStatus=='2'?" <a href=\""+basePath+"user/project/projectManage.do?projectId="+item.proId+"&projectType="+item.projectType+"&to=zcdd\" target=\"_blank\" class=\"btn-public btn-w70 btn-orange mr10\">去发货</a>":"")+"</div>	</div> 	</div> 	</div> </li>	";
							if(index==len-1){
								html += "</ul></div>";
							}
						lastDate = item.yearMonth;
					})
				}
				$("#dataLi").html(html);
				//if(data.pageResult.pageTotal>1){
					// 初始化分页标签
					DM.PageTags.init({
						divId : "pagingFreezeProData", // 放入分页的div的id
						curPage : data.pageResult.pageIndex, // 当前页
						totalCount : data.pageResult.recordCount,// 总记录数
						pageCount : data.pageResult.pageTotal,// 总页数
						showPages : 10, // 显示记录数
						url : basePath + "user/findFreezeProAjax.do", // 请求路径
						isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
						toPageCallBack : function(data) { // 返回函数
							_self.setFreezePro(data.data);
						}
					});
				//}
			},
			// tab切换
			setTab : function(name, cursel, n) {
				var hover = "hover";
				for (var i = 0; i <= n; i++) {
					var menu = $("#" + name + i);
					if (menu) {
						var con = document.getElementById("con_" + name + "_"
								+ i);
						if (i == cursel) {
							menu.addClass(hover);
						} else {
							menu.removeClass(hover);
						}

						if (con) {
							if (cursel == 0) {
								cursel = null;
							}
							$("#direction").val(cursel);
							findFreezeProController.getFreezePro();
							// con.style.display = i == cursel ? "block" :
							// "none";
						}
					}

				}
				if ($(".item_details_con").length > 0) {
					$("html,body").animate({
						scrollTop : $(".item_details_con").offset().top
					}, 200);
				}
			}
		});
// 实例化控制器
var findFreezeProController = new FindFreezeProController();
// 页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		findFreezeProController.getFreezePro();

		userCenterController.tapAnimat();
	}
});