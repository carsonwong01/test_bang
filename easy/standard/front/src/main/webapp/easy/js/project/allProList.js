/**
 * 前台-项目列表
 */
var allProList = DM.Controller.sub({
    init : function() {
    },
    /*
     * 项目列表
     */
    loadRecord : function() {
        // 查询数据
        DM.ajax({
            "formId" : "allProListForm",
            "serialize" : true,
            "url" : "project/allProListAjax.do",
            "success" : this.pendingPageCallBack
        });
    },
    /*
     * 分页回调
     */
    pendingPageCallBack : function(data) {
        // 清空表格数据
        $("#allProListD").empty();
        // 填充数据
        $('#allProListTemp').tmpl(data.frontAllProList).appendTo("#allProListD");
        DM.Event.formatChar();
        // 初始化分页标签
        DM.PageTags.init({
            "divId" : "paging",
            "formId" : "allProListForm",
            "curPage" : data.frontAllProList.pageResult.pageIndex,
            "totalCount" : data.frontAllProList.pageResult.recordCount,
            "pageCount" : data.frontAllProList.pageResult.pageTotal,
            "url" : basePath+"project/allProListAjax.do",
            "toPageCallBack" : arguments.callee
        });
    },
});

//实例化控制器
var allProList = new allProList();
// 页面加载时调用
DM.Page.ready({
    "监控" : function() {
        allProList.loadRecord();
    }
});

