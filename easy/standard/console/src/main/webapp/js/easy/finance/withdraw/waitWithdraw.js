/**
 * 后台-财务管理-提现管理-待审核列表
 * 
 */
var searchWaitWithdraw = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 提现待审核列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "searchWaitWithdrawForm",
					"serialize" : true,
					"url" : "finance/searchWaitWithdrawAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#searchWaitWithdrawD").empty();
				
				// 填充数据
				$('#searchWaitWithdrawTemp').tmpl(data).appendTo("#searchWaitWithdrawD");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "searchWaitWithdrawTag",
					"formId" : "searchWaitWithdrawForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "finance/searchWaitWithdrawAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			//显示审核弹框
			toAudit : function(index,id) {
				var tmpl=$('#waitConfirmTmpl').tmpl({userName:$("#userName"+index).html(),bankPlace:$("#bankPlace"+index).val(),
					bankBranch:$("#bankBranch"+index).val(),bankCardNo:$("#bankCardNo"+index).html(),withdrawAmt:$("#withdrawAmt"+index).html(),
					poundage:$("#poundage"+index).html(),id:id}).html();
				Dialog.showDialog({
				    title:"审核操作",
				    msg:tmpl,
				    dialogMaxHeight:"420px",
				    dialogHeight:"600px",
				    dialogWidth:"630px",
				    buttons:{
					 
				    }
		        });
			},
			//审核提现
			auditWithdraw: function(checkStatus){
				var id = $("#id").val();
				var checkOpinion = $("#checkOpinion").val();
				if(checkStatus == '2' && $.trim(checkOpinion)==''){
					$("#checkOpinion").attr('placeholder','不通过必须填写原因');
					return;
				}
				DM.ajax({
					"type":"POST",
					"data" :{'auditInfo':checkOpinion,'status':checkStatus,'id': id},
					"url" : "finance/withdrawCheck.do",
					"async" : false,
					"success" : function(data){
						//审核  成功
						if(data && data.code=='000000'){
							 Dialog.confirm(data.description,{
								    title:"提示信息",
								    sureName:"确定",
								    showClose: true,
								    showCancel:false,
								    picClass:"success",
								    isLeftFloating:false,
								    callBack:function(){
								    	//刷新列表
								    	searchWaitWithdraw.loadRecord();
								    	Dialog.close();
								    }
							});
						}else{
							 //审核  失败
							 Dialog.confirm(data.description,{
								    title:"提示信息",
								    sureName:"确定",
								    showClose: true,
								    showCancel:false,
								    picClass:"error", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
								    callBack:function(){
								    	
								    }
							});
						}
					}
				});
			},
			
		});

//实例化控制器
var searchWaitWithdraw = new searchWaitWithdraw();
// 页面加载时调用
DM.Page.ready({
	"监控" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			searchWaitWithdraw.loadRecord();
		});
		searchWaitWithdraw.loadRecord();
		
		//绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "searchWaitWithdrawForm",
				"fileName" : "提现待审核列表.xls",
				"url" : "finance/searchWaitWithdrawExport.do"
			});
		});
	}
});