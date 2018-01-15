var ProjectStartController = DM.Controller.sub({
    init:function(){
        //兼容html5 placeholder属性
        setPlaceholder();
    },
    readyProject:function(){
        var _this = this;
        //附件说明
        $("a.explain").click(function(){
            $("#raiseExplain").show();
        });
        $("#raiseExplain #closeBtn,#raiseExplain a.out").click(function(){
            $("#raiseExplain").hide();
        });

        //发布项目按钮click事件
        $("#informProjectBtn").click(function(){
            _this.initProject();
        });

        //同意协议checkBox
        $("#agreeCheckBox").click(function(){
            if($(this).is(":checked")){
                $("#informProjectBtn").addClass("btn-blue").removeClass("btn-gray").click(function(){
                    _this.initProject();
                });
            }else{
                $("#informProjectBtn").addClass("btn-gray").removeClass("btn-blue").unbind("click");
            }
        });
    },
    /**
     * 文本框长度计算
     */
    initCalculate:function($jqueryElement){
        $jqueryElement.each(function(){
            var $input = $(this);
            $input.next().text($input.val().length + "/" + $input.attr("maxlength"));
        });
        $jqueryElement.keyup(function(){
            var $input = $(this);
            $input.next().text($input.val().length + "/" + $input.attr("maxlength"));
        });
        $jqueryElement.keypress(function(){
            var $input = $(this);
            $input.next().text($input.val().length + "/" + $input.attr("maxlength"));
        });
    },
    /**
     * 初始化富文本控件
     * @param input textarea的name
     * @param defaultContent 未填写内容是默认的提示文字
     */
    initKindEditor:function(inputName,defaultContent,tipName){
        var editor1 = KindEditor.create("textarea[name="+inputName+"]", {
            uploadJson : basePath+'common/kingUpload.do',
            allowFileManager : false,
            formatUploadUrl : false,
            afterBlur : function() {
                this.sync();
                $("textarea[name="+inputName+"]").text(this.html());
                if(this.count('text') == 0){
                    this.html(defaultContent);
                }
            },
            afterFocus : function() {
                if(this.html() == defaultContent){
                    this.html("");
                }
                $("#errContent").html("&nbsp;");
            },
            // afterChange : function() {
            //     $("textarea[name="+inputName+"]").trigger('change.formcache');
            //     //限制字数
            //     var limitNum = 200;  //设定限制字数
            //     var count = this.count('text');
            //     if (this.html() == defaultContent) {
            //         count = 0;
            //     }
            //     var $tip = $('#'+tipName);
            //     if($tip){
            //         $tip.attr("count", count);
            //         $tip.html(count + "/" + limitNum); //输入显示
            //     }
            // },
            afterUpload:function(){
                if (this.html() == defaultContent) {
                    this.html("");
                }
            }
        });
        prettyPrint();
        editor1.readonly(false);
        editor1.html(defaultContent);
        return editor1;
    },
    /**
     * 初始化上传控件
     * @param option
     *     containerId: //容器ID,必须
     *     inputPrefix: //input的name前缀,必须
     *     uploadUrl: //上传文件url
     *     deleteUrl: //删除文件url
     *     formData: //上传附带参数
     *     fileNumLimit: //上传文件个数限制
     *     pick: //上传按钮ID
     *     accept: //上传文件类型
     *         {
     *             title: '图片',
     *             extensions: 'jpg,jpeg,bmp,png',
     *             mimeTypes: 'image/jpg,image/jpeg,image/bmp,image/png'
     *         }
     *     isMulti: //是否有设置默认封面按钮
     *     files: //已上传的文件
     *     formId: //缓存的表单Id
     */
    initUpload:function(option){
        var _this = this;
        var mineStatu = false;
        var defaultFileId;
        //设置上传控件
        var $list = $('#'+option.containerId+' .fileListAfter'),
            // 优化retina, 在retina下这个值是2
            ratio = window.devicePixelRatio || 1,
            // 缩略图大小
            thumbnailWidth = 100 * ratio,
            thumbnailHeight = 100 * ratio,
            // Web Uploader实例
            uploader;
        // 初始化Web Uploader
        uploader = WebUploader.create({
            // 自动上传。
            auto: true,
            // swf文件路径
            swf: basePath + 'easy/flash/Uploader.swf',
            // 文件接收服务端。
            server: basePath + option.uploadUrl,
            //文件上传请求的参数表
            formData: option.formData,
            // 选择文件的按钮。可选。内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: option.pick,
            //文件上传数量限制
            fileNumLimit : option.fileNumLimit,
            // 只允许选择文件，可选。
            accept: option.accept,
            //是否允许重复上传
            duplicate: true,
            method: 'POST'
        });

        //初始化之前已上传的文件
        uploader.on('ready', function() {
            if(option.files && option.files.length > 0){
                $.each(option.files, function(index, file){
                    var obj={},
                        statusMap={};
                    obj.id='WU_FILE_' + index;
                    obj.name=file.imageId + "," + file.imageUrl;
                    obj.getStatus=function(){
                        return 'COMPLETE';
                    };
                    obj.statusText='';
                    obj.size=file.imageSize;
                    obj.version=WebUploader.Base.version;
                    obj.type=option.accept.mimeTypes;
                    obj.filetype=file.imageExt;
                    obj.source=this;
                    obj.setStatus=function( status, text ){
                        var prevStatus = statusMap[ this.id ];
                        typeof text !== 'undefined' && (this.statusText = text);
                        if ( status !== prevStatus ) {
                            statusMap[ this.id ] = status;
                            //文件状态变化
                            uploader.trigger( 'statuschange', status, prevStatus );
                        }
                    };
                    obj.imageId=file.imageId;
                    obj.imageUrl=file.imageUrl;
                    if (file.isDefault == '7') {
                        defaultFileId = obj.id;
                    }
                    mineStatu = true;
                    uploader.addQueued(obj);
                });
            }
        });

        // 当有文件添加进来的时候
        uploader.on('fileQueued', function(file) {
            var self = this;
            var content = option.isMulti ? '<p class=""></p><a></a>' : '<p></p><a></a>';
            if (option.isMulti && file.id == defaultFileId) {
                content = '<p class=""></p><a class="defaultImage"></a>';
            }
            // var content = option.isMulti ? '<p class="bg"></p><a>设为封面</a>' : '<p></p><a></a>';
            // if (option.isMulti && file.id == defaultFileId) {
            //     content = '<p class="bg"></p><a class="defaultImage">封面图片</a>';
            // }
            var $li = $('<li id="' + file.id + '" class="file-item thumbnail"><img>' + '<div class="cont">'+content+'</div>');
            var $img = $li.find('img');
            $li.insertBefore($list);
            if(mineStatu){
                var obj = file.name.split(",");
                $img.attr('src', obj[1]);
                $img.click(function(){
                    _this.showImg(this, $(this).attr("src"));
                });
                $($li.find("input[name=imageId]")).val();
                $li.addClass('upload-state-done');
                var tempFile = {
                    batchNumber: obj[0],
                    url: obj[1],
                    oldName: obj[1].substring(obj[1].lastIndexOf("/"), obj[1].length),
                    newFileName: obj[1].substring(obj[1].lastIndexOf("/"), obj[1].length),
                    fileExt: file.ext,
                    size: file.size
                };
                var $input = $('<input type="hidden" name="' + option.inputPrefix + '" value="' + obj[0] + '">').appendTo($li);
                $input.data(tempFile);
                var $i = $('<i class="remove"></i>').appendTo($li);
                $i.click(function(){
                    uploader.removeFile(file, true);
                    if (option.isTrueDel) {

                    }else{
                        //删除文件
                        var self = this;
                        var id = $($(self).parent("li").find("input[name=" + option.inputPrefix + "]")).val();
                        DM.ajax({
                            url:option.deleteUrl,
                            data:{"fileId":id},
                            success:function(){
                                _this.updateDefaultImg(option);
                                console.log("删除图片(ID:" + id + ")成功");
                            },
                            error:function(data){
                                Dialog.show("系统异常，请联系管理员","error");
                            }
                        });
                    }
                    $(this).parent("li").remove();
                    if (option.isMulti) {
                        if($("#"+option.containerId+" .defaultImage") && $("#"+option.containerId+" .defaultImage").length == 0){
                            var $input = $($("#"+option.containerId+" input[name=" + option.inputPrefix + "]").get(0));
                            $input.parent().find(".cont a").addClass("defaultImage").html("");
                            $("#coverImageId").val($input.data("batchNumber"));
                            $("#coverImageUrl").val($input.data("url"));
                            $("#coverImageId,#coverImageUrl").trigger('change.formcache');
                        }
                    }
                    if ($("#"+option.formId).is('form')) {
                        _this.updateFormCache($("#"+option.formId));
                    }
                    _this.updateDefaultImg(option);
                    $("#"+option.containerId+" li.fileListAfter").show();
                });
                if(option.isMulti){
                    //绑定click选中默认图片
                    $li.find("div.cont") && $li.find("div.cont").click(function(){
                        $("a.defaultImage").removeClass("defaultImage").html("");
                        $(this).find("a").addClass("defaultImage").html("");
                        var $input = $(this).next("input[name=" + option.inputPrefix + "]");
                        $("#coverImageId").val($input.data("batchNumber"));
                        $("#coverImageUrl").val($input.data("url"));
                        $("#coverImageId,#coverImageUrl").trigger('change.formcache');
                    });
                }

                if ($("#"+option.formId).is('form')) {
                    _this.updateFormCache($("#"+option.formId));
                }
            }else{
                // 创建缩略图
                uploader.makeThumb(file, function(error, src) {
                    if (error) {
                        $img.replaceWith('<span>不能预览</span>');
                        return;
                    }
                    $img.attr('src', src);
                }, thumbnailWidth, thumbnailHeight);
            }
            mineStatu = false;

            //判断文件个数是否达到上限，达到上限隐藏添加文件按钮
            if ($("#"+option.containerId+" li:not(.fileListAfter,.exampleImage)").length >= option.fileNumLimit) {
                $("#"+option.containerId+" li.fileListAfter").hide();
            }
        });
        // 文件上传过程中创建进度条实时显示。
        uploader.on('uploadProgress', function(file, percentage) {
            var $li = $('#'+option.containerId+' #'+file.id),
                $percent = $li.find('.progress span');
            // 避免重复创建
            if (!$percent.length) {
                $percent = $('<p class="progress"><span></span></p>').appendTo($li).find('span');
            }
            $percent.css('width', percentage * 100 + '%');
        });
        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on('uploadSuccess', function(file , result) {
            var userId = $('.ldr').attr('datr');
            if(userId == "" || userId == null || !result || result.code != '000000'){
                Dialog.show("用户未登录，请先登录！","error");
                var $li = $('#'+option.containerId+' #'+file.id),
                    $error = $li.find('div.error');
                // 避免重复创建
                if (!$error.length) {
                    $error = $('<div class="error"></div>').appendTo($li);
                }
                $error.text('上传失败');
                var $i = $('<i class="remove"></i>').appendTo($li);
                $i.click(function(){
                    uploader.removeFile(file,true);
                    $(this).parent("li").remove();
                    if ($("#"+option.formId).is('form')) {
                        _this.updateFormCache($("#"+option.formId));
                    }
                    _this.updateDefaultImg(option);
                    $("#"+option.containerId+" li.fileListAfter").show();
                });
                return;
            }
            var data = result.data[0];
            $('#'+option.containerId+' #'+file.id).addClass('upload-state-done');
            var $li = $('#'+option.containerId+' #'+file.id);
            var tempFile = {
                batchNumber: data.batchNumber,
                url: data.url,
                oldName: data.oldName,
                newFileName: data.newFileName,
                fileExt: data.fileExt,
                size: data.size
            };
            var $input = $('<input type="hidden" name="' + option.inputPrefix + '" value="' + data.batchNumber + '">').appendTo($li);
            $input.data(tempFile);
            $('<i class="remove"></i>').appendTo($li);
            //绑定移除文件事件
            $li.on("click","i.remove",function(){
                uploader.removeFile(file,true);
                var self = this;
                var id = $($(self).parent("li").find("input[name=" + option.inputPrefix + "]")).val();
                DM.ajax({
                    url:option.deleteUrl,
                    data:{"fileId":id},
                    success:function(){
                        var $li = $(self).parent("li");
                        $li.remove();
                        _this.updateDefaultImg(option);
                        console.log("删除图片(ID:" + id + ")成功");
                    },
                    error:function(data){
                        Dialog.show("系统异常，请联系管理员","error");
                    }
                });
                if ($("#"+option.formId).is('form')) {
                    _this.updateFormCache($("#"+option.formId));
                }
                $("#"+option.containerId+" li.fileListAfter").show();
            });

            //绑定click图片预览
            _this.imgPeview($li.find("img"), option.inputPrefix);
            if(option.isMulti){
                //绑定click选中默认图片
                _this.defaultImg($li.find("div.cont"), option.containerId, option.inputPrefix);
            }

            if ($("#"+option.formId).is('form')) {
                _this.updateFormCache($("#"+option.formId));
            }
        });
        // 文件上传失败，现实上传出错。
        uploader.on('uploadError', function(file) {
            var $li = $('#'+option.containerId+' #'+file.id),
                $error = $li.find('div.error');
            // 避免重复创建
            if (!$error.length) {
                $error = $('<div class="error"></div>').appendTo($li);
            }
            $error.text('上传失败');
            var $i = $('<i class="remove"></i>').appendTo($li).find("i.remove");
            $i.click(function(){
                $(element).parent("li").remove();
                if ($("#"+option.formId).is('form')) {
                    _this.updateFormCache($("#"+option.formId));
                }
                _this.updateDefaultImg(option);
                $("#"+option.containerId+" li.fileListAfter").show();
            });
        });
        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on('uploadComplete', function(file) {
            $('#'+option.containerId+' #'+file.id).find('.progress').remove();
        });
        //加入队列前错误捕获
        uploader.on('error', function(type){
            if ($("#common_popup_con_id").is(":visible")) {
                return;
            }
            var errorMsg;
            switch (type) {
                case 'Q_EXCEED_NUM_LIMIT'://在设置了fileNumLimit且尝试给uploader添加的文件数量超出这个值时派送。
                    errorMsg = "最多只能上传" + uploader.options.fileNumLimit + "个文件！";
                    break;
                case 'Q_EXCEED_SIZE_LIMIT'://在设置了Q_EXCEED_SIZE_LIMIT且尝试给uploader添加的文件总大小超出这个值时派送。
                    errorMsg = "最多只能上传总大小" + uploader.options.fileSizeLimit + "K以内的文件！";
                    break;
                case 'Q_TYPE_DENIED'://当文件类型不满足时触发。
                    errorMsg = "仅支持" + uploader.options.accept[0].extensions + "格式的" + uploader.options.accept[0].title + "！";
                    break;
                case 'F_DUPLICATE'://当设置不允许重复上传，文件重复上传时触发。
                    errorMsg = "同一文件不能重复上传！";
                    break;
                default:
                    errorMsg = type;
                    break;
            }
            Dialog.show(errorMsg,"error");
        });

        return uploader;
    },
    /**
     * 绑定点击预览图片
     */
    imgPeview:function($element, inputName){
        var _this = this;
        $element.on("click",function() {
            var $input = $(this).parent("li").find("input[name="+inputName+"]");
            var src = $input.data("url");
            _this.showImg(this, src);
        });
    },
    /**
     * 图片预览
     */
    showImg:function(element,src){
        if(src===undefined || src==null || src==''){
            return;
        }
        $("#lytebox_productPic").remove();
        $(element).after('<a href="#" id="lytebox_productPic" rel=""></a>');
        $("#lytebox_productPic").attr('rel','lytebox[vacation]');
        $("#lytebox_productPic").attr('href', src);
        myLytebox.start(document.getElementById("lytebox_productPic"),false, false);
        return false;
    },
    /**
     * 绑定事件选择封面图片
     */
    defaultImg:function($element,containerId, inputName){
        if($("#"+containerId+" .defaultImage")){
            $($("#"+containerId+" input[name="+inputName+"]").get(0)).parent().find(".cont a").addClass("defaultImage").html("");
            var $input = $($("#"+containerId+" input[name="+inputName+"]").get(0));
            $("#coverImageId").val($input.data("batchNumber"));
            $("#coverImageUrl").val($input.data("url"));
            $("#coverImageId,#coverImageUrl").trigger('change.formcache');
        }
        $element && $element.click(function(){
            $("a.defaultImage").removeClass("defaultImage").html("");
            $(this).find("a").addClass("defaultImage").html("");
            var $input = $(this).next("input[name="+inputName+"]");
            $("#coverImageId").val($input.data("batchNumber"));
            $("#coverImageUrl").val($input.data("url"));
            $("#coverImageId,#coverImageUrl").trigger('change.formcache');
        });
    },
    /**
     * 更新默认图片
     */
    updateDefaultImg:function(option){
        if (option.isMulti) {
            var defaultCount = $("#"+option.containerId).find("a.defaultImage") ? $("#"+option.containerId).find("a.defaultImage").length : 0;
            var liCount = $("#"+option.containerId).find("li:not(.fileListAfter)") ? $("#"+option.containerId).find("li:not(.fileListAfter)").length : 0;
            if(defaultCount == 0){
                $($("#"+option.containerId+" div.cont a").get(0)).addClass("defaultImage").html("");
                var $input = $($("#"+option.containerId+" input[name=" + option.inputPrefix + "]").get(0));
                $("#coverImageId").val($input.data("batchNumber"));
                $("#coverImageUrl").val($input.data("url"));
                $("#coverImageId,#coverImageUrl").trigger('change.formcache');
            }
            if (liCount == 0) {
                $("#coverImageId").val("");
                $("#coverImageUrl").val("");
                $("#coverImageId,#coverImageUrl").trigger('change.formcache');
            }
        }
    },
    /**
     * form表单缓存
     */
    initFormCache:function($element, key){
        //缓存数据
        var option = {
            key: key
        };
        $element.data("options", option);
        //初始化缓存并恢复之前数据
        $element.formcache(option);
        //返回富文本数据及图片数据
        return $element.formcache("getControllsCache");
    },
    /**
     * form表单缓存更新
     */
    updateFormCache:function($element){
        $element.formcache("addListeners", "true");
    },
    /**
     * form表单缓存清理
     */
    clearFormCache:function($element){
        $element.formcache("removeCache");
        $element.formcache("removeCaches");
    },
    /**
     * 发起项目举报
     */
    initProject:function(){
        var _this = this;
        if(dmCheck.check("#projectForm")){
            if(dmCheck.checkOne($("#coverImageId"))){
                $("#coverImageIdMsg").hide();
            }else{
                $("html,body").animate({scrollTop: $('#projectImageUl').offset().top}, 100);
                return;
            }

            var url = location.search;
            alert(url);
            var projectId=url.substring(11);
            // alert(projectId);
            var url = basePath+"project/addInformProject.do?projectId="+projectId;
            //发布项目按钮取消click事件防止重复提交
            $("#informProjectBtn").unbind("click");
                DM.ajax({
                    type:"POST",
                    url:url,
                    projectId:projectId,
                    data:$("#projectForm").serialize(),
                    async : false,
                    success:function(data){
                        if(data.code == '000000'){
                            Dialog.show({
                                msg:"举报成功",
                                showClose:true,
                                showCancel:false,
                                picClass:"success",
                                titile:"提示信息",
                                callBack:function(){
                                    history.back();
                                }
                            });
                        }else{
                            Dialog.show({
                                msg:"举报失败，请重试!",
                                picClass:"error",
                                titile:"提示信息",
                                callBack:function(){
                                    history.back();
                                }
                            });


                            // Dialog.show("举报失败，请重试！","error");
                            // history.back();
                        }
                    },
                    error:function(data){
                        Dialog.show("系统异常,请联系系统管理员！","error");
                        //发布项目按钮绑定click事件
                        $("#informProjectBtn").click(function(){
                            _this.initProject();
                        });
                    }
                });
        }
    }
});
//实例化控制器
var projectStartController = new ProjectStartController();