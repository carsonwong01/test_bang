/**
 * 项目动态审核列表js
 */
var orderId="";
var commentId="";
var FindCommentListControler = DM.constructor.sub({
	// 查询的Ajax
	getFindCommentListAjax : function() {
		var _self = this;
		DM.ajax({
			url : "bus/auditingManage/findCommentListAjax.do",
			data : $("#dataForm").serialize(),
			success : function(data) {
				if (data) {
					_self.setFindCommentListAjaxQuery(data.data);
				}
			},
			error : function(data) {

			}
		});
	},
	// 项目列表填充
	setFindCommentListAjaxQuery : function(data) {
		var _self = this;
		$("#findCommentListData").empty();
		// 填充数据
		if(data.pageResult.list){
			
			$.each(data.pageResult.list,function(index,item){
				item.tips = item.commentContent;
				if(item.commentContent.length>50){
					item.commentContent = item.commentContent.substring(0,50)+"...";
				}
			})
		}
		$('#findCommentListTemp').tmpl(data.pageResult).appendTo(
				"#findCommentListData");
		// 初始化分页标签
		DM.PageTags.init({
			divId : "findCommentListTag", // 放入分页的div的id
			formId : "dataForm", // 表单id
			curPage : data.pageResult.pageIndex, // 当前页
			totalCount : data.pageResult.recordCount,// 总记录数
			pageCount : data.pageResult.pageTotal,// 总页数
			showPages : 10, // 显示记录数
			url : "bus/auditingManage/findCommentListAjax.do", // 请求路径
			isAjax : true, // 是否为ajax提交 true 为是 false为表单提交
			toPageCallBack : function(data) { // 返回函数
				_self.setFindCommentListAjaxQuery(data.data);
			}
		});
		/**
		 * 绑定事件
		 */
		_self.bindingButton();
	},
	loadComment : function(orderId, headPicUrl, userName, datePay,tips) {// 查看评论详情
		var _self = this;
		DM.ajax({
			data : {
				"id" : orderId
			},
			url : "bus/auditingManage/findCommentDetailListAjax.do",
			type : "get",
			success : function(data) {// 把评论详情填充到模板
				_self.showCommentDetailBox(data, orderId, headPicUrl, userName,
						datePay,tips);
			},
			error : function(data) {
				Dialog.show("查询信息失败", "error"); // 提示失败信息
			}
		});
	},
	// 删除
	showCommentDetailBox : function(data, orderId, headPicUrl, userName,
			datePay,tips) {
		var _self = this;
		var msg = $("#loadCommentTmpl").tmpl({
			data : data.data,
			"orderId" : orderId,
			"headPicUrl" : headPicUrl,
			"userName" : userName,
			"datePay" : datePay,
			"tips":tips
		}).html();
		Dialog.showDialog({
			title : "评论详情",
			msg : msg,
			showClose : true,
			dialogWidth : "700px",
			dialogHeight : "380px",
			buttons : {
				"关闭" : function() {
					Dialog.close();
					_self.closeInfoTolist();
				}
			}
		});
	},
	closeInfoTolist : function() {// 点击"取消"或"关闭",刷新页面
		Dialog.close();
		this.getFindCommentListAjax();
	},
	// 删除
	toDeleteDialog : function(orderId, commentId, userName) {
		$("#dialog_popup_bg_id,#dialog_popup_con_id").hide();
		var htm="<div class=\"dialog_popup_bg_delete_comment\" id=\"dialog_popup_bg_delete_comment\" style=\"z-index: 10000001; display: block;\"></div><div class=\"popup_con\" id=\"dialogCommentDelete\" style=\"width: 500px; display: block;\"><div class=\"hd clearfix\"><h3>删除确认框</h3><a id=\"dialogCommentClose\" class=\"close\" title=\"关闭\"></a></div><div class=\"bd\" style=\"height: 50px;\"><div id=\"deeteComfirmMessage\" class=\"form dialog_message\">确认对“13339941500”发表的评论及回复全部删除（删除后不可恢复）？</div></div><div class=\"dbutton\"><input type=\"hidden\" id=\"deleteOrderId\" value=\"55454445455\"> <input type=\"hidden\" id=\"deleteCommentId\" value=\"\"> <a id=\"deleteCommentSubmit\" class=\"btn02 ml15 mr15\">确定</a><a id=\"closeDeleteCommentDialog\" class=\"btn02_gray ml15 mr15\">取消</a></div></div>";
		$("body").append(htm);
		$("#deleteOrderId").val(orderId);
		$("#deleteCommentId").val(commentId);
		
	},
	
	
	
	// 提交删除
	deleteCommentAjax : function(orderId, commentId) {
		var data = {
			"id" : commentId,
			"orderId" : orderId
		};
		DM.ajax({
			url : "bus/auditingManage/deleteCommentAjax.do",
			data : data,
			async : false,
			success : function(data) {
				if (data.code == "000000") {
					
					//去除 确认 框
					$("#dialog_popup_bg_delete_comment,#dialogCommentDelete").remove();
					//弹出成功提示框
					var html="<div class=\"dialog_popup_bg_delete_comment\" id=\"dialog_popup_bg_delete_comment_succ\" style=\"width: 500px;z-index: 10000003;\"></div><div class=\"popup_con popup_common\" id=\"deleteCommentSucc\" style=\"z-index: 10000004;\"><div class=\"hd clearfix\"><h3>提示框</h3></div><div class=\"bd\"><div class=\"form\"><div class=\"main_content clearfix\" style=\"\"><div class=\"successful\"></div><div class=\"text\">您已成功删除该评论！</div></div></div></div><div class=\"dbutton\"><a id=\"deleteCommentSuccClose\" class=\"btn02\">确定</a></div></div>";
					$("body").append(html);
					// 回调函数
					if(commentId){//删除回复
						//移除子评论
						$("#"+commentId).remove();
					}
					
				}
			},
			error : function(data) {
				Dialog.show("系统异常，请联系管理员", "error");
			}
		});
	},
	// 绑定按钮事件
	bindingButton : function() {
		var _self = this;
		// 删除
		$(".toDeleteDialog").each(function(i) {
			$(this).bind("click", function() {
				
				var orderId = $(this).attr("id");// 订单id
				var node = $(this).parent().siblings();
				var userName = $(node[1]).html();

				_self.toDeleteDialog(orderId, "", userName);
			});
		});
		// 查看详情
		$(".viewCommentDialog").each(function(i) {
			$(this).bind("click", function() {
				
				var orderId = $(this).attr("id");// 订单id
				var node = $(this).siblings();
				var headPicUrl = $(node[0]).html();
				var userName = $(node[1]).html();
				var datePay = $(node[2]).html();
				var tips = $(node[3]).html();
				_self.loadComment(orderId, headPicUrl, userName, datePay,tips);
			});
		});
	}
});

