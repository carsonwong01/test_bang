var ProjectEditController = DM.Controller.sub({
	init:function(){
		//兼容html5 placeholder属性
		setPlaceholder();
	},
	readyProject:function(){
		var _this = this;
		
		//初始化筹日期加减
		var limitOption = {
				lBtn: $("a.l_btn"),//-元素
				rBtn: $("a.r_btn"),//+元素
				days: $("#financingDays"),//期限天数input
				timeBox: $("p.beg-timeBox span")//日期显示容器
		};
		_this.initTimeLimit(limitOption);
		
		//（无订单）确认修改按钮click事件
		$("#editProjectBtn").click(function(){
			_this.editProject();
		});
		//（有订单）确认修改按钮click事件
		$("#editProjectHaveBtn").click(function(){
			_this.editProjectHave();
		});
		
		//同意协议checkBox
		$("#agreeCheckBox").click(function(){
			if($(this).is(":checked")){
				$("#editProjectBtn").addClass("btn-blue").removeClass("btn-gray").click(function(){
					_this.editProject();
				});
				$("#editProjectHaveBtn").addClass("btn-blue").removeClass("btn-gray").click(function(){
					_this.editProjectHave();
				});
			}else{
				$("#editProjectBtn").addClass("btn-gray").removeClass("btn-blue").unbind("click");
				$("#editProjectHaveBtn").addClass("btn-gray").removeClass("btn-blue").unbind("click");
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
	 * 期限日期限制
	 */
	initTimeLimit:function(option){
		var _this = this;
		//初始化时间
		$(option.timeBox.get(0)).text(_this.dateFormat(_this.newDate($(option.timeBox.get(0)).text()),"yyyy-MM-dd"));
		var date = _this.addDay(option.days.val(), _this.newDate($(option.timeBox.get(0)).text()));
		$(option.timeBox.get(1)).text(_this.dateFormat(date,"yyyy-MM-dd"));
		//绑定事件
		var t;
		option.lBtn.click(function(){
			var day = eval(option.days.val());
			var minDay = eval($(this).attr("minDay"));
			if(day > minDay){
				var newDate = _this.addDay(day-1,_this.newDate($(option.timeBox.get(0)).text()));
				var finalDate = _this.dateFormat(newDate,"yyyy-MM-dd");
				var tempDate = _this.newDate(finalDate);
                if (tempDate < _this.newDate(_this.dateFormat(new Date(),"yyyy-MM-dd"))) {
                    return;
                }
				$(option.timeBox.get(1)).text(finalDate);
				option.days.val(day-1);
			}else{
			    if (t) {
			        clearTimeout(t);
			    }
			    $("#financingDaysMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("筹资期限不能小于"+minDay+"天").show();
			    t = setTimeout(function(){
			        $("#financingDaysMsg").hide();
			    },3000);
			}
		});
		option.rBtn.click(function(){
			var day = eval(option.days.val());
			if(day < 30){
				var newDate = _this.addDay(day+1,_this.newDate($(option.timeBox.get(0)).text()));
				$(option.timeBox.get(1)).text(_this.dateFormat(newDate,"yyyy-MM-dd"));
				option.days.val(day+1);
			}
		});
	},
	/**
	 * new Date()兼容ie，firefox旧版本 
	 */
	newDate:function(dateStr){
	    return new Date(dateStr.replace("-", "/").replace("-", "/"));;
	},
	/**
	 * 日期加天数
	 */
	addDay:function(dayNumber, date) {
        date = date ? date : new Date();
        var ms = eval(dayNumber) * (1000 * 60 * 60 * 24);
        return new Date(date.getTime() + ms);
    },
    /**
     * 日期格式化
     * @param now 日期
     * @param mask 日期格式化字符串
     */
	dateFormat:function(now,mask)
    {
        var d = now;
        var zeroize = function (value, length)
        {
            if (!length) length = 2;
            value = String(value);
            for (var i = 0, zeros = ''; i < (length - value.length); i++)
            {
                zeros += '0';
            }
            return zeros + value;
        };
        return mask.replace(/"[^"]*"|'[^']*'|\b(?:d{1,4}|m{1,4}|yy(?:yy)?|([hHMstT])\1?|[lLZ])\b/g, function ($0)
        {
            switch ($0)
            {
                case 'd': return d.getDate();
                case 'dd': return zeroize(d.getDate());
                case 'ddd': return ['Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat'][d.getDay()];
                case 'dddd': return ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'][d.getDay()];
                case 'M': return d.getMonth() + 1;
                case 'MM': return zeroize(d.getMonth() + 1);
                case 'MMM': return ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][d.getMonth()];
                case 'MMMM': return ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][d.getMonth()];
                case 'yy': return String(d.getFullYear()).substr(2);
                case 'yyyy': return d.getFullYear();
                case 'h': return d.getHours() % 12 || 12;
                case 'hh': return zeroize(d.getHours() % 12 || 12);
                case 'H': return d.getHours();
                case 'HH': return zeroize(d.getHours());
                case 'm': return d.getMinutes();
                case 'mm': return zeroize(d.getMinutes());
                case 's': return d.getSeconds();
                case 'ss': return zeroize(d.getSeconds());
                case 'l': return zeroize(d.getMilliseconds(), 3);
                case 'L': var m = d.getMilliseconds();
                    if (m > 99) m = Math.round(m / 10);
                    return zeroize(m);
                case 'tt': return d.getHours() < 12 ? 'am' : 'pm';
                case 'TT': return d.getHours() < 12 ? 'AM' : 'PM';
                case 'Z': return d.toUTCString().match(/[A-Z]+$/);
                default: return $0.substr(1, $0.length - 2);
            }
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
            afterChange : function() {
                $("textarea[name="+inputName+"]").trigger('change.formcache');
                //限制字数
                var limitNum = 5000;  //设定限制字数
                var count = this.count('text');
                if (this.html() == defaultContent) {
                    count = 0;
                }
                var $tip = $('#'+tipName);
                if($tip){
                    $tip.attr("count", count);
                    $tip.html(count + "/" + limitNum); //输入显示
                }
            },
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
	 */
	initUpload:function(option){
		var _this = this;
		var mineStatu = false;
		var defaultFileId;
		var mineObj = {};
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
	    			obj.name=file.imageName;
	    			obj.filename=file.imageName;
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
	    			if (file.isDefault == '1') {
	    			    defaultFileId = obj.id;   
	    			}
	    			mineStatu = true;
	    			mineObj = obj;
	    			uploader.addQueued(obj);
	    		});
	    	}
	    });
	    
	    // 当有文件添加进来的时候
	    uploader.on('fileQueued', function(file) {
	    	var self = this;
	    	var content = option.isMulti ? '<p class="bg"></p><a>设为封面</a>' : '<p></p><a></a>';
	    	if (option.isMulti && file.id == defaultFileId) {
	    	    content = '<p class="bg"></p><a class="defaultImage">封面图片</a>';
	    	}
	        var $li = $('<li id="' + file.id + '" class="file-item thumbnail"><img>' + '<div class="cont">'+content+'</div>');
	        var $img = $li.find('img');
	        $li.insertBefore($list);
	        if(mineStatu){
	        	$img.attr('src', mineObj.imageUrl);
	        	$img.click(function(){
	        		_this.showImg(this, $(this).attr("src"));
	        	});
	        	$($li.find("input[name=imageId]")).val();
	        	$li.addClass('upload-state-done');
		        $('<input type="hidden" name="imagesIds" value="' + mineObj.imageId + '">').appendTo($li);
		        $('<input type="hidden" name="imagesUrls" value="' + mineObj.imageUrl + '">').appendTo($li);
		        $('<input type="hidden" name="imagesExts" value="' + mineObj.filetype + '">').appendTo($li);
		        $('<input type="hidden" name="imagesSizes" value="' + mineObj.size + '">').appendTo($li);
		        var $i = $('<i class="remove"></i>').appendTo($li);
		        $i.click(function(){
		        	uploader.removeFile(file, true);
		        	$(this).parent("li").remove();
                    _this.updateDefaultImg(option);
                    $("#"+option.containerId+" li.fileListAfter").show();
		        });
		        if(option.isMulti){
                    //绑定click选中默认图片
                    $li.find("div.cont") && $li.find("div.cont").click(function(){
                        $("a.defaultImage").removeClass("defaultImage").html("设为封面");
                        $(this).find("a").addClass("defaultImage").html("封面图片");
                        $("#coverImageId").val($(this).next("input[name=imagesIds]").val());
                        $("#coverImageUrl").val($(this).next().next("input[name=imagesUrls]").val());
                    });
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
	    	if(!result || result.code != '000000'){
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
		        	_this.updateDefaultImg(option);
                    $("#"+option.containerId+" li.fileListAfter").show();
		        });
		        return;
	    	}
            var data = result.data[0];
	    	$('#'+option.containerId+' #'+file.id).addClass('upload-state-done');
	        var $li = $('#'+option.containerId+' #'+file.id);
	        $('<input type="hidden" name="imagesIds" value="' + data.batchNumber + '">').appendTo($li);
	        $('<input type="hidden" name="imagesUrls" value="' + data.url + '">').appendTo($li);
	        $('<input type="hidden" name="imagesExts" value="' + data.fileExt + '">').appendTo($li);
	        $('<input type="hidden" name="imagesSizes" value="' + data.size + '">').appendTo($li);
	        $('<i class="remove"></i>').appendTo($li);
	        //绑定移除文件事件
	        $li.on("click","i.remove",function(){
	        	uploader.removeFile(file,true);
	        	var self = this;
	    		var id = $($(self).parent("li").find("input[name=imagesIds]")).val();
	    		DM.ajax({
	    			url:option.deleteUrl,
	    			data:{"fileId":id},
	    			success:function(){
	    				//删除的图片为默认图片
	    				var $li = $(self).parent("li");
                        $li.remove();
	    				_this.updateDefaultImg(option);
	    				console.log("删除图片(ID:" + id + ")成功");
	    			},
	    			error:function(data){
	    				 Dialog.show("系统异常，请联系管理员","error");
	    			}
	    		});
	    		$("#"+option.containerId+" li.fileListAfter").show();
	        });
	       	
	       	//绑定click图片预览
	       	_this.imgPeview($li.find("img"));
	       	if(option.isMulti){
		       	//绑定click选中默认图片
		        _this.defaultImg($li.find("div.cont"), option.containerId);
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
	},
	/**
	 * 绑定点击预览图片
	 */
	imgPeview:function($element){
		var _this = this;
		$element.on("click",function() {
			var src = $(this).parent("li").find("input[name=imagesUrls]").val();
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
	defaultImg:function($element,containerId){
		if($("#"+containerId+" .defaultImage")){
			$($("#"+containerId+" input[name=imagesIds]").get(0)).parent().find(".cont a").addClass("defaultImage").html("封面图片");
			$("#coverImageId").val($($("#"+containerId+" input[name=imagesIds]").get(0)).val());
			$("#coverImageUrl").val($($("#"+containerId+" input[name=imagesUrls]").get(0)).val());
		}
		$element && $element.click(function(){
			$("a.defaultImage").removeClass("defaultImage").html("设为封面");
			$(this).find("a").addClass("defaultImage").html("封面图片");
			$("#coverImageId").val($(this).next("input[name=imagesIds]").val());
			$("#coverImageUrl").val($(this).next().next("input[name=imagesUrls]").val());
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
                $($("#"+option.containerId+" div.cont a").get(0)).addClass("defaultImage").html("封面图片");
                var imagesId = $($("#"+option.containerId+" input[name=imagesIds]").get(0)).val();
                var imagesUrl = $($("#"+option.containerId+" input[name=imagesUrls]").get(0)).val();
                $("#coverImageId").val(imagesId);
                $("#coverImageUrl").val(imagesUrl);
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
	 * 更新回报下标
	 */
	updateReturnSuffix:function(){
		$("#returnUl li").each(function(index, element){
			$(element).find("input").each(function(i, e){
				var name = "returnList[" + index + "]." + $(e).attr("data-name");
				$(e).attr("name", name);
			});
		});
	},
	/**
	 * 更新目标下标
	 */
	updateTargetSuffix:function(){
		//计算总金额
		var targetAmount = 0;
		$("#returnUl li").each(function(index, element){
			$(element).find("input").each(function(i, e){
				var name = "targetList[" + index + "]." + $(e).attr("data-name");
				$(e).attr("name", name);
			});
			targetAmount += eval($($(element).find("input[data-name=supportAmount]")).val());
		});
		$("#targetAmount").text(targetAmount);
	},
	/**
	 * 修改项目（无订单）
	 */
	editProject:function(){
		if(dmCheck.check("#projectForm")){
			var projectType = $("#projectType").val();
            if(projectType == '6' || projectType == '7'){
                if(dmCheck.checkOne($("#projectLabel"))){
                    $("#projectLabelMsg").hide();
                }else{
                    $("#projectLabelMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("至少选择一个标签").show();
                    $("html,body").animate({scrollTop: $('#labels').offset().top}, 100);
                    return;
                }
            }
            if ($("#projectDetailsTip").attr('count') <= 0) {
                $("#projectDetailsMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("此项不能为空").show();
                $("body",$('.ke-container iframe.ke-edit-iframe').contents()).focus();
                $("html,body").animate({scrollTop: $('.ke-container').offset().top}, 100);
                return;
            }else if ($("#projectDetailsTip").attr('count') > 5000) {
                $("#projectDetailsMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("内容不能超过5000字符").show();
                $("body",$('.ke-container iframe.ke-edit-iframe').contents()).focus();
                $("html,body").animate({scrollTop: $('.ke-container').offset().top}, 100);
                return;
            }else{
                $("#projectDetailsMsg").hide();
            }
            if(dmCheck.checkOne($("#coverImageId"))){
                $("#coverImageIdMsg").hide();
            }else{
                $("html,body").animate({scrollTop: $('#projectImageUl').offset().top}, 100);
                return;
            }
			var url = basePath;
			switch (projectType) {
			case "1":
			case "2":
			case "3":
			case "4":
			case "5":
				url += "user/project/updateWelfareProject.do";
				break;
			case "6":
				if ($("#returnUl li") && $("#returnUl li").length > 0) {
					$("#returnUlMsg").hide();
				}else{
					$("#returnUlMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("至少添加一个回报").show();
					return;
				}
				url += "user/project/updateReturnProject.do";
				break;
			case "7":
				if ($("#returnUl li") && $("#returnUl li").length > 0) {
					$("#returnUlMsg").hide();
				}else{
					$("#returnUlMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("至少添加一个目标").show();
					return;
				}
                var projectAmountMin = $("#projectAmountMin").val();
                if (parseFloat($("#targetAmount").text()) < parseFloat(projectAmountMin)) {
                    $("#targetAmountMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("目标金额不能低于"+projectAmountMin+"元").show();
                    $("html,body").animate({scrollTop: $('#targetAmount').offset().top}, 100);
                    return;
                }else{
                    $("#targetAmountMsg").hide();
                }
				url += "user/project/updateDreamProject.do";
				break;
			default:
				
				break;
			}
			//（无订单）确认修改按钮click事件
            $("#editProjectBtn").unbind("click");
			DM.ajax({
				type:"POST",
				url:url,
				data:$("#projectForm").serialize(),
				async : false, 
				success:function(data){
					if(data.code == '000000'){
					    Dialog.confirm("修改成功！",{
                            title:"提示信息",
                            sureName:"确定",
                            showCancel:false,
                            isLeftFloating:false,
                            picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
                            callBack:function(){
                                window.location.href = basePath+"project/projectDetails.do?projectId=" + $("#projectId").val();
                            },
                            showCloseCallBack:function(){
                                $("li#bjxm a").click();
                            }
                        });
					}else{
						Dialog.show(data.description,"error");
						//（无订单）确认修改按钮绑定click事件
                        $("#editProjectBtn").click(function(){
                            _this.editProject();
                        });
					}
				},
				error:function(data){
					Dialog.show("系统异常,请联系系统管理员！","error");
                        //（无订单）确认修改按钮绑定click事件
                        $("#editProjectBtn").click(function(){
                            _this.editProject();
                        });
				}
			});
		}
	},
    /**
     * 修改项目（有订单）
     */
    editProjectHave:function(){
        if(dmCheck.check("#projectForm")){
            var projectType = $("#projectType").val();
            if(projectType == '6' || projectType == '7'){
                if(dmCheck.checkOne($("#projectLabel"))){
                    $("#projectLabelMsg").hide();
                }else{
                    $("#projectLabelMsg").css({"min-height":"20px","line-height":"20px","color":"red","padding-bottom":"0px","color":"#f66"}).html("至少选择一个标签").show();
                    return;
                }
            }
            var url = basePath;
            switch (projectType) {
            case "1":
            case "2":
            case "3":
            case "4":
            case "5":
                url += "user/project/updateWelfareProject.do";
                break;
            case "6":
                url += "user/project/updateReturnProject.do";
                break;
            case "7":
                url += "user/project/updateDreamProject.do";
                break;
            default:
                
                break;
            }
            //（有订单）确认修改按钮取消绑定click事件
            $("#editProjectHaveBtn").unbind("click");
            DM.ajax({
                type:"POST",
                url:url,
                data:$("#projectForm").serialize(),
                async : false, 
                success:function(data){
                    if(data.code == '000000'){
                        Dialog.confirm("修改成功！",{
                            title:"提示信息",
                            sureName:"确定",
                            showCancel:false,
                            isLeftFloating:false,
                            picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
                            callBack:function(){
                                window.location.href = basePath+"project/projectDetails.do?projectId=" + $("#projectId").val();
                            },
                            showCloseCallBack:function(){
                                $("li#bjxm a").click();
                            }
                        });
                    }else{
                        Dialog.show(data.description,"error");
                        //（有订单）确认修改按钮绑定click事件
                        $("#editProjectHaveBtn").click(function(){
                            _this.editProjectHave();
                        });
                    }
                },
                error:function(data){
                    Dialog.show("系统异常,请联系系统管理员！","error");
                    //（有订单）确认修改按钮绑定click事件
                    $("#editProjectHaveBtn").click(function(){
                        _this.editProjectHave();
                    });
                }
            });
        }
    }
});
//实例化控制器
var projectEditController = new ProjectEditController();