$(document).ready(function() {
    $.ajax({
        url : "project/frontPendingSubmitListAjax.do",//请求地址
        dataType : "json",//数据格式
        type : "post",//请求方式
        async : false,//是否异步请求
        success : function(data) { //如何发送成功
            var html = "";
            for(var i=0;i<data.length;i++){ //遍历data数组
                var ls = data[i];
                html += "<li>\n" +
                    "                    <img src='<%=basePath %>easy/images/dfjjpw9076h.png'>" +
                    "                    <div class='detailed'>" +
                    "                        <p class='ti-ou'><a href='<%=basePath %>project/projectDetails.do?projectId=1017110313164258415'>社会组织的政治功能进一步加强</a></p>" +
                    "                        <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>" +
                    "                        <div class='dao-t'id='dao-t'>" +
                    "                            <p class='dao-p'><span>50%</span></p>" +
                    "                        </div>" +
                    "                        <ul class='ul-nus'>" +
                    "                            <li>目标金额（元）</br> <span>10000</span></li>" +
                    "                            <li>目标金额（元）</br> <span>5000</span></li>" +
                    "                            <li>捐助人次（次）</br> <span>0</span></li>" +
                    "                            <div class='clear'></div>" +
                    "                        </ul>" +
                    "                        <p class='but-ab'><a href='<%=basePath %>project/projectDetails.do?projectId=1017110313164258415'>我要捐款</a></p>\n" +
                    "                    </div>" +
                    "                </li>";
            }
            $("#ulul").html(html); //在html页面id=ulul的标签里显示html内容
        },
    })
})




//
//
// /**
//  * 前台-项目列表
//  */
// var allProjectList = DM.Controller.sub({
//     init : function() {
//     },
//     /*
//      * 项目列表
//      */
//     loadRecord : function() {
//         // 查询数据
//         DM.ajax({
//             "formId" : "projectListForm",
//             "serialize" : true,
//             "url" : "project/frontPendingSubmitListAjax.do",
//             "success" : this.pageCallBack
//         });
//     },
//     /*
//      * 分页回调
//      */
//     pageCallBack : function(data) {
//         // 填充数据
//         $('#allProjectListTemp').tmpl(data.allProjectList).appendTo("#allProjectListD");
//         DM.Event.formatChar();
//         // 初始化分页标签
//         DM.PageTags.init({
//             "divId" : "allpaging",
//             "formId" : "projectListForm",
//             "curPage" : data.allProjectList.pageResult.pageIndex,
//             "totalCount" : data.allProjectList.pageResult.recordCount,
//             "pageCount" : data.allProjectList.pageResult.pageTotal,
//             "url" : basePath+"project/frontPendingSubmitListAjax.do",
//             "toPageCallBack" : arguments.callee
//         });
//     },
//     //进入项目详情页
//     // goProjectDetails:function(projectId){
//     // //跳转项目详情
//     // window.location.href = basePath+"project/projectDetails.do?projectId=" + projectId;
//     // },
// });
//
// //实例化控制器
// var allProjectList = new allProjectList();
// // 页面加载时调用
// DM.Page.ready({
//     "监控" : function() {
//         allProjectList.loadRecord();
//     }
// });