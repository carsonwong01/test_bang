/**
 * 前台-项目列表
 */
var projectList = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 项目列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "projectListForm",
					"serialize" : true,
					"url" : "project/projectListAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
                // 清空表格数据
                $("#projectListD").empty();
				// 填充数据
				$('#projectListTemp').tmpl(data.projectList).appendTo("#projectListD");
                if (data.projectList.pageResult.hasNextPage == false) {
					// 初始化分页标签
                    DM.PageTags.init({
                        "divId" : "paging",
                        "formId" : "projectListForm",
                        "curPage" : data.projectList.pageResult.pageIndex,
                        "totalCount" : data.projectList.pageResult.recordCount,
                        "pageCount" : data.projectList.pageResult.pageTotal,
                        "url" : basePath+"project/projectListAjax.do",
                        "toPageCallBack" : arguments.callee
                    });
                }

			},
		});

//实例化控制器
var projectList = new projectList();
// 页面加载时调用
DM.Page.ready({
	"监控" : function() {
		projectList.loadRecord();
	}
});