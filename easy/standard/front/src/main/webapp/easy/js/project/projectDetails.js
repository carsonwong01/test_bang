/**
 * 前台-项目详情
 */
var projectDetails = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 项目详情动态列表
			 */
			dynamicLoadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "dynamicForm",
					"serialize" : true,
					"url" : "project/projectDynamicAjax.do",
					"success" : this.dynamicPageCallBack
				});
			},
			/*
			 * 项目详情动态列表分页回调
			 */
			dynamicPageCallBack : function(data) {
				// 清空表格数据
				$("#dynamicD").empty();
				// 填充数据
				if(data.pageResult.list == ''){
					$("#dynamicD").removeClass("dynamic");
				}
				$('#dynamicTemp').tmpl(data).appendTo("#dynamicD");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "dynamicPaging",
					"formId" : "dynamicForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : basePath+"project/projectDynamicAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			
			/*
			 * 项目支持记录列表
			 */
			commentLoadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "commentForm",
					"serialize" : true,
					"url" : "project/commentListAjax.do",
					"success" : this.commentPageCallBack
				});
			},
			/*
			 * 项目支持记录列表分页回调
			 */
			commentPageCallBack : function(data) {
				// 清空表格数据
				$("#commentD").empty();
				// 填充数据
				$('#commentTemp').tmpl(data).appendTo("#commentD");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "commentPaging",
					"formId" : "commentForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : basePath+"project/commentListAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			/*
			 * 关注/取消关注项目
			 */
			collect : function(_self,id){
				if(currUserId == "" || currUserId == null)
				{
					window.location.href=basePath+"home/login.do";
				}else{
					if($(_self).hasClass("active")){
						DM.ajax({
							type : "POST",
							url : basePath + "project/cancalCollectAjax.do",
							data : {"id":id},
							success : function(data) {
								if(data.code=="000000"){
									$(_self).removeClass("active");	
								}
							}
					    });
					}else{
						DM.ajax({
							type : "POST",
							url : basePath + "project/collectAjax.do",
							data : {"id":id},
							success : function(data) {
								if(data.code=="000000"){
									$(_self).addClass("active");	
									Dialog.confirm("关注项目成功！", {
										picClass : "success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
										showCancel : false,
										showClose : false, // 是否显示关闭按钮(右上角小X)
										callBack : function() {
										}
									});
								}
							}
					    });
					}
				}
			},
			/*
			 * 显示回复框
			 */
			showReplyDiv:function(orderId,_self,replyId){
				if(currUserId == "" || currUserId == null)
				{
					window.location.href=basePath+"home/login.do";
					return;
				}
				if(currUserId == replyId)
				{
					return;
				}
				$("#"+orderId+"").find("input[name='replyId']").val("");
				$("#"+orderId+"").find("textarea").val("");
				if($("#"+orderId+"").parent().hasClass("hide")){
					$("#"+orderId+"").find("textarea").removeAttr("placeholder");
					$("#"+orderId+"").parent().removeClass("hide");
				}else{
					$("#"+orderId+"").parent().addClass("hide");
				}
				if(_self != undefined){
					var  replyNmae = $(_self).html();
					$("#"+orderId+"").find("textarea").attr("placeholder","回复"+replyNmae+"：");
					$("#"+orderId+"").find("input[name='replyId']").val(replyId);
				}
			},
			/*
			 * 回复
			 */
			commont : function(_self,orderId){
				if(currUserId == "" || currUserId == null)
				{
					window.location.href=basePath+"home/login.do";
					return;
				}
				if(!dmCheck.check("#"+orderId+"")){
					$(_self).prev().attr("placeholder","内容不能为空");
					return;
				}
				var formId = $(_self).parent().attr("id");
				DM.ajax({
					"formId" : formId,
					"serialize" : true,
					"url" : "project/commentAjax.do",
					"success" : function(data) {
						if(data.code=="000000"){
							var $li;
							if(data.data.comment.replyUserName == null)
							{
								$li = $('<li><p><span class="highlight"><a href="javascript:void(0)" class="highlight" '+
										+'onclick="projectDetails.showReplyDiv(\''+orderId+'\',this,\''+data.data.comment.userId+'\')">'+data.data.comment.nickName+'</a></span>：'+data.data.comment.content+'</p></li>');
							}else{
								$li = $('<li><p><span class="highlight"><a href="javascript:void(0)" class="highlight" '+
										+'onclick="projectDetails.showReplyDiv(\''+orderId+'\',this,\''+data.data.comment.userId+'\')">'+data.data.comment.nickName+'</a></span>回复<span class="highlight"><a href="javascript:void(0)" class="highlight" '+
										+'onclick="projectDetails.showReplyDiv(\''+orderId+'\',this,\''+data.data.comment.replyUserId+'\')">'+data.data.comment.replyNickName+'</a></span>：'+data.data.comment.content+'</p></li>');
							}
							
							$li.appendTo($(_self).closest("div").prev());
							$("#"+orderId+"").parent().addClass("hide");
						}else{
							Dialog.confirm(data.description, {
								picClass : "error", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
								showCancel : false,
								showClose : false, // 是否显示关闭按钮(右上角小X)
								callBack : function() {
									
								}
							});
						}
					}
				});
			},
			/*
			 * 图片预览
			 */
			showImg:function(_self){
				$("#lytebox_productPic").remove();
				$(_self).after('<a href="#" id="lytebox_productPic" rel=""></a>');
				$("#lytebox_productPic").attr('rel','lytebox[vacation]');
				$("#lytebox_productPic").attr('href', $(_self).attr('src'));
				myLytebox.start(document.getElementById("lytebox_productPic"),false, false);
			}
		});

//实例化控制器
var projectDetails = new projectDetails();
// 页面加载时调用
DM.Page.ready({
	"监控" : function() {
		$("#dynamicTab").bind('click',function(){
			projectDetails.dynamicLoadRecord();
		});
		$("#commentTab").bind('click',function(){
			projectDetails.commentLoadRecord();
		});
		$(".mod-project-padd").find('img').click(function(){
			projectDetails.showImg(this);
        });
	}
});