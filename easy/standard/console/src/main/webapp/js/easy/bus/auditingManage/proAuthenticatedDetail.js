/**
 * 后台-财务管理-支付记录
 * 
 */
var ProAuthenticatedDetailController = DM.Controller.sub({
	/*
	 * 支付记录列表
	 */
	loadAuthenticatedRecord : function() {
		// 查询数据
		DM.ajax({
			data : $("#dataForm").serialize(),
			url : "bus/auditingManage/authenticatedRecordAjax.do",
			success : this.pageCallBack
		});
	},
	/*
	 * 分页回调
	 */
	pageCallBack : function(data) {
		// 清空表格数据
		$("#authenticatedRecordData").empty();
		// 填充数据
		$('#authenticatedRecordTemp').tmpl(data.data.pageResult).appendTo(
				"#authenticatedRecordData");
		
		// 初始化分页标签
		DM.PageTags.init({
			divId : "authenticatedRecordTag", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.data.pageResult.pageIndex, // 当前页
			totalCount : data.data.pageResult.recordCount,// 总记录数
			pageCount : data.data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : "bus/auditingManage/authenticatedRecordAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : arguments.callee
		});
		//this.bindingButton();
		var _self = this;
		// 查看审核原因
		$(".toShowReasonDialog").each(function(i) {
			$(this).bind("click", function() {
				var optnion = $(this).attr("id"); //原因
				//_self.showAuditReason(optnion);
				Dialog.close();
				var tmpl = $('#auditReasonTemp').tmpl({"reasonPrex":"*审核意见","reason":optnion}).html();
				Dialog.showDialog({
					title : "审核意见",
					msg : tmpl,
					dialogWidth : "600px",
					dialogHeight : "260px",
					buttons : {
						"关闭" : function() {
							Dialog.close();
						}
					}
				});
			});
		});
	},
	// 显示审核原因
	showAuditReason : function(auditReason) {
		Dialog.close();
		var tmpl = $('#auditReasonTemp').tmpl({"reasonPrex":"*审核意见","reason":auditReason}).html();
		Dialog.showDialog({
			title : "审核意见",
			msg : tmpl,
			dialogWidth : "600px",
			dialogHeight : "260px",
			buttons : {
				"关闭" : function() {
					Dialog.close();
				}
			}
		});
	},
	// 审核对话框
	commonVerificateAudit : function(validationId) {
		var _self = this;
		Dialog.close();
		
		var msg = $('#toAuditTemp').tmpl({"validationId":validationId}).html();
		Dialog.showDialog({
			title : "项目认证审核",
			msg : msg,
			showClose: true, 
			dialogWidth : "600px",
			dialogHeight : "280px",
			buttons : {
				"审核通过" : function() {
					_self.commonVerificateAuditAjax(validationId,1);
				},
				"审核不通过" : function() {
					_self.commonVerificateAuditAjax(validationId,2);
				}
			}
		});
		// 表单非空初始化
		dmCheck.init("#auditTmplForm");
	},
	// 提交重审、作废
	commonVerificateAuditAjax : function(validationId,
			status) {
		if(dmCheck.check("#auditTmplForm")){
			$("#status").val(status);
			var msg = "审核通过成功!"
			if (status == "2") {
				msg = "审核不通过成功!"
			}
			var _self = this;
			DM.ajax({
				url : "bus/auditingManage/commonVerificateAuditAjax.do",
				data :  $("#auditTmplForm").serialize(),
				success : function(data) {
					Dialog.close();
					if (data.code == "000000") {
						Dialog.confirm(msg, {
							title : "提示信息",
							sureName : "确定",
							showClose : false,
							showCancel : false,
							picClass : "success", // 需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
							callBack : function() {
								// 回调函数
								Dialog.close();
								myfn.AjaxFn("bus/auditingManage/proAuthenticatedDetail.do",$(".viewFramework-content"),{"validationId":validationId});
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
		}
	},
	// 绑定按钮事件
	bindingButton : function() {
		var _self = this;
		// 查看审核原因
		$(".toShowReasonDialog").each(function(i) {
			$(this).bind("click", function() {
				var optnion = $(this).attr("id"); // 项目Id
				_self.showAuditReason(optnion);
			});
		});
	},piclytebox : function() {
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
	}
});

// 实例化控制器
var controller = new ProAuthenticatedDetailController();
// 页面加载时调用
DM.Page.ready({
	"审核列表" : function() {
		//定位
		if(document.getElementById('sh')){
			document.getElementById('sh').scrollIntoView();
		}
		
		
		controller.loadAuthenticatedRecord();
		// 去审核
		$(".toAuditDialog").each(function(i) {
			$(this).bind("click", function() {
				var validdationId = $(this).attr("id"); // 项目Id
				controller.commonVerificateAudit(validdationId);
			});
		});
		
		controller.piclytebox();
	}
});