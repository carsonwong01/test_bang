/**
 * 前台-项目列表
 */
var hospitalList = DM.Controller.sub({
    init : function() {
    },
    /*
     * 项目列表
     */
    loadRecord : function() {
        var projectName = $('#ldr').attr('value');
        var projectLabel = $('#projectLabel').attr('value');
        var projectStatus = $('#projectStatus').attr('value');
        // 查询数据
        DM.ajax({
            "formId" : "allProListForm",
            "serialize" : true,
            "url" : "project/allProListAjax.do",
            "data":{projectName:projectName,projectLabel:projectLabel,projectStatus:projectStatus},
            "success" : this.pageCallBack
        });
    },
    /*
     * 分页回调
     */
    pageCallBack : function(data) {
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
var hospitalList = new hospitalList();
// 页面加载时调用
DM.Page.ready({
    "监控" : function() {
        hospitalList.loadRecord();
    }
});

