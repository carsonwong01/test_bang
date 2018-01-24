/**
 * 前台-项目列表
 */
var foundationList = DM.Controller.sub({
    init : function() {
    },
    /*
     * 项目列表
     */
    loadRecord : function() {
        var foundationName = $('#ldr').attr('value');
        // 查询数据
        DM.ajax({
            "formId" : "foundationListForm",
            "serialize" : true,
            "url" : "foundation/foundationListAjax.do",
            "data":{foundationName:foundationName},
            "success" : this.pageCallBack
        });
    },
    /*
     * 分页回调
     */
    pageCallBack : function(data) {
        // 清空表格数据
        $("#foundationListD").empty();
        // 填充数据
        $('#foundationListTemp').tmpl(data.foundationList).appendTo("#foundationListD");
        DM.Event.formatChar();
        // 初始化分页标签
        DM.PageTags.init({
            "divId" : "paging",
            "formId" : "foundationListForm",
            "curPage" : data.foundationList.pageResult.pageIndex,
            "totalCount" : data.foundationList.pageResult.recordCount,
            "pageCount" : data.foundationList.pageResult.pageTotal,
            "url" : basePath+"foundation/foundationListAjax.do",
            "toPageCallBack" : arguments.callee
        });
    },
});

//实例化控制器
var foundationList = new foundationList();
// 页面加载时调用
DM.Page.ready({
    "监控" : function() {
        foundationList.loadRecord();
    }
});

