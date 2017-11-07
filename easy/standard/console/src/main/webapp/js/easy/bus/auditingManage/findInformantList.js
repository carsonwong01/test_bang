/**
 * 审核管理-举报列表js
 */
var findInformantListControler = DM.constructor.sub({
	// 查询的Ajax
	getFindInformantListAjax : function() {
		var _self = this;
		DM.ajax({
			url : "bus/auditingManage/findInformantListAjax.do",
			data : $("#dataForm").serialize(),
			success : function(data) {
				if (data) {
					_self.setFindInformantListAjaxQuery(data.data);
				}
			},
			error : function(data) {

			}
		});
	},
	// 项目列表填充
	setFindInformantListAjaxQuery : function(data) {
		var _self = this;
		$("#findInformantListData").empty();
		
		// 填充数据
		$('#findInformantListTemp').tmpl(data.pageResult).appendTo(
				"#findInformantListData");
		// 初始化分页标签
		DM.PageTags.init({
			divId : "findInformantListTag", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : "bus/auditingManage/findInformantListAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setFindInformantListAjaxQuery(data.data);
			}
		});
	},
	underOrderList:function(sortKey,sortValue){
		$("#sortKey").val(sortKey);
		$("#sortValue").val(sortValue);
		controler.getFindInformantListAjax();
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

var controler = new findInformantListControler();
// 页面加载时调用
DM.Page.ready({

	"项目动态列表" : function() {
		controler.getFindInformantListAjax();
	},
	"导出列表" : function() {
		// 绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "dataForm",
				"fileName" : "项目举报列表.xls",
				"url" : "bus/auditingManage/findInformantListExport.do"
			});
		});
	},
	"初始化方法":function(){
		$(".reportTotal").each(function(i){
			$(this).bind("click",function(){
				var orderValue=$(this).attr("alt");
				controler.underOrderList("total_count",orderValue);
				if("asc"==orderValue){
					$(this).attr("alt","desc");
					$(this).attr("src","images/px-t230.png");
				}else{
					$(this).attr("alt","asc");
					$(this).attr("src","images/px-b230.png");
				}
				$(".reportCurrent").attr("alt","asc");
				$(".reportCurrent").attr("src","images/px-b230.png");
			});
		});
		$(".reportCurrent").each(function(i){
			$(this).bind("click",function(){
				var orderValue=$(this).attr("alt");
				controler.underOrderList("current_count",orderValue);
				if("asc"==orderValue){
					$(this).attr("alt","desc");
					$(this).attr("src","images/px-t230.png");
				}else{
					$(this).attr("alt","asc");
					$(this).attr("src","images/px-b230.png");
				}
				$(".reportTotal").attr("alt","asc");
				$(".reportTotal").attr("src","images/px-b230.png");
			});
		});
	}
	
});
