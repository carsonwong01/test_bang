/**
 * 前台-项目列表
 */
var hosProjectSum = DM.Controller.sub({
    init : function() {
    },
    /*
     * 项目列表
     */
    loadRecord : function() {
        var hospitalId = $("#hospitalId").val();
        alert(hospitalId);
        // 查询数据
        DM.ajax({
            "data":{hospitalId:hospitalId},
            "formId" : "hospProjectForm",
            "serialize" : true,
            "url" : "hospital/hospitalProjectSumAjax.do",
            "success" : this.pageCallBack
        });
    },
    /*
     * 分页回调
     */
    pageCallBack : function(data) {
        // 清空表格数据
        $("#hosProjectSumD").empty();
        // 填充数据
        $('#hosProjectSumTemp').tmpl(data.hosProjectSum).appendTo("#hosProjectSumD");
        DM.Event.formatChar();
        // 初始化分页标签
        DM.PageTags.init({
            "divId" : "paging",
            "formId" : "hosProjectForm",
            "curPage" : data.hosProjectSum.pageResult.pageIndex,
            "totalCount" : data.hosProjectSum.pageResult.recordCount,
            "pageCount" : data.hosProjectSum.pageResult.pageTotal,
            "url" : basePath+"hospital/hospitalProjectSumAjax.do",
            "toPageCallBack" : arguments.callee
        });
    },
});

//实例化控制器
var hosProjectSum = new hosProjectSum();
// 页面加载时调用
DM.Page.ready({
    "监控" : function() {
        hosProjectSum.loadRecord();
    }
});

