dmCheck.init("#projectForm");
var ProjectReturnController = DM.Controller.sub({
	init:function(){
        //初始化form表单缓存
        var cacheData = projectStartController.initFormCache($("#projectForm"), "return");
        
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
        var projectDetails = projectStartController.initKindEditor("projectDetails","建议详细介绍产品或服务的详细内容。","projectDetailsTip");
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
        
        //初始化回报列表
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
            //更新回报下标
            projectStartController.updateReturnSuffix();
        }
		
		//确认添加回报
		$("#returnDialog #okBtn").click(function(){
			var $file = $("#returnImageUl input[name=imagesId]");
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
			var obj = new Object();
			if(dmCheck.check("#returnForm")){
			    var $input = $("#returnDialog input[name=imagesId]");
				obj.supportAmount=$("#supportAmount").val();
				obj.upperCount=$("#upperCount").val()=="" ? "-1" : $("#upperCount").val();
				obj.returnDescribe=$("#returnDescribe").val();
				obj.image=$input.data();
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
					
					$($li.find("input[data-name=upperCount]")).val(obj.upperCount);
					$($li.find("input[data-name=returnDescribe]")).val(obj.returnDescribe);
					var $imageIdInput = $($li.find("input[data-name=imageId]"));
					if ($imageIdInput.val() != obj.image.batchNumber) {
						$($li.find("img")).attr("src", obj.image.url);
						DM.ajax({
			    			url:"user/project/deleteFile.do",
			    			data:{"fileId":$imageIdInput.val()},
			    			success:function(data){
			    			},
			    			error:function(data){
			    			}
			    		});
					}
					$imageIdInput.val(obj.image.batchNumber);
					$($li.find("input[data-name=imageUrl]")).val(obj.image.url);
					$($li.find("#supportAmountB")).html(obj.supportAmount);
					$($li.find("#returnDescribeP")).html(obj.returnDescribe);
					$li.removeClass("returnEdit");
				}
				//关闭窗口
				$("#returnDialog").hide();
				//更新回报下标
				projectStartController.updateReturnSuffix();
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
		projectStartController.initCalculate($("#returnDescribe"));
		//初始化上传控件
		var option = {
				containerId: "returnImageUl",//容器ID,必须
                inputPrefix: "imagesId",//input的name前缀,必须
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
		projectStartController.initUpload(option);
	},
	/**
	 * 修改回报
	 */
	editReturnDialog:function(element){
		var obj = new Object();
		var $li = $(element).parent().parent("li");
		$li.addClass("returnEdit");
		obj = $li.data();
        obj.upperCount = obj.upperCount == "-1" ? "" : obj.upperCount;
		var files = new Array();
		var file = {};
		file.imageId = obj.image.batchNumber;
		file.imageUrl = obj.image.url;
		file.imageExt = obj.image.fileExt;
		file.imageName = obj.image.oldName;
		file.imageSize = obj.image.size;
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
				var $imageIdInput = $($li.find("input[data-name=imageId]"));
				if ($imageIdInput.val() != $("#returnImageUl input[name=imagesId]").val()) {
					DM.ajax({
		    			url:"user/project/deleteFile.do",
		    			data:{"fileId":$("#returnImageUl input[name=imagesId]").val()},
		    			success:function(data){
		    			},
		    			error:function(data){
		    			}
		    		});
				}
                $li.removeClass("returnEdit");
			}
			//关闭窗口
			$("#returnDialog").hide();
		});
		$("#returnDialog").show();
		//初始化form校验
		dmCheck.init("#returnForm");
		//初始化input实时显示填写字数
		projectStartController.initCalculate($("#returnDescribe"));
		//初始化上传控件
		var option = {
				containerId: "returnImageUl",//容器ID,必须
				inputPrefix: "imagesId",//input的name前缀,必须
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
		        files: files,
		        isTrueDel: true//是否物理删除图片，仅发布产品急销修改回报图片时使用
			};
		projectStartController.initUpload(option);
	},
	/**
	 * 删除回报
	 */
	deleteReturn:function(element){
		var $li = $(element).parent().parent("li");
		var id = $($li.find("input[data-name=imageId]")).val();
		DM.ajax({
			url:"user/project/deleteFile.do",
			data:{"fileId":id},
			success:function(data){
				$li.remove();
				console.log("删除图片(ID:" + id + ")成功");
				projectStartController.updateFormCache($("#projectForm"));
				$("#returnUl li input[data-name=supportAmount]").trigger('change.formcache');
			},
			error:function(data){
				 Dialog.show("系统异常，请联系管理员","error");
			}
		});
		//更新回报下标
		projectStartController.updateReturnSuffix();
	},
	showImage:function(element){
		projectStartController.showImg(element, $(element).attr("src"));
	}
});
//实例化控制器
var projectReturnController = new ProjectReturnController();
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
        
	}
});