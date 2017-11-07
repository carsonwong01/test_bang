/**
 * 项目动态审核列表js
 */
var FindDynamicsListControler = DM.constructor.sub({
	// 查询的Ajax
	getDynamicsListAjax : function() {
		var _self = this;
		DM.ajax({
			url : "bus/auditingManage/findDynamicsListAjax.do",
			data : $("#dataForm").serialize(),
			success : function(data) {
				if (data) {
					_self.setDynamicsListAjaxQuery(data.data);
				}
			},
			error : function(data) {

			}
		});
	},
	// 项目列表填充
	setDynamicsListAjaxQuery : function(data) {
		var _self = this;
		$("#findDynamicsListData").empty();
		// 填充数据
		$('#findDynamicsListTemp').tmpl(data.pageResult).appendTo(
				"#findDynamicsListData");
		// 初始化分页标签
		DM.PageTags.init({
			divId : "findDynamicsListPagerTag", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : "bus/auditingManage/findDynamicsListAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setDynamicsListAjaxQuery(data.data);
			}
		});
		/**
		 * 绑定事件
		 */
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
							_self.getDynamicsListAjax();
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
	//绑定按钮事件
	bindingButton:function(){
		var _self=this;
		//删除
		$(".toDeleteDialog").each(function(i){
			$(this).bind("click",function(){
				var id=$(this).attr("id");
				_self.toDeleteDialog(id);
			});
		});
	}
});

var findDynamicsListControler = new FindDynamicsListControler();
// 页面加载时调用
DM.Page.ready({

	"项目动态列表" : function() {
		findDynamicsListControler.getDynamicsListAjax();
	}

});
