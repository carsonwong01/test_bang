/**
 * 控制器
 *
 */
dmCheck.init("#mForm");
var AdvertImageRecord=DM.Controller.sub({
    init:function(){
    },
    /*
     *  记录列表
     */
    loadRecord:function(){
        //查询数据
        // myfn.AjaxFn("userManage/hospitalUserList.do",$(".viewFramework-content"));
        DM.ajax({"formId":"form","serialize":true,"url":"userManage/listFoundation.do","success":this.pageCallBack});
    },
    /*
     * 分页回调
     */
    pageCallBack:function(data){
        //清空表格数据
        $("#container").empty();
        //填充数据
        $('#proLeadTemple').tmpl(data.pageResult).appendTo("#container");
        //初始化分页标签
        DM.PageTags.init({"divId":"applyRecordTag","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
            "pageCount":data.pageResult.pageTotal,"url":"site/adImageListAjax.do","toPageCallBack":arguments.callee});
    },
    //保存回调
    returnPageBasic:function(msg){
        if(msg.code=='000000'){
            closeInfo();
            Dialog.show({
                msg:"保存成功",
                showClose:true,
                showCancel:false,
                picClass:"success",
                titile:"提示信息",
                callBack:function(){
                    myfn.AjaxFn("userManage/listFoundation.do",$(".viewFramework-content"));
                }
            });
        }else{
            Dialog.show("保存失败！","error");
            myfn.AjaxFn("userManage/addFoundationInfo.do",$(".viewFramework-content"));
        }
    },
    //校验是否上传了质证明图片
    // checkAptitudeIsNull:function(){
    //     var file=$("#file").val();
    //     if(file==''){
    //         Dialog.show("请上传资质证明图片","tip");
    //         return false;
    //     }else{
    //         return true;
    //     }
    // },
    //校验是否上传了医院封面图片
    // checkLogoIsNull:function(){
    //     var file1=$("#file1").val();
    //     if(file1==''){
    //         Dialog.show("请上传医院封面图片","tip");
    //         return false;
    //     }else{
    //         return true;
    //     }
    // },
    // 上传附件
    uploadFile:function(idStr) {
        var _this=this;
        var fileType=[ "jpg", "png", "jpeg"];
        var _this=$("#"+idStr);
        if (!RegExp("\.(" + fileType.join("|") + ")$", "i").test(_this.val().toLowerCase())) {
            Dialog.show("选择文件错误,文件类型必须是" + fileType.join("，") + "中的一种","error");
            _this.val("");
            return false;
        }
        var file=document.getElementById(idStr);
        var size=this.fileChange(file);
        if(size>1024000){
            Dialog.show("视频太大，不能大于1G","error");
            _this.val("");
            return false;
        }else if(size == 0){
            Dialog.show("文件大小验证未生效！\r\n启用此验证，请如下修改浏览器设置：工具->Internet选项->安全->本地Intranet->自定义级别->ActiveX控件和插件->对未标记为可安全执行脚步的ActiveX控件初始化并执行脚步->启用！","tip");
            _this.val("");
            return false;
        }
    },

    fileChange:function(target) {
        var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
        var fileSize = 0;
        if (isIE) {
            try{
                target.select();
                var filePath = document.selection.createRange().text;
                var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
                var file = fileSystem.GetFile(filePath);
                fileSize = file.Size;
            }catch (e) {
                if(e.description=="Automation 服务器不能创建对象"){
                    fileSize=0;
                }
            }
        } else {
            fileSize = target.files[0].size;
        }
        var size = fileSize / 5120;
        return size;

    },
    /*
     * 枚举字段
     */
    rechargeType:{
        "1":""
    }
});

// var flagSubmit = false;
var controller=new AdvertImageRecord();
//页面加载时调用
DM.Page.ready({
    "表单提交":function(){
        //基本信息点击保存type 1:保存 2::下一步 4：预览
        $("#updateFoundation").click(function(){
                $("#mForm").submit();
            // if(flagSubmit){
            //     return;
            // }
            // if(dmCheck.check("#mForm") && controller.checkAptitudeIsNull()
            //     && controller.checkLogoIsNull()){
            //     flagSubmit = true;
            //     $("#mForm").submit();
            // }
        });
        //上传文件类型校验
        // $("#file").change(function(){
        //     controller.uploadFile("file");
        // });
        //上传文件类型校验
        // $("#file1").change(function(){
        //     controller.uploadFile("file1");
        // });
    }
});



