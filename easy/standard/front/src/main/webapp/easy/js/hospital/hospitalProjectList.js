/**
 * 前台-项目列表
 */
var hospitalProjectList = DM.Controller.sub({
    init : function() {
    },
    /*
     * 项目列表
     */
    loadRecord : function() {
        // 查询数据
        DM.ajax({
            "formId" : "hospitalProjectForm",
            "serialize" : true,
            "url" : "hospital/hospitalProjectListAjax.do",
            "success" : this.pageCallBack
        });
    },
    /*
     * 分页回调
     */
    pageCallBack : function(data) {
        // 清空表格数据
        $("#hospitalProjectD").empty();
        // 填充数据
        $('#hospitalProjectTemp').tmpl(data.hospitalProjectList).appendTo("#hospitalProjectD");
        DM.Event.formatChar();
        // 初始化分页标签
        DM.PageTags.init({
            "divId" : "paging",
            "formId" : "hospitalProjectForm",
            "curPage" : data.hospitalProjectList.pageResult.pageIndex,
            "totalCount" : data.hospitalProjectList.pageResult.recordCount,
            "pageCount" : data.hospitalProjectList.pageResult.pageTotal,
            "url" : basePath+"hospital/hospitalProjectListAjax.do",
            "toPageCallBack" : arguments.callee
        });
    },
    // 进入项目详情页
    goHospitalDetails:function(projectId){
    //跳转项目详情
    window.location.href = basePath+"project/projectDetails.do?projectId=" + projectId;
    },
});

//实例化控制器
var hospitalProjectList = new hospitalProjectList();
// alert(document.querySelector('input[type=hidden]').value);
// 页面加载时调用
DM.Page.ready({
    "监控" : function() {
        hospitalProjectList.loadRecord(
            // var hospitalId = document.querySelector('input[type=hidden]').value
        );
    }
});

