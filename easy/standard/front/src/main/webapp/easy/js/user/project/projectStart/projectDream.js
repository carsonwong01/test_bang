dmCheck.init("#projectForm");
var ProjectDreamController = DM.Controller.sub({
    init:function(){
        //初始化form表单缓存
        var cacheData = projectStartController.initFormCache($("#projectForm"), "dream");
        
        projectStartController.readyProject();
        
        //初始化input实时显示填写字数
        projectStartController.initCalculate($("input[name=projectName],input[name=projectIntro],input[name=freightDescribe],input[name=deliverDescribe]"));
        
        //是否需要发货地址
        $("#isNeedAddr").click(function(){
            if($(this).is(":checked")){
                $("#isNeddAddr").val("1");
            }else{
                $("#isNeddAddr").val("2");
            }
            $("#isNeddAddr").trigger('change.formcache');
        });
        
        //初始化项目标签
        var labelSelected = cacheData.projectLabel;
        if (labelSelected && labelSelected[0]) {
            $("#labels li a").each(function(){
                var labelName = $(this).html();
                if (labelSelected[0].indexOf(","+labelName+",") > -1) {
                    $(this).addClass("active");
                }
            });
        }
        //项目标签选择
        $("#labels li a").click(function(){
            if($(this).attr("class") == undefined || $(this).attr("class").indexOf("active") < 0){
                if($("#labels a.active").length == 2){
                    $($("#labels a.active").get(0)).removeClass('active');
                }
                $(this).addClass("active");
            }else{
                $(this).removeClass("active");
            }
            var value = ",";
            $("#labels a.active").each(function(){
                value = value + $(this).html() + ",";
            });
            if(value == ",") value="";
            $("#projectLabel").val(value);
            $("#projectLabel").trigger('change.formcache');
        });
        
        //初始化富文本控件
        var projectDetails = projectStartController.initKindEditor("projectDetails","描述下梦想的具体内容。","projectDetailsTip");
        if (cacheData.projectDetails && cacheData.projectDetails[0] != '') {
          projectDetails.html(cacheData.projectDetails ? cacheData.projectDetails[0] : "");
        }
        
        //初始化上传控件
        var option = {
                containerId: "projectImageUl",//容器ID,必须
                inputPrefix: "imagesIds",//input的name前缀,必须
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
                files: cacheData.imagesIds ? cacheData.imagesIds : null,
                formId: "projectForm"
            };
        projectStartController.initUpload(option);
        
        //初始化目标列表
        if (cacheData.supportAmount && cacheData.supportAmount.length > 0) {
            for (var i=0; i < cacheData.supportAmount.length; i++) {
                var obj = cacheData.supportAmount[i];
                //插入模板
                var $li = $("#returnTmpl").tmpl(obj).appendTo("#returnUl");
                $li.data(obj);
                var $supportAmount = $li.find("input[data-name=supportAmount]");
                $supportAmount.data(obj);
                projectStartController.updateFormCache($("#projectForm"));
                $supportAmount.trigger('change.formcache');
            };
            //更新目标下标
            projectStartController.updateTargetSuffix();
        }
        
        //确认添加目标
        $("#returnDialog #okBtn").click(function(){
            var obj = new Object();
            if(dmCheck.check("#returnForm")){
                obj.supportAmount=$("#supportAmount").val();
                obj.returnDescribe=$("#returnDescribe").val();
                if($(this).attr("data-status") == "add"){
                    //插入模板
                    var $li = $("#returnTmpl").tmpl(obj).appendTo("#returnUl");
                    $li.data(obj);
                    var $supportAmount = $li.find("input[data-name=supportAmount]");
                    $supportAmount.data(obj);
                    projectStartController.updateFormCache($("#projectForm"));
                    $supportAmount.trigger('change.formcache');
                }
                if($(this).attr("data-status") == "edit"){
                    var $li = $("#returnUl .returnEdit");
                    $li.data(obj);
                    var $supportAmount = $li.find("input[data-name=supportAmount]");
                    $supportAmount.data(obj);
                    $supportAmount.val(obj.supportAmount);
                    projectStartController.updateFormCache($("#projectForm"));
                    $supportAmount.trigger('change.formcache');
                    
                    $($li.find("input[data-name=returnDescribe]")).val(obj.returnDescribe);
                    $($li.find("#supportAmountB")).html(obj.supportAmount);
                    $($li.find("#returnDescribeP")).html(obj.returnDescribe);
                    $li.removeClass("returnEdit");
                }
                //关闭窗口
                $("#returnDialog").hide();
                //更新目标下标
                projectStartController.updateTargetSuffix();
            }
        });
    },
    /**
     * 新增目标
     */
    addReturnDialog:function(){
        var maxCount = eval($("#targetCountMax").val());
        if ($("#returnUl li") && $("#returnUl li").length >= eval(maxCount)) {
            Dialog.show("梦想目标个数达到上限！","error");
            return;
        }
        var $title = $("#returnDialog div.title");
        $title.html("");
        $title.append('<a href="#" class="out"></a>添加目标');
        $("#returnDialogContent").empty();
        $("#returnDialogTmpl").tmpl(null).appendTo("#returnDialogContent");
        $("#returnDialog #okBtn").attr("data-status","add");
        $("#returnDialog a.out, #returnDialog #cancelBtn").unbind("click").click(function(){
            //关闭窗口
            $("#returnDialog").hide();
        });
        $("#returnDialog").show();
        //初始化form校验
        dmCheck.init("#returnForm");
        //初始化input实时显示填写字数
        projectStartController.initCalculate($("#returnDescribe"));
    },
    /**
     * 修改目标
     */
    editReturnDialog:function(element){
        var obj = new Object();
        var $li = $(element).parent().parent("li");
        $li.addClass("returnEdit");
        obj = $li.data();
        
        var $title = $("#returnDialog div.title");
        $title.html("");
        $title.append('<a href="#" class="out"></a>修改目标');
        $("#returnDialogContent").empty();
        $("#returnDialogTmpl").tmpl(obj).appendTo("#returnDialogContent");
        $("#returnDialog #okBtn").attr("data-status","edit");
        $("#returnDialog a.out, #returnDialog #cancelBtn").unbind("click").click(function(){
            //关闭窗口
            $("#returnDialog").hide();
        });
        $("#returnDialog").show();
        //初始化form校验
        dmCheck.init("#returnForm");
        //初始化input实时显示填写字数
        projectStartController.initCalculate($("#returnDescribe"));
    },
    /**
     * 删除目标
     */
    deleteReturn:function(element){
        var $li = $(element).parent().parent("li");
        $li.remove();
        projectStartController.updateFormCache($("#projectForm"));
        $("#returnUl li input[data-name=supportAmount]").trigger('change.formcache');
        //更新目标下标
        projectStartController.updateTargetSuffix();
    }
});
//实例化控制器
var projectDreamController = new ProjectDreamController();
//页面加载时调用
DM.Page.ready({
    "初始化" : function() {
        
    }
});