var MySupportProjectListController = DM.Controller
		.sub({
			getMySupportProjectList : function() {
				var _self = this;
				DM.ajax({
					url : basePath
							+ "user/project/user/supportProjectListAjax.do",
					formId : "dataForm", // 表单id
					serialize : true,
					success : function(data) {
						if (data.data) {
							_self.setMySupportProjectList(data.data);
						}
					}
				});
			},
			setMySupportProjectList : function(data) {
				var _self = this;
				// 千分号格式化
				$.each(data.pageResult.list, function(index, item) {
					item.raiseRate = parseInt(Number(item.raisedAmount)
							/ Number(item.targetAmount) * 100);
					item.raisedAmount = userCenterController
							.moneyFormatter(item.raisedAmount);
				});

				$("#mySupportProjectListData").empty();
				// 填充数据
				$('#mySupportProjectListTemplate').tmpl(data.pageResult)
						.appendTo("#mySupportProjectListData");
				// 设置顶部统计
				$("#isTotalQuery").val("2");

				// 绑定事件
				$(".cancelOrder").click(function() {
					_self.cancelOrder($(this).attr("id"));
				})
				// 确认收货
				$(".showComfirmReciptDialog").click(function() {
					$("#comfirmReciptDialog").show();
					$("#comfirmReciptOrderId").val($(this).attr("id"));
				});
				// 初始化分页标签
				DM.PageTags.init({
					divId : "pagingMySpportProject", // 放入分页的div的id
					formId : "dataForm", // 表单id
					curPage : data.pageResult.pageIndex, // 当前页
					totalCount : data.pageResult.recordCount,// 总记录数
					pageCount : data.pageResult.pageTotal,// 总页数
					showPages : 10, // 显示记录数
					url : basePath
							+ "user/project/user/supportProjectListAjax.do", // 请求路径
					isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
					toPageCallBack : function(data) { // 返回函数
						_self.setMySupportProjectList(data.data);
					}
				});
			},
			cancelOrder : function(orderId) {
				DM
						.ajax({
							url : basePath
									+ "user/project/user/cancelOrderAjax.do",
							type : "post",
							data : {
								"id" : orderId
							},
							success : function(data) {
								if (data.code == '000000') {
									Dialog
											.show({
												title : "提示信息",// 需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
												msg : "取消成功",
												picClass : "success",// 需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
												showClose : false,
												callBack : function() {
													userCenterController
															.ajaxTempleGet(
																	basePath
																			+ 'user/project/user/supportProjectList.do',
																	$('#main_right'),
																	0, 'wfqd')
												}
											});
								} else {
									Dialog.show(data.description, "error");
								}
							},
							error : function(data) {
								Dialog.confirm("你当前的会话已失效，请重新登录。", {
									picClass : "error",
									showCancel : false,
									callBack : function() {
										window.location.href = basePath
												+ "home/login.do";
									}
								});
							}
						});
			},
			comfirmRecipt : function() {
				var self = this;
				DM.ajax({
					url : basePath
							+ "user/project/user/commonConfirmReceiptAjax.do",
					type : "post",
					data : {
						"id" : $("#comfirmReciptOrderId").val()
					},
					success : function(data) {
						if (data.code == '000000') {
							Dialog.show({
								title : "提示信息",// 需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
								msg : "操作成功",
								picClass : "success",// 需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
								showClose : false,
								callBack : function() {
									$("#comfirmReciptDialog").hide();
									mySupportProjectListController
											.getMySupportProjectList();
								}
							});
						} else {
							Dialog.show(data.description, "error");
						}
					},
					error : function(data) {
						Dialog.confirm("你当前的会话已失效，请重新登录。", {
							picClass : "error",
							showCancel : false,
							callBack : function() {
								window.location.href = basePath
										+ "home/login.do";
							}
						});
					}
				});
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
							$("#orderStatus").val(cursel);
							mySupportProjectListController
									.getMySupportProjectList();
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
var mySupportProjectListController = new MySupportProjectListController();
// 页面加载时调用
DM.Page.ready({
	"项目订单列表" : function() {
		mySupportProjectListController.getMySupportProjectList();
		userCenterController.tapAnimat();
		$("#closeDialog,.out").click(function(){
			$("#comfirmReciptDialog").hide();
		});
		$("#comfirmRecipt").click(function(){
			mySupportProjectListController.comfirmRecipt();
		})
	}
});