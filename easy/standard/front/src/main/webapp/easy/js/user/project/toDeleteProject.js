var ToDeleteProjectController = DM.Controller.sub({
	init : function() {

		// 删除项目
		$("#deleteProject").click(
				function() {
					DM.ajax({
						url : basePath + "user/project/deleteAjax.do",
						type : "post",
						data : {
							"projectId" : $("#projectId").val()
						},
						success : function(data) {
							if (data.code == '000000') {
								Dialog.show({
									title : "提示信息",// 需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
									msg : "操作成功",
									picClass : "success",// 需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
									showClose : false,
									callBack : function() {
										window.location.href = basePath
												+ "user/userCenter.do?to=wfqd";
									}
								});
							} else {
								Dialog.show(data.description, "error");
							}
						},
						error : function(data) {
							Dialog.confirm("你当前的会话已失效，请重新登录。", {
								picClass : "error",
								showCancel : false,
								callBack : function() {
									window.location.href = basePath
											+ "home/login.do";
								}
							});
						}
					});
				});
	}
});

var toDeleteProjectController = new ToDeleteProjectController();

DM.ready({
	"初始化" : function() {

	}
});
