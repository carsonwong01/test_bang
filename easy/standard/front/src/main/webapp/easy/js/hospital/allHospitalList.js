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
        // 查询数据
        DM.ajax({
            "formId" : "hospitalListForm",
            "serialize" : true,
            "url" : "hospital/hospitalListAjax.do",
            "success" : this.pageCallBack
        });
    },
    /*
     * 分页回调
     */
    pageCallBack : function(data) {
        // 清空表格数据
        $("#hospitalListD").empty();
        // 填充数据
        $('#hospitalListTemp').tmpl(data.hospitalList).appendTo("#hospitalListD");
        DM.Event.formatChar();
        // 初始化分页标签
        if (data.hospitalList.pageResult.recordCount == true) {
            DM.PageTags.init({
                "divId" : "paging",
                "formId" : "hospitalListForm",
                "curPage" : data.hospitalList.pageResult.pageIndex,
                "totalCount" : data.hospitalList.pageResult.recordCount,
                "pageCount" : data.hospitalList.pageResult.pageTotal,
                "url" : basePath+"hospital/hospitalListAjax.do",
                "toPageCallBack" : arguments.callee
            });
        }
    },
    // 进入项目详情页
    goHospitalDetails:function(projectId){
    //跳转项目详情
    window.location.href = basePath+"project/projectDetails.do?projectId=" + projectId;
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

