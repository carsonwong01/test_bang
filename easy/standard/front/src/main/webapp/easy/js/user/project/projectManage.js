var ProjectManageController = DM.Controller.sub({
	ajaxTempleGet : function(url, id, showOrHidden, curId, projectType) {
		var _self = this;
		if (curId != null && curId != '') {
			// 任何方式访问:子菜单:被选中
			$("#" + curId).siblings().removeClass("cur");
			$("#" + curId).addClass("cur");
		} else {
			$("#zcdd").siblings().removeClass("cur");
			$("#zcdd").addClass("cur");
		}
		if(_self.hasPermission()){
			DM.ajax({
				type : "GET",
				url : url+"?projectId="+$("#projectId").val()+"&projectType="+$("#projectType").val(),
				success : function(data) {
					$(id).html(data);
				}
			});
		}
	},
	hasPermission : function() {
		var result = true;
		DM.ajax({
			url : basePath + "user/project/hasPermissionAjax.do",
			type : "post",
			async:false,
			data : {
				"projectId" : $("#projectId").val()
			},
			success : function(data) {
				if (data.code != '000000') {
					{
						Dialog.show({
							title : "提示信息",// 需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
							msg : data.description,
							picClass : "error",// 需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
							showClose : false,
							callBack : function() {
								window.opener = null;
								window.close();
							}
						});
						result = false;
					}
				}
			},
			error : function(data) {
				Dialog.confirm("你当前的会话已失效，请重新登录。",
						{
							picClass : "error",
							showCancel : false,
							callBack : function() {
								window.location.href = basePath
										+ "home/login.do";
							}
				});
				result = false;
			}
		});
		return result;
	},
	/**
	 * 文本框长度计算
	 */
	initCalculate : function($jqueryElement) {
		$jqueryElement.each(function() {
			var $input = $(this);
			$input.next().text(
					$input.val().length + "/" + $input.attr("maxlength"));
		});
		$jqueryElement.keyup(function() {
			var $input = $(this);
			$input.next().text(
					$input.val().length + "/" + $input.attr("maxlength"));
		});
		$jqueryElement.keypress(function() {
			var $input = $(this);
			$input.next().text(
					$input.val().length + "/" + $input.attr("maxlength"));
		});
	},// 进入订单详情页
	goOrderDetail : function(orderId, from) {
		// 跳转订单详情页
		$("#orderId").val(orderId);
		$("#from").val(from);
		$("#goForm").attr("target", "_blank");
		$("#goForm").attr("action",
				basePath + "user/project/order/orderDetail.do").submit();
	},// 进入项目详情页
	goProjectDetails : function(projectId) {
		// 跳转项目详情
//		$("#gOProjectId").val(projectId);
//		$("#goForm").attr("action", basePath + "project/projectDetails.do")
//				.submit();
		
		window.location.href=basePath + "project/projectDetails.do?projectId="+projectId;
	}
});
// 实例化控制器
var projectManageController = new ProjectManageController();
// 页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		
		var curPage = $("#curPage").val();
		switch (curPage) {
		case "xmyz":// 项目验证
			projectManageController.ajaxTempleGet(basePath
					+ "user/project/projectValidPage.do", $('#main_right'), 0, curPage)
			break;
		case "tqjs":// 提前结束
			projectManageController.ajaxTempleGet(basePath
					+ "user/project/aheadEndProject.do", $('#main_right'), 0,
					curPage)
			break;
		case "gxdt":// 更新动态
			projectManageController.ajaxTempleGet(basePath
					+ "user/project/addDynamic.do", $('#main_right'), 0,
					curPage)
			break;
		case "xmbj":// 项目编辑
			projectManageController.ajaxTempleGet(basePath
					+ "user/project/updateProjectPage.do", $('#main_right'), 0, curPage)
			break;
		default:// 支持订单
			
			projectManageController.ajaxTempleGet(basePath
					+ "user/project/projectOrderList.do", $('#main_right'), 0, curPage)

			break;
		}
	}
});