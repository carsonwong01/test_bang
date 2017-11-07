dmCheck.init("#dataForm");
var OrderDetailController = DM.Controller
		.sub({
			comfirmDelivery : function() {
				if($("#isLogistics").val()=='2' || $("#isLogistics").val()=='1' && dmCheck.check("#dataForm")){
				DM
						.ajax({
							url : basePath
									+ "user/project/user/commonConfirmPostAjax.do",
							type : "post",
							formId : "dataForm", // 表单id
							serialize : true,
							success : function(data) {
								if (data.code == '000000') {
									Dialog
											.show({
												title : "提示信息",// 需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
												msg : "操作成功",
												picClass : "success",// 需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
												showClose : false,
												callBack : function() {
													window.location.href = basePath
															+ "user/project/order/orderDetail.do?orderId="
															+ $("#orderId")
																	.val()
															+ "&from=qrfh"

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
				}
			}
		});
// 实例化控制器
var orderDetailController = new OrderDetailController();
// 页面加载时调用
DM.Page.ready({
	"初始化" : function() {

		$("#isLogistics").click(function() {
			if ($(this).val() == "1") {// 之前已被选中
				$(this).removeAttr("checked");
				$("input[name=isLogistics]").val("2");
				$(this).val("2");
				$("li[name=logisticsInfo]").hide();
			} else {//
				$(this).val("1");
				$("input[name=isLogistics]").val("1");
				$(this).attr("checked", "checked");
				$("li[name=logisticsInfo]").show();
			}
		})

		$("#comfirmDelivery").bind(
				"click",
				function() {
					var val = $("#isLogistics").val();
					if (val == 1) {
						if ($("#courierCompany").val() == ''
								|| $("#courierNumber").val() == '') {
							Dialog.show({
								title : "提示信息",
								msg : "请填写物流信息",
								picClass : "warm",
								showClose : false
							});
							return;
						}
					}
					orderDetailController.comfirmDelivery();
				});
		
	}
});