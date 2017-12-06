/**
 * 前台-项目列表
 */
var recomNews = DM.Controller.sub({
    init : function() {
    },
    /*
     * 项目列表
     */
    loadRecord : function() {
        // 查询数据
        DM.ajax({
            "formId" : "recomNewsForm",
            "serialize" : true,
            "url" : "frontHome/recommendNewsInfosAjax.do",
            "success" : this.pageCallBack
        });
    },
    /*
     * 分页回调
     */
    pageCallBack : function(data) {
        // 填充数据
        $('#recomNewsTemp').tmpl(data.recomNews).appendTo("#recomNewsD");
        DM.Event.formatChar();
        // 初始化分页标签
        DM.PageTags.init({
            "divId" : "paging",
            "formId" : "recomNewsForm",
            "curPage" : data.recomNews.pageResult.pageIndex,
            "totalCount" : data.recomNews.pageResult.recordCount,
            "pageCount" : data.recomNews.pageResult.pageTotal,
            "url" : basePath+"frontHome/recommendNewsInfosAjax.do",
            "toPageCallBack" : arguments.callee
        });
    },
});

//实例化控制器
var recomNews = new recomNews();
// 页面加载时调用
DM.Page.ready({
    "监控" : function() {
        recomNews.loadRecord();
    }
});

