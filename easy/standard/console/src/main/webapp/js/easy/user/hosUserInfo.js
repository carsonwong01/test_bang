/**
 * 用户信息列表js
 */
var hospitalUserControler=DM.constructor.sub({
    //查询的Ajax
    getHosUserList:function(){
        var _self=this;
        /* myfn.AjaxFn("user/perInformation.do",$(".viewFramework-content"),$("#dataForm").serialize());*/
        DM.ajax({
            url:"userManage/hospitalUserListAjax.do",
            data:$("#dataForm").serialize(),
            success:function(data){
                if(data){
                    _self.setHosUserAjaxQuery(data);
                }
            },
            error:function(data){

            }
        });
    },
    //用户信息列表填充
    setHosUserAjaxQuery:function(data){
        var _self=this;
        $("#hosUserId").empty();
        //填充数据
        $('#hosUserTemplate').tmpl(data.pageResult).appendTo("#hosUserId");
        //初始化分页标签
        DM.PageTags.init({
            divId:"paging",     //放入分页的div的id
            formId:"dataForm",  //表单id
            curPage:data.pageResult.pageIndex,  //当前页
            totalCount:data.pageResult.recordCount,//总记录数
            pageCount:data.pageResult.pageTotal,//总页数
            showPages:10,  //显示记录数
            url:basePath+"userManage/hospitalUserListAjax.do",  //请求路径
            isAjax:true,  //是否为ajax提交  true 为是  false为表单提交
            toPageCallBack:function(data){   //返回函数
                _self.setHosUserAjaxQuery(data);
            }
        });
    },

    //锁定、解锁、拉黑、取消拉黑弹窗
    locking:function(userStatus,userid,wenzi){
        var _self=this;
        Dialog.confirm("确认"+wenzi+"该用户?",{
            title:wenzi+"确认",
            sureName:"确定",
            cancelName:"取消",
            showCancel:true,
            picClass:"tip", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
            callBack:function(){
                _self.lockingAjax(userStatus,userid,wenzi);
                //回调函数
            }
        });
    },

    //锁定、解锁Ajax跳转
    lockingAjax:function(userStatus,userId,wenzi){
        var _self=this;
        var data= {"status":userStatus,"userId":userId};
        DM.ajax({
            url:"userManage/updateStatus.do",
            data:data,
            success:function(data){
                _self.getHosUserList();
                if(data.code=="000000"){
                    Dialog.confirm(wenzi+"成功！",{
                        title:"提示消息",
                        sureName:"确定",
                        showCancel:false,                //是否显示confirm弹框的取消按钮
                        picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
                        callBack:function(){
                            //回调函数
                            _self.getHosUserList();
                        }
                    });
                }
            },
            error:function(data){

            }
        });
    }
});

var controler=new hospitalUserControler();
//页面加载时调用
DM.Page.ready({

    "用户管理":function(){
        controler.getHosUserList();
    },

    "导出列表":function(){
        //绑定导出事件
        $("#export").bind("click",function(){
            DM.exportExcel({
                "tableId" : "exportTable",
                "formId" : "dataForm",
                "fileName" : "用户信息列表.xls",
                "url" : "userManage/perInformationExport.do"
            });
        });
    }

});


