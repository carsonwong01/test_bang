dmCheck.init("#projectForm");
var ProjectReturnController = DM.Controller.sub({
    init:function(){
        projectEditController.readyProject();
        
        //是否需要发货地址
        $("#isNeedAddr").click(function(){
            if($(this).is(":checked")){
                $("#isNeddAddr").val("1");
            }else{
                $("#isNeddAddr").val("2");
            }
        });
        
        //项目标签选择
        $("#labels li a").click(function(){
            if($(this).attr("class") == undefined || $(this).attr("class").indexOf("cur") < 0){
                if($("#labels a.cur").length == 2){
                    $($("#labels a.cur").get(0)).removeClass('cur');
                }
                $(this).addClass("cur");
            }else{
                $(this).removeClass("cur");
            }
            var value = ",";
            $("#labels a.cur").each(function(){
                value = value + $(this).html() + ",";
            });
            if(value == ",") value="";
            $("#projectLabel").val(value);
        });
        
        //初始化input实时显示填写字数
        projectEditController.initCalculate($("input[name=projectName],input[name=projectIntro],input[name=freightDescribe],input[name=deliverDescribe]"));
        //初始化富文本框
        var projectDetails = projectEditController.initKindEditor("projectDetails","建议详细介绍产品或服务的详细内容。","projectDetailsTip");
        projectDetails.html($("#detailContent").html());
        
        //初始化上传控件
        var option = {
                containerId: "projectImageUl",//容器ID,必须
                uploadUrl: "user/project/uploadAttachment.do",//上传文件url
                deleteUrl: "user/project/deleteAttachment.do",//删除文件url
                formData:{"fileType":"1"},//上传附带参数
                fileNumLimit: 8,
                pick: "#filePicker",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: true,//是否有设置默认封面按钮
                files: projectFiles
            };
        projectEditController.initUpload(option);
        
        //确认添加回报
        $("#returnDialog #okBtn").click(function(){
            var obj = new Object();
            var $file = $("#returnImageUl input[name=imagesUrls]");
            if($file.length > 0 && dmCheck.checkOne($file)){
                $("#returnImageMsg").hide();
            }else{
                $("#returnImageMsg").css({"color":"red"}).html("请选择回报图片").show();
                return;
            }
            if(dmCheck.checkOne($("#upperCount"))){
                $("#upperCountMsg").hide();
            }else{
                return;
            }
            if(dmCheck.check("#returnForm")){
                obj.supportAmount=$("#supportAmount").val();
                obj.upperCount=$("#upperCount").val()=="" ? "-1" : $("#upperCount").val();
                obj.returnDescribe=$("#returnDescribe").val();
                obj.imageId=$("#returnDialog input[name=imagesIds]").val();
                obj.imageUrl=$("#returnDialog input[name=imagesUrls]").val();
                obj.imageExt=$("#returnDialog input[name=imagesExts]").val();
                obj.imageName=$("#returnDialog input[name=imagesNames]").val();
                obj.imageSize=$("#returnDialog input[name=imagesSizes]").val();
                if($(this).attr("data-status") == "add"){
                    //插入模板
                    $("#returnTmpl").tmpl(obj).appendTo("#returnUl");
                }
                if($(this).attr("data-status") == "edit"){
                    var $li = $("#returnUl .returnEdit");
                    $($li.find("input[data-name=supportAmount]")).val(obj.supportAmount);
                    $($li.find("input[data-name=upperCount]")).val(obj.upperCount);
                    $($li.find("input[data-name=returnDescribe]")).val(obj.returnDescribe);
                    var $imageIdInput = $($li.find("input[data-name=imageId]"));
                    if ($imageIdInput.val() != obj.imageId) {
                        $($li.find("img")).attr("src", obj.imageUrl);
                    }
                    $imageIdInput.val(obj.imageId);
                    $($li.find("input[data-name=imageUrl]")).val(obj.imageUrl);
                    $($li.find("#supportAmountB")).html(obj.supportAmount);
                    $($li.find("#returnDescribeP")).html(obj.returnDescribe);
                    $li.removeClass("returnEdit");
                }
                //关闭窗口
                $("#returnDialog").hide();
                //更新回报下标
                projectEditController.updateReturnSuffix();
            }
        });
    },
    /**
     * 新增回报
     */
    addReturnDialog:function(){
        var maxCount = eval($("#returnCountMax").val());
        if ($("#returnUl li") && $("#returnUl li").length >= maxCount) {
            Dialog.show("回报个数达到上限！","error");
            return;
        }
        var $title = $("#returnDialog div.title");
        $title.html("");
        $title.append('<a href="#" class="out"></a>添加回报');
        $("#returnDialogContent").empty();
        $("#returnDialogTmpl").tmpl(null).appendTo("#returnDialogContent");
        $("#returnDialog #okBtn").attr("data-status","add");
        $("#returnDialog a.out, #returnDialog #cancelBtn").unbind("click").click(function(){
            //已有图片则删除
            $("#returnDialog i.remove").click();
            //关闭窗口
            $("#returnDialog").hide();
        });
        $("#returnDialog").show();
        //初始化form校验
        dmCheck.init("#returnForm");
        //初始化input实时显示填写字数
        projectEditController.initCalculate($("#returnDescribe"));
        //初始化上传控件
        var option = {
                containerId: "returnImageUl",//容器ID,必须
                uploadUrl: "user/project/uploadFile.do",//上传文件url
                deleteUrl: "user/project/deleteFile.do",//删除文件url
                formData:null,//上传附带参数
                fileNumLimit: 1,
                pick: "#returnFilePicker",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: false//是否有设置默认封面按钮
            };
        projectEditController.initUpload(option);
    },
    /**
     * 修改回报
     */
    editReturnDialog:function(element){
        var obj = new Object();
        var $li = $(element).parent().parent("li");
        $li.addClass("returnEdit");
        obj.supportAmount = $($li.find("input[data-name=supportAmount]")).val();
        var upperCount = $($li.find("input[data-name=upperCount]")).val();
        obj.upperCount = upperCount == "-1" ? "" : upperCount;
        obj.returnDescribe = $($li.find("input[data-name=returnDescribe]")).val();
        var files = new Array();
        var file = {};
        file.imageId = $($li.find("input[data-name=imageId]")).val();
        file.imageUrl = $($li.find("input[data-name=imageUrl]")).val();
        file.imageExt = $($li.find("input[data-name=imageExt]")).val();
        file.imageName = $($li.find("input[data-name=imageName]")).val();
        file.imageSize = $($li.find("input[data-name=imageSize]")).val();
        files.push(file);
        
        var $title = $("#returnDialog div.title");
        $title.html("");
        $title.append('<a href="#" class="out"></a>修改回报');
        $("#returnDialogContent").empty();
        $("#returnDialogTmpl").tmpl(obj).appendTo("#returnDialogContent");
        $("#returnDialog #okBtn").attr("data-status","edit");
        $("#returnDialog a.out, #returnDialog #cancelBtn").unbind("click").click(function(){
            if($("#returnDialog #okBtn").attr("data-status") == "edit"){
                var $li = $("#returnUl .returnEdit");
                $li.removeClass("returnEdit");
            }
            //关闭窗口
            $("#returnDialog").hide();
        });
        $("#returnDialog").show();
        //初始化form校验
        dmCheck.init("#returnForm");
        //初始化input实时显示填写字数
        projectEditController.initCalculate($("#returnDescribe"));
        //初始化上传控件
        var option = {
                containerId: "returnImageUl",//容器ID,必须
                uploadUrl: "user/project/uploadFile.do",//上传文件url
                deleteUrl: "user/project/deleteFile.do",//删除文件url
                formData:null,//上传附带参数
                fileNumLimit: 1,
                pick: "#returnFilePicker",
                accept: {//上传文件类型
                    title: '图片',
                    extensions: 'jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
                },
                isMulti: false,//是否有设置默认封面按钮
                files: files
            };
        projectEditController.initUpload(option);
    },
    /**
     * 删除回报
     */
    deleteReturn:function(element){
        var $li = $(element).parent().parent("li");
        $li.remove();
        //更新回报下标
        projectEditController.updateReturnSuffix();
    },
    showImage:function(element){
        projectEditController.showImg(element, $(element).attr("src"));
    }
});
//实例化控制器
var projectReturnController = new ProjectReturnController();
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		
	}
});