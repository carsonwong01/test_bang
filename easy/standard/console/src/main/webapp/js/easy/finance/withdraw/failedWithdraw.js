/**
 * 后台-财务管理-提现管理-提现失败列表
 * 
 */
var searchFailedWithdraw = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 提现失败列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "searchFailedWithdrawForm",
					"serialize" : true,
					"url" : "finance/searchFailedWithdrawAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#searchFailedWithdrawD").empty();
				
				// 填充数据
				$('#searchFailedWithdrawTemp').tmpl(data).appendTo("#searchFailedWithdrawD");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "searchFailedWithdrawTag",
					"formId" : "searchFailedWithdrawForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "finance/searchFailedWithdrawAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			//查看失败原因
			withdrawFailReason : function(id){
				DM.ajax({
					"data" :{'id':id},
					"url" : "finance/searchFailedWithdrawReason.do",
					"success" : function(data){
						if(data && data.code=='000000'){
							var reason;
							debugger
							if(data.data.singleResult==undefined||data.data.singleResult.auditInfo == '')
							{
								reason=" ";
							}else{
								reason= data.data.singleResult.auditInfo;
							}
							Dialog.showDialog({
							    title:"查看失败原因",
							    msg:reason,
							    dialogHeight:"100px",
							    buttons:{
								    "关闭":function(){
								    	Dialog.close();
								    }
							    }
					        });
						}else{
							 Dialog.confirm(data.description,{
								    title:"提示信息",
								    sureName:"确定",
								    showClose: true,
								    showCancel:false,
								    picClass:"error",
								    isLeftFloating:false,
								    callBack:function(){
								    }
							});
						}
					}
				});
			},
			
		});

//实例化控制器
var searchFailedWithdraw = new searchFailedWithdraw();
// 页面加载时调用
DM.Page.ready({
	"监控" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			searchFailedWithdraw.loadRecord();
		});
		searchFailedWithdraw.loadRecord();
		//绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "searchFailedWithdrawForm",
				"fileName" : "提现失败列表.xls",
				"url" : "finance/searchFailedWithdrawExport.do"
			});
		});
	}
});