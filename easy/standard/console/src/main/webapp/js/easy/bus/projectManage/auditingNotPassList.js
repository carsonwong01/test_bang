/**
 * 众筹失败项目列表js
 */
var AuditingNotPassListControler = DM.constructor.sub({
	// 查询的Ajax
	getAuditingNotPassListAjax : function() {
		var _self = this;
		/* myfn.AjaxFn("user/perInformation.do",$(".viewFramework-content"),$("#dataForm").serialize()); */
		DM.ajax({
			url : "bus/projectManage/auditingNotPassListAjax.do",
			data : $("#dataForm").serialize(),
			success : function(data) {
				if (data) {
					_self.setAuditingNotPassListAjaxQuery(data.data);
				}
			},
			error : function(data) {

			}
		});
	},
	// 项目列表填充
	setAuditingNotPassListAjaxQuery : function(data) {
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
			url : "bus/projectManage/auditingNotPassListAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setAuditingNotPassListAjaxQuery(data.data);
			}
		});
		// 绑定按钮事件
		_self.bindingButton();
	},
	// 弹出框
	toShowShieldDialog : function(projectId, projectNo, projectName,shiledStatus) {
		var _self = this;
		var title = null;
		var tmpl = null;
		if (shiledStatus == "1") {
			title = "下架项目!";
			tmpl = $('#offShelfTmpl').tmpl({
				"projectNo" : projectNo,
				"projectName" : projectName
			}).html();
		}else {
			title = "取消下架!";
			tmpl = $('#onShelfTmpl').tmpl({
				"projectNo" : projectNo,
				"projectName" : projectName
			}).html();
		}
		Dialog.showDialog({
			title : title,
			msg : tmpl,
			dialogWidth : "600px",
			dialogHeight : "220px",
			buttons : {
				"确定" : function() {
					_self.updateProjectShieldStatus(projectId, shiledStatus);
				},
				"取消" : function() {
					Dialog.close();
				}
			}
		});
	},
	
	updateProjectShieldStatus : function(projectId, shiledStatus) {
			var msg = "下架成功!"
			if (shiledStatus == "2") {
				msg = "取消下架成功!"
			}
			var data = {
				"projectId" : projectId,
				"shiledStatus" : shiledStatus
			};
			var _self = this;
			DM.ajax({
				url : "bus/projectManage/updateFailProjectShieldStatusAjax.do",
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
								_self.getAuditingNotPassListAjax();
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
		
		
		
		// 取消原因
		$(".cancelReasonDialog").each(function(i) {
			$(this).bind("click", function() {
				var projectId = $(this).attr("id"); // 项目Id
				_self.getDeleteOrCancleReason(projectId,3);
			});
		});
		
		$(".projectShieldStatus").click(function() {
			var projectId = $(this).attr("projectId"); // 项目Id
			var shiledStatus = $(this).attr("status"); // 状态，1-下架，2-取消下架
			var node = $(this).parent().siblings();
			var projectNo = $(node[1]).html();
			var projectName = $(node[2]).html();
			_self.toShowShieldDialog(projectId, projectNo, projectName, shiledStatus);
		})
		
	}
});

var controler = new AuditingNotPassListControler();
// 页面加载时调用
DM.Page.ready({

	"项目管理" : function() {
		controler.getAuditingNotPassListAjax();
	},

	"导出列表" : function() {
		// 绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "dataForm",
				"fileName" : "众筹失败项目列表.xls",
				"url" : "bus/projectManage/auditingNotPassListExport.do"
			});
		});
	}

});
