/**
 * 后台-业务管理-审核管理-项目动态管理-详情
 */
var FindDynamicsDetailsControler = DM.Controller.sub({
	// 项目动态
	getFindDynamicsDetails : function() {
		var _self = this;
		DM.ajax({
			url : "bus/auditingManage/findDynamicsDetailsAjax.do",
			data : $("#dataForm").serialize(),
			success : function(data) {
				if (data.code == "000000") {
					_self.setFindDynamicsDetails(data.data);
				}
			},
			error : function(data) {
				Dialog.show("系统异常，请联系管理员", "error");
			}
		});
	},
	setFindDynamicsDetails : function(data) {
		var _self = this;
		$("#findDynamicsDetailsData").empty();
		// 填充数据

		$('#findDynamicsDetailsTemp').tmpl(data.pageResult).appendTo(
				"#findDynamicsDetailsData");
		DM.Event.limit();// 截取字符 DM.jsc
		// 初始化分页标签
		DM.PageTags.init({
			divId : "paging", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : basePath + "bus/auditingManage/findDynamicsDetailsAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setFindDynamicsDetails(data.data);
			}
		});
		// 绑定按钮事件
		_self.bindingButton();
	},
	// 删除
	toDeleteDialog : function(dynamicId) {
		var _self = this;
		Dialog.showDialog({
			title : "删除动态",
			msg : "<div class=\"tc\">是否确认删除该动态？</div>",
			dialogWidth : "300px",
			dialogHeight : "50px",
			buttons : {
				"确定" : function() {
					// 回调删除动态
					_self.deleteDynamicsAjax(dynamicId);
				},
				"取消" : function() {
					Dialog.close();
				}
			}
		});
	},
	// 提交删除
	deleteDynamicsAjax : function(dynamicId) {
		var data = {
			"id" : dynamicId
		};
		var _self = this;
		DM.ajax({
			url : "bus/auditingManage/deleteDynamicsAjax.do",
			data : data,
			success : function(data) {
				Dialog.close();
				if (data.code == "000000") {
					Dialog.confirm("删除成功", {
						title : "提示信息",
						sureName : "确定",
						showClose : false,
						showCancel : false,
						picClass : "success", // 需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
						callBack : function() {
							// 回调函数
							_self.getFindDynamicsDetails();
						}
					});
				} else {
					Dialog.show(data.description, "error");
				}
			},
			error : function(data) {
				Dialog.show("系统异常，请联系管理员", "error");
			}
		});
	},
	piclytebox : function() {
		$(".imgPreviewNew").on(
				"click",
				function() {
					var src = $(this).attr("src");
					if (src === undefined || src == null) {
						src = $("#img_" + $(this).attr("id")).attr("src");
					}
					$("#lytebox_productPic").remove();
					$(this).after(
							'<a href="#" id="lytebox_productPic" rel=""></a>');
					$("#lytebox_productPic").attr('rel', 'lytebox[vacation]');
					$("#lytebox_productPic").attr('href', src);
					myLytebox
							.start(document
									.getElementById("lytebox_productPic"),
									false, false);
					return false;
				});
	},
	// 绑定按钮事件
	bindingButton : function() {
		var _self = this;
		// 删除
		$(".toDeleteDialog").each(function(i) {
			$(this).bind("click", function() {
				var id = $(this).attr("id");
				_self.toDeleteDialog(id);
			});
		});
		_self.piclytebox();
	}
});

var controller = new FindDynamicsDetailsControler();
// 页面加载时调用
DM.Page.ready({
	"页面加载" : function() {
		controller.getFindDynamicsDetails();
	}
});