var controler = new FindCommentListControler();
// 页面加载时调用
DM.Page.ready({

	"项目动态列表" : function() {
		
		$("body").delegate("#closeDeleteCommentDialog,#dialogCommentClose","click",function(){
			$("#dialog_popup_bg_delete_comment,#dialogCommentDelete").remove();
			$("#dialog_popup_bg_id,#dialog_popup_con_id").show();
		});
		
		//删除评论ajax调用
		$("body").delegate("#deleteCommentSubmit","click",function(){
			
		    if($("#deleteOrderId").val()==undefined && $("#deleteCommentId").val()==undefined){
				
			}else{
				orderId = $("#deleteOrderId").val();
			    commentId = $("#deleteCommentId").val();
			   
			    controler.deleteCommentAjax(orderId,commentId);
			}
		});
		
		//确认框确认按钮
		$("body").delegate("#deleteCommentSuccClose","click",function(){
                if(orderId==""&&commentId !=""){
               	     //删除当前 成功提示 的遮罩层  ，删除当前 成功提示 的弹出框
                    $("#dialog_popup_bg_delete_comment_succ,#deleteCommentSucc").remove();
                     //显示 最初 评论列表详情 弹出框
                    $("#dialog_popup_bg_id,#dialog_popup_con_id").show();
                }
                if(orderId!="" && commentId ==""){
                   //删除当前 成功提示 的遮罩层  ，删除当前 成功提示 的弹出框
                   $("#dialog_popup_bg_delete_comment_succ,#deleteCommentSucc").remove();
                   //删除第一层的遮罩层和弹窗
                   $("#dialog_popup_bg_id,#dialog_popup_con_id").remove();
               	   //删除所有的评论
                   controler.getFindCommentListAjax();
                } 
                orderId="";
                commentId="";
		});
		
		controler.getFindCommentListAjax();
	}

});
