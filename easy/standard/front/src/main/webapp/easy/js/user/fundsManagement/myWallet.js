var MyWalletController = DM.Controller
		.sub({
			getAccMoney : function() {
				var _self = this;
				DM.ajax({
					url : basePath + "user/findAccMoneyAjax.do",
					formId : "dataForm", // 表单id
					serialize : true,
					success : function(data) {
						if (data.data) {
							_self.setAccMoney(data.data);
						}
					}
				});
			},
			setAccMoney : function(data) {
				var _self = this;
//				$("#con_one_1").empty();
				var html = "";
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
									html += "</ul></div></li>";
								}
								html += "<li><div class=\"project_til\"><ul class=\"clearfix\"><li class=\"mod_l\"><span class=\"ml20 f16\">"+item.yearMonth+"</span></li></ul></div><div class=\"project_con\"><ul>";
							}
							switch (item.tradeType) {
								case "1":
								case "2":
									// 项目相关
									html += "<li class=\"item\"><div class=\"clearfix\"><div class=\"mod_l\"><div class=\"pic\"><a href=\"javascript:void(0)\" onclick=\"userCenterController.goProjectDetails('"+ item.projectId+"')\"><img src=\""+item.coverImage+"\" /></a> </div> <div class=\"info pt10\"><div class=\"til\"> <a href=\"javascript:void(0)\" onclick=\"userCenterController.goProjectDetails('"+ item.projectId+"')\">"+item.projectName+"</a><span class=\"state\">"+((item.tradeType=="1" || item.tradeType=="2")?"众筹结束":"") +"</span> </div> <p class=\"time\">"+item.dateCreate+"</p> </div> </div> <div class=\"mod_r\"> <div class=\"con\"> <span class=\"money\">"+(item.capitalDirection=="1"?"+":"-")+item.tradeAmount+"</span> "+(item.accountType=="1"?"<span class=\"type highlight2\">可用金额</span>":"<span class=\"type red\">冻结金额</span>")+"	</div> 	</div> 	</div> </li>";
								break;
								case "3":
								case "4":
									// 提现相关
									html +="<li class=\"item\"><div class=\"clearfix\"><div class=\"mod_l\"><div class=\"info pt10\"><div class=\"til\"><a>申请提现"+(item.tradeType=="3"?"成功":"失败")+"</a></div><p class=\"time\">"+item.dateCreate+"</p></div></div><div class=\"mod_r\"><div class=\"con pt15\"><span class=\"money\">"+(item.capitalDirection=="1"?"+":"-")+item.tradeAmount+"</span></div></div></div></li>";
								break;
								default:
								break;
							}
							if(index==len-1){
								html += "</ul></div></li>";
							}
						lastDate = item.yearMonth;
					})
				}
				$("#con_one_1").html(html);
				//if(data.pageResult.pageTotal>1){
					// 初始化分页标签
					DM.PageTags.init({
						divId : "pagingAccMoneyData", // 放入分页的div的id
						formId : "dataForm", // 表单id
						curPage : data.pageResult.pageIndex, // 当前页
						totalCount : data.pageResult.recordCount,// 总记录数
						pageCount : data.pageResult.pageTotal,// 总页数
						showPages : 10, // 显示记录数
						url : basePath + "user/findAccMoneyAjax.do", // 请求路径
						isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
						toPageCallBack : function(data) { // 返回函数
							_self.setAccMoney(data.data);
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
							myWalletController.getAccMoney();
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
var myWalletController = new MyWalletController();
// 页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		
		myWalletController.getAccMoney();

		userCenterController.tapAnimat();
	}
});