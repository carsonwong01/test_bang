var MyInitProjectListController = DM.Controller.sub({
	getMyInitProjectList : function() {
		var _self = this;
		DM.ajax({
			url : basePath + "user/project/myInitProjectListAjax.do",
			formId : "dataForm", // 表单id
			serialize : true,
			success : function(data) {
				if (data.data) {
					_self.setMyInitProjectList(data.data);
				}
			}
		});
	},
	setMyInitProjectList : function(data) {
		var _self = this;
		
		//千分号格式化
		$.each(data.pageResult.list,function(index,item){
			item.raiseRate=parseInt(Number(item.supportAmt)/Number(item.facTarget)*100);
			item.facTarget=userCenterController.moneyFormatter(item.facTarget);
			item.supportAmt=userCenterController.moneyFormatter(item.supportAmt);
		});
		
		$("#myInitProjectListData").empty();
		// 填充数据
		$('#myInitProjectListTemplate').tmpl(data.pageResult).appendTo(
				"#myInitProjectListData");

		//初始化方法
		//查看失败原因
		$(".operateReason").click(function(){
			_self.operateReason($(this).attr("id"), "3");
		})
		
		// 初始化分页标签
		DM.PageTags.init({
			divId : "pagingMyInitProjectList", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : basePath + "user/project/myInitProjectListAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setMyInitProjectList(data.data);
			}
		});
	},
	operateReason:function(projectId,projectStatus){
		DM.ajax({
			url:basePath+"user/project/operateReasonAjax.do",
			type:"post",
			data: {"projectId":projectId,"projectStatus":projectStatus},
			success: function(data){
				if(data.code == '000000' && data.data){
					Dialog.show({
						title:"提示信息",//需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
						msg:data.data.singleResult.reason,
						picClass:"error",//需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
						showClose:true
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
						window.location.href=basePath+"home/toUserLogin.do";
					}
				});
			 }
		});
	}
	,
	// tab切换
	setTab : function(name, cursel, n) {
		var hover = "hover";
		for (var i = 0; i <= n; i++) {
			var menu = $("#" + name + i);
			if(menu){
				var con = document.getElementById("con_" + name + "_" + i);
				if (i == cursel) {
					menu.addClass(hover);
				} else {
					menu.removeClass(hover);
				}

				if (con){
					if(cursel==0){
						cursel = null;
					}
					$("#projectStatus").val(cursel);
					myInitProjectListController.getMyInitProjectList();
					//con.style.display = i == cursel ? "block" : "none";
				}
			}
			
		}
		if ($(".item_details_con").length > 0) {
			$("html,body").animate({
				scrollTop : $(".item_details_con").offset().top
			}, 200);
		}
	}
});
// 实例化控制器
var myInitProjectListController = new MyInitProjectListController();
// 页面加载时调用
DM.Page.ready({
	"项目订单列表" : function() {
		userCenterController.tapAnimat();
		myInitProjectListController.getMyInitProjectList();

		
	}
});