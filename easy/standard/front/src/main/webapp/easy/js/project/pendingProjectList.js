/**
 * 前台-项目列表
 */
var pendingProjectList = DM.Controller.sub({
    init : function() {
    },
    /*
     * 项目列表
     */
    loadRecord : function() {
        // 查询数据
        DM.ajax({
            "formId" : "pendingProListForm",
            "serialize" : true,
            "url" : "project/frontPendingProjectAjax.do",
            "success" : this.pendingPageCallBack
        });
    },
    /*
     * 分页回调
     */
    pendingPageCallBack : function(data) {
        // 清空表格数据
        $("#pendingProListD").empty();
        // 填充数据
        $('#pendingProjectListTemp').tmpl(data.pendingProjectList).appendTo("#pendingProListD");
        DM.Event.formatChar();
        // 初始化分页标签
        DM.PageTags.init({
            "divId" : "paging",
            "formId" : "pendingProListForm",
            "curPage" : data.pendingProjectList.pageResult.pageIndex,
            "totalCount" : data.pendingProjectList.pageResult.recordCount,
            "pageCount" : data.pendingProjectList.pageResult.pageTotal,
            "url" : basePath+"project/frontPendingProjectAjax.do",
            "toPageCallBack" : arguments.callee
        });
    },
});

//实例化控制器
var pendingProjectList = new pendingProjectList();
// 页面加载时调用
DM.Page.ready({
    "监控" : function() {
        pendingProjectList.loadRecord();
    }
});

