var ProjectOrderListController = DM.Controller.sub({
	getSupportList : function() {
		var _self = this;
		DM.ajax({
			url : basePath + "user/project/projectOrderListAjax.do",
			"formId" : "dataForm",
			"serialize" : true,
			success : function(data) {
				if (data.data) {
					
					_self.setSupportList(data.data);
				}
			}
		});
	},
	setSupportList : function(data) {
		var _self = this;
		$("#projectOrderListData").empty();
		// 填充数据
		if(data.pageResult.list){
			$.each(data.pageResult.list,function(index,item){
				if(item.returnDescribe){
					//截取描述
					item.returnDescribeTips = item.returnDescribe;
					if(item.returnDescribe.length>7){
						item.returnDescribe = item.returnDescribe.substring(0,7)+"...";
					}
				}
				
				//截取用户名
				item.nickNameTips = item.nickName;
				if(item.nickName.length>7){
					item.nickName = item.nickName.substring(0,7)+"...";
				}
			})
		}
		$('#projectOrderListTemplate').tmpl(data.pageResult).appendTo(
				"#projectOrderListData");
		//设置顶部统计
		if("1"==$("#isTotalQuery").val()){
			$("#totalSupportAmount").html(data.statResult.supportAmtTotal);
			$("#totalSupportCount").html(data.statResult.supportCount);
			$("#isTotalQuery").val("2");
		}
		
		// 初始化分页标签
		DM.PageTags.init({
			divId : "pagingProjectOrder", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : basePath + "user/project/projectOrderListAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setSupportList(data.data);
			}
		});
	}
});
// 实例化控制器
var projectOrderListController = new ProjectOrderListController();
//页面加载时调用
DM.Page.ready({
	"项目订单列表" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			projectOrderListController.getSupportList();
		});
		projectOrderListController.getSupportList();
		
	}
});