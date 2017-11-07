/**
 * 众筹中项目列表js
 */
var PendingSubmitListControler = DM.constructor.sub({
	// 查询的Ajax
	getPendingSubmitListAjax : function() {
		var _self = this;
		/* myfn.AjaxFn("user/perInformation.do",$(".viewFramework-content"),$("#dataForm").serialize()); */
		DM.ajax({
			url : "bus/projectManage/pendingSubmitListAjax.do",
			data : $("#dataForm").serialize(),
			success : function(data) {
				if (data) {
					_self.setPendingSubmitListAjaxQuery(data.data);
				}
			},
			error : function(data) {

			}
		});
	},
	// 项目列表填充
	setPendingSubmitListAjaxQuery : function(data) {
		var _self = this;
		$("#projectData").empty();
		// 填充数据
		$('#projectListTemplate').tmpl(data.pageResult).appendTo(
				"#projectData");
		// 初始化分页标签
		DM.PageTags.init({
			divId : "projectPagerTag", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : "bus/projectManage/pendingSubmitListAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setPendingSubmitListAjaxQuery(data.data);
			}
		});
		// 绑定按钮事件
		_self.bindingButton();
	},
	// 删除
	toDeleteDialog : function(projectId,projectNo,projectName) {
		var _self = this;
		var tmpl = $('#toDeleteTmpl').tmpl({"projectNo":projectNo,"projectName":projectName}).html();
		Dialog.showDialog({
			title : "删除项目",
			msg : tmpl,
			dialogWidth : "600px",
			dialogHeight : "380px",
			buttons : {
				"确定" : function() {
					if (dmCheck.check("#toDeleteTmplForm")) {
						// 作废原因
						var failureReason = $("#deleteReasonId").val();
						// 回调函数 项目状态 提交重审--(3取消项目)、作废--(4.删除项目)
						_self.submitChangeStatusAjax(projectId, '4',
								failureReason);
					}
				},
				"取消" : function() {
					Dialog.close();
				}
			}
		});
		// 表单非空初始化
		dmCheck.init("#toDeleteTmplForm");
	},
	// 取消
	toCancelDialog : function(projectId,projectNo,projectName) {
		var _self = this;
		var tmpl = $('#toCancelTmpl').tmpl({"projectNo":projectNo,"projectName":projectName}).html();
		Dialog.showDialog({
			title : "取消项目",
			msg : tmpl,
			dialogWidth : "600px",
			dialogHeight : "380px",
			buttons : {
				"确定" : function() {
					if (dmCheck.check("#toCancelTmplForm")) {
						// 作废原因
						var failureReason = $("#cancelReasonId").val();
						// 回调函数 项目状态 提交重审--(3取消项目)、作废--(4.删除项目)
						_self.submitChangeStatusAjax(projectId, '3',
								failureReason);
					}
				},
				"取消" : function() {
					Dialog.close();
				}
			}
		});
		// 表单非空初始化
		dmCheck.init("#toCancelTmplForm");
	},
	// 提交重审、作废
	submitChangeStatusAjax : function(projectId, projectStatus,
			reason) {
		// 项目状态 -- 3:众筹失败-4:已删除
		var msg = "删除成功!"
		if (projectStatus == "3") {
			msg = "取消成功!"
		}
		var data = {
			"projectId" : projectId,
			"projectStatus" : projectStatus,
			"reason" : reason
		};
		var _self = this;
		DM.ajax({
			url : "bus/projectManage/submitChangeStatusAjax.do",
			data : data,
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
							_self.getPendingSubmitListAjax();
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
	// 获取取消、删除项目原因
	getDeleteOrCancleReason : function(projectId, projectStatus) {
		// 项目状态 -- 3:众筹失败-4:已删除
		var tmplParam = {
			reasonPrex:"删除原因",
			reason:""
		}
		var msg = "删除原因";
			if (projectStatus == "3") {
				msg = "众筹失败原因";
				tmplParam.reasonPrex="取消原因";
			}
			
		var data = {
			"projectId" : projectId,
			"projectStatus" : projectStatus
		};
		
		
		
		DM.ajax({
			url : "bus/projectManage/operateReasonAjax.do",
			data : data,
			success : function(data) {
				Dialog.close();
				if (data.code == "000000") {
					tmplParam.reason=data.data.singleResult.reason;
					var tmpl = $('#showReasonTmpl').tmpl(tmplParam).html();
					Dialog.showDialog({
						title : msg,
						msg : tmpl,
						dialogWidth : "600px",
						dialogHeight : "260px",
						buttons : {
							"关闭" : function() {
								Dialog.close();
							}
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
	// 绑定按钮事件
	bindingButton : function() {
		var _self = this;
		// 删除项目
		$(".toDeleteDialog").each(function(i) {
			$(this).bind("click", function() {
				var projectId = $(this).attr("id"); // 项目Id
				var node = $(this).parent().siblings();
				var projectNo = $(node[1]).html();
				var projectName = $(node[2]).html();
				_self.toDeleteDialog(projectId,projectNo,projectName);
			});
		});
		// 取消项目
		$(".toCancelDialog").each(function(i) {
			$(this).bind("click", function() {
				var projectId = $(this).attr("id"); // 项目Id
				var node = $(this).parent().siblings();
				var projectNo = $(node[1]).html();
				var projectName = $(node[2]).html();
				_self.toCancelDialog(projectId,projectNo,projectName);
			});
		});
		
		// 取消原因
		$(".cancelReasonDialog").each(function(i) {
			$(this).bind("click", function() {
				var projectId = $(this).attr("id"); // 项目Id
				_self.getDeleteOrCancleReason(projectId,3);
			});
		});
		
		// 删除原因
		$(".deleteReasonDialog").each(function(i) {
			$(this).bind("click", function() {
				var projectId = $(this).attr("id"); // 项目Id
				_self.getDeleteOrCancleReason(projectId,4);
			});
		});
		
	}
});

var controler = new PendingSubmitListControler();
// 页面加载时调用
DM.Page.ready({

	"项目管理" : function() {
		controler.getPendingSubmitListAjax();
	},

	"导出列表" : function() {
		// 绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "dataForm",
				"fileName" : "众筹中项目列表.xls",
				"url" : "bus/projectManage/pendingSubmitListExport.do"
			});
		});
	}

});
