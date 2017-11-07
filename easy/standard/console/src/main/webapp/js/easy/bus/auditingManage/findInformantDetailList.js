/**
 * 审核管理-举报列表js
 */
var FindInformantDetailListControler = DM.constructor.sub({
	// 查询的Ajax
	getFindInformantDetailListAjax : function() {
		var _self = this;
		DM.ajax({
			url : "bus/auditingManage/findInformantDetailListAjax.do",
			data : $("#dataForm").serialize(),
			success : function(data) {
				if (data) {
					_self.setFindInformantDetailListAjaxQuery(data.data);
				}
			},
			error : function(data) {

			}
		});
	},
	// 项目列表填充
	setFindInformantDetailListAjaxQuery : function(data) {
		var _self = this;
		$("#findInformantDetailListData").empty();
		// 填充数据
		if(data.pageResult.list){
			
			$.each(data.pageResult.list,function(index,item){
				item.tips = item.reason;
				if(item.reason.length>50){
					item.reason = item.reason.substring(0,50)+"...";
				}
			})
		}
		$('#findInformantDetailListTemp').tmpl(data.pageResult).appendTo(
				"#findInformantDetailListData");
		// 初始化分页标签
		DM.PageTags.init({
			divId : "findInformantDetailListTag", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : "bus/auditingManage/findInformantDetailListAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setFindInformantDetailListAjaxQuery(data.data);
			}
		});
		_self.bindingButton();
	},
	showDetailDialog : function(reportId) {
		var _self = this;
		DM.ajax({
			url : "bus/auditingManage/findInformantContentAjax.do",
			data : {id:reportId},
			success : function(data) {
				Dialog.close();
				if (data.code == "000000") {
					var reportDetailsHtml = $('#reportDetailsTemp').tmpl(data.data).html();
					Dialog.showDialog({
						title : "举报内容",
						msg : reportDetailsHtml,
						dialogWidth : "800px",
						dialogHeight : "800px",
						buttons : {
							"关闭" : function() {
								Dialog.close();
							}
						}
					});
					$("#dialogContains").css({"overflow-y": "scroll"});
					_self.piclytebox();
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
		// 举报详细内容
		$(".toShowDetailDialog").each(function(i) {
			$(this).bind("click", function() {
				var reportId = $(this).attr("id");
				_self.showDetailDialog(reportId);
			});
		});
	}
});

var controler = new FindInformantDetailListControler();
// 页面加载时调用
DM.Page.ready({

	"举报详情列表列表" : function() {
		controler.getFindInformantDetailListAjax();
	},
	"导出列表" : function() {
		// 绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "dataForm",
				"fileName" : "项目举报详情列表.xls",
				"url" : "bus/auditingManage/findInformantDetailListExport.do"
			});
		});
	}
});
