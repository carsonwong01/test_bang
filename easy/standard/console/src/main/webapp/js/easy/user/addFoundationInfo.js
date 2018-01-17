/**
 * 控制器
 *
 */
dmCheck.init("#mForm");
var AdvertImageRecord=DM.Controller.sub({
    toUp:function(val,time1,time2){
        var _self=this;
        Dialog.confirm("确定要置顶该广告？",{
            title:"置顶操作",
            sureName:"确定",
            showClose:true,
            showCancel:true,
            picClass:"tip", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
            callBack:function(){
                _self.toTop(val,time1,time2);//置顶
            }
        });
    },
    goDel:function(val){
        var _self=this;
        Dialog.confirm("确认删除该广告吗？删除后将不可恢复。",{
            title:"删除操作",
            sureName:"确定",
            showClose:true,
            showCancel:true,
            picClass:"tip", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
            callBack:function(){
                _self.toDel(val);//删除
                //回调函数
            }
        });
    },
    //删除
    toDel:function(val){
        var _self=this;
        DM.ajax({
            url:"site/banner/advertImageDel.do",
            data:{id:val},
            success:function(data){
                if("000000" == data.code){
                    _self.loadRecord();
                }
            },
            error:function(){

            }
        });
    },
    //置顶
    toTop:function(val,time1,time2){
        var _self=this;
        DM.ajax({
            url:"site/banner/advertImageTop.do",
            data:{id:val,dateVisible:time1,dateInvisible:time2},
            success:function(data){
                if("000000" == data.baseDataResp.code){
                    _self.loadRecord();
                }
            },
            error:function(){

            }
        });
    },
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
            Dialog.show("保存失败，该基金会已存在！","error");
            myfn.AjaxFn("userManage/addFoundationInfo.do",$(".viewFramework-content"));
        }
    },
    //校验是否上传了基金会logo
    checkLogoIsNull:function(){
        var file1=$("#file1").val();
        if(file1==''){
            Dialog.show("请上传基金会logo","tip");
            return false;
        }else{
            return true;
        }
    },
    //校验是否上传了登记证书扫描件
    checkCertificateIsNull:function(){
        var file=$("#file").val();
        if(file==''){
            Dialog.show("请上传登记证书扫描件","tip");
            return false;
        }else{
            return true;
        }
    },

    //校验是否上传了公开募捐资格证书
    checkDonationIsNull:function(){
        var file2=$("#file2").val();
        if(file2==''){
            Dialog.show("请上传公开募捐资格证书扫描件","tip");
            return false;
        }else{
            return true;
        }
    },
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

var flagSubmit = false;
var controller=new AdvertImageRecord();
//页面加载时调用
DM.Page.ready({
    "表单提交":function(){
        //基本信息点击保存type 1:保存 2::下一步 4：预览
        $("#addFoundation").click(function(){
            if(flagSubmit){
                return;
            }
            if(dmCheck.check("#mForm") && controller.checkCertificateIsNull()
                && controller.checkDonationIsNull() && controller.checkLogoIsNull()){
                flagSubmit = true;
                $("#mForm").submit();
            }
        });
        //上传文件类型校验
        $("#advertImage").change(function(){
            controller.uploadFile("advertImage");
        });
    }
});



