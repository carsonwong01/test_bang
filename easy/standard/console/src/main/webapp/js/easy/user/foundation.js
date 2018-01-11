/**
 * 用户信息列表js
 */
var PerInformationControler=DM.constructor.sub({
    //查询的Ajax
    getPerInformationList:function(){
        var _self=this;
        /* myfn.AjaxFn("user/perInformation.do",$(".viewFramework-content"),$("#dataForm").serialize());*/
        DM.ajax({
            url:"userManage/listFoundationAjax.do",
            data:$("#dataForm").serialize(),
            success:function(data){
                if(data){
                    _self.setperInformationAjaxQuery(data);
                }
            },
            error:function(data){

            }
        });
    },
    //用户信息列表填充
    setperInformationAjaxQuery:function(data){
        var _self=this;
        $("#hosInformationId").empty();
        //填充数据
        $('#perInformationTemplate').tmpl(data.pageResult).appendTo("#hosInformationId");
        //初始化分页标签
        DM.PageTags.init({
            divId:"paging",     //放入分页的div的id
            formId:"dataForm",  //表单id
            curPage:data.pageResult.pageIndex,  //当前页
            totalCount:data.pageResult.recordCount,//总记录数
            pageCount:data.pageResult.pageTotal,//总页数
            showPages:10,  //显示记录数
            url:basePath+"userManage/listFoundationAjax.do",  //请求路径
            isAjax:true,  //是否为ajax提交  true 为是  false为表单提交
            toPageCallBack:function(data){   //返回函数
                _self.setperInformationAjaxQuery(data);
            }
        });
    },

    //修改hospital User 推荐 取消推荐弹窗
    recommend:function(recommendStatus,userid,wenzi){
        var _self=this;
        Dialog.confirm("确认"+wenzi+"该用户?",{
            title:wenzi+"确认",
            sureName:"确定",
            cancelName:"取消",
            showCancel:true,
            picClass:"tip", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
            callBack:function(){
                _self.recommendAjax(recommendStatus,userid,wenzi);
                //回调函数
            }
        });
    },
    //推荐  取消推荐 Ajax跳转
    recommendAjax:function(recommendStatus,userId,wenzi){
        var _self=this;
        var data= {"recommendStatus":recommendStatus,"userId":userId};
        DM.ajax({
            url:"userManage/updateHosRecStatus.do",
            data:data,
            success:function(data){
                _self.getPerInformationList();
                if(data.code=="000000"){
                    Dialog.confirm(wenzi+"成功！",{
                        title:"提示消息",
                        sureName:"确定",
                        showCancel:false,                //是否显示confirm弹框的取消按钮
                        picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
                        callBack:function(){
                            //回调函数
                            _self.getPerInformationList();
                        }
                    });
                }
            },
            error:function(data){

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
                _self.getPerInformationList();
                if(data.code=="000000"){
                    Dialog.confirm(wenzi+"成功！",{
                        title:"提示消息",
                        sureName:"确定",
                        showCancel:false,                //是否显示confirm弹框的取消按钮
                        picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
                        callBack:function(){
                            //回调函数
                            _self.getPerInformationList();
                        }
                    });
                }
            },
            error:function(data){

            }
        });
    },


    //删除弹窗
    delFoundation:function(val, title,wenzi){
        var _self=this;
        Dialog.confirm("确认删除该内容吗？删除后将不可恢复！",{
            title:wenzi+"确认",
            sureName:"确定",
            cancelName:"取消",
            showCancel:true,
            picClass:"tip", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
            callBack:function(){
                _self.delAjax(val, title,wenzi);
                //回调函数
            }
        });
    },

    //删除Ajax跳转
    delAjax:function(val, title,wenzi){
        var _self=this;
        //var data= {"status":userStatus,"userId":userId};
        DM.ajax({
            url:"userManage/delFoundationInfo.do",
            data:{foundationId:val},
            success:function(data){
                _self.getPerInformationList();
                if(data.code=="000000"){
                    Dialog.confirm(wenzi+"成功！",{
                        title:"提示消息",
                        sureName:"确定",
                        showCancel:false,                //是否显示confirm弹框的取消按钮
                        picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
                        callBack:function(){
                            //回调函数
                            _self.getPerInformationList();
                        }
                    });
                }
            },
            error:function(data){

            }
        });
    }
});

var controler=new PerInformationControler();
//页面加载时调用
DM.Page.ready({

    "用户管理":function(){
        controler.getPerInformationList();
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


