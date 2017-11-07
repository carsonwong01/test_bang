var MyCollectionListController = DM.Controller.sub({
	getMyCollectionList : function() {
		var _self = this;
		DM.ajax({
			url : basePath + "user/project/myCollectionListAjax.do",
			formId : "dataForm", // 表单id
			serialize : true,
			success : function(data) {
				if (data.data) {
					_self.setMyCollectionList(data.data);
				}
			}
		});
	},
	setMyCollectionList : function(data) {
		var _self = this;
		
		//千分号格式化
		$.each(data.pageResult.list,function(index,item){
			item.raiseRate=parseInt(Number(item.supportAmt)/Number(item.facTarget)*100);
			item.facTarget=userCenterController.moneyFormatter(item.facTarget);
		});
		
		$("#myCollectionListData").empty();
		// 填充数据
		$('#myCollectionListTemplate').tmpl(data.pageResult).appendTo(
				"#myCollectionListData");

		//注册事件
		$(".unFocusProject").bind("click",function(){
			_self.unFocusProject($(this).attr("id"));
		})
		// 初始化分页标签
		DM.PageTags.init({
			divId : "pagingMyCollectionList", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : basePath + "user/project/myCollectionListAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setMyCollectionList(data.data);
			}
		});
	},
	unFocusProject:function(projectId){
		DM.ajax({
			url:basePath+"user/project/cancelCollectAjax.do",
			type:"post",
			data: {"id":projectId},
			success: function(data){
				if(data.code == '000000'){
					Dialog.show({
						title:"提示信息",//需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
						msg:"取消成功",
						picClass:"success",//需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
						showClose:false,
						callBack:function(){
							myCollectionListController.getMyCollectionList();
						}
					});
				}else{
             		Dialog.show(data.description,"error");
             	}
			},
			error:function(data){
				Dialog.confirm("你当前的会话已失效，请重新登录。",{
					picClass:"error",
					showCancel:false,
					callBack:function(){
						window.location.href=basePath+"home/login.do";
					}
				});
			 }
		});
	}
});
// 实例化控制器
var myCollectionListController = new MyCollectionListController();
// 页面加载时调用
DM.Page.ready({
	"项目订单列表" : function() {
		myCollectionListController.getMyCollectionList();

	}
});