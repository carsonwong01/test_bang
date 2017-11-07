var UserAddressController = DM.Controller.sub({
	init : function() {
		// 隐藏弹出框
		$("#dialogBox").hide();
		var _self = this;

		// 点击添加地址
		$("#addAddress").click(
				function() {
					$("#dialogBox").show();
					$("#dialogBox").html("");
					// 填充数据
					$('#editAddressTemp').tmpl({
						addrId : null,
						consigneeName : null,
						consigneePhone : null,
						consigneeAddress : null,
						isDefault : null,
						consigneeCity : null,
						operationType : "0"
					}).appendTo("#dialogBox");
					dmCheck.init("#formData");
					// 保存地址-提交地址信息
					$("#saveAddressSubmit")
							.click(
									function() {
										if (dmCheck.check("#formData")) {
											_self.updateAddress($(
													"#operationType").val(), $(
													"#formData").serialize());
											$("#dialogBox").hide();
										}
									});
					// 取消
					$(".close").click(function() {
						$("#dialogBox").hide();
						$("li#shdz a").click();
					});
					// 加载省，市，县 联动
					DM.Region.init();
				});

		// 点击修改地址
		$(".modifyAddress").click(
				function() {

					DM.ajax({
						url : basePath
								+ "user/addressManage/findAddressDetail.do",
						type : "post",
						async : false,
						data : {
							"id" : $(this).attr("id")
						},
						success : function(data) {
							if (data.code == '000000') {
								$("#dialogBox").show();

								$("#dialogBox").html("");
								// 填充数据
								data.data.singleResult.operationType = "1";
								$('#editAddressTemp').tmpl(
										data.data.singleResult).appendTo(
										"#dialogBox");
								dmCheck.init("#formData");
								// 保存地址-提交地址信息
								$("#saveAddressSubmit").click(
										function() {
											if (dmCheck.check("#formData")) {
												_self.updateAddress(
														$("#operationType")
																.val(), $(
																"#formData")
																.serialize());
												$("#dialogBox").hide();
											}
										});
								// 取消
								$(".close").click(function() {
									$("#dialogBox").hide();
									$("li#shdz a").click();
								});

								// 加载省，市，县 联动
								DM.Region.init();
							} else {
								Dialog.show(data.description, "error");
								$("li#shdz a").click();
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

				});

		// 删除地址-提交地址信息
		/*
		 * $(".deleteAddress").click(function() { $(this).parent().hide();
		 * $(this).parent().next().show(); });
		 */
		// 删除弹窗-确认
		$(".deleteAddressSubmit").click(function() {
			var addressId = $(this).attr("addressId");
			var params = {
				addrId : addressId,
				operationType : "2"
			};
			_self.updateAddress(params.operationType, params);
			$(this).parent().hide();
			$(this).parent().prev().show();
		});
		// 删除弹窗-取消
		/*
		 * $(".cancle").click(function(){ $(this).parent().hide();
		 * $(this).parent().prev().show(); })
		 */
		$(".setDefaultAddress").click(function() {
			var params = {
				operationType : null,
				addrId : null,
				isDefault : null
			}
			params.addrId = $(this).attr("id");
			params.isDefault = "1";
			params.operationType = "1";
			_self.updateAddress(params.operationType, params);
		});
	},
	// 更新地址信息-添加、修改、删除、设置默认
	/**
	 * optType:操作类型，0-添加，1修改（包括默认设置）、2-删除
	 * 
	 */
	updateAddress : function(optType, params) {
		// console.log(params)
		DM.ajax({
			url : basePath + "user/addressManage/updateAddress.do",
			type : "post",
			async : false,
			data : params,
			success : function(data) {
				if (data.code == '000000') {
					Dialog.show({
						title : "提示信息",// 需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
						msg : "操作成功",
						picClass : "success",// 需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
						showClose : false,
						callBack : function() {
							$("li#shdz a").click();
						}
					});
				} else {
					Dialog.show(data.description, "error");
					$("li#shdz a").click();
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

});
// 删除默认地址
var delBtn = $('.user-ShippingAddress .del-handle');
delBtn
		.click(function() {
			var that = $(this), father = that.parent(), delbox = father
					.siblings(), top = father.parent(), prev = top.prev()
					.children(), fasle_btn = delbox.find('.cancle'), width = that
					.siblings().width();
			father.hide();
			prev.css('visibility', 'hidden');
			top.addClass('active');
			fasle_btn.click(function() {
				top.removeClass('active');
				setTimeout(function() {
					father.show();
					prev.css('visibility', 'visible');
				}, 320);

			});
		});
var userAddressController = new UserAddressController();

DM.ready({});
