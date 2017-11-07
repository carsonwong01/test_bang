var UserCenterController = DM.Controller.sub({
	ajaxTempleGet : function(url, id, showOrHidden, curId) {
		$("li[name=meun]").removeClass("cur");
		if (curId != null && curId != '') {
			// 任何方式访问:子菜单:被选中
			$("#" + curId).addClass("cur");
			$(".group").children("span").removeClass("up");
			$(".group").children("ul").css({
				"display" : "none"
			});
			$("#" + curId).parent().prev().addClass("up");
			$("#" + curId).parent().css({
				"display" : "block"
			});
		} else {
			$(".group").children("span").removeClass("up");
			$(".group").children("ul").css({
				"display" : "none"
			});
		}
		//兼容ie不报错问题
		if(history && history.replaceState){
			history.replaceState(history.state, null, basePath
					+ "user/userCenter.do?to=" + curId);
		}
		
		DM.ajax({
			type : "GET",
			url : url,
			success : function(data) {
				$(id).html(data);
			}
		});
	},
	moneyFormatter : function(num) {
		var result = [], counter = 0;
		num = (num || 0).toString().split('');
		for (var i = num.length - 1; i >= 0; i--) {
			counter++;
			result.unshift(num[i]);
			if (!(counter % 3) && i != 0) {
				result.unshift(',');
			}
		}
		return result.join('');
	},
	tapAnimat : function() {
		// usertab切换
		var $usertab = $('.user-tab-til li'), $anip = $('.animate_p');
		var liHeight = $usertab.siblings().innerWidth();
		var tabIndex = 0;
		if (liHeight === 0) {
			liHeight = $usertab.innerWidth();
		}
		$anip.width(liHeight);
		$usertab.hover(function() {
			liHeight = $(this).innerWidth();
			$anip.stop().animate({
				'left' : $(this).offsetParent().context.offsetLeft,
				'widht' : $anip.width(liHeight)
			}, 300);
		}, function() {
			liHeight = $usertab.eq(tabIndex).innerWidth();
			$anip.stop().animate({
				'left' : $usertab.eq(tabIndex).position().left,
				'width' : liHeight
			}, 300);
		});
		$usertab.click(function() {
			tabIndex = $(this).index();
		})
	},// 进入项目详情页
	goProjectDetails : function(projectId) {
		// 跳转项目详情
//		$("#projectId").val(projectId);
		window.location.href=basePath + "project/projectDetails.do?projectId="+projectId;
//		$("#goForm").attr("action", basePath + "project/projectDetails.do")
//				.submit();
	},// 进入项目管理页
	goProjectManage : function(projectId, projectType, to) {
		// 跳转项目管理页
		$("#projectId").val(projectId);
		$("#projectType").val(projectType);
		$("#to").val(to);
		$("#goForm").attr("target", "_blank");
		$("#goForm").attr("action", basePath + "user/project/projectManage.do")
				.submit();
	},// 进入订单详情页
	goOrderDetail : function(orderId, from) {
		// 跳转订单详情页
		$("#orderId").val(orderId);
		$("#from").val(from);
		$("#goForm").attr("target", "_blank");
		$("#goForm").attr("action",
				basePath + "user/project/order/orderDetail.do").submit();
	}
});
// 实例化控制器
var userCenterController = new UserCenterController();
// 页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		//跳转
		var curPage = $("#curPage").val();
		if(curPage==null || curPage==''){
			curPage="wdzc";
		}
		$("#"+curPage).children("a").click();

	}
});
